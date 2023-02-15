package front.cs.csa.service;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * VOC Service
 * </pre>
 * 
 * @ClassName		: CSAVocService.java
 * @Description		: VOC Service
 * @author 장준일
 * @since 2021.02.23
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2021.02.23		   장준일				  최초 생성
 * </pre>
 */ 
public interface CSAVocService {	
	
	/**
	 * VOC를 등록한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertVoc(EmfMap emfMap) throws Exception;
}
