package front.ml.mld.web;

import java.util.List;

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
import front.ml.mld.service.MLDChngRqstService;

/**
 * <pre> 
 * 전환서비스 신청을 위한 Controller
 * </pre>
 * 
 * @ClassName		: MLDChngRqstController.java
 * @Description		: 전환서비스 신청을 위한 Controller
 * @author 허진영
 * @since 2016.03.08
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.08		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/my-lifeway/chage-service/request")
public class MLDChngRqstController extends EmfController {	
	
	/** 서비스 **/
	@Resource(name="mLDChngRqstService")
    private MLDChngRqstService mLDChngRqstService;
	
	/**
	 * 가입상품 목록을 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/index.do")
	public String selectJoinPrdctList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			List<EmfMap> joinPrdctList = mLDChngRqstService.selectJoinPrdctList(emfMap);
			
			modelMap.addAttribute("joinPrdctList", joinPrdctList);
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/ml/mld/MLDJoinPrdctList.front";
	}
	
	/**
	 * 가입상품 상세를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/search.ajax", method=RequestMethod.POST)
	public String selectJoinPrdct(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap = mLDChngRqstService.selectJoinPrdct(emfMap);
			
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
		
		return "front/ml/mld/MLDChngPrdctWrite";
	}
	
	/**
	 * 전환서비스상품 상세를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/dtl-list.ajax", method=RequestMethod.POST)
	public String selectPrdctDtlList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap = mLDChngRqstService.selectPrdctDtlList(emfMap);
			
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
		
		return "front/ml/mld/MLDPrdctDtlList";
	}
	
	/**
	 * 전환서비스상품 상세를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/dtl-info.do", method=RequestMethod.POST)
	public String selectPrdctDtlInf(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			emfMap.put("rqstYn", "Y");
			
			EmfMap rtnMap = mLDChngRqstService.selectPrdctDtlInf(emfMap);
			
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
		
		return "front/ml/mld/MLDPrdctDtlInfPop.pop";
	}
	
	/**
	 * 전환서비스 신청 페이지. (회원 및 사용자 정보확인)
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/check.do", method=RequestMethod.POST)
	public String selectMemInf(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		String url = "error/blank.error";
		
		try
		{
			EmfMap rtnMap = mLDChngRqstService.selectMemInf(emfMap);
			
			HttpSession session = request.getSession(false);
			
			if(session.getAttribute("chkInfo") != null)
			{
				session.removeAttribute("chkInfo");
			}
			     
			session.setAttribute("chkInfo", emfMap);
			
			modelMap.addAttribute("rtnMap", rtnMap);
			
			url = "front/ml/mld/MLDChngRqstChk.front";
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			
			if("재신청오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "이미 접수되어 재신청을 할 수 없습니다.");
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
	 * 전환서비스 신청 페이지. (약관 동의)
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/agree.do", method=RequestMethod.POST)
	public String selectPrdctInf(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		try
		{
			HttpSession session = request.getSession(false);
			
			if(session.getAttribute("chkInfo") != null)
			{
				emfMap.put("chkInfo", session.getAttribute("chkInfo"));
				
				EmfMap prdctInfo = mLDChngRqstService.selectPrdctInf(emfMap);
				
				session.setAttribute("rqstInfo", emfMap);
				
				modelMap.addAttribute("prdctInfo", prdctInfo);
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
		
		return "front/ml/mld/MLDChngRqstAgr.front";
	}
	
	/**
	 * 전환서비스 신청을 한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertChngSrvcRqst(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		String url = "error/blank.error";
		
		try
		{
			HttpSession session = request.getSession(false);
			
			if(session.getAttribute("chkInfo") != null && session.getAttribute("rqstInfo") != null)
			{
				emfMap.put("chkInfo", session.getAttribute("chkInfo"));
				emfMap.put("rqstInfo", session.getAttribute("rqstInfo"));
				
				mLDChngRqstService.insertChngSrvcRqst(emfMap);
			
				modelMap.addAttribute("url", "./complete.do");
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
	
	/**
	 * 전환서비스 신청 페이지 (완료)
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/complete.do")
	public String getChngSrvcRqstCmp(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		String url = "error/blank.error";
		
		try
		{
			HttpSession session = request.getSession(false);
			
			if(session.getAttribute("chkInfo") != null && session.getAttribute("rqstInfo") != null)
			{
				emfMap.put("chkInfo", session.getAttribute("chkInfo"));
				emfMap.put("rqstInfo", session.getAttribute("rqstInfo"));
				
				EmfMap prdctInfo = mLDChngRqstService.selectPrdctInf(emfMap);
				
				modelMap.addAttribute("prdctInfo", prdctInfo);
				
				session.removeAttribute("chkInfo");
				session.removeAttribute("rqstInfo");
				
				url = "front/ml/mld/MLDChngRqstCmp.front";
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
