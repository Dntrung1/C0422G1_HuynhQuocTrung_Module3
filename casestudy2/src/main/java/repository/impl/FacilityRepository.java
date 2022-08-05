package repository.impl;

import model.Facility;
import repository.Database;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private final String FIND_ID = "select * from dich_vu where ma_dich_vu =?";
    private final String SELECT_ALL_SERVICE = "select *from dich_vu;";
    private final String INSERT_INTO_SERVICE = "insert into dich_vu (ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_Da,ma_kieu_thue,ma_loai_dich_vu,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem) \n" +
            "value (?,?,?,?,?,?,?,?,?,?,?)";
    private final String UPDATE = "update dich_vu" +
            "set ten_dich_vu = ?,dien_tich = ?,chi_phi_thue = ?,so_nguoi_toi_Da = ?,ma_kieu_thue= ?, tieu_chuan_phong = ?, mo_ta_tien_nghi_khac = ?, dien_tich_ho_boi = ?,so_tang = ?,dich_vu_mien_phi_di_kem" +
            "where ma_dich_vu = ?;";
//    private final String UPDATE_VILLA = "update dich_vu" +
//            "set ten_dich_vu = ?,dien_tich = ?,chi_phi_thue = ?,so_nguoi_toi_Da = ?,ma_kieu_thue= ?, tieu_chuan_phong = ?, mo_ta_tien_nghi_khac = ?, dien_tich_ho_boi = ?,so_tang = ?" +
//            "where ma_dich_vu = ?;";
//    private final String UPDATE_ROOM = "update dich_vu" +
//            "set ten_dich_vu = ?,dien_tich = ?,chi_phi_thue = ?,so_nguoi_toi_Da = ?,ma_kieu_thue= ?, dich_vu_mien_phi_di_kem = ?" +
//            "where ma_dich_vu = ?;";
//    private final String UPDATE_HOUSE = "update dich_vu" +
//            "set ten_dich_vu = ?,dien_tich = ?,chi_phi_thue = ?,so_nguoi_toi_Da = ?,ma_kieu_thue= ?, tieu_chuan_phong = ?, mo_ta_tien_nghi_khac = ?, so_tang = ?" +
//            "where ma_dich_vu = ?;";

    @Override
    public List<Facility> findAllService() {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = Database.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idService = resultSet.getInt("ma_dich_vu");
                String name = resultSet.getString("ten_dich_vu");
                double area = resultSet.getDouble("dien_tich");
                double cost = resultSet.getDouble("chi_phi_thue");
                int maxPeople = resultSet.getInt("so_nguoi_toi_Da");
                String rentTypId = resultSet.getString("ma_kieu_thue");
                String code = resultSet.getString("ma_loai_dich_vu");
                String standardRoom = resultSet.getString("tieu_chuan_phong");
                String descriptionOtherConvenience = resultSet.getString("mo_ta_tien_nghi_khac");
                double poolArea = resultSet.getDouble("dien_tich_ho_boi");
                int numberOfFloors = resultSet.getInt("so_tang");
                String facilityFree = resultSet.getString("dich_vu_mien_phi_di_kem");
                Facility facility = new Facility(idService, name, area, cost, maxPeople, rentTypId, code, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
                facilityList.add(facility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return facilityList;
    }

    @Override
    public boolean addFacility(Facility facility) {
        Connection connection = Database.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_SERVICE);
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setDouble(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getRentTypId());
            preparedStatement.setString(6, facility.getCode());
            preparedStatement.setString(7, facility.getStandardRoom());
            preparedStatement.setString(8, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9, facility.getPoolArea());
            preparedStatement.setInt(10, facility.getNumberOfFloors());
            preparedStatement.setString(11, facility.getFacilityFree());
            int check = preparedStatement.executeUpdate();
            return (check == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateFacility(Facility facility) {
        Connection connection = Database.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setDouble(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getRentTypId());
            preparedStatement.setString(6, facility.getCode());
            preparedStatement.setString(7, facility.getStandardRoom());
            preparedStatement.setString(8, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9, facility.getPoolArea());
            preparedStatement.setInt(10, facility.getNumberOfFloors());
            preparedStatement.setString(11, facility.getFacilityFree());
            preparedStatement.setInt(12,facility.getIdService());
            int check = preparedStatement.executeUpdate();
            return (check == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Facility findID(int id) {
        Facility facility = null;
        Connection connection = Database.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("ten_dich_vu");
                double area = resultSet.getDouble("dien_tich");
                double cost = resultSet.getDouble("chi_phi_thue");
                int maxPeople = resultSet.getInt("so_nguoi_toi_Da");
                String rentTypId = resultSet.getString("ma_kieu_thue");
                String code = resultSet.getString("ma_loai_dich_vu");
                String standardRoom = resultSet.getString("tieu_chuan_phong");
                String descriptionOtherConvenience = resultSet.getString("mo_ta_tien_nghi_khac");
                double poolArea = resultSet.getDouble("dien_tich_ho_boi");
                int numberOfFloors = resultSet.getInt("so_tang");
                String facilityFree = resultSet.getString("dich_vu_mien_phi_di_kem");
                facility = new Facility(id, name, area, cost, maxPeople, rentTypId, code, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facility;
    }
}
