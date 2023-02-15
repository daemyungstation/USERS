package front.cs.csa.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.service.EgovCmmUseService;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.cs.csa.service.CSAPrsnCnslService;

/**
 * <pre> 
 * 1:1 상담하기를 위한 Controller
 * </pre>
 * 
 * @ClassName		: CSAPrsnCnslController.java
 * @Description		: 1:1 상담하기를 위한 Controller
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
@RequestMapping("/customer-center/personal-counseling")
public class CSAPrsnCnslController extends EmfController {	
	
	/** 서비스 **/
	@Resource(name="cSAPrsnCnslService")
    private CSAPrsnCnslService cSAPrsnCnslService;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
	
	/**
	 * 1:1 상담하기를 등록 페이지
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/index.do")
	public String getPrsnCnslWritePage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{			
			//공통코드 배열 셋팅
			ArrayList<String> cdDtlList = new ArrayList<String>();
			
			//제휴상담 구분
			cdDtlList.add("PRSN_INQRY_GB");
			
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
		
		return "front/cs/csa/CSAPrsnCnslWrite.front";
	}

	/**
	 * 1:1 상담하기를 등록한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertPrsnCnsl(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
        try 
        {
        	cSAPrsnCnslService.insertPrsnCnsl(emfMap);
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
	 * 1:1 상담하기 완료페이지.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/complete.do")
	public String getPrsnCnslCompPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
        return "front/cs/csa/CSAPrsnCnslComp.front";
	}
	
	/**
	 * 1:1 상담 문의구분 상세를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/inqry-type.ajax", method=RequestMethod.POST)
	public ModelAndView selectPrsnInqryDtlList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{
			List<EmfMap> rtnList = cSAPrsnCnslService.selectPrsnInqryDtlList(emfMap);
			
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
