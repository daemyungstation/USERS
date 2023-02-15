package front.lg.lgb.service;

import javax.servlet.http.HttpServletRequest;

import emf.core.vo.EmfMap;

import java.util.List;
import java.util.Map;

/**
 * <pre> 
 * 회원 가입을 위한 Service
 * </pre>
 * 
 * @ClassName		: LGBMemJoinService.java
 * @Description		: 회원 가입을 위한 Service
 * @author 김필기
 * @since 2016.03.02
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.02		   김필기				  최초 생성
 * </pre>
 */ 
public interface LGBMemJoinService {	
	
	/**
	 * 회원 정보를 등록한다.
	 * 
	 * @param emfMap
	 * @param request
	 * @throws Exception 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertMemInf(EmfMap emfMap, HttpServletRequest request) throws Exception;
	public void insertMemInfSso(EmfMap emfMap, HttpServletRequest request) throws Exception;

	/**
	 * 로그인 시도 횟수 조회
	 *
	 * @param id
	 * @return
	 * @throws Exception
	 */
	EmfMap selectMemLgnCnt(String id) throws Exception;
	public EmfMap selectMemLgnCntByCi(String ci) throws Exception;

	/**
	 * 최초 로그인 시도 저장
	 *
	 * @param id
	 * @throws Exception
	 */
	void insertMemLgnCnt(String id) throws Exception;

	/**
	 * 로그인 시도 횟수 수정
	 *
	 * @param emfMap
	 * @throws Exception
	 */
	void updateMemLgnCnt(EmfMap emfMap) throws Exception;

	/**
	 * 로그인 시도 횟수 삭제 (초기화)
	 * @param id
	 * @throws Exception
	 */
	void deleteMemLgnCnt(String id) throws Exception;
	
	/**
	 * 회원 정보를 가져온다(아이디, 이메일 중복검사 혼용)
	 * 
	 * @param emfMap (check : id or email)
	 * @return EmfMap
	 * @throws Exception 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMemInf(EmfMap emfMap) throws Exception;

	/**
	 * 통합 회원 이메일 중복 체크
	 *
	 * @param emfMap
	 * @return
	 * @throws Exception
	 */
	public int checkIntegrationEmail(EmfMap emfMap) throws Exception;

	/**
	 * 통합 회원 가입 정보를 가져온다.
	 *
	 * @param ci
	 * @return
	 * @throws Exception
	 */
	List<EmfMap> selectIntegrationMemberInfo(String ci, String id) throws Exception;

	/**
	 * 상조 회원 가입 정보를 가져온다.
	 *
	 * @param ci
	 * @return
	 * @throws Exception
	 */
	List<EmfMap> selectFuneralMemberInfo(String ci) throws Exception;

	/**
	 * 사용가능한 아이디 조회
	 *
	 * @param emfMap
	 * @return
	 */
	Map<String, Object> checkAvailableAccount(EmfMap emfMap);
	public Map<String, Object> checkAvailableAccountSso(EmfMap emfMap, HttpServletRequest request) throws Exception;

	/**
	 * 비밀번호를 변경한다.
	 * 
	 * @param emfMap
	 * @return EmfMap
	 * @throws Exception 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateMemPwdInf(EmfMap emfMap) throws Exception;

	void updateIntegrationMemPwdInf(EmfMap emfMap) throws Exception;

	public void updateMemAgreement(EmfMap emfMap) throws Exception;

	/**
	 * 회원 정보를 가져온다(아이디, 이메일 중복검사 혼용)
	 * 
	 * @param EmfMap(check : id or email)
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
//	public EmfMap selectIdEmailCheck(EmfMap emfMap) throws Exception;

	void updateIntegrationMemInf(EmfMap emfMap, HttpServletRequest request) throws Exception;
	public void updateIntegrationMemInfSso(EmfMap emfMap, HttpServletRequest request) throws Exception;

	public EmfMap getCheckAuth(EmfMap emfMap, HttpServletRequest request) throws Exception;

}
