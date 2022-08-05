package controller;

import model.Facility;
import service.IFacilityService;
import service.impl.FacilityService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FuramaServlet", value = "/Furama")
public class FuramaServlet extends HttpServlet {
    IFacilityService iFacilityService = new FacilityService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAddForm(request, response);
                break;
            case "update":
                showFormUpdate(request, response);
                break;
            case "delete":
                break;
            default:
                showListService(request, response);
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code");
        Facility facility = iFacilityService.findID(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/service/update.jsp");
        request.setAttribute("facility", facility);
        request.setAttribute("code",code);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/service/add.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListService(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/service/list.jsp");
        List<Facility> facilityList = iFacilityService.findAllService();
        request.setAttribute("facilityList", facilityList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
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
                saveService(request, response);
                break;
            case "update":
                updateService(request,response);
                break;
            case "delete":
                break;
            default:
        }
    }

    private void updateService(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double area = Double.parseDouble(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String rentTypId = request.getParameter("rentTypId");
        String code = request.getParameter("code");
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        String facilityFree = request.getParameter("facilityFree");
        Facility facility = new Facility(id,name, area, cost, maxPeople, rentTypId, code, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
        iFacilityService.updateFacility(facility);
        showListService(request,response);
    }

    private void saveService(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        double area = Double.parseDouble(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String rentTypId = request.getParameter("rentTypId");
        String code = request.getParameter("code");
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        String facilityFree = request.getParameter("facilityFree");
        Facility facility = new Facility(name, area, cost, maxPeople, rentTypId, code, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
        boolean flag = iFacilityService.addFacility(facility);
        String mess = "Thêm mới Thất bại";
        if (flag) {
            mess = "Thêm mới thành công";
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/service/add.jsp");
        request.setAttribute("mess", mess);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
