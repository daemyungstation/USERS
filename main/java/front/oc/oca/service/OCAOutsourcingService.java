package front.oc.oca.service;

import javax.servlet.http.HttpServletRequest;

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
public interface OCAOutsourcingService {	
	
	/**
	 * 회원 정보를 등록한다.
	 * 
	 * @param EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public boolean insertOutsourcingInf(EmfMap emfMap, HttpServletRequest request) throws Exception;
	
	/**
     * 외주업체 코드별 관리 정보를 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap selectOutsourcingPageMngInfo(EmfMap emfMap) throws Exception;

	/**
     * 외주업체 상품 정보를 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap selectOutsourcingPrdctList(EmfMap emfMap) throws Exception;

	/**
	 * (selectCmmLinkCode 메서드로 합쳐지면서 사용하지 않음)
     * LG B2B 를 위한 상품 정보 조회
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap selectOutsourcingPrdctListLGB2B(EmfMap emfMap) throws Exception;

    /**
     * 쿼리를 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap getOverrapSid(EmfMap emfMap) throws Exception;

    /**
     * THEONE을 위한 상품 정보 조회
     * @param emfMap
     * @return
     */
	public EmfMap selectOutsourcingPrdctListTHEONE(EmfMap emfMap) throws Exception;

	public EmfMap agentAuthCheck(HttpServletRequest request, EmfMap paramMap) throws Exception;

	public void insertAuthInf(EmfMap emfMap) throws Exception;

	public EmfMap agentCdCheck(HttpServletRequest request, EmfMap paramMap) throws Exception;
    
}
