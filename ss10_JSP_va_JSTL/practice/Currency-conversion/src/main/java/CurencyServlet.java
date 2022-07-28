import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CurencyServlet", urlPatterns = "/curency-conversion")
public class CurencyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float rate = Float.parseFloat(request.getParameter("rate"));
        float amount = Float.parseFloat(request.getParameter("amount"));
        float result = rate * amount;
        request.setAttribute("rate",rate);
        request.setAttribute("amount",amount);
        request.setAttribute("result",result);
        request.getRequestDispatcher("result.jsp").forward(request,response);
    }
}
