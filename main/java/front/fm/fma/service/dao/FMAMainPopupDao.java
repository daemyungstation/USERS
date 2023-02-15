package front.fm.fma.service.dao;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;
import org.springframework.stereotype.Repository;

@Repository("fMAMainPopupDao")
public class FMAMainPopupDao extends EmfAbstractDAO {

    public EmfMap getMainPopupInfo(EmfMap emfMap) throws Exception {
        return (EmfMap) selectByPk("FMAMainPopupDao.getMainPopupInfo", emfMap);
    }
}
