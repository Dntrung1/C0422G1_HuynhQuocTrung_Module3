package servlet;

import model.Caculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CaculateServlet", value = "/caculate")
public class CaculateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double first = Double.parseDouble(request.getParameter("first"));
        double second = Double.parseDouble(request.getParameter("second"));
        String tinh = request.getParameter("tinh");
        System.out.println(tinh);
        Caculator caculator = new Caculator();
        String result = caculator.tinh(first,second,tinh);
        request.setAttribute("result",result);
        request.getRequestDispatcher("display.jsp").forward(request,response);
    }
}
