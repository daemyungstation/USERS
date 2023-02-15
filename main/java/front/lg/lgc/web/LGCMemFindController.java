package front.lg.lgc.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import front.ml.mlh.service.MLHMemDrotService;
import front.ml.mlh.service.dao.MLHMemDrotDAO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovNetworkState;
import egovframework.com.utl.sim.service.SeedCipher;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.lg.lgb.service.LGBMemJoinService;
import front.lg.lgb.service.dao.LGBMemJoinDAO;
import front.lg.sso.exception.SsoException;
import front.lg.sso.service.SSOService;

import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * <pre> 
 * 아이디, 비밀번호 찾기를 위한 Controller
 * </pre>
 * 
 * @ClassName		: LGCMemFindController.java
 * @Description		: 아이디, 비밀번호 찾기를 위한 Controller
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
@Controller
@RequestMapping("/member")
public class LGCMemFindController extends EmfController {
	
	@Resource(name="lGBMemJoinService")
    private LGBMemJoinService lGBMemJoinService;

	@Resource(name="mLHMemDrotService")
    private MLHMemDrotService mlhMemDrotService;

	@Resource(name = "ssoService")
	private SSOService ssoService;

	@Resource(name = "mLHMemDrotDAO")
	private MLHMemDrotDAO mLHMemDrotDAO;

	@Resource(name="lGBMemJoinDAO")
	private LGBMemJoinDAO lGBMemJoinDAO;

	/**
	 * 아이디 찾기 화면
	 *
 	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/findid/index.do")
	public String getFindIdView(EmfMap emfMap, ModelMap modelMap) throws Exception {
		return "front/lg/lgc/LGCMemFindId.front";
	}

	/**
	 * 본인 인증 결과 처리(아이디조회)
	 *
 	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/findid/complete.do")
	public String selectFindId(EmfMap emfMap, ModelMap modelMap) throws Exception {
		String url = "error/blank.error";
		try{
			EmfMap authMap = (EmfMap)EgovUserDetailsHelper.getIndividualInfAuth();	// 본인인증 후 넘어온 값
			
			if(authMap != null){
				emfMap.put("check", "ci");
				emfMap.put("ci", authMap.getString("ci"));

//				System.out.print("휴대폰 인증 결과 파라미터 :: ");
//				System.out.println(authMap);

				/* 기존 일반 회원용
				emfMap = lGBMemJoinService.selectMemInf(emfMap);
				emfMap = (EmfMap)emfMap.get("info");

				if(emfMap != null){
					modelMap.addAttribute("id", emfMap.getString("id"));
					url = "front/lg/lgc/LGCMemFindIdComplete.front";
				}else{
					modelMap.addAttribute("msg", "해당 정보로 가입된 정보가 없습니다.");
					modelMap.addAttribute("url", "/member/findid/index.do");
				}
				*/

				// 회원몰 탈퇴 회원 조회 후, 홈페이지 회원 탈퇴 처리
				mlhMemDrotService.selectIntegrationDeleteMemberInfo(authMap.getString("ci"));

				// 통합 회원 조회
				List<EmfMap> integrationMemberList = lGBMemJoinService.selectIntegrationMemberInfo(authMap.getString("ci"), null);

				if (integrationMemberList != null && !integrationMemberList.isEmpty()) {
					if (integrationMemberList.size() == 1) {
						// ci로 조회된 아이디 또는 통합 아이디가 1개 일때
						// integrationId, homepageId, ci, homepageJoinDate, integrationDate
						EmfMap memberInfo = integrationMemberList.get(0);
//						System.out.print("memberInfo :: ");
//						System.out.println(memberInfo);
						if (memberInfo.get("integrationId") != null && memberInfo.get("integrationId") != "") {
							// 통합 회원 존재
							modelMap.addAttribute("id", memberInfo.get("integrationId"));
							url = "front/lg/lgc/LGCMemFindIdComplete.front";
						} else if (memberInfo.get("integrationId") == null && memberInfo.get("homepageId") != null) {
							// 홈페이지 회원만 존재
							modelMap.addAttribute("id", memberInfo.get("homepageId"));
							url = "front/lg/lgc/LGCMemFindIdComplete.front";
						} else {
							// 회원몰 회원만 존재이게찌.
							modelMap.addAttribute("msg", "해당 정보로 가입된 정보가 없습니다.");
							modelMap.addAttribute("url", "/member/findid/index.do");
						}
					} else {
						// TODO ci로 조회된 아이디 또는 통합 아이디가 여러개 일때
						modelMap.addAttribute("msg", "해당 정보로 가입된 정보가 여러개입니다.");
						modelMap.addAttribute("url", "/member/findid/index.do");
					}
				} else {
					// ci로 조회된 정보가 없을 때
					modelMap.addAttribute("msg", "해당 정보로 가입된 정보가 없습니다.");
					modelMap.addAttribute("url", "/member/findid/index.do");
				}

				RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);				
			} else {
				url = "redirect:/member/findid/index.do";
			}

		} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			throw new EmfException(he.getMessage());
		} 
		
		return url;		
	}

	/**
	 * 본인 인증 결과 처리(아이디조회) - SSO
	 *
 	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/findid/complete_sso.do")
	public String selectFindIdSso(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		String url = "error/blank.error";
		try
		{
			EmfMap authMap = (EmfMap)EgovUserDetailsHelper.getIndividualInfAuth();	// 본인인증 후 넘어온 값
			if (authMap != null)
			{
				emfMap.put("check", "ci");
				emfMap.put("ci", authMap.getString("ci"));

//				System.out.print("휴대폰 인증 결과 파라미터 :: ");
//				System.out.println(authMap);

				String clientIp = EgovNetworkState.getMyIPaddress(request);

				HashMap ssoMemberInfo = null;
				try
				{
					ssoMemberInfo = ssoService.find(null, null, authMap.getString("ci"), clientIp);
				}
				catch (SsoException ex)
				{
					modelMap.addAttribute("msg", "에러가 발생하였습니다.(" + ex.getMessage() + ")");
					modelMap.addAttribute("url", "/findid/index.do");
					RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
					return url;
				}

				if (ssoMemberInfo != null) //SSO 회원 존재
				{
					if (ssoMemberInfo.get("id") == null || "".equals((String)ssoMemberInfo.get("id")))
						throw new EmfException("비정상적인 통합 아이디 : id값이 없음");

					if (ssoMemberInfo.get("ci") == null || "".equals((String)ssoMemberInfo.get("ci")))
						throw new EmfException("비정상적인 통합 아이디 : ci값이 없음");

					modelMap.addAttribute("id", ssoMemberInfo.get("id"));
					url = "front/lg/lgc/LGCMemFindIdComplete.front";
				}
				else // 기존 일반 회원 확인
				{
					EmfMap infoMap = new EmfMap();
					infoMap.put("ci", (String)authMap.getString("ci"));
					EmfMap homepageMemberInfo = lGBMemJoinDAO.selectMemInfFromMemAndQscnMem(infoMap);
					if(homepageMemberInfo != null) // 기존 일반 회원
					{
						// SSO 회원이 아니면 탈퇴한 회원인지 조회 (타 사이트에서 탈퇴를 진행한 경우 홈페이지디비 회원도 탈퇴 진행을 해야한다.)
						List<HashMap> ssoDropMemberInfo = null;
						try
						{
							ssoDropMemberInfo = ssoService.findDrop(null, null, (String)authMap.getString("ci"), clientIp);
						}
						catch (SsoException ex)
						{
							modelMap.put("msg", "에러가 발생하였습니다.(" + ex.getMessage() + ")");
							modelMap.put("url", "/member/findid/index.do");
							RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
							return url;
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

							modelMap.addAttribute("msg", "해당 정보로 가입된 정보가 없습니다.");
							modelMap.addAttribute("url", "/member/findid/index.do");
						}
						else
						{
							modelMap.addAttribute("id", homepageMemberInfo.getString("id"));
							url = "front/lg/lgc/LGCMemFindIdComplete.front";
						}
					}
					else
					{
						modelMap.addAttribute("msg", "해당 정보로 가입된 정보가 없습니다.");
						modelMap.addAttribute("url", "/member/findid/index.do");
					}
				}
			}
			else
			{
				modelMap.addAttribute("msg", "인증 정보가 잘못되었습니다.");
				modelMap.addAttribute("url", "/member/findid/index.do");
			}

			RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);				
		}
		catch (Exception he)
		{
			if (log.isDebugEnabled()) log.debug(he);

			RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);				
			throw new EmfException(he.getMessage());
		} 
		
		return url;		
	}
	
	/**
	 * 비밀번호 찾기 화면
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/findpass/index.do")
	public String getFindPassView(EmfMap emfMap, ModelMap modelMap) throws Exception {
		return "front/lg/lgc/LGCMemFindPass.front";
	}

	/**
	 * 본인 인증 결과 처리(비밀번호 찾기)
	 *
 	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/findpass/change.do")
	public String selectFindPass(EmfMap emfMap, ModelMap modelMap) throws Exception {
		String url = "error/blank.error";
		try {
			EmfMap authMap = (EmfMap)EgovUserDetailsHelper.getIndividualInfAuth();	// 본인인증 후 넘어온 값
			
			if (authMap != null) {
				/* 일반회원용
				emfMap.put("check", "ci");
				emfMap.put("ci", authMap.getString("ci"));
				emfMap = lGBMemJoinService.selectMemInf(emfMap);
				emfMap = (EmfMap)emfMap.get("info");
				*/

				// 회원몰 탈퇴 회원 조회 후, 홈페이지 회원 탈퇴 처리
				mlhMemDrotService.selectIntegrationDeleteMemberInfo(authMap.getString("ci"));

				// 통합 회원 조회
				List<EmfMap> integrationMemberList = lGBMemJoinService.selectIntegrationMemberInfo(authMap.getString("ci"), null);

				if (integrationMemberList != null && !integrationMemberList.isEmpty()) {
					if (integrationMemberList.size() == 1) {
						// ci로 조회된 아이디 또는 통합 아이디가 1개 일때
						// integrationId, homepageId, ci, homepageJoinDate, integrationDate
						EmfMap memberInfo = integrationMemberList.get(0);

						if (memberInfo.get("integrationId") != null) {
							// 통합 회원 존재
							RequestContextHolder.getRequestAttributes().setAttribute("accountType", "INTEGRATION", RequestAttributes.SCOPE_SESSION);
							RequestContextHolder.getRequestAttributes().setAttribute("id", memberInfo.get("integrationId"), RequestAttributes.SCOPE_SESSION);
							RequestContextHolder.getRequestAttributes().setAttribute("CI", authMap.getString("ci"), RequestAttributes.SCOPE_SESSION);
							url = "front/lg/lgc/LGCMemFindPassChange.front";
						} else if (memberInfo.get("integrationId") == null && memberInfo.get("homepageId") != null) {
							// 홈페이지 회원만 존재
							RequestContextHolder.getRequestAttributes().setAttribute("accountType", "HOMEPAGE", RequestAttributes.SCOPE_SESSION);
							RequestContextHolder.getRequestAttributes().setAttribute("id", memberInfo.get("homepageId"), RequestAttributes.SCOPE_SESSION);
							RequestContextHolder.getRequestAttributes().setAttribute("CI", authMap.getString("ci"), RequestAttributes.SCOPE_SESSION);
							url = "front/lg/lgc/LGCMemFindPassChange.front";
						} else {
							// 회원몰 회원만 존재이게찌.
							modelMap.addAttribute("msg", "해당 정보로 가입된 정보가 없습니다.");
							modelMap.addAttribute("url", "/member/findid/index.do");
						}
					} else {
						// TODO ci로 조회된 아이디 또는 통합 아이디가 여러개 일때
						modelMap.addAttribute("msg", "해당 정보로 가입된 정보가 여러개입니다.");
						modelMap.addAttribute("url", "/member/findpass/index.do");
					}
				} else {
					// ci로 조회된 정보가 없을 때
					modelMap.addAttribute("msg", "해당 정보로 가입된 정보가 없습니다.");
					modelMap.addAttribute("url", "/member/findpass/index.do");
				}

				/*
				if(emfMap != null){
					RequestContextHolder.getRequestAttributes().setAttribute("CI", authMap.getString("ci"), RequestAttributes.SCOPE_SESSION);					
					url = "front/lg/lgc/LGCMemFindPassChange.front";				
				}else{
					modelMap.addAttribute("msg", "해당 정보로 가입된 정보가 없습니다.");
					modelMap.addAttribute("url", "/member/findpass/index.do");
				}
				*/
				
				RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
			} else {
				url = "redirect:/member/findpass/index.do";
			}

		} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			throw new EmfException(he.getMessage());
		} 
		return url;
	}

	/**
	 * 본인 인증 결과 처리(비밀번호 찾기) - SSO
	 *
 	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/findpass/change_sso.do")
	public String selectFindPassSso(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		String url = "error/blank.error";
		try
		{
			EmfMap authMap = (EmfMap)EgovUserDetailsHelper.getIndividualInfAuth();	// 본인인증 후 넘어온 값
			if (authMap != null) // 본인 인증 성공
			{
				emfMap.put("check", "ci");
				emfMap.put("ci", authMap.getString("ci"));

				String clientIp = EgovNetworkState.getMyIPaddress(request);

				HashMap ssoMemberInfo = null;
				try
				{
					ssoMemberInfo = ssoService.find(null, null, authMap.getString("ci"), clientIp);
				}
				catch (SsoException ex)
				{
					modelMap.addAttribute("msg", "에러가 발생하였습니다.(" + ex.getMessage() + ")");
					modelMap.addAttribute("url", "/findpass/index.do");
					RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
					return url;
				}

				if (ssoMemberInfo != null) //SSO 회원 존재
				{
					if (ssoMemberInfo.get("id") == null || "".equals((String)ssoMemberInfo.get("id")))
						throw new EmfException("비정상적인 통합 아이디 : id값이 없음");

					if (ssoMemberInfo.get("ci") == null || "".equals((String)ssoMemberInfo.get("ci")))
						throw new EmfException("비정상적인 통합 아이디 : ci값이 없음");

					RequestContextHolder.getRequestAttributes().setAttribute("accountType", "INTEGRATION", RequestAttributes.SCOPE_SESSION);
					RequestContextHolder.getRequestAttributes().setAttribute("id", ssoMemberInfo.get("id"), RequestAttributes.SCOPE_SESSION);
					RequestContextHolder.getRequestAttributes().setAttribute("CI", ssoMemberInfo.get("ci"), RequestAttributes.SCOPE_SESSION);
					url = "front/lg/lgc/LGCMemFindPassChange.front";
				}
				else // 기존 일반 회원 확인
				{
					EmfMap infoMap = new EmfMap();
					infoMap.put("ci", (String)authMap.getString("ci"));
					EmfMap homepageMemberInfo = lGBMemJoinDAO.selectMemInfFromMemAndQscnMem(infoMap);
					if(homepageMemberInfo != null) // 기존 일반 회원
					{
						// SSO 회원이 아니면 탈퇴한 회원인지 조회 (타 사이트에서 탈퇴를 진행한 경우 홈페이지디비 회원도 탈퇴 진행을 해야한다.)
						List<HashMap> ssoDropMemberInfo = null;
						try
						{
							ssoDropMemberInfo = ssoService.findDrop(null, null, authMap.getString("ci"), clientIp);
						}
						catch (SsoException ex)
						{
							modelMap.put("msg", "에러가 발생하였습니다.(" + ex.getMessage() + ")");
							modelMap.put("url", "/member/findpass/index.do");
							RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
							return url;
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

							modelMap.addAttribute("msg", "해당 정보로 가입된 정보가 없습니다.");
							modelMap.addAttribute("url", "/member/findpass/index.do");
						}
						else
						{
							RequestContextHolder.getRequestAttributes().setAttribute("accountType", "HOMEPAGE", RequestAttributes.SCOPE_SESSION);
							RequestContextHolder.getRequestAttributes().setAttribute("id", homepageMemberInfo.getString("id"), RequestAttributes.SCOPE_SESSION);
							RequestContextHolder.getRequestAttributes().setAttribute("CI", homepageMemberInfo.getString("ci"), RequestAttributes.SCOPE_SESSION);
							url = "front/lg/lgc/LGCMemFindPassChange.front";
						}
					}
					else
					{
						modelMap.addAttribute("msg", "해당 정보로 가입된 정보가 없습니다.");
						modelMap.addAttribute("url", "/member/findpass/index.do");
					}
				}
				RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
			}
			else // 본인인증 실패
			{
				modelMap.addAttribute("msg", "인증 정보가 잘못되었습니다.");
				modelMap.addAttribute("url", "/member/findpass/index.do");
			}
		}
		catch (Exception he)
		{
			if (log.isDebugEnabled()) log.debug(he);
			RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
			throw new EmfException(he.getMessage());
		} 

		return url;
	}

	/**
	 * 비밀번호 변경
	 *
 	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/findpass/complete.do")
	public String updateFindPassChange(EmfMap emfMap, ModelMap modelMap) throws Exception {
		String url = "error/blank.error";
		try {
			
			//2020년 취약점 점검 사항 수정
			Pattern p = Pattern.compile("^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{6,16}$");
			Matcher m = p.matcher(emfMap.getString("pwd"));
			if (m.find() == false) {
				modelMap.addAttribute("msg", "패스워드 입력값이 올바르지 않습니다. 비밀번호는 영문 대/소문자, 숫자, 특수문자(!@#$%^&*+=)를 조합하여 6~16자로 입력합니다.");
				modelMap.addAttribute("url", "/member/findpass/index.do");
			} else {
				String ci = (String) RequestContextHolder.getRequestAttributes().getAttribute("CI", RequestAttributes.SCOPE_SESSION);
				String accountType = (String) RequestContextHolder.getRequestAttributes().getAttribute("accountType", RequestAttributes.SCOPE_SESSION);
				emfMap.put("ci", ci);
				if ("INTEGRATION".equals(accountType)) {
					// 통합 회원
					lGBMemJoinService.updateIntegrationMemPwdInf(emfMap);
				} else {
					// 홈페이지 회원
					lGBMemJoinService.updateMemPwdInf(emfMap);
				}
				modelMap.addAttribute("msg", "비밀번호가 변경되었습니다.");
				modelMap.addAttribute("url", "/main/index.do");				
			}
			
		} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			throw new EmfException(he.getMessage());
		} 
		return url;
	}		

	/**
	 * 비밀번호 변경 - SSO
	 *
 	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/findpass/complete_sso.do")
	public String updateFindPassChangeSso(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		String url = "error/blank.error";
		try
		{
			
			//2020년 취약점 점검 사항 수정
			Pattern p = Pattern.compile("^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{6,16}$");
			Matcher m = p.matcher(emfMap.getString("pwd"));
			if (m.find() == false) {
				modelMap.addAttribute("msg", "패스워드 입력값이 올바르지 않습니다. 비밀번호는 영문 대/소문자, 숫자, 특수문자(!@#$%^&*+=)를 조합하여 6~16자로 입력합니다.");
				modelMap.addAttribute("url", "/member/findpass/index.do");
			} else {
				String id = (String) RequestContextHolder.getRequestAttributes().getAttribute("id", RequestAttributes.SCOPE_SESSION);
				String ci = (String) RequestContextHolder.getRequestAttributes().getAttribute("CI", RequestAttributes.SCOPE_SESSION);
				String accountType = (String) RequestContextHolder.getRequestAttributes().getAttribute("accountType", RequestAttributes.SCOPE_SESSION);
				String clientIp = EgovNetworkState.getMyIPaddress(request);

				emfMap.put("ci", ci);
				if ("INTEGRATION".equals(accountType)) // sso 회원
				{
					String pwd = SeedCipher.oneencrypt(emfMap.getString("pwd"));		// 비밀번호 암호화
					ssoService.updatePassword(id, ci, null, null, pwd, clientIp);
				}
				else // 홈페이지 회원
				{
					lGBMemJoinService.updateMemPwdInf(emfMap);
				}

				modelMap.addAttribute("msg", "비밀번호가 변경되었습니다.");
				modelMap.addAttribute("url", "/main/index.do");						
			}
				
		}
		catch (Exception he)
		{
			if (log.isDebugEnabled()) log.debug(he);
			throw new EmfException(he.getMessage());
		} 

		return url;
	}		

}
