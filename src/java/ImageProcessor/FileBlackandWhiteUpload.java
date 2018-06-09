package ImageProcessor;

import Filters.BlackAndWhiteEffect;
import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luis
 */
@WebServlet(name = "FileBnWUpload", urlPatterns = {"/UploadToSeeTheBlackAndWhiteMagic"})
@MultipartConfig
public class FileBlackandWhiteUpload extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /**
         * Upload the image file and pass it via response to the corresponding
         * section
         */
        Runnable myThread4 = new RunnableImpl(request, response);
        myThread4.run();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private static class RunnableImpl implements Runnable {

        private final HttpServletRequest request;
        private final HttpServletResponse response;

        public RunnableImpl(HttpServletRequest request, HttpServletResponse response) {
            this.request = request;
            this.response = response;
        }

        @Override
        public void run() {
            try {
                InputStream in = request.getInputStream();
                BlackAndWhiteEffect bnwFilter = new BlackAndWhiteEffect();
                bnwFilter.setMyImage(ImageIO.read(in));
                bnwFilter.ApplyFilter();
                BufferedImage thumb = new BufferedImage(bnwFilter.getMyImage().getWidth(), bnwFilter.getMyImage().getHeight(),
                        bnwFilter.getMyImage().getType());
                Graphics2D g = thumb.createGraphics();
                g.setComposite(AlphaComposite.Src);
                g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
                g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
                g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g.drawImage(bnwFilter.getMyImage(), 0, 0, bnwFilter.getMyImage().getWidth(), bnwFilter.getMyImage().getHeight(), null);

                response.setContentType("image/jpg");
                ImageIO.write(thumb, "jpg", response.getOutputStream());
            } catch (IOException ex) {
                Logger.getLogger(FileBlackandWhiteUpload.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}