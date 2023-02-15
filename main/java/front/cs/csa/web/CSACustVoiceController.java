package front.cs.csa.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.cs.csa.service.CSACustVoiceService;
import front.lg.lgb.service.LGBMemJoinService;

/**
 * <pre> 
 * 고객의 소리를 위한 Controller
 * </pre>
 * 
 * @ClassName		: CSACustVoiceController.java
 * @Description		: 고객의 소리를 위한 Controller
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
@Controller
@RequestMapping("/customer-center/customer-voice")
public class CSACustVoiceController extends EmfController {	
	
	/** 서비스 **/
	@Resource(name="cSACustVoiceService")
    private CSACustVoiceService cSACustVoiceService;
	
	@Resource(name="lGBMemJoinService")
	private LGBMemJoinService lGBMemJoinService;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
	
	/**
	 * 고객의 소리를 등록 페이지
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/index.do")
	public String getCustVoiceWritePage(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		try
		{	
			if(!EgovUserDetailsHelper.isAuthenticated())
			{
				modelMap.addAttribute("msg", "로그인이 필요한 페이지입니다.");
				//modelMap.addAttribute("url", "/member/login/Login.do");
				modelMap.addAttribute("url", "/member/login/Login.do?vwUrl=" + request.getRequestURI());
				return "error/blank.error";
			}

			//공통코드 배열 셋팅
			ArrayList<String> cdDtlList = new ArrayList<String>();
			
			//제휴상담 구분
			cdDtlList.add("CUST_VOICE_GB");
			
			//정의된 코드id값들의 상세 코드 맵 반환		
			modelMap.addAttribute("rtnMap", cmmUseService.selectCmmCodeBindAll(cdDtlList));
			
			// 로그인 정보 호출 
			emfMap.put("id", RequestContextHolder.getRequestAttributes().getAttribute("logId", RequestAttributes.SCOPE_SESSION));
			modelMap.addAttribute("loginMap", lGBMemJoinService.selectMemInf(emfMap));
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/cs/csa/CSACustVoiceWrite.front";
	}

	/**
	 * 고객의 소리를 등록한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertCustVoice(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
        try 
        {
        	cSACustVoiceService.insertCustVoice(emfMap);
        }
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
        }
        
        return "redirect:./complete.do";
	}
	
	/**
	 * 고객의 소리 완료페이지.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/complete.do")
	public String getCustVoiceCompPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
        return "front/cs/csa/CSACustVoiceComp.front";
	}
	
	/**
	 * 고객의 소리 문의구분 상세를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/voice-type.ajax", method=RequestMethod.POST)
	public ModelAndView selectCustVoiceDtlList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{
			List<EmfMap> rtnList = cSACustVoiceService.selectPrsnInqryDtlList(emfMap);
			
			mav.addObject("rtnList", rtnList);
			
			mav.setViewName("jsonView");
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		}
		
		return mav;
	}
}
