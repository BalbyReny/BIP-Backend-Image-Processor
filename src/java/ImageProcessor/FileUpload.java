package ImageProcessor;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet (name = "FileUpload", urlPatterns = {"/UploadToSeeTheMagic"})
@MultipartConfig    
public class FileUpload extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /**
         * Upload the image file and pass it via response to the corresponding section
         */
        
        InputStream in = request.getInputStream ();
        BufferedImage bi = ImageIO.read (in);
        BufferedImage thumb = new BufferedImage (bi.getWidth(), bi.getHeight(), bi.getType ());
        Graphics2D g = thumb.createGraphics ();
        g.setComposite (AlphaComposite.Src);
        g.setRenderingHint (RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        g.setRenderingHint (RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g.setRenderingHint (RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);        
        g.drawImage (bi, 0, 0, bi.getWidth(), bi.getHeight(), null);
        
        response.setContentType ("image/jpg");
        ImageIO.write (thumb, "jpg", response.getOutputStream ());
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}