package front.ml.mlc.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.com.utl.fcc.service.EgovStringUtil;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.ml.mlc.service.MLCPfmcInfService;

/**
 * <pre> 
 * 공연 예약을 위한 위한 Controller
 * </pre>
 * 
 * @ClassName		: MLCPfmcRsvtnController.java
 * @Description		: 공연 예약을 위한 위한 Controller
 * @author 허진영
 * @since 2016.02.26
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.02.26		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/my-lifeway/performance/request")
public class MLCPfmcInfController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="mLCPfmcInfService")
    private MLCPfmcInfService mLCPfmcInfService;
	
	/**
     * 공연 정보 목록을 조회한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/index.do")
	public String selectPfmcInfList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap = mLCPfmcInfService.selectPfmcInfList(emfMap);
			
			modelMap.addAttribute("rtnMap", rtnMap);
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/ml/mlc/MLCPfmcInfList.front";
	}
	
	/**
     * 공연 정보 상세를 조회한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/write.do")
	public String selectPfmcInf(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		String url = "error/blank.error";
		
		try
		{
			EmfMap rtnMap = mLCPfmcInfService.selectPfmcInf(emfMap);
			
			HttpSession session = request.getSession(false);
			
			if(session.getAttribute("pfmcInfo") != null)
			{
				session.removeAttribute("pfmcInfo");
			}
			
			session.setAttribute("pfmcInfo", emfMap);
			
			modelMap.addAttribute("rtnMap", rtnMap);
			
			url = "front/ml/mlc/MLCPfmcRsvtnWrite.front";
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			
			if("실납입오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "1회차 납입 후에 혜택이용이 가능합니다.");
				modelMap.addAttribute("url", "./index.do");
			}
			else if("행사오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "행사 고객은 가입후 5년까지 혜택이용이 가능합니다.");
				modelMap.addAttribute("url", "./index.do");
			}
			else if("회원상태오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "연체 / 해약 / 청약철회 고객은 혜택이용이 불가합니다.");
				modelMap.addAttribute("url", "./index.do");
			}
			else if("재관람오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "이미 관람한 공연은 다음달부터 예약접수가 가능합니다.");
				modelMap.addAttribute("url", "./index.do");
			}
			else if("재예약오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "이미 접수되었습니다.\\n[예약정보 확인]에서 확인할 수 있습니다.");
				modelMap.addAttribute("url", "./index.do");
			}
			else if("월예약오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "이미 신청하셨습니다. 월 1회만 신청 가능합니다.");
				modelMap.addAttribute("url", "./index.do");
			}
			else
			{
				throw new EmfException(he.getMessage());
			}
		} 
		
		return url;
	}
	
	/**
     * 공연 예약을 등록한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertPfmcRsvtn(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		String url = "error/blank.error";
		
		try
		{
			HttpSession session = request.getSession(false);
			
			if(session.getAttribute("pfmcInfo") != null)
			{
				emfMap.put("pfmcInfo", session.getAttribute("pfmcInfo"));
				
				mLCPfmcInfService.insertPfmcRsvtn(emfMap);
				
				session.removeAttribute("pfmcInfo");
				
				modelMap.addAttribute("msg", "접수되었습니다. 3영업일 이내 처리됩니다.");
				modelMap.addAttribute("url", "./index.do");
			}
			else
			{
				modelMap.addAttribute("msg", "잘못된 접근입니다.");
				modelMap.addAttribute("url", "./index.do");
			}
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return url;
	}
}