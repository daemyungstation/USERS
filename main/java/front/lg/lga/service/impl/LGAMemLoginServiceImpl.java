package front.lg.lga.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

import egovframework.com.cmm.service.EgovProperties;
import front.lg.lga.service.dao.MallMemDAO;
import front.lg.lgb.service.dao.LGBMemJoinDAO;
import front.lg.sso.exception.SsoException;
import front.lg.sso.service.SSOService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.com.utl.sim.service.EgovNetworkState;
import egovframework.com.utl.sim.service.SeedCipher;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.lg.lga.service.LGAMemLoginService;
import front.lg.lga.service.dao.LGAMemLoginDAO;
import front.lg.lgb.service.LGBMemJoinService;
import front.ml.mlh.service.dao.MLHMemDrotDAO;

/**
 * <pre> 
 * 회원 로그인을 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: LGAMemLoginServiceImpl.java
 * @Description		: 회원 로그인을 위한 ServiceImpl
 * @author 김필기
 * @since 2016.03.03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.03		   김필기				  최초 생성
 * </pre>
 */  
@Service("lGAMemLoginService")
public class LGAMemLoginServiceImpl extends EmfAbstractService implements LGAMemLoginService {
	
	@Resource(name="lGAMemLoginDAO")
	private LGAMemLoginDAO lGAMemLoginDAO;

	@Resource(name="lGBMemJoinDAO")
	private LGBMemJoinDAO lGBMemJoinDAO;

	@Resource(name="mallMemDAO")
	private MallMemDAO mallMemDAO;

	@Resource(name="ssoService")
	private SSOService ssoService;

	@Resource(name = "mLHMemDrotDAO")
	private MLHMemDrotDAO mLHMemDrotDAO;
	
	private final String SSO_API_URL = EgovProperties.getProperty("sso.api.url");

	private final String SSO_SERVICE_KEY= EgovProperties.getProperty("sso.api.servicekey");

	/** 서비스 **/
	@Resource(name="lGBMemJoinService")
    private LGBMemJoinService lGBMemJoinService;
	
    /**
	 * 일반 로그인을 처리한다
	 *
	 * @param emfMap
	 * @return request
	 * @exception Exception
	 */
    public EmfMap actionLogin(EmfMap emfMap, HttpServletRequest request) throws Exception {
		//보안문자 체크
		String captcha = EMFStringUtil.nullConvert(request.getSession().getAttribute("CurrentAnswer"));

//		int retryCount; 
//		retryCount = (Integer) RequestContextHolder.getRequestAttributes().getAttribute("retryCount", RequestAttributes.SCOPE_SESSION) == null ? 0 : (Integer) RequestContextHolder.getRequestAttributes().getAttribute("retryCount", RequestAttributes.SCOPE_SESSION) ;
//		log.debug(retryCount);
		
		EmfMap lgnInfo = lGBMemJoinService.selectMemLgnCnt(emfMap.getString("id"));
		Integer retryCount = 1;
		
		if (lgnInfo != null) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date lastLgnDate = formatter.parse(lgnInfo.getString("lastLgnTryDtm"));
			Calendar cal = new GregorianCalendar(Locale.KOREA);
			cal.add(Calendar.DAY_OF_YEAR,  -1);
			
			if (lastLgnDate.getTime() < cal.getTimeInMillis()) {
				// 마지막 로그인시도 한지 하루 지났을때 카운트 초기화
				lgnInfo.put("lgnTryCnt", retryCount);
				lGBMemJoinService.updateMemLgnCnt(lgnInfo);
			} else {
				retryCount += Integer.valueOf(String.valueOf(lgnInfo.get("lgnTryCnt")));
				lgnInfo.put("lgnTryCnt", retryCount);
				lGBMemJoinService.updateMemLgnCnt(lgnInfo);
			}
		} else {
			lGBMemJoinService.insertMemLgnCnt(emfMap.getString("id"));
		}
				
		/*
		Enumeration keys = request.getSession().getAttributeNames();
		
		log.debug("시작");
		while (keys.hasMoreElements())
		{
		  String key = (String)keys.nextElement();
		  log.debug("key + " + request.getSession().getAttribute(key));
		}
		log.debug("종료");
		log.debug(request.getSession().getAttribute("CurrentAnswer"));
		log.debug(request); //.getAttribute("CurrentAnswer"));
		 */

		if (retryCount > 4) {
			if(!captcha.equals(EMFStringUtil.nullConvert(emfMap.get("captchaText")))) {
				throw new Exception("보안문자오류");
			}
		}
		
    	String vwUrl = emfMap.getString("vwUrl");
    	String idx = emfMap.getString("idx");

    	emfMap.put("check", "loginid");
    	emfMap = lGBMemJoinService.selectMemInf(emfMap);		// 아이디로 1차 검사

		EmfMap rtnMap = (EmfMap)emfMap.get("info");	// 조회에 성공시 회원 정보
		EmfMap compareMap = new EmfMap();

    	if (rtnMap != null) {
    		compareMap.put("id", rtnMap.getString("id"));	// 비교 id 설정
    		compareMap.put("ci", rtnMap.getString("ci"));	// 비교 ci 설정
    		
    		if ("O".equals(rtnMap.getString("userGb")) && "N".equals(rtnMap.getString("oldAuthYn"))) {		// 기존 회원이고 인증 전일 경우
			   //보안 처리(로그인 세션 변경)
			   if (request.getSession() != null) {
				   request.getSession().invalidate();
			   }
			   
			   if ("".equals(EgovStringUtil.nullConvert(emfMap.getString("vwUrl")))) {
				   emfMap.put("vwUrl", "/main/index.do");
			   }
    			   
    			RequestContextHolder.getRequestAttributes().setAttribute("compareMap", compareMap, RequestAttributes.SCOPE_SESSION);
        		//emfMap.put("msg",  "이전 홈페이지 회원분은 비밀번호를 다시 설정해주시기 바랍니다.");
        		//emfMap.put("url",  "/member/login/Login.do");
        		emfMap.put("vwUrl", "redirect:/member/old/index.do");
    			
    		} else {
			   
			   	if ("".equals(EgovStringUtil.nullConvert(emfMap.getString("vwUrl")))) {
				   emfMap.put("vwUrl", "/main/index.do");
			   	}
				emfMap.put("check", "login");
            	
            	//단방향 암호화 처리
            	String enpassword = EgovFileScrty.encryptPassword( EMFStringUtil.nullConvert( emfMap.get("pwd") ));
            	emfMap.put("pwd", enpassword);
            	
            	emfMap = lGBMemJoinService.selectMemInf(emfMap);
            	emfMap = (EmfMap)emfMap.get("info");	// 조회에 성공시 회원 정보

            	if (emfMap != null) {
            		if ("Y".equals(emfMap.getString("qscnYn"))) {	// 휴면 계정일때
            			RequestContextHolder.getRequestAttributes().setAttribute("compareMap", compareMap, RequestAttributes.SCOPE_SESSION);
            			emfMap.put("vwUrl", "redirect:/member/qscn/index.do");
            		} else {
         			   	//보안 처리(로그인 세션 변경)
         			   	if (request.getSession() != null) {
         				   request.getSession().invalidate();
         			   	}
         			   	lGAMemLoginDAO.updateMemLoginInf(emfMap);
                		emfMap.put("loginIp", EgovNetworkState.getMyIPaddress(request));
                		emfMap.remove("pwd");
                		
            			RequestContextHolder.getRequestAttributes().setAttribute("userLgnMap", emfMap, RequestAttributes.SCOPE_SESSION);
            			
            			if(!"".equals(idx)){
            				vwUrl = vwUrl + "&idx=" + idx;
            			} else {
            				vwUrl = "/main/index.do";
            			}

            			emfMap.put("vwUrl", "redirect:" + vwUrl);
            			// 대명 리조트로 값 전달
            			log.debug(rtnMap.getString("id"));
            			sendDataToResort(rtnMap.getString("id"));
            		}
            		emfMap.put("lgnTryCnt", 0);
            		lGBMemJoinService.updateMemLgnCnt(emfMap);
            	} else {
//            		retryCount++;
					RequestContextHolder.getRequestAttributes().setAttribute("retryCount", retryCount, RequestAttributes.SCOPE_SESSION);

					emfMap = new EmfMap();
					emfMap.put("msg",  "아이디 혹은 비밀번호를 다시 확인해주세요.");
					emfMap.put("url",  "/member/login/Login.do");
					emfMap.put("vwUrl", "error/blank.error");
            	}    			
    		}
    	} else {
//    		retryCount++;
			RequestContextHolder.getRequestAttributes().setAttribute("retryCount", retryCount, RequestAttributes.SCOPE_SESSION);

    		emfMap = new EmfMap();
    		emfMap.put("msg",  "아이디 혹은 비밀번호를 다시 확인해주세요");
    		emfMap.put("url",  "/member/login/Login.do");
    		emfMap.put("vwUrl", "error/blank.error");    		
    	}
    	
    	return emfMap;
    }

	/**
	 * 통합회원 로그인 (구버전)
	 *
	 * @param emfMap
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @Override
    public EmfMap actionIntegrationLogin(EmfMap emfMap, HttpServletRequest request) throws Exception {
		//보안문자 체크
		String captcha = EMFStringUtil.nullConvert(request.getSession().getAttribute("CurrentAnswer"));
		EmfMap lgnInfo = lGBMemJoinService.selectMemLgnCnt(emfMap.getString("id"));

		if (lgnInfo != null) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date lastLgnDate = formatter.parse(lgnInfo.getString("lastLgnTryDtm"));
			Calendar cal = new GregorianCalendar(Locale.KOREA);
			cal.add(Calendar.DAY_OF_YEAR,  -1);

			if (lastLgnDate.getTime() > cal.getTimeInMillis()) {
				int retryCount = Integer.valueOf(String.valueOf(lgnInfo.get("lgnTryCnt")));
				if (++retryCount > 4 && !captcha.equals(EMFStringUtil.nullConvert(emfMap.get("captchaText")))) {
					throw new Exception("보안문자오류");
				}
			}
		}

		String requestId = (String) emfMap.get("id");
		String vwUrl = emfMap.getString("vwUrl");
		String idx = emfMap.getString("idx");

    	EmfMap integrationParam = new EmfMap();
    	integrationParam.put("type", "INTEGRATION");
    	integrationParam.put("id", requestId);
		EmfMap integrationMemberInfo = lGAMemLoginDAO.getIntegrationMemberInfo(integrationParam);
		String enpassword = EgovFileScrty.encryptPassword(EMFStringUtil.nullConvert(emfMap.get("pwd")));

		if (integrationMemberInfo != null && integrationMemberInfo.get("integrationId") != null && integrationMemberInfo.get("secessionDate") == null) {
			// 통합 계정 존재
			// 아이디, 패스워드 확인
			if (!enpassword.equals(integrationMemberInfo.get("integrationPw"))) {
				// 비밀번호 틀림
				this.incorrectPassword(emfMap, integrationMemberInfo);
			} else {
				String qscnFlag = (String) integrationMemberInfo.get("qscnYn");
				emfMap = integrationMemberInfo;

				if (qscnFlag != null && "Y".equals(qscnFlag)) {
					// 휴면 회원 본인 인증 후 휴면 해제
					this.sendClearQscnMemberPage(emfMap, integrationMemberInfo);
				} else {
					// 정상 통합 회원 로그인
					//보안 처리(로그인 세션 변경)
					if (request.getSession() != null) request.getSession().invalidate();

					if (integrationMemberInfo.get("homepageId") == null && integrationMemberInfo.get("memberId") != null) {
						// 통합 회원에 있는 고유번호로 홈페이지 회원 조회, 홈페이지 회원이 있다면 통합 회원에 홈페이지 회원 아이디 업데이트.
						EmfMap homepageMember = lGAMemLoginDAO.getHomepageMemberInfo(null, null, integrationMemberInfo.getString("memberId"));

						if (homepageMember != null) {
							// 통합 회원 테이블에 홈페이지 회원 아이디 업데이트
							EmfMap homepageIdParams = new EmfMap();
							homepageIdParams.put("homepageId", homepageMember.get("id"));
							homepageIdParams.put("unqNo", homepageMember.get("unqNo"));
							lGAMemLoginDAO.putHomepageIdToIntegrationMember(homepageIdParams);

						} else {
							// 통합 회원 이지만 홈페이지 회원이 아니라면 홈페이지 디비 insert
							List<EmfMap> mallUserInfos = mallMemDAO.getMallMemInfo(integrationMemberInfo.getString("memberId"));

							if (mallUserInfos.size() == 1) {
								EmfMap mallUserInfo = mallUserInfos.get(0);
								// 홈페이지 계정이 없기때문에 통합 아이디를 저장.
								emfMap.put("homepageId", integrationMemberInfo.get("integrationId"));
								emfMap.put("unqNo", integrationMemberInfo.getString("memberId"));
								emfMap.put("ci", integrationMemberInfo.getString("ci"));
								emfMap.put("pwd", enpassword);
								emfMap.put("loginIp", EgovNetworkState.getMyIPaddress(request));
								this.syncUserInfo(emfMap, mallUserInfo);
								lGAMemLoginDAO.putIntegrationMemberInfo(emfMap);
							}

							emfMap.remove("pwd");
							emfMap.put("check", "loginid");
							emfMap.put("id", emfMap.get("homepageId"));

							emfMap = lGBMemJoinService.selectMemInf(emfMap);
							emfMap.put("loginIp", EgovNetworkState.getMyIPaddress(request));
							emfMap.put("unqNo", emfMap.getString("memberId"));
						}

					} else {
						// 통합 회원 + 홈페이지 회원
						emfMap.put("id", emfMap.get("homepageId"));
						lGAMemLoginDAO.updateMemLoginInf(emfMap);
						emfMap.remove("pwd");
						emfMap.put("check", "loginid");

						emfMap = lGBMemJoinService.selectMemInf(emfMap);
						emfMap.put("loginIp", EgovNetworkState.getMyIPaddress(request));
						emfMap.put("unqNo", emfMap.getString("memberId"));

						// 고유번호 업데이트
                        EmfMap homepageMemberInfo = (EmfMap) emfMap.get("info");
                        if (integrationMemberInfo.get("memberId") == null && homepageMemberInfo != null && homepageMemberInfo.get("unqNo") != null) {
                            EmfMap uptIntMemParam = new EmfMap();
                            uptIntMemParam.put("unqNo", homepageMemberInfo.get("unqNo"));
                            uptIntMemParam.put("integrationId", requestId);
                            lGAMemLoginDAO.putIntegrationMemberInfo(uptIntMemParam);
                        }

						// 회원몰과 동기화
						if (integrationMemberInfo.get("memberId") != null) {
							List<EmfMap> mallUserInfos = mallMemDAO.getMallMemInfo(integrationMemberInfo.getString("memberId"));
							if (mallUserInfos.size() == 1) {
								EmfMap mallUserInfo = mallUserInfos.get(0);
								EmfMap homepageInfo = (EmfMap) emfMap.get("info");
//								System.out.println(mallUserInfo);

								SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								long mallModDate = 0L;
								long homeModDtm = 0L;
								if (mallUserInfo.get("uesrEditdate") != null) {
									mallModDate = df.parse(mallUserInfo.getString("uesrEditdate")).getTime();
								}
								if (homepageInfo.get("modDtm") != null) homeModDtm = df.parse(homepageInfo.getString("modDtm")).getTime();

								if (mallModDate >= homeModDtm) {
									// 회원몰 -> 홈페이지
									emfMap.put("homepageId", integrationMemberInfo.get("homepageId"));
									this.syncUserInfo(emfMap, mallUserInfo);
								}

							} else {
								// 회원몰 계정이 복수개 조회되는 경우 동기화하지 않음.
							}
						}
					}

					RequestContextHolder.getRequestAttributes().setAttribute("userLgnMap", emfMap, RequestAttributes.SCOPE_SESSION);

					if (!"".equals(idx)) vwUrl = vwUrl + "&idx=" + idx;
					else vwUrl = "/main/index.do";

					emfMap.put("vwUrl", "redirect:" + vwUrl);

					// 대명 리조트로 값 전달
					log.debug(requestId);
					sendDataToResort(requestId);
				}
				// 로그인 시도 초기화
				lGBMemJoinService.deleteMemLgnCnt(requestId);
			}

		} else {
			// TODO 통합 계정, 이전 로그인 시도 없음
			// TODO 통합 계정 X , 홈페이지 계정 조회
			this.getHomepageMemberInfo(emfMap, integrationParam, enpassword);
			emfMap.put("success", false);
		}
		return emfMap;
	}


    public EmfMap actionLoginSso(EmfMap emfMap, HttpServletRequest request) throws Exception {
		String clientIp = EgovNetworkState.getMyIPaddress(request);
		String ssoId = (String) emfMap.get("id");
		String vwUrl = emfMap.getString("vwUrl");
		String idx = emfMap.getString("idx");
		String enpassword = EgovFileScrty.encryptPassword(EMFStringUtil.nullConvert(emfMap.get("pwd")));
		HashMap ssoMemberInfo = null;

		emfMap.put("serviceKey", SSO_SERVICE_KEY);
		emfMap.put("success", true);

		EmfMap lgnInfo = null;
		lgnInfo = lGBMemJoinService.selectMemLgnCnt(ssoId);

		//0. 보안문자 체크
		if (lgnInfo != null) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date lastLgnDate = formatter.parse(lgnInfo.getString("lastLgnTryDtm"));
			Calendar cal = new GregorianCalendar(Locale.KOREA);
			cal.add(Calendar.DAY_OF_YEAR,  -1);

			if (lastLgnDate.getTime() > cal.getTimeInMillis()) {
				int retryCount = Integer.valueOf(String.valueOf(lgnInfo.get("lgnTryCnt")));
				String captcha = EMFStringUtil.nullConvert(request.getSession().getAttribute("CurrentAnswer"));
				if (++retryCount > 4 && !captcha.equals(EMFStringUtil.nullConvert(emfMap.get("captchaText"))))
					throw new Exception("보안문자오류");
			}
		}

// 1. 비밀번호 확인
		HashMap ssoLoginInfo = null;
		try
		{
			ssoLoginInfo = ssoService.login(ssoId, enpassword, clientIp);
		}
		catch (SsoException ex)
		{
			ex.printStackTrace();
    		emfMap.put("msg", "에러가 발생하였습니다.(" + ex.getMessage() + ")");
    		emfMap.put("vwUrl",  "/member/login/Login.do");
    		emfMap.put("success", false);

    		return emfMap;
		}
		
		if (ssoLoginInfo != null) //통합회원 로그인 성공
		{
			emfMap.putAll(ssoLoginInfo);

			try
			{
				ssoMemberInfo = ssoService.find(ssoId, null, null, clientIp);
			}
			catch (SsoException ex)
			{
				ex.printStackTrace();
	    		emfMap.put("msg", "에러가 발생하였습니다.(" + ex.getMessage() + ")");
	    		emfMap.put("vwUrl",  "/member/login/Login.do");
	    		emfMap.put("success", false);

	    		return emfMap;
			}

			if (ssoMemberInfo == null)
				throw new Exception("비정상적인 통합회원 입니다.");

			String ci = (String)ssoMemberInfo.get("ci");
			if (ci == null || ci.equals(""))
				throw new Exception("비정상적인 통합회원 입니다.");

			EmfMap infoMap = new EmfMap();
			infoMap.put("ci", ci);
			EmfMap homepageMemberInfo = lGBMemJoinDAO.selectMemInfFromMemAndQscnMem(infoMap);
			if (homepageMemberInfo != null) //로컬 회원 존재
			{
				if ("Y".equals(homepageMemberInfo.get("qscnYn"))) //휴면 회원 처리
				{
					// 휴면회원이기 때문에, 본인인증 후 휴면 해제.
					EmfMap clearQscnParamMap = new EmfMap();
					clearQscnParamMap.put("id", (String)homepageMemberInfo.get("id"));
					clearQscnParamMap.put("homepageId", (String)homepageMemberInfo.get("id"));
					clearQscnParamMap.put("integrationId", ssoId);
					clearQscnParamMap.put("ci", ci);
					sendClearQscnMemberPage(emfMap, clearQscnParamMap);
		    		emfMap.put("vwUrl",  "/member/qscn/index.do");

					return emfMap;
				}

				if (request.getSession() != null) request.getSession().invalidate();
				ssoMemberInfo.put("clientIp", clientIp);
				ssoMemberInfo.put("newId", homepageMemberInfo.getString("id"));
				syncUserInfo(ssoMemberInfo);
			}
			else
			{
				// 대명홈페이지 디비에 회원 정보 INSERT
				ssoMemberInfo.put("clientIp", clientIp);
				//TODO: 충분히 오류 가능성 있음 SSO 아이디 암호화 갑시
				ssoMemberInfo.put("newId", ssoMemberInfo.get("id"));
				syncUserInfo(ssoMemberInfo);
				homepageMemberInfo = lGBMemJoinDAO.selectMemInfFromMemAndQscnMem(infoMap);
			}

			// 로그인처리 (세션에 회원정보를 담으면 됨.)
			homepageMemberInfo.put("integrationId", (String)ssoMemberInfo.get("id"));
			emfMap.put("loginIp", EgovNetworkState.getMyIPaddress(request));
			RequestContextHolder.getRequestAttributes().setAttribute("userLgnMap", homepageMemberInfo, RequestAttributes.SCOPE_SESSION);

			if (!"".equals(idx)) {
				vwUrl = vwUrl + "&idx=" + idx;
			} else {
				vwUrl = "/main/index.do";
			}

			emfMap.put("vwUrl", vwUrl);

			// 대명 리조트로 값 전달
			//sendDataToResort(ssoId);

			// 로그인 시도 초기화
			lGBMemJoinService.deleteMemLgnCnt(ssoId);
			
			// 최종로그인 접속일 업데이트
			lGAMemLoginDAO.updateMemLoginInf(emfMap);
		}
		else //통합회원 로그인 실패
		{
			// 탈퇴회원인지 조회
			List<HashMap> ssoDropMemberInfo = null;
			try
			{
				ssoDropMemberInfo = ssoService.findDrop(ssoId, null, null, clientIp);
			}
			catch (SsoException ex)
			{
				ex.printStackTrace();
	    		emfMap.put("msg", "에러가 발생하였습니다.(" + ex.getMessage() + ")");
	    		emfMap.put("vwUrl",  "/member/login/Login.do");
	    		emfMap.put("success", false);

	    		return emfMap;
			}

			if (ssoDropMemberInfo != null && ssoDropMemberInfo.size() > 0) // 탈퇴회원 처리
			{
				String ci = (String)ssoDropMemberInfo.get(0).get("ci");
				if (ci == null || ci.equals(""))
					throw new Exception("비정상적인 통합회원 입니다.");

				EmfMap infoMap = new EmfMap();
				infoMap.put("ci", ci);
				EmfMap homepageMemberInfo = lGBMemJoinDAO.selectMemInfFromMemAndQscnMem(infoMap);

				if (homepageMemberInfo != null) //로컬 회원 존재
				{
					EmfMap dropUserParam = new EmfMap();
					dropUserParam.put("id", homepageMemberInfo.get("id"));
					if ("Y".equals(homepageMemberInfo.get("qscnYn"))) //휴면회원 탈퇴처리
					{
						dropUserParam.put("dropReason", "타사이트 SSO 탈퇴");
						mLHMemDrotDAO.insertMemDropInfoFromQscn(dropUserParam);
						mLHMemDrotDAO.deleteMemDrotFromQscn(dropUserParam);
					}
					else // 일반회원 탈퇴처리
					{
						mLHMemDrotDAO.insertMemDropInfo(dropUserParam);
						mLHMemDrotDAO.deleteMemDrot(dropUserParam);
					}
					mLHMemDrotDAO.deleteMemEtcDrot(dropUserParam.getString("id"));
					mLHMemDrotDAO.deleteIdntInf(dropUserParam);
					incorrectPassword(emfMap, lgnInfo == null ? null : lgnInfo);
			    	return emfMap;
				}
			}

			// SSO 회원은 아니나 기본 일반회원인 경우 처리
			EmfMap infoMap = new EmfMap();
			infoMap.put("id", ssoId);
			EmfMap homepageMemberInfo = lGBMemJoinDAO.selectMemInfFromMemAndQscnMem(infoMap);
			
			if (homepageMemberInfo != null && enpassword.equals(homepageMemberInfo.getString("pwd"))) //로컬 로그인 성공
			{
				if (homepageMemberInfo.get("ci") == null || "".equals(homepageMemberInfo.get("ci")))
				{
	        		emfMap.put("vwUrl", "/member/old/index.do"); //TODO:테스트 필요
			    	return emfMap;
				}

				// 동일 CI값의 회원이 SSO에 존재하는지 확인
				try
				{
					ssoMemberInfo = ssoService.find(null, null, (String)homepageMemberInfo.get("ci"), clientIp);
				}
				catch (SsoException ex)
				{
					ex.printStackTrace();
		    		emfMap.put("msg", "에러가 발생하였습니다.(" + ex.getMessage() + ")");
		    		emfMap.put("vwUrl",  "/member/login/Login.do");
		    		emfMap.put("success", false);

		    		return emfMap;
				}
				
				if (ssoMemberInfo == null) //동일 CI값을 가진 통합회원이 존재하지 않음.
				{
					// 탈퇴회원인지 조회
					ssoDropMemberInfo = null;
					try
					{
						ssoDropMemberInfo = ssoService.findDrop(null, null, (String)homepageMemberInfo.get("ci"), clientIp);
					}
					catch (SsoException ex)
					{
						ex.printStackTrace();
			    		emfMap.put("msg", "에러가 발생하였습니다.(" + ex.getMessage() + ")");
			    		emfMap.put("vwUrl",  "/member/login/Login.do");
			    		emfMap.put("success", false);

			    		return emfMap;
					}

					if (ssoDropMemberInfo != null && ssoDropMemberInfo.size() > 0) // 탈퇴회원 처리
					{
						EmfMap dropUserParam = new EmfMap();
						dropUserParam.put("id", homepageMemberInfo.get("id"));
						if ("Y".equals(homepageMemberInfo.get("qscnYn"))) //휴면회원 탈퇴처리
						{
							dropUserParam.put("dropReason", "타사이트 SSO 탈퇴");
							mLHMemDrotDAO.insertMemDropInfoFromQscn(dropUserParam);
							mLHMemDrotDAO.deleteMemDrotFromQscn(dropUserParam);
						}
						else // 일반회원 탈퇴처리
						{
							mLHMemDrotDAO.insertMemDropInfo(dropUserParam);
							mLHMemDrotDAO.deleteMemDrot(dropUserParam);
						}
						mLHMemDrotDAO.deleteMemEtcDrot(dropUserParam.getString("id"));
						mLHMemDrotDAO.deleteIdntInf(dropUserParam);
						incorrectPassword(emfMap, lgnInfo == null ? null : lgnInfo);
					}
					else // 정말 SSO에 회원 정보 없음.
					{
						// SSO 아닌 경우 처리
						if (homepageMemberInfo.get("qscnYn") != null && "Y".equals(homepageMemberInfo.getString("qscnYn"))) //휴면회원
						{
							// 휴면 회원 본인 인증 후 휴면 해제
							EmfMap clearQscnParamMap = new EmfMap();
							clearQscnParamMap.put("id", ssoId);
							clearQscnParamMap.put("homepageId", ssoId);
							clearQscnParamMap.put("integrationId", ssoId);
							clearQscnParamMap.put("ci", homepageMemberInfo.get("ci"));

							sendClearQscnMemberPage(emfMap, clearQscnParamMap);
				    		emfMap.put("vwUrl",  "/member/qscn/index.do");
						}
						else
						{
							emfMap.put("vwUrl", "/member/join/integration/agree.do?id=" + ssoId);
						}
					}
				}
				else //동일 CI값을 가진 통합회원이 존재
				{
					emfMap.put("vwUrl", "/member/findid/index.do"); //ToDo : 확인 필요.
				}
			}
			else //계정이 없거나 비번 틀림
			{
				incorrectPassword(emfMap, lgnInfo == null ? null : lgnInfo);
			}
		}
		
    	return emfMap;
	}
    
	/**
	 * (구버전)
	 *
	 * @param emfMap
	 * @param mallUserInfo
	 */
	private void syncUserInfo(EmfMap emfMap, EmfMap mallUserInfo) {
		EmfMap syncUserInfoParam = new EmfMap();

		syncUserInfoParam.put("homepageId", emfMap.get("homepageId"));
		syncUserInfoParam.put("pwd", emfMap.get("pwd"));
		syncUserInfoParam.put("unqNo", emfMap.get("memberId"));
		syncUserInfoParam.put("modId", emfMap.get("homepageId"));
		syncUserInfoParam.put("modIP", emfMap.get("loginIp"));
		syncUserInfoParam.put("name", mallUserInfo.get("name"));
		syncUserInfoParam.put("ci", emfMap.get("ci"));
		syncUserInfoParam.put("birth", mallUserInfo.get("birthday"));
		syncUserInfoParam.put("sex", ("M".equals(mallUserInfo.get("sexDiv")) ? 1 : 0));
		syncUserInfoParam.put("email", mallUserInfo.get("mail"));
		syncUserInfoParam.put("hp", mallUserInfo.get("pcs"));

		lGAMemLoginDAO.updateHomepageMemberInfo(syncUserInfoParam, "SYNC");

		EmfMap syncUserEtcParam = new EmfMap();

		syncUserEtcParam.put("homepageId", emfMap.get("homepageId"));
		syncUserEtcParam.put("modId", emfMap.get("homepageId"));
		syncUserEtcParam.put("modIP", emfMap.get("loginIp"));
		syncUserEtcParam.put("mrrgYn", mallUserInfo.get("married"));
		syncUserEtcParam.put("chdrnGb", mallUserInfo.get("addEtc3"));
		syncUserEtcParam.put("intrPtc", null);
		syncUserEtcParam.put("joinPath", null);
		syncUserEtcParam.put("joinPathEtc", null);
		syncUserEtcParam.put("pfrnPtc", null);
		syncUserEtcParam.put("pfrnEtc", null);
		syncUserEtcParam.put("modId", emfMap.get("homepageId"));
		syncUserEtcParam.put("modIp", emfMap.get("loginIp"));
		syncUserEtcParam.put("optionintrfield", null);
		lGAMemLoginDAO.updateHomepageMemberEtcInfo(syncUserEtcParam, "SYNC");
	}

	public void syncUserInfo(HashMap emfMap) throws Exception {
		EmfMap syncUserInfoParam = new EmfMap();

		String id = null;
		if (emfMap.get("newId") != null && !"".equals((String)emfMap.get("newId")))
			id = (String)emfMap.get("newId");
		else
			id = (String)emfMap.get("id");
			
		syncUserInfoParam.put("homepageId", id);
		syncUserInfoParam.put("pwd", emfMap.get("pwd"));
		syncUserInfoParam.put("modId", (String)emfMap.get("id"));
		syncUserInfoParam.put("modIP", emfMap.get("clientIp"));
		syncUserInfoParam.put("name", emfMap.get("name"));
		syncUserInfoParam.put("ci", emfMap.get("ci"));
		syncUserInfoParam.put("birth", emfMap.get("birth"));
		syncUserInfoParam.put("sex", ("M".equals(emfMap.get("gender")) ? 1 : 0));
		syncUserInfoParam.put("email", emfMap.get("email"));
		syncUserInfoParam.put("hp", emfMap.get("cellPhone"));
		syncUserInfoParam.put("tel", emfMap.get("phone"));
		syncUserInfoParam.put("zipcd", emfMap.get("zipCode"));
		syncUserInfoParam.put("adr", emfMap.get("address"));
		syncUserInfoParam.put("adrDtl", emfMap.get("addressDetail"));

		lGAMemLoginDAO.updateHomepageMemberInfo(syncUserInfoParam, "SYNC");
	}

	/**
	 * 홈페이지 회원 조회 (통합회원 테이블)
	 *
	 * @param emfMap
	 * @param integrationParam
	 * @param enpassword
	 * @return
	 * @throws Exception
	 */
	private void getHomepageMemberInfo(EmfMap emfMap, EmfMap integrationParam, String enpassword) throws Exception {
		integrationParam.put("type", "HOMEPAGE");
		/*	integrationMemberInfo
		INTEGRATION_ID, INTEGRATION_PW, HOMEPAGE_ID, MALL_ID, MEMBER_ID, CI, HOMEPAGE_ONLINE_YN, CMPLT_DATE, SECESSION_DATE, SECESSION_DELETE_DIV,
		QSCN_YN, NAME, SEX, BIRTH, EMAIL, HP, LGN_TRY_ID, LGN_TRY_CNT, LAST_LGN_TRY_DTM, HOMEPAGE_PW	*/
		EmfMap integrationMemberInfo = lGAMemLoginDAO.getIntegrationMemberInfo(integrationParam);
		// 홈페이지 회원 존재 조회
		// 비밀번호 확인
		if (integrationMemberInfo != null && integrationMemberInfo.get("homepageId") != null
				&& integrationMemberInfo.get("integrationId") == null && enpassword.equals(integrationMemberInfo.get("homepagePw"))) {

			if (integrationMemberInfo.get("qscnYn") != null && "Y".equals(integrationMemberInfo.get("qscnYn"))) {
				// 휴면 회원 본인 인증 후 휴면 해제
				this.sendClearQscnMemberPage(emfMap, integrationMemberInfo);
			} else {
				emfMap.put("ci", integrationMemberInfo.get("ci"));
				// 통합회원 전환
				emfMap.put("vwUrl", "/front/lg/lgb/LGBIntegrationMemJoinAgree.front");
			}
		} else {
			// 계정 없거나 비번 틀림
			this.incorrectPassword(emfMap, integrationMemberInfo);
		}
	}

	private void sendClearQscnMemberPage(EmfMap emfMap, EmfMap integrationMemberInfo) throws Exception {
		EmfMap compareMap = new EmfMap();
		compareMap.put("id", integrationMemberInfo.get("homepageId"));
		compareMap.put("homepageId", integrationMemberInfo.get("homepageId"));
		compareMap.put("integrationId", emfMap.get("integrationId"));
		compareMap.put("ci", integrationMemberInfo.get("ci"));
		RequestContextHolder.getRequestAttributes().setAttribute("compareMap", compareMap, RequestAttributes.SCOPE_SESSION);
		emfMap.put("vwUrl", "redirect:/member/qscn/index.do");
	}

	private void sendClearQscnMemberPage(EmfMap emfMap) throws Exception {
		RequestContextHolder.getRequestAttributes().setAttribute("compareMap", emfMap, RequestAttributes.SCOPE_SESSION);
		emfMap.put("vwUrl", "redirect:/member/qscn/index.do");
	}

	private void incorrectPassword(EmfMap emfMap, EmfMap integrationMemberInfo) throws Exception {
		BigDecimal lgnTryCnt = new BigDecimal(0);
		if (integrationMemberInfo != null && integrationMemberInfo.get("lgnTryCnt") != null) {
			integrationMemberInfo.put("lgnTryId", emfMap.get("id"));
			lGBMemJoinService.updateMemLgnCnt(integrationMemberInfo);
			lgnTryCnt = (BigDecimal) integrationMemberInfo.get("lgnTryCnt");
		} else {
			lGBMemJoinService.insertMemLgnCnt((String) emfMap.get("id"));
		}
		RequestContextHolder.getRequestAttributes().setAttribute("retryCount", lgnTryCnt.add(BigDecimal.valueOf(1)), RequestAttributes.SCOPE_SESSION);
		emfMap.put("msg",  "아이디 혹은 비밀번호를 다시 확인해주세요.");
		emfMap.put("vwUrl",  "/member/login/Login.do");
//		emfMap.put("vwUrl", "error/blank.error");
		emfMap.put("success", false);
	}

	/**
	 * 홈페이지 계정 정보 조회
	 *
	 * @param ci
	 * @param homepageId
	 * @return
	 * @throws Exception
	 */
	@Override
	public EmfMap getHomepageMemberInfo(String ci, String homepageId, String unqNo) {
		return lGAMemLoginDAO.getHomepageMemberInfo(ci, homepageId, unqNo);
	}
    
    // 대명 리조트에 값을 보내기 위해 임동진 대리님이(010-6258-2971) 만든 url 로 데이터 전송
    public void sendDataToResort(String id){
    	EmfMap param = new EmfMap();
    	
    	// id = "akirades1"; // 우선 테스트를 위한 고정값 
    	
    	param.put("id", id);
    	//EmfMap resortMap = new EmfMap(); 
    	List result = lGAMemLoginDAO.getMemResortInf(param);
    	
    	if (result == null)
    		return;
    	
    	try {
    		EmfMap data = (EmfMap)result.get(0);
    		
    		if(result.size() > 0){
	    		//String urlString = String.format("http://test.com/abc.do?accnt_no=%s&mem_nm=%s&resort_no=%s&join_dt=%s&cell=%s&ci_val=%s");
    			//	MB.ID, MB.NAME, ACCNTDLCC.ACCNT_NO, ACCNTDLCC.RESORT_NO, ACCNTDLCC.JOIN_DT, MB.HP, MB.AGREEMENT_FOR_THIRD_PARTY	
	    		//String ciBase64String = new String(Base64.encodeBase64(((String)data.get("ci")).getBytes()));
	    		String urlString = String.format("http://mobile.daemyung.com/mem/inf/saveLifewayPkg.do?lwMemNo=%s&lwMemName=%s&trMemNo=%s&rMemNo=&rMemGubun=01&jDate=%s&eDate=&cDate=&lwMemMobile=%s&lwMemId=&oDate=&payGubun=L11&lwyunchae_yn=&cntcInfo=%s"
	    				, data.get("accntNo")
	    				, URLEncoder.encode((String) data.get("name"), "EUC-KR")
	    				, data.get("resortNo")
	    				, data.get("joinDt")
	    				, data.get("hp")
	    				, URLEncoder.encode((String) data.get("ci"), "EUC-KR"));

	    		/*
	    		String urlString = String.format("http://junglan.com/test.php?lwMemNo=%s&lwMemName=%s&trMemNo=%s&rMemNo=&rMemGubun=01&jDate=%s&eDate=&cDate=&lwMemMobile=%s&lwMemId=&oDate=&payGubun=L11&lwyunchae_yn=&cntcInfo=%s"
	    				, data.get("accntNo")
	    				, URLEncoder.encode((String) data.get("name"), "EUC-KR")
	    				, data.get("resortNo")
	    				, data.get("joinDt")
	    				, data.get("hp")
	    				, ciBase64String);
	    		*/
	    		URL url = new URL(urlString);
				URLConnection connection = url.openConnection();
				BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				String inputLine;
				
				while ((inputLine = in.readLine()) != null) 
				    log.debug(inputLine);
				in.close();
				
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    /**
	 * 일반 로그아웃을 처리한다.
	 *
	 * @param request
	 * @exception Exception
	 */
    public void actionLogout(HttpServletRequest request) throws Exception
    {
    	RequestContextHolder.getRequestAttributes().setAttribute("userLgnMap", null, RequestAttributes.SCOPE_SESSION);
    }

	/**
	 * 휴면 계정을 일반계정으로 변경한다.
	 *
	 * @param emfMap
	 * @throws Exception
	 */
	public void updateMemInfQscn(EmfMap emfMap) throws Exception {
    	lGAMemLoginDAO.updateMemLoginInf(emfMap);
    }

	/**
	 * 대리 로그인을 처리한다
	 *
	 * @param emfMap
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public EmfMap actionProxyLogin(EmfMap emfMap, HttpServletRequest request) throws Exception
    {   
    	emfMap.put("check", "login");
    	
    	emfMap.put("id", SeedCipher.decrypt(emfMap.getString("id"), "UTF-8"));
    	
    	EmfMap rtnMap = lGBMemJoinService.selectMemInf(emfMap);
    	
    	if(rtnMap.get("info") != null)
    	{
    		EmfMap lgnMap = (EmfMap) rtnMap.get("info");
    		
    		lgnMap.remove("pwd");
    		lgnMap.put("loginIp", EgovNetworkState.getMyIPaddress(request));
    		
    		RequestContextHolder.getRequestAttributes().setAttribute("userLgnMap", lgnMap, RequestAttributes.SCOPE_SESSION);
    	}
    	
    	return emfMap;
    }
}
