package front.fm.fma.service.dao;

import java.util.List;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

import org.springframework.stereotype.Repository;

@Repository("fMAMainMngDao")
public class FMAMainMngDao extends EmfAbstractDAO {

	public List<EmfMap> selectVisualMainList() throws Exception {
		return list("FMAMainMngDao.selectVisualMainList", null);
	}
	
	public List<EmfMap> selectContentMainList() throws Exception {
		return list("FMAMainMngDao.selectContentMainList", null);
	}
}
