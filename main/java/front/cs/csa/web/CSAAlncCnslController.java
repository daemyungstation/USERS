package front.cs.csa.web;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.cs.csa.service.CSAAlncCnslService;

/**
 * <pre> 
 * 제휴 문의를 위한 Controller
 * </pre>
 * 
 * @ClassName		: CSAAlncCnslController.java
 * @Description		: 제휴 문의를 위한 Controller
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
@RequestMapping("/customer-center/alliance-counseling")
public class CSAAlncCnslController extends EmfController {	
	
	/** 서비스 **/
	@Resource(name="cSAAlncCnslService")
    private CSAAlncCnslService cSAAlncCnslService;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
	
	/**
	 * 제휴 문의 페이지
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/index.do")
	public String getAlncCnslWritePage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{			
			//공통코드 배열 셋팅
			ArrayList<String> cdDtlList = new ArrayList<String>();
			
			//제휴상담 구분
			cdDtlList.add("ALNC_INQRY_GB");
			
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
		
		return "front/cs/csa/CSAAlncCnslWrite.front";
	}
	
	/**
	 * 제휴 문의를 등록한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertAlncCnsl(EmfMap emfMap, ModelMap modelMap, MultipartHttpServletRequest multiRequest) throws Exception
	{
		String url = "error/blank.error";
		
        try 
        {
        	cSAAlncCnslService.insertAlncCnsl(emfMap, multiRequest);
        	
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
			else if("파일용량초과".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "파일 용량이 초과되었습니다.");
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
	 * 제휴 문의 완료페이지.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/complete.do")
	public String getPrsnCnslCompPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
        return "front/cs/csa/CSAAlncCnslComp.front";
	}
}
