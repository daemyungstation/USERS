package egovframework.com.cmm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import emf.core.vo.EmfMap;

/**
 * @Class Name : EgovCmmUseServiceImpl.java
 * @Description : 공통코드등 전체 업무에서 공용해서 사용해야 하는 서비스를 정의하기위한 서비스 구현 클래스
 * @Modification Information
 *
 *    수정일       수정자         수정내용
 *    -------        -------     -------------------
 *    2009. 3. 11.     이삼섭
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 3. 11.
 * @version
 * @see
 *
 */
@Service("EgovCmmUseService")
public class EgovCmmUseServiceImpl extends AbstractServiceImpl implements EgovCmmUseService {

    @Resource(name="cmmUseDAO")
    private CmmUseDAO cmmUseDAO;

    /**
     * 공통코드를 조회한다.
     * 
     * @param ArrayList<String>
     * @return EmfMap
     * @throws Exception
     */
    public EmfMap selectCmmCodeBindAll(ArrayList<String> cdDtList) throws Exception 
    {
    	List<EmfMap> codeList = cmmUseDAO.selectCmmCodeAll();
    	
    	EmfMap cdMap = null;
    	
    	HashMap<String, Object> codeMap = new HashMap<String, Object>();
    	
    	ArrayList<EmfMap> list;
    	
    	if(codeList != null && codeList.size() > 0)
    	{
    		for(int i = 0; i < codeList.size(); i++)
        	{    		
        		cdMap = (EmfMap) codeList.get(i);
    			
        		if(codeMap.get(cdMap.getString("cdId")) == null)
    			{
    				codeMap.put(cdMap.getString("cdId"), new ArrayList<EmfMap>());
    			}
    			
        		list = (ArrayList<EmfMap>) codeMap.get(cdMap.getString("cdId"));
    			list.add(cdMap);			
    		}    	
    	}
    	
    	String cdId = "";
    			
    	EmfMap rtnMap = new EmfMap();
    	
		for(int i = 0; i < cdDtList.size(); i++)
    	{
			cdId = cdDtList.get(i).toString();
			
			if(codeMap.get(cdId) != null)
			{
				rtnMap.put(cdId, (ArrayList<EmfMap>) codeMap.get(cdId));
			}
		}    		
		
    	return rtnMap;
    }

    /**
     * 공통코드를 조회한다.
     * 
     * @param EmfMap
     * @return EmfMap
     * @throws Exception
     */
    public List<EmfMap> selectCmmCodeDetail(EmfMap emfMap) throws Exception 
    {
    	return cmmUseDAO.selectCmmCodeDetail(emfMap);
    }
    
    /**
     * 링크코드를 조회한다.
     * 
     * @param EmfMap
     * @return EmfMap
     * @throws Exception
     */
    public List<EmfMap> selectCmmLinkCode(EmfMap emfMap) throws Exception 
    {
    	return cmmUseDAO.selectCmmLinkCode(emfMap);
    }
    
    
    /**
     * (selectCmmLinkCode 메서드로 합쳐지면서 사용하지 않음)
     * LGB2B용 링크코드를 조회한다.
     * 
     * @param EmfMap
     * @return EmfMap
     * @throws Exception
     */
    public List<EmfMap> selectCmmLinkCodeLGB2B(EmfMap emfMap) throws Exception 
    {
    	return cmmUseDAO.selectCmmLinkCodeLGB2B(emfMap);
    }

    
    /**
     * 공통코드를 조회한다.
     * 
     * @param List<EmfMap>
     * @return EmfMap
     * @throws Exception
     */
    public EmfMap selectCmmCodeDetails(List<EmfMap> emfList) throws Exception 
    {
		EmfMap tmpMap = new EmfMap();
		EmfMap rtnMap = new EmfMap();
	
		for(int i = 0; i < emfList.size(); i++)
		{
			tmpMap = emfList.get(i);
			rtnMap.put(tmpMap.get("cdId"), cmmUseDAO.selectCmmCodeDetail(tmpMap));
		}
	
		return rtnMap;
    }
    
    /**
     * 공통코드를 조회한다.(단일)
     * 
     * @param List<EmfMap>
     * @return EmfMap
     * @throws Exception
     */
    public EmfMap selectCmmCodeDetailInf(EmfMap emfMap) throws Exception 
    {
		return cmmUseDAO.selectCmmCodeDetailInf(emfMap);
    }

    /**
     * THEONE용 링크코드를 조회한다.
     * 
     * @param EmfMap
     * @return EmfMap
     * @throws Exception
     */
	public List<EmfMap> selectCmmLinkCodeTHEONE(EmfMap emfMap) throws Exception {
		return cmmUseDAO.selectCmmLinkCodeTHEONE(emfMap);
	}

	public void actionViewAuthLog(EmfMap logMap) throws Exception {
		try {
			cmmUseDAO.actionViewAuthLog(logMap);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
