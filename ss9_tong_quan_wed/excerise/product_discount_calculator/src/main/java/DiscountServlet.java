import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "caculateServlet", urlPatterns = {"/caculate"})
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double number1 = Double.parseDouble(request.getParameter("Price"));
        double number2 = Double.parseDouble(request.getParameter("Discount"));
        double discountAmount = number1 * number2 * 0.01;
        double discountPrice = number1 - discountAmount;
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("results.jsp");
        request.setAttribute("discountAmount",discountAmount);
        request.setAttribute("discountPrice",discountPrice);
        requestDispatcher.forward(request,response);
    }
}
