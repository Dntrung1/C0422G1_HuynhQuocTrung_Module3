package service;

import model.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> findAllService();
    boolean addFacility(Facility facility);
    boolean updateFacility(Facility facility);
    boolean deleteFacility(int id);
    Facility findID(int id);
}
