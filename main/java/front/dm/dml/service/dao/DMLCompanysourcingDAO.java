package front.dm.dml.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractOutDAO;
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
@Repository("dMLCompanysourcingDAO")
public class DMLCompanysourcingDAO extends EmfAbstractOutDAO {
	/**
     * 임동진테스트
     * 
     * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public List<EmfMap> selectLdjList(EmfMap emfMap) throws Exception
	{
		return list("DMLCompanysourcingDAO.selectLdjList", emfMap);
	}
	
	/**
     * EIS화면 개발
     * 
     * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public List<EmfMap> selectEisList(EmfMap emfMap) throws Exception
	{
		return list("DMLCompanysourcingDAO.selectEisList", emfMap);
	}	
	
	/**
     * 임동진행사정보
     * 
     * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public List<EmfMap> selectLdj_Event_List(EmfMap emfMap) throws Exception
	{
		return list("DMLCompanysourcingDAO.selectLdj_Event_List", emfMap);
	}
	
	/**
     * 투어몰 조회
     * 
     * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public List<EmfMap> selectLdj_Tour_List(EmfMap emfMap) throws Exception
	{
		return list("DMLCompanysourcingDAO.selectLdj_Tour_List", emfMap);
	}	
	
	public List<EmfMap> select_SDP_CHECK_List(EmfMap emfMap) throws Exception
	{
		return list("DMLCompanysourcingDAO.select_SDP_CHECK_List", emfMap);
	}

	public List<EmfMap> select_THEONE_CHECK_List(EmfMap emfMap) 
	{
		return list("DMLCompanysourcingDAO.select_THEONE_CHECK_List", emfMap);
	}
	
	//임동진 test
	public Integer selectChkReqnCnt(EmfMap emfMap) throws Exception
	{
		return (Integer) selectByPk("DMLCompanysourcingDAO.selectChkReqnCnt", emfMap);
	}
	
	// 회원몰 아이디 체크 count
	public String selectIdCheck(EmfMap emfMap) throws Exception
	{
		return (String) selectByPk("DMLCompanysourcingDAO.selectIdCheck", emfMap);
	}

	/**
     * 일별 만기방어 리스트
     * 
     * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public List<EmfMap> selectResnProtectList(EmfMap emfMap) throws Exception
	{
		return list("DMLCompanysourcingDAO.selectResnProtectList", emfMap);
	}
	
}
