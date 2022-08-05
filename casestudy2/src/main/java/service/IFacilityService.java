package service;

import model.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> findAllService();
    boolean addFacility(Facility facility);
    boolean updateFacility(Facility facility);
    Facility findID(int id);
}
