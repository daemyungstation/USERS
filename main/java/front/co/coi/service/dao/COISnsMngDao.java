package front.co.coi.service.dao;

import java.util.List;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

import org.springframework.stereotype.Repository;

@Repository("cOISnsMngDao")
public class COISnsMngDao extends EmfAbstractDAO {

	public List<EmfMap> selectSnsList(EmfMap emfMap) throws Exception {
		return list("COISnsMngDao.selectSnsList", emfMap);
	}
}
