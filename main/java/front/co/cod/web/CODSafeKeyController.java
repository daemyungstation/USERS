package front.co.cod.web;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.service.EgovProperties;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * Nice Safe-Key(인터넷 방식)발급 위한 Controller
 * </pre>
 * 
 * @ClassName		: CODNiceSafeKeyController.java
 * @Description		: Nice Safe-Key(인터넷 방식)발급 위한 Controller
 * @author 허진영
 * @since 2016.10.25
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.10.25		   허진영				  최초 생성
 * </pre>
 */  
@Controller
@RequestMapping("/safe-key")
public class CODSafeKeyController extends EmfController {	
	
	/**
	 * Nice Safe-Key 발급 페이지
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/index.do")
	public String getNiceSafeKeyPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/co/cod/CODSafeKeyWrite.pop";
	}
	
	/**
	 * Nice Safe-Key 발급위한 데이터 체크
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/check.ajax", method=RequestMethod.POST)
	public ModelAndView setNiceSafeKeyCheck(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{
			NiceID.Check.CPClient niceCheck = new NiceID.Check.CPClient();
			
			// NICE 받은 사이트 코드,패스워드
			String sSiteCode = "0023454";				// NICE로부터 부여받은 사이트 코드
			String sSitePassword = "5XC5Z8F33UL4";		// NICE로부터 부여받은 사이트 패스워드
			
			/*
				요청번호 생성
				요청번호는 안심키인증이 끝난 후 성공/실패 결과값에 포함하여 전송됩니다.
			*/
			String sRequestNumber = "";
			
			sRequestNumber = "REQ0000000001";        			  	// 모듈 대신 임의값을 업체에서 생성하여 사용가능
			sRequestNumber = niceCheck.getRequestNO(sSiteCode); 	// 모듈을 통한 생성
			
			HttpSession session = request.getSession(false);
			
			if(session.getAttribute("REQ_SEQ") != null)
			{
				session.removeAttribute("REQ_SEQ");
			}
			
			session.setAttribute("REQ_SEQ" , sRequestNumber);		// 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
			
			/*
				요청일시 생성 yyyyMMddHHmmss		
			*/
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			String req_datetime = df.format(cal.getTime());
				
			/*
				값은 총 3자리로 첫번째자리는 휴대폰인증사용여부, 두번째자리는 신용카드인증사용여부, 세번째자리는 공인인증서인증사용여부를 입력합니다.
				값은 반드시 3자리로 입력해 주셔야 됩니다.
				사용인 경우는 1,미사용인 경우는 0으로 표기합니다.
				예) 휴대폰인증사용,신용카드인증미사용,공인인증서인증사용 인 경우 
				    sAuthType = "101";
			*/
			String sAuthType = "111";

			/*
				생년월일 정보로 8자리로 입력합니다.(년 4자리, 월 2자리, 일 2자리)
				예) 생년월일이 '9999년 1월 20일' 인 경우
				    birthdate = "99990120";
			*/
			String birthdate = emfMap.getString("birthdate");

			/*
				성별정보 남자는 1, 여자는 0으로 입력합니다.
				예) '남자' 인 경우
				    gender = "1";
			*/
			String gender = emfMap.getString("gender");

			/*
				안심키 대상에 성명을 적어주시면 됩니다.
				예) 이름이 '홍길동' 인 경우
				    username = "홍길동";
			*/
			
			String username = emfMap.getString("username");
			
			username = URLEncoder.encode(username, "euc-kr");
			
			/*
				동의문에 대한 사용여부를 결정하는 코드입니다.		
				동의문종류 
				- 신용인증송부 서비스 신청 동의
				
				예) 신용인증송부 서비스 신청 동의를 원하는 경우 
					agree1_map = "1000000000";
					신용인증송부 서비스 신청 동의 원하지 않을 경우
					agree1_map = "0000000000";
			*/
			String agree1_map = "0000000000"; // 신용인증송부 서비스 신청 동의

			/*
				동의문에 대한 사용여부를 결정하는 코드입니다.
				업체에서 사전에 등록한 동의문정보를 기준으로 작성해주시면됩니다.
				동의문종류 		
				- 업체 필수 동의 (업체에서 제공하는 필수 동의문)
				- 업체 선택 동의 (업체에서 제공하는 선택 동의문)
				각 동의문은 최대 10개까지 등록이 가능합니다.
				입력 값은 등록하신 동의문이 없어도 반드시 10자리 입력해 주셔야 됩니다.
				사용여부는 사용인 경우 1, 미사용인 경우 0로 표기합니다.
				예) 등록된 동의문 중 동의문 중 1,3,5,6,번째 동의문만 사용하고 싶은 경우
					agree2_map = "1010110000";
					동록뢴 동의문이 없는 경우
					agree3_map = "0000000000";
			*/
			String agree2_map = "0000000000"; // 업체 필수 동의문
			String agree3_map = "0000000000"; // 업체 선택 동의문
			
			/*
				결과로 CI값을 결과값으로 받을지를 결정
				Y : CI를 결과값으로 받음, N : CI를 결과값으로 받지 않음
				
				CI는 본인확인을 정상적으로 성공한 경우만 받을 수 있습니다.
			*/
			String cigubun = "N";

			/*
				팝업창을 구분하는 입력값으로 제공되는 페이지에 취소버튼 즉 팝업창을 닫는 버튼이 없어집니다.
				Y : 취소버튼 있음, N : 취소버튼 없음
			*/
			String popgubun = "N";

			/*
				안심키 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
				받을 page는 https://~, http://~ 부터 입력해 주시기 바랍니다.
				부모창에 페이지와 결과페이지에 도메인은 반드시 일치하도록 입력해 주시기 바랍니다.
			*/ 
			String sReturnUrl = EgovProperties.getProperty("Globals.httpsUrl") + "/safe-key/complete.do";      // 성공시 이동될 URL
			String sErrorUrl = EgovProperties.getProperty("Globals.httpsUrl") + "/safe-key/complete.do";       // 실패시 이동될 URL
			
			// 입력될 plain 데이타를 만든다.
			String sPlainData =	"7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +  
								"12:REQ_DATETIME" + req_datetime.getBytes().length + ":" + req_datetime +
								"8:SITECODE" + sSiteCode.getBytes().length + ":" + sSiteCode +
								"9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
								"10:AGREE1_MAP" + agree1_map.getBytes().length + ":" + agree1_map +
								"10:AGREE2_MAP" + agree2_map.getBytes().length + ":" + agree2_map +
								"10:AGREE3_MAP" + agree3_map.getBytes().length + ":" + agree3_map +
								"8:USERNAME" + username.getBytes().length + ":" + username +
								"9:BIRTHDATE" + birthdate.getBytes().length + ":" + birthdate +
								"6:GENDER" + gender.getBytes().length + ":" + gender +
								"8:CI_GUBUN" + cigubun.getBytes().length + ":" + cigubun +
								"11:POPUP_GUBUN" + popgubun.getBytes().length + ":" + popgubun +
								"7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl +
								"7:ERR_URL" + sErrorUrl.getBytes().length + ":" + sErrorUrl;

			String sEncData = "";
			String sMessage = "";

			int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
			
			if( iReturn == 0 )
			{
				sEncData = niceCheck.getCipherData();
			}
			else if( iReturn == -1 )
			{
				sMessage = "암호화 시스템 에러입니다.";
			}
			else if( iReturn == -2 )
			{
				sMessage = "암호화 처리오류입니다.";
			}
			else if( iReturn == -3 )
			{
				sMessage = "암호화 데이터 오류입니다.";
			}
			else if( iReturn == -9 )
			{
				sMessage = "입력 데이터 오류입니다.";
			}
			else
			{
				sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
			}
			
			mav.addObject("sEncData", sEncData);
			mav.addObject("sMessage", sMessage);
			
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
	 * Nice Safe-Key 발급위한 데이터 체크
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/complete.do")
	public String getNiceSafeKeyComplete(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		try
		{
			NiceID.Check.CPClient niceCheck = new NiceID.Check.CPClient();

			String sEncodeData = EMFStringUtil.requestReplace(emfMap.getString("encodedata"), "encodeData");
		    String sReserved1  = EMFStringUtil.requestReplace(emfMap.getString("paramR1"), "");
		    String sReserved2  = EMFStringUtil.requestReplace(emfMap.getString("paramR2"), "");
		    String sReserved3  = EMFStringUtil.requestReplace(emfMap.getString("paramR3"), "");
		    
		    String sSiteCode = "0023454";				// NICE로부터 부여받은 사이트 코드
			String sSitePassword = "5XC5Z8F33UL4";		// NICE로부터 부여받은 사이트 패스워드

		    String sCipherTime = "";					// 복호화한 시간
		    String sRequestNumber = "";					// 요청 번호
		    String sResponseNumber = "";				// 인증 고유번호  
		    String sSafekey = "";						// 안심키
		    String sAuthType = "";						// 본인인증 수단
		    String sReturnCode = "";					// 결과코드
		    String sReturnMsg = "";						// 결과 메시지
		    String sRequestTime = "";					// 요청시간
		    String sAuthTime = "";						// 인증시간
		    String sAgree1Map = "";						// 이용자가 선택한 나이스 필수 동의문
		    String sAgree2Map = "";						// 이용자가 선택한 업체 필수 동의문    
		    String sAgree3Map = "";    					// 이용자가 선택한 업체 선택 동의문
		    String sCi = ""; 							// CI정보
		 
		    String sMessage = "";
		    String sPlainData = "";
		    
		    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

		    if( iReturn == 0 )
		    {
		        sPlainData = niceCheck.getPlainData();
		        sCipherTime = niceCheck.getCipherDateTime();
		        
		        // 데이타를 추출합니다.
		        HashMap mapresult = niceCheck.fnParse(sPlainData);
		        
		        //아래는 실제 데이타를 가져 오는 부분이다.
		        sSafekey = (String)mapresult.get("SAFE_KEY");
		        sRequestNumber = (String)mapresult.get("REQ_SEQ");
		        sResponseNumber = (String)mapresult.get("RES_SEQ");
		        sReturnCode = (String)mapresult.get("RETURN_CODE");
		        sReturnMsg = (String)mapresult.get("RETURN_MSG");
		        sRequestTime = (String)mapresult.get("REQ_DATETIME");    
		        sAuthTime = (String)mapresult.get("AUTH_DATETIME"); 
		        sAuthType = (String)mapresult.get("AUTH_TYPE");
		        sAgree1Map = (String)mapresult.get("AGREE1_MAP");
		        sAgree2Map = (String)mapresult.get("AGREE2_MAP");
		        sAgree3Map = (String)mapresult.get("AGREE3_MAP");
		        sCi = (String)mapresult.get("CI");
		        
		        HttpSession session = request.getSession(false);
				
		        if(session.getAttribute("REQ_SEQ") != null)
				{
			        String session_sRequestNumber = (String) session.getAttribute("REQ_SEQ");
			        
			        if(!sRequestNumber.equals(session_sRequestNumber))
			        {
			        	sMessage = "세션값이 다릅니다. 올바른 경로로 접근하시기 바랍니다.";
			        }
				}
		        else
		        {
		        	sMessage = "잘못된 접근입니다. 올바른 경로로 접근하시기 바랍니다.";
		        }
		    }
		    else if( iReturn == -1 )
		    {
		        sMessage = "복호화 시스템 에러입니다.";
		    }    
		    else if( iReturn == -4 )
		    {
		        sMessage = "복호화 처리오류입니다.";
		    }    
		    else if( iReturn == -5 )
		    {
		        sMessage = "복호화 해쉬 오류입니다.";
		    }    
		    else if( iReturn == -6 )
		    {
		        sMessage = "복호화 데이터 오류입니다.";
		    }    
		    else if( iReturn == -9 )
		    {
		        sMessage = "입력 데이터 오류입니다.";
		    }    
		    else if( iReturn == -12 )
		    {
		        sMessage = "사이트 패스워드 오류입니다.";
		    }    
		    else
		    {
		        sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
		    }
		    
		    modelMap.addAttribute("sSafekey", sSafekey);
		    modelMap.addAttribute("sMessage", sMessage);
		    
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/co/cod/CODSafeKeyComp.pop";
	}
}
