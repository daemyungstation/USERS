package front.dm.dml.web;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.dm.dml.service.DMLCompanysourcingService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

/**
 * <pre> 
 * 외주업체 상담신청 위한 Controller
 * </pre>
 * 
 * @ClassName		: DMLCompanysourcingController.java
 * @Description		: 자체개발 홈페이지(일일실적)
 * @author 임동진
 * @since 2016.05.02
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.05.02		   임동진				  최초 생성
 * </pre>
 */ 
@Controller
public class DMLCompanysourcingController extends EmfController {
	
	@Resource(name="dMLCompanysourcingService")
    private DMLCompanysourcingService dMLCompanysourcingService;	
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;


	/**
     * 임동진
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/dmlifeway/agree.do")
	public String getClause(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/dm/dml/DMLCompanyagree";
	}
	
	/**  (향후 파기 요망) (향후 파기 요망) (향후 파기 요망) (향후 파기 요망) (향후 파기 요망) (향후 파기 요망) (향후 파기 요망)
     * 임동진 (향후 파기 요망)
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */   
	/*
	@RequestMapping(value="/dmlsourcing/dmreport.do")
	public String selectLdjList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap =  dMLCompanysourcingService.selectLdjList(emfMap);

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
		
		return "front/dm/dml/DMLCompanyResult";
	}
	*/
	
	/**
     * 임동진
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	
	/*
	@RequestMapping(value="/dmlsourcing/dmimreadyreport.do")
	public String selectdmDataList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap =  dMLCompanysourcingService.selectLdjList(emfMap);

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
		
		return "front/dm/dml/DMLCompanyResult";
	}
	*/
	/**
     * 임동진
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/dmlsourcing/dmreport.do")
	public String selectdmDataListVer1(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		try
		{
			checkDMPassCode(emfMap, request);
			EmfMap rtnMap =  dMLCompanysourcingService.selectLdjList(emfMap);
			modelMap.addAttribute("rtnMap", rtnMap);
		}
		catch (Exception he)
		{
			throwDMPassException(he, modelMap, emfMap);
		}
		
		return "front/dm/dml/DMLCompanyResultVer2";
	}
	

	/**
     * 임동진
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/dmlsourcing/dmeisreport.do")
	public String selectdmEisList(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		try
		{
			EmfMap rtnMap =  dMLCompanysourcingService.selectEisList(emfMap);
			System.out.println(">>>>>>>>>>>>>>>>>>" + rtnMap); 
			modelMap.addAttribute("rtnMap", rtnMap);
		}
		catch (Exception he)
		{
			throwDMPassException(he, modelMap, emfMap);
		}
		
		return "front/dm/dml/DMLCompanyEisList";
	}

	/**
     * 임동진
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/dmlsourcing/dmtestchart.do")
	public String selectdmTestList(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		
		return "front/dm/dml/DMLCompanyTest";
	}


	/**
     * 임동진
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/dmlsourcing/dmreportresnprotect.do")
	public String selectdmDataListResnProtect(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		try
		{
			checkDMPassCode(emfMap, request);
			EmfMap rtnMap =  dMLCompanysourcingService.selectResnProtectList(emfMap);
			modelMap.addAttribute("rtnMap", rtnMap);
		}
		catch (Exception he)
		{
			throwDMPassException(he, modelMap, emfMap);
		}
		
		return "front/dm/dml/DMLCompanyResultResnProtect";
	}
	
	/**
     * 임동진
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/dmlsourcing/dmevent.do")
	public String selectLdj_Event_List(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap = null;
			String name = EgovStringUtil.nullConvert(emfMap.getString("name")); 
			String cell = EgovStringUtil.nullConvert(emfMap.getString("cell"));
			
			if(StringUtils.isEmpty(name) && StringUtils.isEmpty(cell)){
				rtnMap = new EmfMap();
			} else {
				rtnMap =  dMLCompanysourcingService.selectLdj_Event_List(emfMap);
			}

			modelMap.addAttribute("rtnMap", rtnMap);
			modelMap.addAttribute("emfMap", emfMap);
		}
		catch (Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		}
		
		return "front/dm/dml/DMLEvnetInfo";
	}	
	
	/**
     * 임동진
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/dmlsourcing/dmtourmall.do")
	public String selectLdj_dmtourmall_List(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			System.out.println(">>>>>>>>>>>>>>   " + EgovStringUtil.nullConvert(emfMap.getString("accntno")));		
			
			EmfMap rtnMap =  dMLCompanysourcingService.selectLdj_Tour_List(emfMap);

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
		
		return "front/dm/dml/DMLTourInfo";
	}
	
	/**
     * 임동진
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/sd/sd.do")
	public String testLIst(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/dm/dml/test.front2";
	}
	
	
    /**
	 * 일반(세션) 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
    //@RequestMapping(value="/sd/setTest.do", method=RequestMethod.POST)
	@RequestMapping(value="/sd/setTest.do")
    public String actionLogin(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception 
    {  	   
    	try
    	{
		   //보안 처리(로그인 세션 변경)
		   if(request.getSession() != null)
		   {
			   request.getSession().invalidate();
		   }
		   String test = EgovStringUtil.nullConvert(emfMap.getString("id"));
		   EmfMap rtnMap = new EmfMap();   
		   rtnMap.put("test", test);
		   
		   modelMap.addAttribute("rtnMap", rtnMap);
		   
		   /*
		   
		   if("".equals(EgovStringUtil.nullConvert(emfMap.getString("vwUrl"))))
		   {
			   emfMap.put("vwUrl", "/main/index.do");
		   }
		   
		   EmfMap resultMap = lGAMemLoginService.actionLogin(emfMap, request);  
		   
		   modelMap.addAttribute("msg", resultMap.get("msg"));
		   modelMap.addAttribute("url", resultMap.get("url"));
			
		   return EgovStringUtil.nullConvert( resultMap.get("vwUrl") );
		   */
		   return "front/dm/dml/test2.front2";
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
	
	@RequestMapping(value="/sd/setTest2.do", method=RequestMethod.POST)
    public String actionLogin2(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception 
    {  	   
    	try
    	{
		   //보안 처리(로그인 세션 변경)
		   if(request.getSession() != null)
		   {
			   request.getSession().invalidate();
		   }
		   
		   String test = EgovStringUtil.nullConvert(emfMap.getString("name"));		   
		   String test1 = request.getParameter("reqnGb");
		   
		   System.out.println(test);
		   System.out.println(test1);


		   EmfMap rtnMap = new EmfMap();   
		   rtnMap.put("test", test);		
		   
		   
		   
		   modelMap.addAttribute("rtnMap", rtnMap);
		   /*
		   
		   if("".equals(EgovStringUtil.nullConvert(emfMap.getString("vwUrl"))))
		   {
			   emfMap.put("vwUrl", "/main/index.do");
		   }
		   
		   EmfMap resultMap = lGAMemLoginService.actionLogin(emfMap, request);  
		   
		   modelMap.addAttribute("msg", resultMap.get("msg"));
		   modelMap.addAttribute("url", resultMap.get("url"));
			
		   return EgovStringUtil.nullConvert( resultMap.get("vwUrl") );
		   */
		   return "front/dm/dml/test2.front2";
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
     * 임동진
     * 이름 / 핸드폰 번호 입력 후 고유번호 확인 절차 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/shop/idcheck.do")
	public String idCheckLIst(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/dm/dml/idcheck.front2";
	}
	
    /**
	 * 일반(세션) 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
	@RequestMapping(value="/shop/setIdCheck.do")
    public String setIdCheck(EmfMap emfMap,  ModelMap modelMap) throws Exception 
    {
		try
		{
			System.out.println(">>>>>>>>>>>>>>   " + EgovStringUtil.nullConvert(emfMap.getString("name")));
			System.out.println(">>>>>>>>>>>>>>   " + EgovStringUtil.nullConvert(emfMap.getString("cell")));
			
			EmfMap rtnMap =  dMLCompanysourcingService.selectShopIdCheck(emfMap);
			
			System.out.println("xxxxxxxxxxxxxxxxx  " + rtnMap.getString("memno"));

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
		
						
		return "front/dm/dml/result_idcheck.front2";
	
    } 
	

	/**
	 * 고유번호 확인요청을 등록한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/sd/insert.ajax", method=RequestMethod.POST)
	public ModelAndView insertChkReqn(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{
			//EmfMap rtnMap = dMLCompanysourcingService.insertChkReqn(emfMap);
			
			mav.addObject("status", "Y");
			
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> test");
						
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
     * 임동진 (삼성디지털 프라자 회원 상태 체크)
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/dmlsourcing/sdpcheck.do")
	public String getSdpCheck(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/dm/dml/DMLSdp_check.front2";
	}

	/**
     * TheONe라이프 회원 가입 조회
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/dmlsourcing/theonecheck.do")
	public String getTheoneCheck(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/dm/dml/DMLTheone_check.front2";
	}
	
	/**
     * 회원정보를 검색한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/dmlsourcing/sdpsearch.ajax", method=RequestMethod.POST)
	public String select_SDP_CHECK_List(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap = dMLCompanysourcingService.select_SDP_CHECK_List(emfMap);

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
		
		return "front/dm/dma/DMAsdpstatSrchList";
	}

	/**
     * 회원정보를 검색한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/dmlsourcing/theoneSearch.ajax", method=RequestMethod.POST)
	public String select_THEONE_CHECK_List(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap = dMLCompanysourcingService.select_THEONE_CHECK_List(emfMap);

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
		
		return "front/dm/dma/DMAsdpstatSrchList";
	}

	private void throwDMPassException(Exception he, ModelMap modelMap, EmfMap emfMap) throws EmfException {
		emfMap.put("require", "");
		emfMap.put("list", new ArrayList());
		if( he.getMessage().equals("보안코드입력요청")) {
			emfMap.put("require", "SecurityCd");
			//modelMap.addAttribute("msg", "보안코드르 입력해주세요");
		} else if( he.getMessage().equals("보안코드에러")) {
			modelMap.addAttribute("msg", "보안코드가 일치하지 않습니다.");
		} else if( he.getMessage().equals("보안코드미입력") ) {
			modelMap.addAttribute("msg", "보안코드가 입력되지 않았습니다. ");

		} else {
			if (log.isDebugEnabled()) {
				log.debug(he);
			}
			throw new EmfException(he.getMessage());
		}
		modelMap.addAttribute("rtnMap", emfMap);
	}

	private void checkDMPassCode(EmfMap emfMap, HttpServletRequest request) throws Exception {
		Long passTime = (Long) request.getSession().getAttribute("DMREPORT_PASS");
		//30분 마다 최소 한번씩 진입 시 패스워드 체크
		if( passTime == null  || passTime < System.currentTimeMillis() - 1800 * 1000) {
			String passCode = (String)emfMap.get("securityCd");
			String passCodeYN = (String)emfMap.get("securityCdYN");
			if( !"Y".equals(passCodeYN) ) {
				//emfMap.put("require", "SecurityCd");
				throw new Exception("보안코드입력요청");
			} else if( !StringUtils.isEmpty(passCode) ) {
				EmfMap param = new EmfMap();
				param.put("cdId", "DMREPORT_PASS");
				param.put("cd", "DEFAULT");
				EmfMap dmReportMap = cmmUseService.selectCmmCodeDetailInf(param);
				String shaPassPassCode = dmReportMap.getString("cdNm");
				String shaPassInputPassCode = EMFStringUtil.sha256(passCode);
				if( shaPassInputPassCode.startsWith(shaPassPassCode) ) {
					passTime = System.currentTimeMillis();
					RequestContextHolder.getRequestAttributes().setAttribute("DMREPORT_PASS", passTime, RequestAttributes.SCOPE_SESSION);	// 변경된 이름으로 세션 재설정
				}  else {
					throw new Exception("보안코드에러");
				}
			} else {
				throw new Exception("보안코드미입력");
			}
		} else {
			//30분이 안되었다면 세션 연장처럼 연장 처리
			passTime = System.currentTimeMillis();
			RequestContextHolder.getRequestAttributes().setAttribute("DMREPORT_PASS", passTime, RequestAttributes.SCOPE_SESSION);
		}
	}
}
