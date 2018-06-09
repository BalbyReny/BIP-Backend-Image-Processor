package Filters;

import java.awt.image.BufferedImage;

/**
 *
 * @author Luis
 */
public class SepiaEffect {

    private BufferedImage myImage = null;
    private int width;
    private int height;

    public void ApplyFilter() {
        this.setWidth(this.getMyImage().getWidth());
        this.setHeight(this.getMyImage().getHeight());
        int pixel, alpha, red, green, blue;
        int tr, tg, tb;
        for (int i = 0; i < this.getHeight(); i++) {
            for (int j = 0; j < this.getWidth(); j++) {
                pixel = this.getMyImage().getRGB(j, i);
                alpha = (pixel >> 24) & 0xFF;
                red = (pixel >> 16) & 0xFF;
                green = (pixel >> 8) & 0xFF;
                blue = pixel & 0xFF;

                tr = (int) (0.393 * red + 0.769 * green + 0.189 * blue);
                tg = (int) (0.349 * red + 0.686 * green + 0.168 * blue);
                tb = (int) (0.272 * red + 0.534 * green + 0.131 * blue);

                if (tr > 255) {
                    red = 255;
                } else {
                    red = tr;
                }

                if (tg > 255) {
                    green = 255;
                } else {
                    green = tg;
                }

                if (tb > 255) {
                    blue = 255;
                } else {
                    blue = tb;
                }

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