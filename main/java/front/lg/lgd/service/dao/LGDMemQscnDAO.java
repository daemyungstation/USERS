package front.lg.lgd.service.dao;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;
import org.springframework.stereotype.Repository;

@Repository("lGCMemQscnDAO")
public class LGDMemQscnDAO extends EmfAbstractDAO {

    public void changeQscnUserToActiveUser(String id, String ci) throws Exception {
        EmfMap emfMap = new EmfMap();
        emfMap.put("id", id);
        emfMap.put("ci", ci);
        insert("lGCMemQscnDAO.changeQscnUserToActiveUser", emfMap);
    }

    public void deleteQscnUser(String id, String ci) {
        EmfMap emfMap = new EmfMap();
        emfMap.put("id", id);
        emfMap.put("ci", ci);
        delete("lGCMemQscnDAO.deleteQscnUser", emfMap);
    }

}
