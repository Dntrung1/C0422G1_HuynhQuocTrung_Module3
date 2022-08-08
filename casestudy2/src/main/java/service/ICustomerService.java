package service;

import model.Customer;
import model.Facility;

import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> findAllCustomer();
    Map<String,String> addCustomer(Customer customer);
    boolean updateCustomer(Customer customer);
    boolean deleteCustomer(int id);
    Customer findIdCustomer(int id);
}
