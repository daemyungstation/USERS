package front.oc.oca.service.dao;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 외주업체 상담 신청을 위한 DAO
 * </pre>
 * 
 * @ClassName		: OCAOutsourcingDAO.java
 * @Description		: 외주업체 상담 신청을 위한 DAO
 * @author 김필기
 * @since 2016.03.23
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.23		   김필기				  최초 생성
 * </pre>
 */ 
@Repository("oCAOutsourcingDAO")
public class OCAOutsourcingDAO extends EmfAbstractDAO {
	
    /**
     * 온라인 상담신청 고객정보를 등록한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void insertOutsourcingInf(EmfMap emfMap) throws Exception 
	{
		insert("OCAOutsourcingDAO.insertOutsourcingInf", emfMap);
    }
	
	/**
	 * 외주업체 코드별 관리 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectOutsourcingPageMngInfo(EmfMap emfMap) throws Exception 
    {
    	return (EmfMap)selectByPk("OCAOutsourcingDAO.selectOutsourcingPageMngInfo", emfMap);
    }	
	
	/**
	 * sid가 중복되는 내용 검색
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectOverrapSid(EmfMap emfMap) throws Exception 
    {
    	return (EmfMap)selectByPk("OCAOutsourcingDAO.selectOverrapSid", emfMap);
    }

	public EmfMap agentAuthCheck(EmfMap emfMap) throws Exception {
		return (EmfMap) selectByPk("OCAOutsourcingDAO.agentAuthCheck", emfMap);
	}
	
	public EmfMap agentCdCheck(EmfMap emfMap) throws Exception {
		return (EmfMap) selectByPk("OCAOutsourcingDAO.getAgentNmByAgentCd", emfMap);
	}

	public void insertAuthInf(EmfMap emfMap) throws Exception {
		insert("OCAOutsourcingDAO.insertAuthInf", emfMap);
	}

	public Integer selectTelegramNum(EmfMap emfMap) {
		return (Integer) selectByPk("OCAOutsourcingDAO.selectTelegramNo", emfMap);
	}
}
