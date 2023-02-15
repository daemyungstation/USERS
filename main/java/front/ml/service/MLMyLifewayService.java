package front.ml.service;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * MyLifeway를 위한 Service
 * </pre>
 * 
 * @ClassName		: MLMyLifewayService.java
 * @Description		: MyLifeway를 위한 Service
 * @author 허진영
 * @since 2016.03.21
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.21		   허진영				  최초 생성
 * </pre>
 */ 
public interface MLMyLifewayService {	

	/**
	 * 고유번호 확인요청을 등록한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap insertChkReqn(EmfMap emfMap) throws Exception;
}
