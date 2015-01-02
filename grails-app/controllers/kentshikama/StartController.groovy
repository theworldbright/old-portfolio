package kentshikama

import java.io.File;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

class StartController {
    def index() {
        def thumbnailFolder = grailsAttributes.getApplicationContext().getResource("/images/collection-400/").getFile().toString();
        def imageFolder = grailsAttributes.getApplicationContext().getResource("/images/collection-1600/").getFile().toString();
        ArrayList<String> thumbnailURLs = new ArrayList<String>();
        ArrayList<String> imageURLs = new ArrayList<String>();
        walk(thumbnailFolder, thumbnailURLs);
        walk(imageFolder, imageURLs);
        ArrayList<ImageFigure> imageFigureArrayList = new ArrayList<ImageFigure>();
        if (thumbnailURLs.size() < imageURLs.size()) {
            println("Missing thumbnails...");
        } else if (thumbnailURLs.size() > imageURLs.size()) {
            println("Missing full-size images...");
        } else {
            int lengthOfList = thumbnailURLs.size();
            for (int i = 0; i < lengthOfList; i++) {
                ImageFigure imageFigure = buildImageFigure(i, imageURLs, thumbnailURLs)
                imageFigureArrayList.add(imageFigure);
            }
        }
        return [imageFigureList: imageFigureArrayList];
    }

    private ImageFigure buildImageFigure(int position, ArrayList<String> imageURLs, ArrayList<String> thumbnailURLs) {
        String imageURL = imageURLs.get(position);

        File imageFile = new File(imageURL);
        BufferedImage image = ImageIO.read(imageFile);
        int width = image.getWidth();
        int height = image.getHeight();

        String baseURL = grailsAttributes.getApplicationContext().getResource("/").getFile().toString();
        String relativeImageURL = "/" + new File(baseURL).toURI().relativize(new File(imageURL).toURI()).getPath();
        String thumbnailURL = thumbnailURLs.get(position);
        String relativeThumbnailURL = "/" + new File(baseURL).toURI().relativize(new File(thumbnailURL).toURI()).getPath();

        String imageFileName = imageFile.getName();
        println("Image File Name: " + imageFileName);
        String alt = imageFileName;

        ImageFigure imageFigure = new ImageFigure(imageURL: relativeImageURL, width: width, height: height, thumbnailURL: relativeThumbnailURL, alt: alt);
        return imageFigure;
    }

    private void walk(String path , ArrayList<String> listOfURLs) {
        File root = new File( path );
        File[] list = root.listFiles();
        if (list == null) {
            return;
        }
        for ( File f : list ) {
            if ( f.isDirectory() ) {
                println("Walking directory: " + f.getAbsolutePath());
                walk( f.getAbsolutePath() , listOfURLs );
            } else if (f.isHidden()) {
                println("Skipping hidden file: " + f.getAbsolutePath());
            } else {
                println( "Adding file URL:" + f.getAbsolutePath() );
                listOfURLs.add(f.getAbsolutePath());
            }
        }
    }
}
