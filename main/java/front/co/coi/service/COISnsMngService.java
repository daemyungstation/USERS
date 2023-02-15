package front.co.coi.service;


import java.util.List;

import emf.core.vo.EmfMap;
import front.co.coi.service.dao.COISnsMngDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("cOISnsMngService")
public class COISnsMngService {

    @Autowired
    private COISnsMngDao cOISnsMngDao;

    public List<EmfMap> selectSnsList(EmfMap emfMap) throws Exception {
        return cOISnsMngDao.selectSnsList(emfMap);
    }
}
