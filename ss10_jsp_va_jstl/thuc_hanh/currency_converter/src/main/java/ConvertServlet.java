import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ConvertServlet", urlPatterns = "/converter")
public class ConvertServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    double rate = Double.parseDouble(request.getParameter("rate"));
    double usd = Double.parseDouble(request.getParameter("usd"));
    request.setAttribute("rate",rate);
    request.setAttribute("usd",usd);
    request.getRequestDispatcher("/converter.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
