package kentshikama

import grails.converters.JSON
import groovy.json.JsonParserType
import groovy.json.JsonSlurper

import java.awt.image.BufferedImage;
import javax.imageio.ImageIO
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.attribute.BasicFileAttributes

class StartController {
    def index() {
        String imageJSONFileString = "/json/images.json";
        File imageJSONFile = grailsAttributes.getApplicationContext().getResource(imageJSONFileString).getFile();
        JsonSlurper parser = new JsonSlurper().setType(JsonParserType.INDEX_OVERLAY);
        ArrayList<ImageFigure> imageFigureArrayList = parser.parse(imageJSONFile) as ArrayList<ImageFigure>;
        return [imageFigureList: imageFigureArrayList];
    }
}