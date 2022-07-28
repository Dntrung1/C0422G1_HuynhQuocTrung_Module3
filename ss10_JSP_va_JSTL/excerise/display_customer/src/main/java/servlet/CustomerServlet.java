package servlet;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/Customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        customerList.add(new Customer("Nguyễn Minh Huy", LocalDate.parse("1983-08-20"),"Hà Nội","https://scontent.fsgn2-6.fna.fbcdn.net/v/t39.30808-6/280947562_3216720201897096_8054528806146528346_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=YfLcPB8Kd2oAX8945S8&_nc_ht=scontent.fsgn2-6.fna&oh=00_AT_a9hpr8a6BvqaNBtFkeT8MXu4ySDpcmmFnXpoPU8Axbw&oe=62E6341F"));
        customerList.add(new Customer("Trần Xuân Quỳnh", LocalDate.parse("1983-08-21"),"Kon Tum","https://scontent.fsgn2-3.fna.fbcdn.net/v/t39.30808-6/227527957_1514598955548471_5105047582108881231_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=Ok0HHBQQQEwAX8CIK3R&tn=7eclJLA8d3WWrMsB&_nc_ht=scontent.fsgn2-3.fna&oh=00_AT-J6JWVxz2y417-kw29qzbBXEpdTZQGJ2rq_SCP1B5vDA&oe=62E71291"));
        customerList.add(new Customer("Nguyễn Phi Hùng", LocalDate.parse("1983-10-08"),"Đà Nẵng","https://scontent.fsgn2-3.fna.fbcdn.net/v/t39.30808-6/270236561_3053841868208152_2855795783005238510_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=174925&_nc_ohc=IwLEETQ83BMAX8t8d4Z&tn=7eclJLA8d3WWrMsB&_nc_ht=scontent.fsgn2-3.fna&oh=00_AT--S7B-pP0Y6_yScuzDqxxXSCCcdkDdUCH-MYcS3a1sMA&oe=62E70F46"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("display.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
