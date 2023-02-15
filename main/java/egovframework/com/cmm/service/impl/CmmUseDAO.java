package egovframework.com.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * @Class Name : COECdMngDAO.java
 * @Description : 공통코드등 전체 업무에서 공용해서 사용해야 하는 서비스를 정의하기위한 데이터 접근 클래스
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
@Repository("cmmUseDAO")
public class CmmUseDAO extends EmfAbstractDAO {

	/**
     * 주어진 조건에 따른 공통코드를 불러온다.
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    public List<EmfMap> selectCmmCodeAll() throws Exception 
    {
    	return list("CmmUseDAO.selectCdIdAllList", null);
    }

    /**
     * 주어진 조건에 따른 공통코드를 불러온다.
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    public List<EmfMap> selectCmmCodeDetail(EmfMap emfMap) throws Exception 
    {
    	return list("CmmUseDAO.selectCmmCodeDetail", emfMap);
    }
    
    /**
     * 주어진 조건에 따른 링크코드를 불러온다.
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    public List<EmfMap> selectCmmLinkCode(EmfMap emfMap) throws Exception 
    {
    	return list("CmmUseDAO.selectCmmLinkCode", emfMap);
    }
    

    /**
     * (selectCmmLinkCode 메서드로 합쳐지면서 사용하지 않음)
     * 주어진 조건에 따른 링크코드를 불러온다.
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    public List<EmfMap> selectCmmLinkCodeLGB2B(EmfMap emfMap) throws Exception 
    {
    	return list("CmmUseDAO.selectCmmLinkCodeLGB2B", emfMap);
    }

    
    /**
     * 주어진 조건에 따른 공통코드를 불러온다.(단일)
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    public EmfMap selectCmmCodeDetailInf(EmfMap emfMap) throws Exception 
    {
    	return (EmfMap)selectByPk("CmmUseDAO.selectCmmCodeDetailInf", emfMap);
    }

    /**
     * THEONE정보에 따른 링크코드를 불러온다.
     * 
     * @param vo
     * @return
     * @throws Exception
     */
	public List<EmfMap> selectCmmLinkCodeTHEONE(EmfMap emfMap) throws Exception{
		return list("CmmUseDAO.selectCmmLinkCodeTHEONE", emfMap);
	}

	public void actionViewAuthLog(EmfMap emfMap) {
		insert("CmmUseDAO.actionViewAuthLog", emfMap);
	}    
}
