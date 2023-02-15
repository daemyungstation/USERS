package front.cs.csa.service;

import java.util.List;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 고객의 소리를 위한 Service
 * </pre>
 * 
 * @ClassName		: CSACustVoiceService.java
 * @Description		: 고객의 소리를 위한 Service
 * @author 허진영
 * @since 2016.03.03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.03		   허진영				  최초 생성
 * </pre>
 */ 
public interface CSACustVoiceService {	
	
	/**
	 * 고객의 소리를 등록한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertCustVoice(EmfMap emfMap) throws Exception;
	
	/**
     *  고객의 소리 문의구분 상세를 조회한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public List<EmfMap> selectPrsnInqryDtlList(EmfMap emfMap) throws Exception;
}
