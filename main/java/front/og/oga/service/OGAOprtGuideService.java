package front.og.oga.service;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 이용안내 조회를 위한 Service
 * </pre>
 * 
 * @ClassName		: OGAOprtGuideService.java
 * @Description		: 이용안내 조회를 위한 Service
 * @author 허진영
 * @since 2016.03.11
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.11		   허진영				  최초 생성
 * </pre>
 */ 
public interface OGAOprtGuideService {	
	
	/**
	 * 이용안내를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectOprtGuide(EmfMap emfMap) throws Exception;
}
