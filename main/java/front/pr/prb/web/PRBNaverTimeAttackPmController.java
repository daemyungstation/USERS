package front.pr.prb.web;

import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.pr.prb.service.PRBNaverTestPromotionService;

/**
 * <pre> 
 * 네이버 실시간 검색 프로모션 Controller
 * </pre>
 * 
 * @ClassName		: PRBNaverTestPromotionController.java
 * @Description		: 네이버 실시간 검색 time attack 프로모션 Controller
 * @author 이너스커뮤니티
 * @since 2019.08.19
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2019.08.19	   이너스커뮤니티			  최초 생성
 * </pre>
 */ 

@Controller
@RequestMapping("/pr-center/timeattack/pm")
public class PRBNaverTimeAttackPmController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="pRBNaverTestPromotionService")
    private PRBNaverTestPromotionService pRBNaverTestPromotionService;
	
	private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private String strStartDate = "2019-08-29 15:00:00";
	private String strEndDate = "2019-08-29 17:00:00";
	private String strNaverCheck = "Y";
	private String strFromurlCheck = "Y";
	private int iDivision = 3;
	
    public void getCongif() throws Exception
    {
    	try {
    		List<EmfMap> rtnMap = pRBNaverTestPromotionService.selectConfig(this.iDivision);
    		if(rtnMap.size() > 0) {
    			EmfMap cfgMap = rtnMap.get(0);
    			this.strStartDate = cfgMap.getString("pntecStime");
    			this.strEndDate = cfgMap.getString("pntecEtime");
    			this.strNaverCheck = cfgMap.getString("pntecNaverCheck");
    			this.strFromurlCheck = cfgMap.getString("pntecFromurlCheck");
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
    }
	
	/**
     * 프로모션 PV
     * 
     * @param EmfMap INSERT 데이터
     * @param HttpServletRequest httprequest 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	private void insertPv(EmfMap emfMap, HttpServletRequest request) throws Exception
	{
		try {
			String uri = request.getScheme() + "://" +
				 request.getServerName() + ":" +
				 request.getServerPort() +
	             request.getRequestURI();
			if(request.getQueryString() != null && !request.getQueryString().isEmpty()) {
				uri += "?" + request.getQueryString();
			}
			
			emfMap.put("NTEVTPV_PAGE", uri);
			emfMap.put("NTEVTPV_REFERER", request.getHeader("referer"));
			emfMap.put("NTEVTPV_FROMURL", request.getParameter("fromurl"));
			emfMap.put("NTEVTPV_REG_IP", request.getRemoteAddr());
			emfMap.put("NTEVTPV_AGENT", request.getHeader("user-agent"));
			emfMap.put("NTEVTPV_DIVISION", this.iDivision);
			
			pRBNaverTestPromotionService.insertPv(emfMap);
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
	}
	
	/**
     * 프로모션 메인 PAGE
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/index.do")
	public String selectNaverTimeAttackPromotion(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		String strView = "";
		boolean bStartCheck = false;
		boolean bEndCheck = false;
		
		try
		{
			this.getCongif();
			//시작시간
			Date dtStartDate = this.simpleDateFormat.parse(this.strStartDate);
			long lStartDate = dtStartDate.getTime();
			
			//마감시간
			Date dtEndDate = this.simpleDateFormat.parse(this.strEndDate);
			long lEndDate = dtEndDate.getTime();
			
			//현재 시간
			long lNowTime = System.currentTimeMillis();
			
			
			//시작 시간 이전 체크
			if(lNowTime < lStartDate) {
				strView = "prev";
			}else {
				bStartCheck = true;
			}
			
			//시작 시간 이후 체크
			if(lNowTime >= lEndDate) {
				strView = "next";
			}else {
				bEndCheck = true;
			}
			
			//리퍼러 체크
			if(bStartCheck == true && bEndCheck == true) {
				String strReferer = request.getHeader("referer");
				String fromurl = request.getParameter("fromurl");
				if(this.strNaverCheck.equals("Y") && this.strFromurlCheck.equals("Y")){
					if(strReferer != null && !strReferer.isEmpty() && (strReferer.indexOf("search.naver.com") > -1 || strReferer.indexOf("adcr.naver.com") > -1) && fromurl != null && (fromurl.equals("PC_Bsmain_08") || fromurl.equals("PC_BS01_08") || fromurl.equals("PC_BS02_08") || fromurl.equals("PC_BS03_08") || fromurl.equals("MO_Bsmain_08") || fromurl.equals("MO_BS01_08") || fromurl.equals("MO_BS02_08") || fromurl.equals("MO_BS03_08"))) {
					} else{
						strView = "notNaver";
					}
				}
				if(this.strNaverCheck.equals("N") && this.strFromurlCheck.equals("Y")){
					if(fromurl != null && (fromurl.equals("PC_Bsmain_08") || fromurl.equals("PC_BS01_08") || fromurl.equals("PC_BS02_08") || fromurl.equals("PC_BS03_08") || fromurl.equals("MO_Bsmain_08") || fromurl.equals("MO_BS01_08") || fromurl.equals("MO_BS02_08") || fromurl.equals("MO_BS03_08"))) {
					} else{
						strView = "notNaver";
					}
				}
				if(this.strNaverCheck.equals("Y") && this.strFromurlCheck.equals("N")){
					if(strReferer != null && !strReferer.isEmpty() && strReferer.indexOf("search.naver.com") > -1) {
					} else{
						strView = "notNaver";
					}
				}
			}
			
			EmfMap emPv = new EmfMap();
			emPv.put("NTEVTPV_TYPE", strView);
			this.insertPv(emPv, request);
			
			modelMap.addAttribute("strView", strView);
			modelMap.addAttribute("fromurl", request.getParameter("fromurl"));
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/pr/prb/PRBNaverTimeAttackPmView.front";
	}
	
	/**
     * 프로모션 사용자정보 등록
     * 
     * @param EmfMap 입력 데이터
	 * @return ModelAndView JSON 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/promotion_action.ajax", method=RequestMethod.POST)
	public ModelAndView insertNaverTestPromotion(EmfMap emfMap, HttpServletRequest request) throws Exception
	{
		this.getCongif();
		
		ModelAndView mav = new ModelAndView();
		
		String strView = "";
		boolean bStartCheck = false;
		boolean bEndCheck = false;
		
		try
		{
			//시작시간
			Date dtStartDate = this.simpleDateFormat.parse(this.strStartDate);
			long lStartDate = dtStartDate.getTime();
			
			//마감시간
			Date dtEndDate = this.simpleDateFormat.parse(this.strEndDate);
			long lEndDate = dtEndDate.getTime();
			
			//현재 시간
			long lNowTime = System.currentTimeMillis();
			
			
			//시작 시간 이전 체크
			if(lNowTime < lStartDate) {
				strView = "prev";
			}else {
				bStartCheck = true;
			}
			
			//시작 시간 이후 체크
			if(lNowTime >= lEndDate) {
				strView = "next";
			}else {
				bEndCheck = true;
			}
			
			if(!strView.equals("prev") && !strView.equals("next") && !strView.equals("notNaver"))
			{
				EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
				
				EmfMap putMap = new EmfMap();
				putMap.put("NTEVT_NAME", emfMap.get("name"));
				putMap.put("NTEVT_PHONE", emfMap.get("hphone1") +"-"+ emfMap.get("hphone2") +"-"+ emfMap.get("hphone3"));
				putMap.put("TNEVT_AGREE", emfMap.get("agree"));
				putMap.put("NTEVT_MARKETING_AGREE", emfMap.get("maketing"));
				if(lgnMap != null && !lgnMap.getString("id").isEmpty())
				{
					putMap.put("NTEVT_USERID", lgnMap.getString("id"));
				}
				putMap.put("NTEVT_REG_IP", request.getRemoteAddr());
				putMap.put("NTEVT_FROMURL", emfMap.get("fromurl"));
				putMap.put("NTEVT_AGENT", request.getHeader("user-agent"));
				putMap.put("NTEVT_DIVISION", this.iDivision);
				
				pRBNaverTestPromotionService.insertNaverTestPromotion(putMap);
				
				mav.addObject("status", "Y");
				mav.setViewName("jsonView");
			}else {
				mav.addObject("status", "N");
				mav.setViewName("jsonView");
			}
		}
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he.getMessage());
            }
			throw new EmfException(he.getMessage());
		}			
		
		return mav;
	}
	
	/**
     * 프로모션 버튼 클릭
     * 
     * @param null
	 * @return void
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/click.ajax", method=RequestMethod.POST)
	public ModelAndView insertButtonCick(EmfMap emfMap, HttpServletRequest request) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		try {
			String uri = request.getScheme() + "://" +
				 request.getServerName() + ":" +
				 request.getServerPort() +
	             request.getRequestURI();
			if(request.getQueryString() != null && !request.getQueryString().isEmpty()) {
				uri += "?" + request.getQueryString();
			}
			
			emfMap.put("NTEVTPV_PAGE", uri);
			emfMap.put("NTEVTPV_REFERER", request.getHeader("referer"));
			emfMap.put("NTEVTPV_FROMURL", request.getParameter("fromurl"));
			emfMap.put("NTEVTPV_REG_IP", request.getRemoteAddr());
			emfMap.put("NTEVTPV_AGENT", request.getHeader("user-agent"));
			
			pRBNaverTestPromotionService.insertPv(emfMap);
			
			mav.addObject("result", "Y");
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