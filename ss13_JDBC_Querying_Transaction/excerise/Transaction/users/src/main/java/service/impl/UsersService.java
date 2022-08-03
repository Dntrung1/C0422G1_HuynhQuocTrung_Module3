package service.impl;

import model.Users;
import repository.IUsersRepository;
import repository.impl.UsersRepository;
import service.IUsersService;

import java.util.List;
public class UsersService implements IUsersService {
    IUsersRepository iUsersRepository = new UsersRepository();
    @Override
    public List<Users> findAll() {
        return iUsersRepository.findAll();
    }

    @Override
    public boolean add(Users users) {
        return iUsersRepository.add(users);
    }

    @Override
    public boolean update(Users users) {
        return iUsersRepository.update(users);
    }

    @Override
    public boolean delete(int id) {
        return iUsersRepository.delete(id);
    }

    @Override
    public Users findId(int id) {
        return iUsersRepository.findId(id);
    }

    @Override
    public List<Users> findByCountry(String country) {
        return iUsersRepository.findByCountry(country);
    }

    @Override
    public List<Users> findAllSort() {
        return iUsersRepository.findAllSort();
    }

    @Override
    public String addUserTransaction() {
        return iUsersRepository.addUserTransaction();
    }
}
