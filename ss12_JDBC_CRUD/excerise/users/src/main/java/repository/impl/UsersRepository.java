package repository.impl;

import model.Users;
import repository.DatabaseUsers;
import repository.IUsersRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class UsersRepository implements IUsersRepository {
    private final String FIND_ID = "select * from users where id =?";
    private final String SELECT_ALL = "select *from users ";
    private final String SELECT_ALL_Sort = "select *from users order by name";
    private final String INSERT_INTO = "insert into users(name,email,country)" +
            "value(?,?,?)";
    private final String UPDATE = "update users set name =?,email =?,country =? where id = ?";
    private final String DELETE = "delete from users where id = ?";
    private final String FIND_BY_COUNTRY = "select *" +
            "from users " +
            "where country like concat('%',?,'%')";
    @Override
    public List<Users> findAll() {
        List<Users> users = new ArrayList<>();
        Connection connection = DatabaseUsers.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                Users us = new Users(id,name,email,country);
                users.add(us);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean add(Users users) {
        Connection connection = DatabaseUsers.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,users.getName());
            preparedStatement.setString(2,users.getEmail());
            preparedStatement.setString(3,users.getCountry());
            int check = preparedStatement.executeUpdate();
            return (check == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Users users) {
        Connection connection = DatabaseUsers.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1,users.getName());
            preparedStatement.setString(2,users.getEmail());
            preparedStatement.setString(3,users.getCountry());
            preparedStatement.setInt(4,users.getId());
            int check = preparedStatement.executeUpdate();
            return (check == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    @Override
    public boolean delete(int id) {
        Connection connection = DatabaseUsers.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            int check = preparedStatement.executeUpdate();
            return (check == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Users findId(int id) {
        Users users = null;
        Connection connection = DatabaseUsers.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users = new Users(id,name,email,country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users ;
    }

    @Override
    public List<Users> findByCountry(String country) {
        List<Users> users = new ArrayList<>();
        Connection connection = DatabaseUsers.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_COUNTRY);
            preparedStatement.setString(1,country);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                Users us = new Users(id,name,email,country);
                users.add(us);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users ;
    }

    @Override
    public List<Users> findAllSort() {
        List<Users> users = new ArrayList<>();
        Connection connection = DatabaseUsers.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_Sort);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                Users us = new Users(id,name,email,country);
                users.add(us);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

}
