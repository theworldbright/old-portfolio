package kentshikama

class ImageFigure implements Comparable<ImageFigure> {
    static constraints = {
    }

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
