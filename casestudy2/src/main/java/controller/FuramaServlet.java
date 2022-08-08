package controller;

import model.Customer;
import model.CustomerType;
import model.Facility;
import service.ICustomerService;
import service.ICustomerTypeService;
import service.IFacilityService;
import service.impl.CustomerService;
import service.impl.CustomerTypeService;
import service.impl.FacilityService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@WebServlet(name = "FuramaServlet", value = "/Furama")
public class FuramaServlet extends HttpServlet {
    IFacilityService iFacilityService = new FacilityService();
    ICustomerService iCustomerService = new CustomerService();
    ICustomerTypeService iCustomerTypeService = new CustomerTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "listService":
                showListService(request, response);
                break;
            case "listCustomer":
                showListCustomer(request, response);
                break;
            case "listEmployee":
                showListEmployee(request, response);
                break;
            case "listContact":
                showListContact(request, response);
                break;
            case "add":
                showAddForm(request, response);
            case "addCustomer":
                showAddCustomer(request, response);
                break;
            case "update":
                showFormUpdate(request, response);
                break;
            case "updateCustomer":
                showFormUpdateCustomer(request, response);
                break;
            case "deleteCustomer":
                deleteCustomer(request, response);
                break;
            case "delete":
                deleteService(request, response);
                break;
        }
    }

    private void showListContact(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/contact/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iCustomerService.deleteCustomer(id);
        showListCustomer(request, response);
    }

    private void showFormUpdateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = iCustomerService.findIdCustomer(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/update.jsp");
        request.setAttribute("customer", customer);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/add.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        List<Customer> customerList = iCustomerService.findAllCustomer();
        List<CustomerType> customerTypeList = iCustomerTypeService.findAll();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);
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
            case "addCustomer":
                saveCustomer(request, response);
                break;
            case "update":
                updateService(request, response);
                break;
            case "updateCustomer":
                updateCustomer(request, response);
                break;
            case "delete":
                break;
            default:
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String customerTypeId = request.getParameter("customerTypeId");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        byte gender = Byte.parseByte(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int status = Integer.parseInt(request.getParameter("status"));
        Customer customer = new Customer(id, customerTypeId, name, birthday, gender, idCard, phone, email, address, status);
        iCustomerService.updateCustomer(customer);
        showListCustomer(request, response);
    }

    private void saveCustomer(HttpServletRequest request, HttpServletResponse response) {
        String customerTypeId = request.getParameter("customerTypeId");
        String name = request.getParameter("name");
        String birtday = request.getParameter("birtday");
        byte gender = Byte.parseByte(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(customerTypeId, name, birtday, gender, idCard, phone, email, address);
        customer.setName(name);
        customer.setPhone(phone);
        customer.setIdCard(idCard);
        customer.setEmail(email);
        Map<String, String> mapError = this.iCustomerService.addCustomer(customer);
        if (mapError.size() > 0) {
            for (Map.Entry<String, String> entry : mapError.entrySet()) {
                request.setAttribute(entry.getKey(), entry.getValue());
            }
            try {
                request.getRequestDispatcher("view/customer/add.jsp")
                        .forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        showAddCustomer(request, response);
    }


    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Facility facility = iFacilityService.findID(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/service/update.jsp");
        request.setAttribute("facility", facility);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/service/test.jsp");
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

    private void deleteService(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        iFacilityService.deleteFacility(id);
        showListService(request, response);
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
        Facility facility = new Facility(id, name, area, cost, maxPeople, rentTypId, code, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
        boolean flag = iFacilityService.updateFacility(facility);
        String mess = "Khoong thanh coong";
        if (flag) {
            mess = "ok";
        }
        request.setAttribute("mess", mess);
        showListService(request, response);

    }

    private void saveService(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        double area = Double.parseDouble(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String rentTypId = request.getParameter("rentTypId");
        String code = request.getParameter("code");

        String standardRoom =
                request.getParameter("standardRoom");
        String descriptionOtherConvenience =
                request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble
                (request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt
                (request.getParameter("numberOfFloors"));
        String facilityFree =
                request.getParameter("facilityFree");
        if (code.equals("1")) {
            facilityFree = "";
        } else if (code.equals("2")) {
            standardRoom = "";
            descriptionOtherConvenience = "";
            poolArea = 0;
            numberOfFloors = 0;
        } else if (code.equals("3")) {
            poolArea = 0;
            facilityFree = "";
        }
        Facility facility = new Facility(name, area, cost, maxPeople, rentTypId, code, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
        facility.setName(name);
        facility.setNumberOfFloors(numberOfFloors);
        Map<String, String> mapErrors = this.iFacilityService.addFacility(facility);
        if (mapErrors.size() > 0) {
            for (Map.Entry<String, String> entry: mapErrors.entrySet()) {
                request.setAttribute(entry.getKey(), entry.getValue());
            }
            try {
                request.getRequestDispatcher("view/service/test.jsp")
                        .forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        showListService(request,response);
    }
}
