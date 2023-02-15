package front.lg.lga.service;

import javax.servlet.http.HttpServletRequest;

import emf.core.vo.EmfMap;

import java.util.HashMap;

/**
 * <pre> 
 * 회원 로그인, 로그아웃을 위한 Service
 * </pre>
 * 
 * @ClassName		: LGAMemLoginService.java
 * @Description		: 회원 로그인, 로그아웃을 위한 Service
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
public interface LGAMemLoginService {	
	
	/**
	 * 일반 로그인을 처리한다
	 * @param EmfMap
	 * @return EmfMap
	 * @exception Exception
	 */
	public EmfMap actionLogin(EmfMap emfMap, HttpServletRequest request) throws Exception;

	/**
	 * 통합 로그인 처리 (구버전)
	 *
	 * @param emfMap
	 * @param request
	 * @return
	 * @throws Exception
	 */
	EmfMap actionIntegrationLogin(EmfMap emfMap, HttpServletRequest request) throws Exception;

	public EmfMap actionLoginSso(EmfMap emfMap, HttpServletRequest request) throws Exception;

    /**
	 * 일반 로그아웃을 처리한다.
	 * @param EmfMap
	 * @return 
	 * @exception Exception
	 */
    public void actionLogout(HttpServletRequest request) throws Exception;
    
    /**
	 * 휴면 계정을 일반계정으로 변경한다.
	 * @param EmfMap
	 * @return 
	 * @exception Exception
	 */
    public void updateMemInfQscn(EmfMap emfMap) throws Exception;    
    
    /**
	 * 대리 로그인을 처리한다
	 * @param EmfMap
	 * @return EmfMap
	 * @exception Exception
	 */
    public EmfMap actionProxyLogin(EmfMap emfMap, HttpServletRequest request) throws Exception;  
    
    public void sendDataToResort(String id) throws Exception;

	/**
	 * 홈페이지 회원 정보 조회
	 *
	 * @param ci
	 * @param id
	 * @return
	 */
	EmfMap getHomepageMemberInfo(String ci, String id, String unqNo);

	public void syncUserInfo(HashMap emfMap) throws Exception;

}
