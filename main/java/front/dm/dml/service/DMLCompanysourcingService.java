package front.dm.dml.service;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 외주업체 상담 신청을 위한 Service
 * </pre>
 * 
 * @ClassName		: OCAOutsourcingService.java
 * @Description		: 외주업체 상담 신청을 위한 Service
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
public interface DMLCompanysourcingService {	
	
	/**
	 * 임동진테스트
	 * 
	 * @param EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectEisList(EmfMap emfMap) throws Exception;
	
	public EmfMap selectLdjList(EmfMap emfMap) throws Exception;
	
	public EmfMap selectLdj_Event_List(EmfMap emfMap) throws Exception;
	
	public EmfMap selectLdj_Tour_List(EmfMap emfMap) throws Exception;
	
	public EmfMap select_SDP_CHECK_List(EmfMap emfMap) throws Exception;
	
	public EmfMap select_THEONE_CHECK_List(EmfMap emfMap) throws Exception;
	
	public EmfMap insertChkReqn(EmfMap emfMap) throws Exception;
	
	//회원몰 회원 아이디 체크
	public EmfMap selectShopIdCheck(EmfMap emfMap) throws Exception;
	
	//만기방어 실적
	public EmfMap selectResnProtectList(EmfMap emfMap) throws Exception;
	
}
