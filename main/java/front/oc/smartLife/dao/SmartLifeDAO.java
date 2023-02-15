package front.oc.smartLife.dao;

import emf.core.extend.dao.EmfAbstractOutDAO;
import emf.core.vo.EmfMap;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SmartLifeDAO extends EmfAbstractOutDAO {

    public List getUserRecord(EmfMap emfMap) throws Exception {
        return list("SmartLifeDAO.getUserRecord", emfMap);
    }

    public Integer getUserRecordTotalCount(EmfMap emfMap) throws Exception {
        return (Integer) selectByPk("SmartLifeDAO.getUserRecordTotalCount", emfMap);
    }
}
