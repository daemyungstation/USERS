package front.lg.lgf.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.com.utl.fcc.service.EgovStringUtil;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.lg.lgf.service.LGFMemMyService;
import front.ml.mla.service.MLAAcntChngService;
import front.ml.mla.service.MLAPmtPtcService;
import front.ml.mla.service.MLARefndPtcService;
import front.ml.mle.service.MLETrnsfAcquService;
import front.ml.mlh.service.MLHPrsnDataChngService;

/**
 * <pre> 
 * 모바일 민원 처리를 위한 Controller
 * </pre>
 * 
 * @ClassName		: LGAMemMyController.java
 * @Description		: 모바일 민원 처리를 위한 Controller
 * @author 장준일
 * @since 2022.02.07
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2022.02.07		        장준일				                    최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/member/my")
public class LGFMemMyController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="lGFMemMyService")
    private LGFMemMyService lGFMemMyService;
	
	@Resource(name="mLAPmtPtcService")
    private MLAPmtPtcService mLAPmtPtcService;
	
	@Resource(name="mLHPrsnDataChngService")
    private MLHPrsnDataChngService mLHPrsnDataChngService;
	
	@Resource(name="mLAAcntChngService")
    private MLAAcntChngService mLAAcntChngService;
	
	@Resource(name="mLETrnsfAcquService")
	private MLETrnsfAcquService mLETrnsfAcquService;
	
	@Resource(name="mLARefndPtcService")
    private MLARefndPtcService mLARefndPtcService;
	
	/**
	 * 로그인 화면
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/index.do")
	public String myLogin(EmfMap emfMap, ModelMap modelMap) throws Exception {
		return "front/lg/lgf/LGFIndex.pop";
	}
	
	/**
	 * 로그인 인증
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/checkAuth.do")
	public String myAuth(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception {
    	try{
    		EmfMap resultMap = lGFMemMyService.myAuth(emfMap, request);
    		Boolean success = (Boolean) resultMap.get("success");
    		if(success) {
    			return "redirect:/member/my/dashboard.do";
    		}else {
    			modelMap.addAttribute("msg", resultMap.getString("msg"));
    			return "front/lg/lgf/LGFErr.pop";
    		}
    	} catch (Exception he) {
			he.printStackTrace();
			if (log.isDebugEnabled()) log.debug(he);
			
			modelMap.addAttribute("msg", "에러가 발생하였습니다.<br>다시 시도해주세요");
			return "front/lg/lgf/LGFErr.pop";
		}
	}
	
	/**
	 * 대시보드
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/dashboard.do")
	public String myDashboard(EmfMap emfMap, ModelMap modelMap) throws Exception {
		EmfMap userLgnMap = (EmfMap) RequestContextHolder.getRequestAttributes().getAttribute("userLgnMap", RequestAttributes.SCOPE_SESSION);
		if(userLgnMap != null) {
			return "front/lg/lgf/LGFDashboard.pop";
		}else {
			modelMap.addAttribute("msg", "세션이 만료되었습니다.<br>다시 로그인해주세요.");
			return "front/lg/lgf/LGFErr.pop";
		}
	}
	
	/**
	 * 납입내역
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/payment.do")
	public String myPayment(EmfMap emfMap, ModelMap modelMap) throws Exception {
		EmfMap userLgnMap = (EmfMap) RequestContextHolder.getRequestAttributes().getAttribute("userLgnMap", RequestAttributes.SCOPE_SESSION);
		if(userLgnMap != null) {
			try
			{
				List<EmfMap> pmtPtcList = mLAPmtPtcService.selectPmtPtcList(emfMap);
				
				modelMap.addAttribute("pmtPtcList", pmtPtcList);
			}
			catch (Exception he) 
			{
				if (log.isDebugEnabled()) 
				{
					log.debug(he);
	            }
				throw new EmfException(he.getMessage());
			} 
			return "front/lg/lgf/LGFPayment.pop";
		}else {
			modelMap.addAttribute("msg", "세션이 만료되었습니다.<br>다시 로그인해주세요.");
			return "front/lg/lgf/LGFErr.pop";
		}
	}
	
	/**
	 * 개인정보변경
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/info.do")
	public String myInfo(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
		EmfMap userLgnMap = (EmfMap) RequestContextHolder.getRequestAttributes().getAttribute("userLgnMap", RequestAttributes.SCOPE_SESSION);
		if(userLgnMap != null) {
			try
			{
				EmfMap rtnMap = lGFMemMyService.selectMemInfSso(emfMap, request);		
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
			return "front/lg/lgf/LGFInfo.pop";
		}else {
			modelMap.addAttribute("msg", "세션이 만료되었습니다.<br>다시 로그인해주세요.");
			return "front/lg/lgf/LGFErr.pop";
		}
	}
	
	/**
	 * 개인정보변경 등록
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/info_update.do")
	public String myInfoUpdate(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
		String url = "error/blank.error";
		EmfMap userLgnMap = (EmfMap) RequestContextHolder.getRequestAttributes().getAttribute("userLgnMap", RequestAttributes.SCOPE_SESSION);
		if(userLgnMap != null) {
			try
			{
				lGFMemMyService.updateMemInfSso(emfMap, request);
				modelMap.addAttribute("msg", "회원정보 변경이 완료되었습니다.");
				modelMap.addAttribute("url", "./dashboard.do");
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
		}else {
			modelMap.addAttribute("msg", "세션이 만료되었습니다.<br>다시 로그인해주세요.");
			return "front/lg/lgf/LGFErr.pop";
		}
	}
	
	/**
	 * 결제정보변경
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/method.do")
	public String myMethod(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
		EmfMap userLgnMap = (EmfMap) RequestContextHolder.getRequestAttributes().getAttribute("userLgnMap", RequestAttributes.SCOPE_SESSION);
		if(userLgnMap != null) {
			try
			{
				List<EmfMap> joinPrdctList = mLAAcntChngService.selectJoinPrdctList(emfMap);
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
			return "front/lg/lgf/LGFMethod.pop";
		}else {
			modelMap.addAttribute("msg", "세션이 만료되었습니다.<br>다시 로그인해주세요.");
			return "front/lg/lgf/LGFErr.pop";
		}
	}
	
	/**
	 * 결제계좌 정보를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/method_search.ajax")
	public String myMethodInf(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
        try 
        {
			EmfMap rtnMap = mLAAcntChngService.selectPayAcntInf(emfMap);
			modelMap.addAttribute("rtnMap", rtnMap);
        }
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
        }
        
        return "front/lg/lgf/LGFMethodWrite";
	}
	
	/**
	 * 결제계좌변경 신청을 등록한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/method_insert.do", method=RequestMethod.POST)
	public String myMethodInsert(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		String url = "error/blank.error";
		
        try 
        {
			mLAAcntChngService.insertAcntChngRqst(emfMap);
			
			modelMap.addAttribute("msg", "결제계좌변경 신청이 완료되었습니다.");
			modelMap.addAttribute("url", "./dashboard.do");
        }
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			
			if("재신청오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "이미 접수되어 재신청을 할 수 없습니다.");
				modelMap.addAttribute("url", "./dashboard.do");
			}
			else if("이중출금오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "이중출금이 될 수 있어 기존 납부일 및 신청 납부일 3일 이전에는\\n신청을 할 수 없습니다.");
				modelMap.addAttribute("url", "./dashboard.do");
			}
			else
			{
				throw new EmfException(he.getMessage());
			}
        }
        
        return url;
	}
	
	/**
	 * 해약신청접수
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/terminate.do")
	public String myTerminate(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
		EmfMap userLgnMap = (EmfMap) RequestContextHolder.getRequestAttributes().getAttribute("userLgnMap", RequestAttributes.SCOPE_SESSION);
		if(userLgnMap != null) {
			try
			{
				emfMap.put("cnclRefndYn", "Y");
				List<EmfMap> joinPrdctList = mLETrnsfAcquService.selectJoinPrdctList(emfMap);
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
			return "front/lg/lgf/LGFTerminate.pop";
		}else {
			modelMap.addAttribute("msg", "세션이 만료되었습니다.<br>다시 로그인해주세요.");
			return "front/lg/lgf/LGFErr.pop";
		}
	}
	
	/**
	 * 해약 환급금 표
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/terminate_list.do")
	public String myTerminateList(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
		EmfMap userLgnMap = (EmfMap) RequestContextHolder.getRequestAttributes().getAttribute("userLgnMap", RequestAttributes.SCOPE_SESSION);
		if(userLgnMap != null) {
			try
			{
				List<EmfMap> cnclRefndList = mLARefndPtcService.selectRefndPtcDtlList(emfMap);
				modelMap.addAttribute("cnclRefndList", cnclRefndList);
				modelMap.addAttribute("rtnMap", emfMap);
			}
			catch (Exception he) 
			{
				if (log.isDebugEnabled()) 
				{
					log.debug(he);
	            }
				throw new EmfException(he.getMessage());
			} 
			return "front/lg/lgf/LGFTerminateList.pop";
		}else {
			modelMap.addAttribute("msg", "세션이 만료되었습니다.<br>다시 로그인해주세요.");
			return "front/lg/lgf/LGFErr.pop";
		}
	}
	
}
