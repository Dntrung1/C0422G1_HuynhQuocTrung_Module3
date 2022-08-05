package repository;

import model.Customer;
import model.Facility;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAllCustomer();
    boolean addCustomer(Customer customer);
    boolean updateCustomer(Customer customer);
    boolean deleteCustomer(int id);
    Customer findIdCustomer(int id);
}
