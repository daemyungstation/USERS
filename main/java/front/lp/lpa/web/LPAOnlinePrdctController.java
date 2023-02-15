package front.lp.lpa.web;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.lg.lgb.service.LGBMemJoinService;
import front.lp.service.LPOnlinePrdctService;

/**
 * <pre> 
 * 온라인 상품가입을 위한 Controller
 * </pre>
 * 
 * @ClassName		: LPAOnlinePrdctController.java
 * @Description		: 온라인 상품가입을 위한 Controller
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
@Controller
@RequestMapping("/onlineproduct")
public class LPAOnlinePrdctController extends EmfController {

	/** 서비스 **/
	@Resource(name="lPOnlinePrdctService")
    private LPOnlinePrdctService lPOnlinePrdctService;
	
	@Resource(name="lGBMemJoinService")
    private LGBMemJoinService lGBMemJoinService;
	
	/**
     * 약관동의 화면
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/normal/agree.do")
	public String selectAgreeView(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		String url = "";
		
		if(lgnMap != null)
		{
			modelMap.put("rtnMap", lPOnlinePrdctService.selectTopTerms(emfMap));
			
			url = "front/lp/lpa/LPAOnlinePrdctGnrlAgree.front";
		}
		else
		{
			url = "front/lp/lpa/LPAOnlinePrdctGnrlLogin.front";
		}
		
		return url;
	}
	
	/**
     * 일반회원 회원정보 화면
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/normal/info.do")
	public String getMemInfView(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		String url = "";
		
		if(lgnMap != null)
		{
			emfMap.put("id", lgnMap.get("id"));
			modelMap.put("rtnMap", lGBMemJoinService.selectMemInf(emfMap));
			
			url = "front/lp/lpa/LPAMemInf.front";
		}
		else
		{
			url = "front/lp/lpa/LPAOnlinePrdctGnrlLogin.front";
		}
		
		return url;
	}	
	
	/**
     * 일반회원 작성 화면
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/normal/write.do")
	public String selectOnlinePrdctInf(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		String url = "";
		
		if(lgnMap != null)
		{
			EmfMap memInfoMap = new EmfMap();
			
			memInfoMap.put("id", lgnMap.get("id"));
			modelMap.put("memInfo", lGBMemJoinService.selectMemInf(memInfoMap));			
			
			emfMap.put("prdctCsGb", EgovProperties.getProperty("Globals.gnrlPrdctCd"));
			EmfMap rtnMap = lPOnlinePrdctService.selectOnlinePrdctInf(emfMap);
			
			rtnMap.put("prdctCsGb", emfMap.get("prdctCsGb"));								//	상담상품 구분(일반, b2b)
			rtnMap.put("cms", EgovProperties.getProperty("Globals.cms"));					//  계좌구분 코드(cms)
			rtnMap.put("creditCard", EgovProperties.getProperty("Globals.creditCard"));		//  계좌구분 코드(신용카드)
			
			modelMap.addAttribute("rtnMap", rtnMap);			
			
			url = "front/lp/lpa/LPAOnlinePrdctGnrlWrite.front";
		}
		else
		{
			url = "front/lp/lpa/LPAOnlinePrdctGnrlLogin.front";
		}
		
		return url;
	}
	
	/**
	 * 온라인 상담신청을 입력한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/normal/insert.do", method=RequestMethod.POST)
	public String insertOnlinePrdctInf(HttpServletRequest request, EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			emfMap.put("marketingYn", "N");

			// 요청정보로부터 쿠키를 가져온다.
			Cookie[] cookies = request.getCookies();

			// 쿠키 배열을 반복문으로 돌린다.
			for(int i = 0; i<cookies.length; i++)
			{
				if("marketingYn".equals(cookies[i].getName()))
				{
					emfMap.put("marketingYn", cookies[i].getValue());
				}
			}	
			
			lPOnlinePrdctService.insertOnlinePrdctJoin(emfMap);
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 

		return "redirect:/onlineproduct/normal/complete.do";    	
	}	
	
	/**
     * 완료 화면
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/normal/complete.do")
	public String getCompleteView(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/lp/lpa/LPAOnlinePrdctGnrlComplete.front";
	}	
}
