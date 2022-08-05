package service.impl;

import model.Facility;
import repository.IFacilityRepository;
import repository.impl.FacilityRepository;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    IFacilityRepository iFacilityRepository = new FacilityRepository();
    @Override
    public List<Facility> findAllService() {
        return iFacilityRepository.findAllService();
    }

    @Override
    public boolean addFacility(Facility facility) {
        return iFacilityRepository.addFacility(facility);
    }

    @Override
    public boolean updateFacility(Facility facility) {
        return iFacilityRepository.updateFacility(facility);
    }

    @Override
    public Facility findID(int id) {
        return iFacilityRepository.findID(id);
    }
}
