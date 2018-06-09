package Filters;

import java.awt.image.BufferedImage;

/**
 *
 * @author Luis
 */
public class NegativeEffect {

    private BufferedImage myImage = null;
    private int width;
    private int height;

    public void ApplyFilter() {
        this.setWidth(this.getMyImage().getWidth());
        this.setHeight(this.getMyImage().getHeight());
        int pixel, alpha, red, green, blue;
        for (int i = 0; i < this.getHeight(); i++) {
            for (int j = 0; j < this.getWidth(); j++) {
                pixel = this.getMyImage().getRGB(j, i);
                alpha = (pixel >> 24) & 0xFF;
                red = (pixel >> 16) & 0xFF;
                green = (pixel >> 8) & 0xFF;
                blue = pixel & 0xFF;

                red = 255 - red;
                green = 255 - green;
                blue = 255 - blue;
                pixel = (alpha << 24) | (red << 16) | (green << 8) | blue;
                this.getMyImage().setRGB(j, i, pixel);
            }
        }
    }

    public BufferedImage getMyImage() {
        return myImage;
    }

    public void setMyImage(BufferedImage myImage) {
        this.myImage = myImage;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }
}