package service.impl;

import model.Facility;
import repository.IFacilityRepository;
import repository.impl.FacilityRepository;
import service.IFacilityService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FacilityService implements IFacilityService {
    IFacilityRepository iFacilityRepository = new FacilityRepository();

    @Override
    public List<Facility> findAllService() {
        return iFacilityRepository.findAllService();
    }

    @Override
    public Map<String, String> addFacility(Facility facility) {
        Map<String, String> mapErrors = new HashMap<>();
        if (!facility.getName().isEmpty()) {
            if (!facility.getName().matches("[A-Za-z0-9]+")) {
                mapErrors.put("name", "Please input right format!");
            }
        } else {
            mapErrors.put("name", "Please input name!");
        }
        if (facility.getNumberOfFloors() < 0) {
            mapErrors.put("numberOfFloors", "please the number of floors is not negative!");
        }
        if (mapErrors.size() == 0) {
            this.iFacilityRepository.addFacility(facility);
        }
        return mapErrors;
    }

    @Override
    public boolean updateFacility(Facility facility) {
        return iFacilityRepository.updateFacility(facility);
    }

    @Override
    public boolean deleteFacility(int id) {
        return iFacilityRepository.deleteFacility(id);
    }

    @Override
    public Facility findID(int id) {
        return iFacilityRepository.findID(id);
    }
}
