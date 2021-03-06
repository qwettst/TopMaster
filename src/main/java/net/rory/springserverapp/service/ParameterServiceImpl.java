package net.rory.springserverapp.service;


import net.rory.springserverapp.dao.ParameterDao;
import net.rory.springserverapp.model.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ParameterServiceImpl implements ParameterService {
    @Autowired
    ParameterDao parameterDao;

    @Override
    public List<Parameter> getAllParameters() {
        return parameterDao.findAll();
    }
}
