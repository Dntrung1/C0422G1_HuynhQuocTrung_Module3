package controller.servlet;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductServlet", urlPatterns ={"","/Product"})
public class ProductServlet extends HttpServlet {
    IProductService iProductService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "add":
                showAddProduct(request,response);
                break;
            case "update":
                showUpdateProduct(request,response);
                break;
            case "delete":
                showDeleteProduct(request,response);
                break;
            default:
                showListProduct(request,response);
        }
    }

    private void showDeleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null){
            dispatcher = request.getRequestDispatcher("error.jsp");
        }else {
            request.setAttribute("product",product);
            dispatcher = request.getRequestDispatcher("view/Product/delete.jsp");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showUpdateProduct(HttpServletRequest request, HttpServletResponse response) {
      int id = Integer.parseInt(request.getParameter("id"));
      Product product = iProductService.findById(id);
      RequestDispatcher dispatcher;
      if (product == null){
            dispatcher = request.getRequestDispatcher("error.jsp");
      }else {
          request.setAttribute("product",product);
          dispatcher = request.getRequestDispatcher("view/Product/edit.jsp");
          try {
              dispatcher.forward(request,response);
          } catch (ServletException e) {
              e.printStackTrace();
          } catch (IOException e) {
              e.printStackTrace();
          }
      }

    }

    private void showAddProduct(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/Product/add.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/Product/list.jsp");
        List<Product> products = iProductService.findAll();
        request.setAttribute("productlist",products);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "add":
                saveProduct(request,response);
                break;
            case "update":
                updateProduct(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
            default:
        }
        String search = request.getParameter("search");
        List<Product> products = iProductService.findByName(search);
        request.setAttribute("product",products);
        try {
            request.getRequestDispatcher("view/Prduct/search").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iProductService.delete(id);
        showListProduct(request,response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        Product product = new Product(id,name,price,describe,producer);
        iProductService.update(id,product);
        showListProduct(request,response);

    }

    private void saveProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        Product product = new Product(id,name,price,describe,producer);
        iProductService.add(product);
        request.setAttribute("mess","Thêm mới thành công");
        showAddProduct(request,response);
    }
}
