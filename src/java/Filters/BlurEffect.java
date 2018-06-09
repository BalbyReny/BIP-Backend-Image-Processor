package Filters;

import java.awt.image.BufferedImage;
import java.awt.image.BufferedImageOp;
import java.awt.image.ConvolveOp;
import java.awt.image.Kernel;

/**
 *
 * @author Luis
 */
public class BlurEffect {

    private BufferedImage myImage = null;

    public void ApplyFilter() {
        float[] matrix = new float[400];

        for (int i = 0; i < matrix.length; i++) {
            matrix[i] = 1.0f / 400.0f;
        }
        Kernel kernel = new Kernel(20, 20, matrix);

        BufferedImageOp op = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP, null);
        this.myImage = op.filter(this.myImage, null);
    }

    public void setMyImage(BufferedImage myImage) {
        this.myImage = myImage;
    }

    public BufferedImage getMyImage() {
        return myImage;
    }
}