package front.fair.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.fair.service.dao.FAIRMainDao;
import front.fair.service.FAIRMainService;

@Service("fairMainService")
public class FAIRMainServiceImpl extends EmfAbstractService implements FAIRMainService {
	
	@Resource(name = "fairMainDao")
	private FAIRMainDao fairMainDao;
	
	public List<EmfMap> configList() throws Exception {
        return fairMainDao.configList();
    }
    
    public List<EmfMap> selectBanner() throws Exception {
        return fairMainDao.selectBanner();
    }
    
    public List<EmfMap> selectPoint() throws Exception {
        return fairMainDao.selectPoint();
    }
    
    public List<EmfMap> selectPointList() throws Exception {
        return fairMainDao.selectPointList();
    }
    
    public List<EmfMap> selectCategory() throws Exception {
        return fairMainDao.selectCategory();
    }
    
    public List<EmfMap> selectProductList(EmfMap emfMap) throws Exception {
        return fairMainDao.selectProductList(emfMap);
    }
    
    public List<EmfMap> selectProduct(EmfMap emfMap) throws Exception {
        return fairMainDao.selectProduct(emfMap);
    }

    public List<EmfMap> selectProductDetail(EmfMap emfMap) throws Exception {
        return fairMainDao.selectProductDetail(emfMap);
    }
    
    public List<EmfMap> selectProductDetailBenefit(EmfMap emfMap) throws Exception {
        return fairMainDao.selectProductDetailBenefit(emfMap);
    }
    
    public List<EmfMap> selectEvent() throws Exception {
        return fairMainDao.selectEvent();
    }
    
    public void insertUser(EmfMap emfMap) throws Exception {
    	fairMainDao.insertUser(emfMap);
    }

}
