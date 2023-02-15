package front.fair.service;

import java.util.List;
import emf.core.vo.EmfMap;

public interface FAIRMainService {

    public List<EmfMap> configList() throws Exception;
    
    public List<EmfMap> selectBanner() throws Exception;
    
    public List<EmfMap> selectPoint() throws Exception;
    
    public List<EmfMap> selectPointList() throws Exception;
    
    public List<EmfMap> selectCategory() throws Exception;
    
    public List<EmfMap> selectProductList(EmfMap emfMap) throws Exception;
    
    public List<EmfMap> selectProduct(EmfMap emfMap) throws Exception;

    public List<EmfMap> selectProductDetail(EmfMap emfMap) throws Exception;
    
    public List<EmfMap> selectProductDetailBenefit(EmfMap emfMap) throws Exception;
    
    public List<EmfMap> selectEvent() throws Exception;
    
    public void insertUser(EmfMap emfMap) throws Exception;
}