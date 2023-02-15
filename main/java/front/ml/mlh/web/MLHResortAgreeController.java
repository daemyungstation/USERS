package front.ml.mlh.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovNetworkState;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.ml.mlh.service.MLHPrsnDataChngService;
import front.ml.mlh.service.dao.MLHPrsnDataChngDAO;
import front.lg.lga.service.LGAMemLoginService;
import front.lg.lgb.service.LGBMemJoinService;

/**
 * <pre> 
 * 개인정보 변경을 위한 Controller
 * </pre>
 * 
 * @ClassName		: MLHPrsnDataChngController.java
 * @Description		: 개인정보 변경을 위한 Controller
 * @author 허진영
 * @since 2016.03.07
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.07		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/my-lifeway/member/resortagree")
public class MLHResortAgreeController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="lGBMemJoinService")
    private LGBMemJoinService lGBMemJoinService;

	@Resource(name="mLHPrsnDataChngDAO")
	private MLHPrsnDataChngDAO mLHPrsnDataChngDAO;

	@Resource(name="lGAMemLoginService")
	private LGAMemLoginService lGAMemLoginService;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

	/**
	 * 비밀번호 확인 페이지.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/index.do")
	public String getResortAgreePage(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{ 
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		emfMap.put("id", lgnMap.getString("id"));
		
    	emfMap = lGBMemJoinService.selectMemInf(emfMap);
    	EmfMap rtnMap = (EmfMap)emfMap.get("info");	// 조회에 성공시 회원 정보
    	
    	modelMap.addAttribute("rtnMap", rtnMap);
    	
		/*
		 홈페이지 개인정보 로그 - 보안관련 로직 신규 구현
		 2017.12.26
		 */
		EmfMap logMap = new EmfMap();
		logMap.put("ip", EgovNetworkState.getMyIPaddress(request));
		logMap.put("gubun", "나의 라이프웨이 - 회원정보 관리 - 리조트 객실 예약을 위한 (주)대명레저산업 개인정보 제공동의 조회");
		logMap.put("flag", "S");
		logMap.put("pageGubun", "H");
		logMap.put("name", lgnMap.get("name"));
		logMap.put("hp", lgnMap.get("hp"));
		logMap.put("id", lgnMap.get("id"));
		cmmUseService.actionViewAuthLog(logMap);

		return "front/ml/mlh/MLHResortAgree.front";
	}
	@RequestMapping(value="/update.do")
	public String updateAgreement(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		String url = "redirect:./index.do";
		
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		EmfMap logMap = new EmfMap();
		
		logMap.put("id", lgnMap.getString("id"));
		logMap.put("rcvGb", "agreementForThirdParty");
		logMap.put("regId", lgnMap.getString("id"));
		logMap.put("regIp", EgovNetworkState.getMyIPaddress(request));
		logMap.put("modId", logMap.getString("regId"));
		logMap.put("modIp", logMap.getString("regIp"));		

		emfMap.put("id", lgnMap.getString("id"));
		
		mLHPrsnDataChngDAO.insertInitialSrvcRcvModLog(logMap);
		
    	lGBMemJoinService.updateMemAgreement(emfMap);
    	lGAMemLoginService.sendDataToResort(lgnMap.getString("id"));
		return url;
	}
}
