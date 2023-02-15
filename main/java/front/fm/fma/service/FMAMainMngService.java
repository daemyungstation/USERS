package front.fm.fma.service;


import java.util.List;

import emf.core.vo.EmfMap;
import front.fm.fma.service.dao.FMAMainMngDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("fMAMainMngService")
public class FMAMainMngService {

    @Autowired
    private FMAMainMngDao fMAMainMngDao;

    public List<EmfMap> selectVisualMainList() throws Exception {
        return fMAMainMngDao.selectVisualMainList();
    }
    
    public List<EmfMap> selectContentMainList() throws Exception {
		return fMAMainMngDao.selectContentMainList();
	}
}
