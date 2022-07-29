package servlet;

import service.IService;
import service.impl.CaculateService;

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
        IService iService = new CaculateService();
        String result = iService.tinh(first,second,tinh);
        request.setAttribute("result",result);
        request.setAttribute("first",first);
        request.setAttribute("second",second);
        request.setAttribute("tinh",tinh);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
