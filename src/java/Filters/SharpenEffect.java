package Filters;

import java.awt.image.BufferedImage;
import java.awt.image.BufferedImageOp;
import java.awt.image.ConvolveOp;
import java.awt.image.Kernel;

/**
 *
 * @author Adrian
 */
public class SharpenEffect {

    private BufferedImage myImage = null;

    public void ApplyFilter() {

        Kernel kernel = new Kernel(3, 3, new float[]{-1, -1, -1,
            -1, 9, -1,
            -1, -1, -1});
        BufferedImageOp op = new ConvolveOp(kernel);
        this.myImage = op.filter(this.myImage, null);
    }

    public BufferedImage getMyImage() {
        return myImage;
    }

    public void setMyImage(BufferedImage myImage) {
        this.myImage = myImage;
    }
}