package service.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    ICustomerRepository iCustomerRepository = new CustomerRepository();
    @Override
    public List<Customer> findAllCustomer() {
        return iCustomerRepository.findAllCustomer();
    }

    @Override
    public Map<String, String> addCustomer(Customer customer) {
        Map<String, String> mapErrors = new HashMap<>();
        if (!customer.getName().isEmpty()) {
            if (!customer.getName().matches("[A-Za-z ]+")) {
                mapErrors.put("name", "Please input right format!");
            }
        } else {
            mapErrors.put("name", "Please input name!");
        }

        if (!customer.getPhone().isEmpty()) {
            if (!customer.getPhone().matches("[0|84+][90|91][0-9]{7}")) {
                mapErrors.put("phone", "Please input right format!");
            }
        } else {
            mapErrors.put("phone", "Please input phone!");
        }

        if (!customer.getIdCard().isEmpty()) {
            if (!customer.getIdCard().matches("[0-9]{9}")) {
                mapErrors.put("idCard", "Please input right format!");
            }
        } else {
            mapErrors.put("idCard", "Please input CMND!");
        }

        if (!customer.getEmail().isEmpty()) {
            if (!customer.getEmail().matches("[A-Za-z\\d_]+@[a-z]+.com")) {
                mapErrors.put("email", "Please input right format!");
            }
        } else {
            mapErrors.put("email", "Please input Email!");
        }

        if (mapErrors.size() == 0) {
            this.iCustomerRepository.addCustomer(customer);
        }
        return mapErrors;
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return iCustomerRepository.updateCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int id) {
        return iCustomerRepository.deleteCustomer(id);
    }

    @Override
    public Customer findIdCustomer(int id) {
        return iCustomerRepository.findIdCustomer(id);
    }
}
