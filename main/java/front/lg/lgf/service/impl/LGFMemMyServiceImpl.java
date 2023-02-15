package front.lg.lgf.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.com.utl.sim.service.EgovNetworkState;
import egovframework.com.utl.sim.service.SeedCipher;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.lg.lgb.service.LGBMemJoinService;
import front.lg.lgb.service.dao.LGBMemJoinDAO;
import front.lg.lgf.service.LGFMemMyService;
import front.lg.lgf.service.dao.LGFMemMyDAO;
import front.lg.sso.exception.SsoException;
import front.lg.sso.service.SSOService;

/**
 * <pre> 
 * 모바일 민원 처리를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: LGFMemMyServiceImpl.java
 * @Description		: 모바일 민원 처리를 위한 ServiceImpl
 * @author 이너스커뮤니티
 * @since 2022.02.07
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2022.02.07		   이너스커뮤니티				  최초 생성
 * </pre>
 */ 

@Service("lGFMemMyService")
public class LGFMemMyServiceImpl extends EmfAbstractService implements LGFMemMyService {

	@Resource(name="lGFMemMyDAO")
	private LGFMemMyDAO lGFMemMyDAO;
	
	@Resource(name="ssoService")
	private SSOService ssoService;

	@Resource(name="lGBMemJoinDAO")
	private LGBMemJoinDAO lGBMemJoinDAO;
	
	@Resource(name="lGBMemJoinService")
	private LGBMemJoinService lGBMemJoinService;
	
	public EmfMap myAuth(EmfMap emfMap, HttpServletRequest request) throws Exception
	{
		// 본인 인증 후 세션에 저장된 정보를 가져온다(이름, 생년월일)
		EmfMap authMap = (EmfMap) EgovUserDetailsHelper.getIndividualInfAuth();
		emfMap.put("ci", authMap.getString("ci"));
		
		List result = lGFMemMyDAO.getInfoByCI(emfMap);
		
		if(result.size() > 0){
			if(result.size() == 1) {
				
				EmfMap info = (EmfMap)result.get(0);
				
				String clientIp = EgovNetworkState.getMyIPaddress(request);
				String ssoId = info.getString("id");
				String enpassword = info.getString("pwd");
				HashMap ssoMemberInfo = null;

				emfMap.put("serviceKey", EgovProperties.getProperty("sso.api.servicekey"));
				emfMap.put("success", true);

				//1. 비밀번호 확인
				HashMap ssoLoginInfo = null;
				try
				{
					ssoLoginInfo = ssoService.login(ssoId, enpassword, clientIp);
				}
				catch (SsoException ex)
				{
					ex.printStackTrace();
		    		emfMap.put("msg", "에러가 발생하였습니다.(" + ex.getMessage() + ")");
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
							emfMap.put("msg", "휴면회원이십니다. 홈페이지에서 먼저 휴면회원 해체 신청해주세요.");
				    		emfMap.put("success", false);
							return emfMap;
						}
					}
					else
					{
						homepageMemberInfo = lGBMemJoinDAO.selectMemInfFromMemAndQscnMem(infoMap);
					}

					// 로그인처리 (세션에 회원정보를 담으면 됨.)
					homepageMemberInfo.put("integrationId", (String)ssoMemberInfo.get("id"));
					emfMap.put("loginIp", EgovNetworkState.getMyIPaddress(request));
					RequestContextHolder.getRequestAttributes().setAttribute("userLgnMap", homepageMemberInfo, RequestAttributes.SCOPE_SESSION);
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
			    		emfMap.put("success", false);
			    		return emfMap;
					}

					if (ssoDropMemberInfo != null && ssoDropMemberInfo.size() > 0) // 탈퇴회원 처리
					{
						String ci = (String)ssoDropMemberInfo.get(0).get("ci");
						if (ci == null || ci.equals(""))
							throw new Exception("비정상적인 통합회원 입니다.");

						emfMap.put("msg", "탈퇴회원입니다.");
			    		emfMap.put("success", false);
						return emfMap;
					}

					// SSO 회원은 아니나 기본 일반회원인 경우 처리
					EmfMap infoMap = new EmfMap();
					infoMap.put("id", ssoId);
					EmfMap homepageMemberInfo = lGBMemJoinDAO.selectMemInfFromMemAndQscnMem(infoMap);
					
					if (homepageMemberInfo != null && enpassword.equals(homepageMemberInfo.getString("pwd"))) //로컬 로그인 성공
					{
						if (homepageMemberInfo.get("ci") == null || "".equals(homepageMemberInfo.get("ci")))
						{
							emfMap.put("msg", "본인인증 값이 존재하지 않습니다.");
				    		emfMap.put("success", false);
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
								emfMap.put("msg", "탈퇴회원입니다.");
					    		emfMap.put("success", false);
								return emfMap;
							}
							else // 정말 SSO에 회원 정보 없음.
							{
								// SSO 아닌 경우 처리
								if (homepageMemberInfo.get("qscnYn") != null && "Y".equals(homepageMemberInfo.getString("qscnYn"))) //휴면회원
								{
									emfMap.put("msg", "휴면회원이십니다. 홈페이지에서 먼저 휴면회원 해체 신청해주세요.");
						    		emfMap.put("success", false);
									return emfMap;
								}
								else
								{
									emfMap.put("msg", "통합회원이 아닙니다. 홈페이지에서 먼저 통합회원으로 변경해주세요.");
						    		emfMap.put("success", false);
									return emfMap;
								}
							}
						}
						else //동일 CI값을 가진 통합회원이 존재
						{
							emfMap.put("msg", "아이디가 틀린 통합회원이 존재합니다. 관리자에게 문의해주세요.");
				    		emfMap.put("success", false);
							return emfMap;
						}
					}
					else //계정이 없거나 비번 틀림
					{
						emfMap.put("msg", "에러발생. 관리자에게 문의해주세요.");
			    		emfMap.put("success", false);
						return emfMap;
					}
				}
				
		    	return emfMap;
			}else {
				emfMap.put("msg", "중복된 회원입니다.");
	    		emfMap.put("success", false);
			}
		}else {
			emfMap.put("msg", "회원이 아닙니다.");
    		emfMap.put("success", false);
		}
		return emfMap;
	}
	
	/**
	 * 회원 정보를 조회한다. - SSO
	 *
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMemInfSso(EmfMap emfMap, HttpServletRequest request) throws Exception
	{
		String clientIp = EgovNetworkState.getMyIPaddress(request);
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		emfMap.put("integrationId", lgnMap.getString("integrationId"));

		HashMap ssoFindMap = null;
    	ssoFindMap = ssoService.find(lgnMap.getString("integrationId"), null, null, clientIp);
    	emfMap.put("memInfo", ssoFindMap);
    	return emfMap;
	}
	
	/**
	 * 회원 정보를 변경한다. - SSO
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateMemInfSso(EmfMap emfMap, HttpServletRequest request) throws Exception
	{
		String clientIp = EgovNetworkState.getMyIPaddress(request);
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("id", lgnMap.getString("id"));
		
		emfMap.put("regId", lgnMap.getString("id"));
		emfMap.put("regIp", lgnMap.getString("loginIp"));
		emfMap.put("modId", lgnMap.getString("id"));
		emfMap.put("modIp", lgnMap.getString("loginIp"));
		
		//회원 정보 수정
		lGFMemMyDAO.updateMemInf(emfMap);
			
		EmfMap tmpMap = lGBMemJoinService.selectMemInf(emfMap);
		
		if(tmpMap.get("info") != null)
    	{
			EmfMap memInfo = (EmfMap) tmpMap.get("info");
			
			lgnMap.put("email", memInfo.getString("email"));
			lgnMap.put("hp", memInfo.getString("hp"));
			lgnMap.put("tel", memInfo.getString("tel"));
			lgnMap.put("zipcd", memInfo.getString("zipcd"));
			lgnMap.put("adr", memInfo.getString("adr"));
			lgnMap.put("adrDtl", memInfo.getString("adrDtl"));
			
			RequestContextHolder.getRequestAttributes().setAttribute("userLgnMap", lgnMap, RequestAttributes.SCOPE_SESSION);
    	}
		
		try
		{
			String marketingYn = "";
			if (emfMap.getString("marketingYn") == null || emfMap.getString("marketingYn") == "")
				marketingYn = "N";
			else
				marketingYn = emfMap.getString("marketingYn");

			ssoService.update(lgnMap.getString("integrationId")
								, lgnMap.getString("ci")
								, clientIp
								, lgnMap.getString("name")
								, emfMap.getString("email")
								, emfMap.getString("tel")
								, emfMap.getString("hp")
								, emfMap.getString("zipcd")
								, emfMap.getString("adr")
								, emfMap.getString("adrDtl")
								,marketingYn);
		}
		catch (SsoException ex)
		{
    		throw new Exception("통합회원 정보 업데이트에 실패했습니다.");
		}
	}
}
