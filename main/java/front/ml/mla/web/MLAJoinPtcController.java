package front.ml.mla.web;

import java.util.Calendar;
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
import egovframework.com.utl.sim.service.EgovNetworkState;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.lp.service.DmLifeService;
import front.lp.service.LPOnlinePrdctService;
import front.ml.mla.service.MLAJoinPtcService;
import front.lg.lgb.service.LGBMemJoinService;

/**
 * <pre> 
 * 가입내역 조회를 위한 Controller
 * </pre>
 * 
 * @ClassName		: MLAJoinPtcController.java
 * @Description		: 가입내역 조회를 위한 Controller
 * @author 허진영
 * @since 2016.03.15
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.15		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/my-lifeway/join-product-information/join-details")
public class MLAJoinPtcController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="mLAJoinPtcService")
    private MLAJoinPtcService mLAJoinPtcService;
	
	@Resource(name="lPOnlinePrdctService")
    private LPOnlinePrdctService lPOnlinePrdctService;
	
	@Resource(name="dMLifeService")
    private DmLifeService dMLifeService;
	
	@Resource(name="lGBMemJoinService")
    private LGBMemJoinService lGBMemJoinService;

	@Resource(name="EgovCmmUseService")
	private EgovCmmUseService cmmUseService;
	
	/**
	 * 가입내역 목록을 조회한다.
	 * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/index.do")
	public String selectJoinPtcList(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap = mLAJoinPtcService.selectJoinPtcList(emfMap);
			EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
			emfMap.put("id", lgnMap.get("id"));
			emfMap = lGBMemJoinService.selectMemInf(emfMap);
			EmfMap infoMap = (EmfMap) emfMap.get("info");
			rtnMap.put("agreementForThirdParty", infoMap.get("agreementForThirdParty"));
			modelMap.addAttribute("rtnMap", rtnMap);

			/*
			 홈페이지 개인정보 로그 - 보안관련 로직 신규 구현
			 2017.12.26
			 */
			EmfMap logMap = new EmfMap();
			logMap.put("ip", EgovNetworkState.getMyIPaddress(request));
			logMap.put("gubun", "나의 라이프웨이 - 고객의 소리 접수내역 조회");
			logMap.put("flag", "S");
			logMap.put("pageGubun", "H");
			logMap.put("name", lgnMap.getString("name"));
			logMap.put("hp", lgnMap.getString("hp"));
			logMap.put("id", lgnMap.getString("id"));
			
			cmmUseService.actionViewAuthLog(logMap);
			log.debug(emfMap);
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/ml/mla/MLAJoinPtcList.front";
	}
	
	/**
	 * 약관 및 계약안내 설정 확인
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	@RequestMapping(value="/checkTermGrp.ajax", method=RequestMethod.POST)
	public ModelAndView checkTermGrp(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{			
			mav.addObject("check", lPOnlinePrdctService.checkTermGrp(emfMap));
			
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
	
	/**
	 * 계약안내 및 약관을 출력한다.
	 * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/printTerm.do")
	public String printTerm(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		String url = "error/blank.error";
		
		try
		{
			if("TRS_GB".equals(emfMap.getString("cdId")))
			{
				url = "front/ml/mla/printTermPop.pop";
			}
			else
			{
				url = "front/ml/mla/printContractPop.pop";
			}
			
			List<EmfMap> rtnMap = lPOnlinePrdctService.selectMemTerm(emfMap);
			
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
		
		return url;
	}	
	
	/**
	 * 가입증서를 출력한다.
	 * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/printCert.do")
	public String selectJoinCert(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap = dMLifeService.selectJoinCert(emfMap);
			
			Calendar cal = Calendar.getInstance();

			rtnMap.put("year", cal.get(cal.YEAR));
			rtnMap.put("month", cal.get(cal.MONTH));
			rtnMap.put("day", cal.get(cal.DATE));
			
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
		
		return "front/ml/mla/printCert.pop";
	}		
}
