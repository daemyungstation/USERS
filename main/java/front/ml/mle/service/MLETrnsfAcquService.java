package front.ml.mle.service;

import java.util.List;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 양도·양수 안내를 위한 Service
 * </pre>
 * 
 * @ClassName		: MLETrnsfAcquService.java
 * @Description		: 양도·양수 안내를 위한 Service
 * @author 허진영
 * @since 2016.03.14
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.14		   허진영				  최초 생성
 * </pre>
 */ 
public interface MLETrnsfAcquService {	
	
	/**
	 * 가입상품 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectJoinPrdctList(EmfMap emfMap) throws Exception;
}
