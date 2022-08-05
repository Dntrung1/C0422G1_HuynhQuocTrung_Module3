package service.impl;

import model.Customer;
import model.Facility;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerRepository iCustomerRepository = new CustomerRepository();
    @Override
    public List<Customer> findAllCustomer() {
        return iCustomerRepository.findAllCustomer();
    }

    @Override
    public boolean addCustomer(Customer customer) {
        return iCustomerRepository.addCustomer(customer);
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
