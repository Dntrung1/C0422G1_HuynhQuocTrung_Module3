package controller;

import model.Users;
import service.IUsersService;
import service.impl.UsersService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UsersServlet", urlPatterns ={"","/Users"})
public class UsersServlet extends HttpServlet {
    IUsersService iUsersService = new UsersService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showFormAdd(request,response);
                break;
            case "update":
                showUpdate(request,response);
                break;
            case "delete":
                deletUsers(request,response);
                break;
            case "sort":
                sortUsers(request,response);
                break;
            default:
                showListUsers(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                saveUsers(request,response);
                break;
            case "update":
                updateUsers(request,response);
                break;
            case "search":
                searchUsers(request,response);
                break;
        }
    }
    private void sortUsers(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/users/list.jsp");
        List<Users> users = iUsersService.findAllSort();
        request.setAttribute("users", users);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deletUsers(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iUsersService.deleteUser(id);
        showListUsers(request,response);
    }

    private void showUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Users users = iUsersService.getUserById(id);
        RequestDispatcher dispatcher;
            request.setAttribute("users", users);
            dispatcher = request.getRequestDispatcher("view/users/update.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }



    private void searchUsers(HttpServletRequest request, HttpServletResponse response) {
        String search = request.getParameter("search");
        List<Users> users = iUsersService.findByCountry(search);
        request.setAttribute("users",users);
        try {
            request.getRequestDispatcher("view/users/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateUsers(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        Users users = new Users(id,name,email,country);
        iUsersService.updateUser(users);
        showListUsers(request, response);
    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/users/add.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListUsers(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/users/list.jsp");
        List<Users> users = iUsersService.findAll();
        request.setAttribute("users", users);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    private void saveUsers(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        Users users = new Users(name,email,country);
        boolean flag = iUsersService.insertUser(users);
        String mess = "Không thành công";
        if (flag){
            mess = "Thành công";
        }
        request.setAttribute("mess", mess);
        showFormAdd(request, response);
    }
}
