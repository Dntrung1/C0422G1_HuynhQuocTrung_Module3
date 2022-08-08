package service;

import model.Facility;

import java.util.List;
import java.util.Map;

public interface IFacilityService {
    List<Facility> findAllService();
    Map<String,String> addFacility(Facility facility);
    boolean updateFacility(Facility facility);
    boolean deleteFacility(int id);
    Facility findID(int id);
}
