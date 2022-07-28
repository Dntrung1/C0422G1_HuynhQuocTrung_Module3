import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "SearchServlet", value = "/SearchServlet")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search").toLowerCase(Locale.ROOT);
        Map<String,String> dic = new HashMap<>();
        dic.put("dog","chó");
        dic.put("cat","mèo");
        dic.put("pig","heo");
        String result = "";
        if (dic.get(search) !=null){
            result += dic.get(search);
        }else {
            result += "Ko thấy";
        }
        request.setAttribute("result",result);
        request.getRequestDispatcher("result.jsp").forward(request,response);

    }
}
