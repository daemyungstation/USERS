package front.lp.service;

import java.util.List;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 온라인 상품가입 위한 Service
 * </pre>
 * 
 * @ClassName		: LPOnlinePrdctService.java
 * @Description		: 온라인 상품가입을 위한 Service
 * @author 김필기
 * @since 2016.03.04
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.04		   김필기				  최초 생성
 * </pre>
 */ 
public interface LPOnlinePrdctService {	
	
	/**
	 * 최근에 적용된 약관을 조회한다.
	 * @param emfMap
	 * @return
	 * @throws Exception
	 */
	public EmfMap selectTopTerms(EmfMap emfMap) throws Exception;
	
    /**
     * 온라인 상담신청 정보를 작성 화면
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap selectOnlinePrdctInf(EmfMap emfMap) throws Exception;	

    /**
     * 온라인 상담신청 정보를 등록한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void insertOnlinePrdctJoin(EmfMap emfMap) throws Exception;
    
    /**
     * 회사 목록을 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap selectCompanyList(EmfMap emfMap) throws Exception;	
	
	/**
	 * 상품별 적용된 최신 약관을 조회한다.
	 * @param emfMap
	 * @return
	 * @throws Exception
	 */
	public EmfMap getTerms(EmfMap emfMap) throws Exception;
	
	/**
     * 약관 상세내용을 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap selectTermsDtl(EmfMap emfMap) throws Exception;

	/**
     * 약관 및 계약안내 설정 확인
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap checkTermGrp(EmfMap emfMap) throws Exception;
    
	/**
     * 가입신청일자를 기준으로 적용된 약관 및 계약안내를 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public List<EmfMap> selectMemTerm(EmfMap emfMap) throws Exception;    
}
