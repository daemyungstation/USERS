package front.fm.fma.service;


import emf.core.vo.EmfMap;
import front.fm.fma.service.dao.FMAMainPopupDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("fMAMainPopupService")
public class FMAMainPopupService {

    @Autowired
    private FMAMainPopupDao fmaMainPopupDao;

    public EmfMap getMainPopupInfo(EmfMap emfMap) throws Exception {
        return fmaMainPopupDao.getMainPopupInfo(emfMap);
    }
}
