import groovy.json.JsonBuilder
import groovy.json.JsonOutput
import groovy.json.JsonParserType
import groovy.json.JsonSlurper

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.attribute.BasicFileAttributes
import java.text.SimpleDateFormat

class ImageFigure implements Comparable<ImageFigure> {
    String imageURL;
    Date creationDate = new Date();
    int width;
    int height;

    String thumbnailURL;
    String alt;

    @Override
    int compareTo(ImageFigure imageFigure) {
        creationDate.compareTo(imageFigure.creationDate);
    }
}

private void buildImageFigureProperties() {
    String imageJSONFileString = "../web-app/json/images.json";
    File imageJSONFile = new File(imageJSONFileString);
    String jsonOutput = buildJsonOutput();
    imageJSONFile.write(jsonOutput);
}
private String buildJsonOutput() {
    ArrayList<ImageFigure> imageFigureArrayList = buildImageFigureArrayList();
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
    simpleDateFormat.setTimeZone(TimeZone.getTimeZone('UTC'));
    JsonOutput.dateFormatter.set(simpleDateFormat);
    return JsonOutput.toJson(imageFigureArrayList);
}
private ArrayList<ImageFigure> buildImageFigureArrayList() {
    String thumbnailsFolderString = "/images/collection-400/";
    String imagesFolderString = "/images/collection-1600/";
    String thumbnailFolder = "../web-app" + thumbnailsFolderString;
    String imageFolder = "../web-app" + imagesFolderString;
    ArrayList<String> thumbnailURLs = new ArrayList<String>();
    ArrayList<String> imageURLs = new ArrayList<String>();
    walkAndAdd(thumbnailFolder, thumbnailURLs);
    walkAndAdd(imageFolder, imageURLs);
    ArrayList<ImageFigure> imageFigureArrayList = new ArrayList<ImageFigure>();
    if (thumbnailURLs.size() < imageURLs.size()) {
        println("Missing thumbnails...");
    } else if (thumbnailURLs.size() > imageURLs.size()) {
        println("Missing full-size images...");
    } else {
        int lengthOfList = thumbnailURLs.size();
        for (int i = 0; i < lengthOfList; i++) {
            ImageFigure imageFigure = buildImageFigure(i, imageURLs, thumbnailURLs);
            imageFigureArrayList.add(imageFigure);
        }
    }
    Collections.sort(imageFigureArrayList, Collections.reverseOrder());
    return imageFigureArrayList;
}
private ImageFigure buildImageFigure(int position, ArrayList<String> imageURLs, ArrayList<String> thumbnailURLs) {
    String imageURL = imageURLs.get(position);

    File imageFile = new File(imageURL);
    Path imageFilePath = imageFile.toPath();
    BasicFileAttributes attr = Files.readAttributes(imageFilePath, BasicFileAttributes.class);
    Date creationDate = new Date(attr.creationTime().toMillis());
    
    BufferedImage image = ImageIO.read(imageFile);
    int width = image.getWidth();
    int height = image.getHeight();

    String baseURL = "../web-app/";
    String relativeImageURL = new File(baseURL).toURI().relativize(new File(imageURL).toURI()).getPath();
    String thumbnailURL = thumbnailURLs.get(position);
    String relativeThumbnailURL = new File(baseURL).toURI().relativize(new File(thumbnailURL).toURI()).getPath();

    String imageFileName = imageFile.getName();
    String alt = imageFileName;

    ImageFigure imageFigure = new ImageFigure(imageURL: relativeImageURL, creationDate: creationDate, width: width, height: height, thumbnailURL: relativeThumbnailURL, alt: alt);
    return imageFigure;
}
private void walkAndAdd(String path , ArrayList<String> listOfURLs) {
    File root = new File( path );
    File[] list = root.listFiles();
    if (list == null) {
        return;
    }
    for ( File file : list ) {
        if ( file.isDirectory() ) {
            walkAndAdd( file.getAbsolutePath() , listOfURLs );
        } else if (file.isHidden()) {
            // Skip file
        } else {
            listOfURLs.add(file.getAbsolutePath());
        }
    }
}

buildImageFigureProperties();