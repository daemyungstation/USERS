package front.lg.lgb.service;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 전산DB 회원정보 Service
 * </pre>
 * 
 * @ClassName		: DMLifeMemService.java
 * @Description		: 전산DB 회원정보 Service
 * @author 김필기
 * @since 2016.03.03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.03		   김필기				  최초 생성
 * </pre>
 */ 
public interface DMLifeMemService {	
	
	/**
	 * 회원 정보를 가져온다
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectDMLifeMemInf(EmfMap emfMap) throws Exception;		
	
	public EmfMap selectJoinPtcList(EmfMap emfMap) throws Exception;
}
