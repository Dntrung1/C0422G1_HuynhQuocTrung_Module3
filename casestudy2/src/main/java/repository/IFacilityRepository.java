package repository;

import model.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> findAllService();
    boolean addFacility(Facility facility);
    boolean updateFacility(Facility facility);
    boolean deleteFacility(int id);
    Facility findID(int id);
}
