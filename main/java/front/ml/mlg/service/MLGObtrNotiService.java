package front.ml.mlg.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 부고알리미를 위한 Service
 * </pre>
 * 
 * @ClassName		: MLGObtrNotiService.java
 * @Description		: 부고알리미를 위한 Service
 * @author 허진영
 * @since 2016.03.04
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.04		   허진영				  최초 생성
 * </pre>
 */ 
public interface MLGObtrNotiService {	
	
	/**
	 * 가입상품 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectJoinPrdctList(EmfMap emfMap) throws Exception;
	
	/**
	 * 부고알리미 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectObtrNotiInf(EmfMap emfMap) throws Exception;
	
	/**
	 * 부고알리미 정보를 저장한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateObtrNotiInf(EmfMap emfMap) throws Exception;
	
	/**
	 * 양식으로 업로드된 데이터를 가져온다.
	 * 
	 * @param EmfMap
	 * @return List<String>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<String> getFormExcelData(EmfMap emfMap, MultipartHttpServletRequest multiRequest) throws Exception;
	
	/**
	 * 부고알리미를 발송한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertObtrNotiSend(EmfMap emfMap) throws Exception;
}
