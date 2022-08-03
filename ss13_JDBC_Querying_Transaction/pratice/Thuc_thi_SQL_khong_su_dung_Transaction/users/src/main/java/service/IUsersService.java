package service;

import model.Users;

import java.util.List;

public interface IUsersService {
    List<Users> findAll();
    boolean add(Users users);
    boolean update(Users users);
    boolean delete(int id);
    Users findId(int id);
    List<Users> findByCountry(String country);
    List<Users> findAllSort();
    Users getUserById(int id);
    void insertUser(Users users);
    void insertUpdateWithoutTransaction();
}
