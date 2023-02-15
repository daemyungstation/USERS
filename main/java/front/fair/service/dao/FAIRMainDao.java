package front.fair.service.dao;

import java.util.List;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

import org.springframework.stereotype.Repository;

@Repository("fairMainDao")
public class FAIRMainDao extends EmfAbstractDAO {

	public List<EmfMap> configList() throws Exception {
		return list("FAIRMainDao.configList", null);
	}
	
	public List<EmfMap> selectBanner() throws Exception {
		return list("FAIRMainDao.selectBanner", null);
	}
	
	public List<EmfMap> selectPoint() throws Exception {
		return list("FAIRMainDao.selectPoint", null);
	}
	
	public List<EmfMap> selectPointList() throws Exception {
		return list("FAIRMainDao.selectPointList", null);
	}
	
	public List<EmfMap> selectCategory() throws Exception {
		return list("FAIRMainDao.selectCategory", null);
	}
	
	public List<EmfMap> selectProductList(EmfMap emfMap) throws Exception {
		return list("FAIRMainDao.selectProductList", emfMap);
	}
	
	public List<EmfMap> selectProduct(EmfMap emfMap) throws Exception {
		return list("FAIRMainDao.selectProduct", emfMap);
	}
	
	public List<EmfMap> selectProductDetail(EmfMap emfMap) throws Exception {
		return list("FAIRMainDao.selectProductDetail", emfMap);
	}
	
	public List<EmfMap> selectProductDetailBenefit(EmfMap emfMap) throws Exception {
		return list("FAIRMainDao.selectProductDetailBenefit", emfMap);
	}

	public List<EmfMap> selectEvent() throws Exception {
		return list("FAIRMainDao.selectEvent", null);
	}
	
	public void insertUser(EmfMap emfMap) throws Exception {
		insert("FAIRMainDao.insertUser", emfMap);
	}
}