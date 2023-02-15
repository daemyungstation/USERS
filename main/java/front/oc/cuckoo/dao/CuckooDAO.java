package front.oc.cuckoo.dao;

import emf.core.extend.dao.EmfAbstractOutDAO;
import emf.core.vo.EmfMap;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CuckooDAO extends EmfAbstractOutDAO {

    public List getUserRecord(EmfMap emfMap) throws Exception {
        return list("CuckooDAO.getUserRecord", emfMap);
    }

    public Integer getUserRecordTotalCount(EmfMap emfMap) throws Exception {
        return (Integer) selectByPk("CuckooDAO.getUserRecordTotalCount", emfMap);
    }
}
