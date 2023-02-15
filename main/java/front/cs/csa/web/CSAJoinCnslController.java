package front.cs.csa.web;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.cs.csa.service.CSAJoinCnslService;

/**
 * <pre> 
 * 가임상담 신청을 위한 Controller
 * </pre>
 * 
 * @ClassName		: CSAJoinCnslController.java
 * @Description		: 가임상담 신청을 위한 Controller
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
@RequestMapping("/customer-center/join-counseling")
public class CSAJoinCnslController extends EmfController {	
	
	/** 서비스 **/
	@Resource(name="cSAJoinCnslService")
    private CSAJoinCnslService cSAJoinCnslService;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
	
	/**
	 * 가임상담 신청 페이지
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/index.do")
	public String getJoinCnslWritePage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{			
			//공통코드 배열 셋팅
			ArrayList<String> cdDtlList = new ArrayList<String>();
			
			//제휴상담 구분
			cdDtlList.add("JOIN_INQRY_GB");
			
			//정의된 코드id값들의 상세 코드 맵 반환		
			modelMap.addAttribute("rtnMap", cmmUseService.selectCmmCodeBindAll(cdDtlList));
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/cs/csa/CSAJoinCnslWrite.front";
	}
	
	/**
	 * 이벤트 가입 상담 신청 페이지
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/event.do")
	public String getJoinCnslEventWritePage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{			
			//공통코드 배열 셋팅
			ArrayList<String> cdDtlList = new ArrayList<String>();
			
			//제휴상담 구분
			cdDtlList.add("JOIN_INQRY_GB");
			
			//정의된 코드id값들의 상세 코드 맵 반환		
			modelMap.addAttribute("rtnMap", cmmUseService.selectCmmCodeBindAll(cdDtlList));
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/cs/csa/CSAJoinCnslEventWrite.front";
	}
	
	/**
	 * 가임상담 신청을 등록한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertJoinCnsl(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		String url = "error/blank.error";
		StringBuffer requestURL = request.getRequestURL();
		log.debug(requestURL.toString());
        try 
        {
        	cSAJoinCnslService.insertJoinCnsl(emfMap, request);
        	
        	url = "redirect:./complete.do";
        }
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			
			if("보안문자오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "보안문자 입력이 올바르지 않습니다.");
				modelMap.addAttribute("url", "javascript:history.back();");
			}
			else
			{
				throw new EmfException(he.getMessage());
			}
        }
        
        return url;
	}

	/**
	 * 가임상담 신청을 등록한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/insertEventCnsl.do", method=RequestMethod.POST)
	public String insertJoinEventCnsl(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		String url = "error/blank.error";
		StringBuffer requestURL = request.getRequestURL();
		log.debug(requestURL.toString());
        try 
        {
        	cSAJoinCnslService.insertJoinEventCnsl(emfMap, request);
        	
        	url = "redirect:./complete.do";
        }
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			
			if("보안문자오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "보안문자 입력이 올바르지 않습니다.");
				modelMap.addAttribute("url", "/member/login/Login.do");
			}
			else
			{
				throw new EmfException(he.getMessage());
			}
        }
        
        return url;
	}

	/**
	 * 가임상담 신청 완료페이지.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/complete.do")
	public String getPrsnCnslCompPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
        return "front/cs/csa/CSAJoinCnslComp.front";
	}
}
