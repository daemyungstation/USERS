package front.lg.lgb.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import front.lg.lga.service.LGAMemLoginService;
import front.lg.lga.service.dao.LGAMemLoginDAO;
import front.ml.mlh.service.MLHMemDrotService;

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
import front.lg.lgb.service.LGBMemJoinService;

/**
 * <pre>
 * 회원 가입 위한 Controller
 * </pre>
 *
 * @author 김필기
 * @version 1.0
 * @ClassName        : LGBMemJoinController.java
 * @Description        : 회원 가입 위한 Controller
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.02		   김필기				  최초 생성
 * </pre>
 * @see
 * @since 2016.03.02
 */
@Controller
@RequestMapping("/member/join")
public class LGBMemJoinController extends EmfController {

    @Resource(name = "lGBMemJoinService")
    private LGBMemJoinService lGBMemJoinService;

    @Resource(name = "lGAMemLoginService")
    private LGAMemLoginService lgaMemLoginService;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "mLHMemDrotService")
    private MLHMemDrotService mlhMemDrotService;

	@Resource(name="lGAMemLoginDAO")
	private LGAMemLoginDAO lGAMemLoginDAO;


    private final String NECESSARY_INTEGRATION_MEMBER = "NECESSARY_INTEGRATION_MEMBER";
    private final String ALREADY_INTEGRATION_MEMBER = "ALREADY_INTEGRATION_MEMBER";
    private final String REGISTER_MEMBER = "REGISTER_MEMBER";
    private final String REGISTER_MEMBER_WITHOUT_MEMBER_MALL = "REGISTER_MEMBER_WITHOUT_MEMBER_MALL";

    /**
     * 회원가입(약관동의) 화면
     *
     * @param emfMap
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/agree.do")
    public String getAgreeView(EmfMap emfMap, ModelMap modelMap) throws Exception {
        return "front/lg/lgb/LGBMemJoinAgree.front";
    }

    @RequestMapping(value = "/integration/agree.do")
    public String getIntegrationAgreeView(EmfMap emfMap, ModelMap modelMap) throws Exception {
        modelMap.addAttribute("id", emfMap.getString("id"));
        return "front/lg/lgb/LGBIntegrationMemJoinAgree.front";
    }

    /**
     * 본인 인증 후 결과 처리
     *
     * @param emfMap
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/checkAuth.do")
    public String getPhoneAuthInf(EmfMap emfMap, ModelMap modelMap) throws Exception {
        String url = "error/blank.error";

        try {
            // 본인 인증 후 세션에 저장된 정보를 가져와서 세션에 저장한다.(이름, 생년월일)
			EmfMap authMap = (EmfMap)EgovUserDetailsHelper.getIndividualInfAuth();

			emfMap.put("ci", authMap.getString("ci"));			// 유저 고유값
			emfMap.put("name", authMap.getString("name"));		// 이름
			emfMap.put("birth", authMap.getString("birth"));	// 생년월일
			emfMap.put("sex", authMap.get("sex"));	// 생년월일
			// 현재 가입 여부 검사
//			emfMap.put("check", "ci");
//			emfMap = lGBMemJoinService.selectMemInf(emfMap);

//            System.out.print("휴대폰 인증 결과 파라미터 :: ");
//            System.out.println(authMap);

			String ci = authMap.getString("ci");

            // 회원몰 탈퇴 회원 조회 후, 홈페이지 회원 탈퇴 처리
            mlhMemDrotService.selectIntegrationDeleteMemberInfo(ci);

            String loginType = null;
            List<EmfMap> integrationMemberList = lGBMemJoinService.selectIntegrationMemberInfo(ci, null);

            if (integrationMemberList.size() > 1) {
                // TODO 중복회원 예외 처리

            } else if (integrationMemberList.size() == 1) {
                EmfMap integrationMember = integrationMemberList.get(0);
                if (integrationMember.get("integrationId") != null) {
                    // 통합회원 아이디 존재 (홈페이지 로그인 페이지)
                    loginType = ALREADY_INTEGRATION_MEMBER;
                    modelMap.addAttribute("msg", "이미 통합회원에 가입되어 있는 회원정보입니다. \\n 아이디 찾기를 통해 로그인 하세요.");
                    modelMap.addAttribute("url", "/member/login/Login.do");
                    RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);

                } else {
                    loginType = NECESSARY_INTEGRATION_MEMBER;
                    RequestContextHolder.getRequestAttributes().setAttribute("homepageId", integrationMember.get("homepageId"), RequestAttributes.SCOPE_SESSION);
                    RequestContextHolder.getRequestAttributes().setAttribute("homepageJoinDate", integrationMember.get("homepageJoinDate"), RequestAttributes.SCOPE_SESSION);
                    RequestContextHolder.getRequestAttributes().setAttribute("mallId", integrationMember.get("mallId"), RequestAttributes.SCOPE_SESSION);
                    RequestContextHolder.getRequestAttributes().setAttribute("mallJoinDate", integrationMember.get("mallJoinDate"), RequestAttributes.SCOPE_SESSION);
                    RequestContextHolder.getRequestAttributes().setAttribute("memberId", integrationMember.get("memberId"), RequestAttributes.SCOPE_SESSION);
                    url = "front/lg/lgb/LGBMemJoinComplete.front";
                }
            } else {
                // 통합 회원, 홈페이지 회원, 회원몰 회원이 아니거나 통합 회원 또는 홈페이지 회원 탈퇴를 한 경우. (회원가입)
                // 상조회원 DB 조회
                List<EmfMap> funeralMemberList = lGBMemJoinService.selectFuneralMemberInfo(ci);
                if (funeralMemberList == null || funeralMemberList.isEmpty()) {
                    // 회원몰 서비스 이용불가 안내
                    loginType = REGISTER_MEMBER_WITHOUT_MEMBER_MALL;
                } else {
                    loginType = REGISTER_MEMBER;
                }
                url = "redirect:/member/join/write.do";
            }

            RequestContextHolder.getRequestAttributes().setAttribute("loginType", loginType, RequestAttributes.SCOPE_SESSION);


//			if (emfMap.get("info") != null) {
//				modelMap.addAttribute("msg", "이미 가입되어 있는 회원정보입니다.\\n아이디 찾기를 통해 로그인 하세요.");
//				modelMap.addAttribute("url", "/member/join/agree.do");
//				RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
//			} else {
//				url = "redirect:/member/join/write.do";
//			}

        } catch (Exception he) {
            if (log.isDebugEnabled()) log.debug(he);
            throw new EmfException(he.getMessage());
        }

        return url;
    }

    /**
     * 본인 인증 후 결과 처리(SSO)
     *
     * @param emfMap
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/checkAuth_sso.do")
    public String getCheckAuthSso(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
        String url = "error/blank.error";

        try {
            EmfMap resultMap = lGBMemJoinService.getCheckAuth(emfMap, request);
            modelMap.addAttribute("msg", resultMap.get("msg"));
            modelMap.addAttribute("url", resultMap.get("url"));
//            url = (String) resultMap.get("url");

        } catch (Exception e) {
            if (log.isDebugEnabled()) log.debug(e);
            throw new EmfException(e.getMessage());
        }

        return url;
    }

    /**
     * 회원 정보 작성화면
     *
     * @param emfMap 검색할 데이터
     * @return String View URL
     * @throws Exception 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    @RequestMapping(value = "/write.do")
    public String getMemInfWrite(EmfMap emfMap, ModelMap modelMap) throws Exception {
        String url;
        try {
            // 본인 인증 후 세션에 저장된 정보를 가져온다(이름, 생년월일)
			EmfMap authMap = (EmfMap) EgovUserDetailsHelper.getIndividualInfAuth();

			if (authMap == null) {
                url = "redirect:/member/join/agree.do";
            } else {
                modelMap.put("authInf", authMap);
                url = "front/lg/lgb/LGBMemJoinWrite.front";
            }

            //공통코드 배열 셋팅
            ArrayList<String> cdDtlList = new ArrayList<String>();
            //회원 - 가입경로
            cdDtlList.add("JOIN_PATH_GB");
            //회원 - 관심정보
            cdDtlList.add("INTR_GB");
            //회원 - 선호정보
            cdDtlList.add("PFRN_GB");
            //정의된 코드id값들의 상세 코드 맵 반환
            modelMap.put("cdDtlList", cmmUseService.selectCmmCodeBindAll(cdDtlList));
            
//            System.out.println(modelMap);
            
        } catch (Exception he) {
            if (log.isDebugEnabled()) log.debug(he);
            throw new EmfException(he.getMessage());
        }

        return url;
    }

    /**
     * 회원 정보 저장한다.
     *
     * @param emfMap
     * @param request
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST)
    public String insertMemInf(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception {
        String url = "";
        try {
            // 본인 인증 후 세션에 저장된 정보를 가져온다(이름, 생년월일)
            EmfMap authMap = (EmfMap) EgovUserDetailsHelper.getIndividualInfAuth();
            if (authMap == null) {
                url = "redirect:/member/join/agree.do";
            } else {
                RequestContextHolder.getRequestAttributes().setAttribute("loginType", null, RequestAttributes.SCOPE_SESSION);
                url = "redirect:/member/join/complete.do";
                lGBMemJoinService.insertMemInf(emfMap, request);
                // 가입 완료시 본인인증 정보 세션에서 삭제
                RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
            }
        } catch (Exception he) {
            if (log.isDebugEnabled()) log.debug(he);
            throw new EmfException(he.getMessage());
        }
        return url;
    }

    /**
     * 회원 정보 저장한다. - SSO
     *
     * @param emfMap
     * @param request
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insert_sso.do", method = RequestMethod.POST)
    public String insertMemInfSso(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception {
        String url = "error/blank.error";
        try {
            // 본인 인증 후 세션에 저장된 정보를 가져온다(이름, 생년월일)
            EmfMap authMap = (EmfMap) EgovUserDetailsHelper.getIndividualInfAuth();
            if (authMap == null) {
                url = "redirect:/member/join/agree.do";
            } else {
                RequestContextHolder.getRequestAttributes().setAttribute("loginType", null, RequestAttributes.SCOPE_SESSION);
                lGBMemJoinService.insertMemInfSso(emfMap, request);
                url = "redirect:/member/join/complete.do";
                // 가입 완료시 본인인증 정보 세션에서 삭제
                RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
            }
        } catch (Exception he) {
            if (log.isDebugEnabled()) log.debug(he);
            modelMap.addAttribute("msg", he.getMessage());
            modelMap.addAttribute("url", "/member/login/Login.do");
            //throw new EmfException(he.getMessage());
        }
        return url;
    }

    /**
     * 회원 가입 완료
     *
     * @param emfMap
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/complete.do")
    public String getCompleteView(EmfMap emfMap, ModelMap modelMap) throws Exception {
        return "front/lg/lgb/LGBMemJoinComplete.front";
    }

    /**
     * 통합 회원 전환 완료
     *
     * @param emfMap
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/integration/complete.do")
    public String getIntegrationCompleteView(EmfMap emfMap, ModelMap modelMap) throws Exception {
        modelMap.put("id", emfMap.getString("id"));
        modelMap.put("regDate", emfMap.getString("regDate"));
        
//        System.out.println(modelMap);
        
        return "front/lg/lgb/LGBIntegrationMemJoinComplete.front";
    }

    /**
     * 통합 회원 전환 ID 선택
     *
     * @param emfMap
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/integration/id.do")
    public String getIntegrationIdsView(EmfMap emfMap, ModelMap modelMap) throws Exception {
//        System.out.print("/integration/id.do :: ");
//        System.out.println(emfMap);
        String ci = emfMap.get("ci") != null ? emfMap.getString("ci") : null;
        String id = emfMap.get("id") != null ? emfMap.getString("id") : null;
        // CI, ID로 조회한 값은 유일
        List<EmfMap> integrationMemberInfo = lGBMemJoinService.selectIntegrationMemberInfo(ci, id);
        if (integrationMemberInfo.size() == 1) {
//			ID, INTEGRATION_ID, INTEGRATION_PW, HOMEPAGE_ID, MALL_ID, MEMBER_ID, CI, HOMEPAGE_ONLINE_YN, HOMEPAGE_JOIN_DATE, MALL_JOIN_DATE, SECESSION_DATE, SECESSION_DELETE_DIV
            EmfMap member = integrationMemberInfo.get(0);
//            System.out.println(member);
            Map<String, Object> availableAccount = lGBMemJoinService.checkAvailableAccount(member);
            modelMap.addAttribute("availableAccount", availableAccount);
            modelMap.addAttribute("unqNo", member.get("memberId"));
            modelMap.addAttribute("ci", member.get("ci"));
//            System.out.println(modelMap);
        } else if (integrationMemberInfo.size() > 1) {
            // 혹시 중복값이 있다면 예외처리
        } else {
            // 조회된 값이 없다면 예외 처리
        }
        return "front/lg/lgb/LGBIntegrationMemJoinId.front";
    }

    /**
     * 통합 회원 전환 ID 선택 - SSO
     *
     * @param emfMap
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/integration/id_sso.do")
    public String getIntegrationIdsViewSso(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
//        System.out.print("/integration/id_sso.do :: ");
//        System.out.println(emfMap);
        String ci = emfMap.get("ci") != null ? emfMap.getString("ci") : null;
        String id = emfMap.get("id") != null ? emfMap.getString("id") : null;

        // CI, ID로 조회한 값은 유일
        ModelAndView mav = new ModelAndView();
        emfMap.put("loginId", emfMap.get("id"));
        emfMap.put("integrationId", emfMap.get("id"));
        Map<String, Object> availableAccount = lGBMemJoinService.checkAvailableAccountSso(emfMap, request);
        modelMap.addAttribute("availableAccount", availableAccount);

        return "front/lg/lgb/LGBIntegrationMemJoinId.front";
    }

    /**
     * 통합 아이디 중복 체크
     *
     * @param emfMap
     * @return
     */
    @RequestMapping(value = "/integration/checkDuplicateId.ajax")
    public ModelAndView checkDuplicateId(EmfMap emfMap) {
        ModelAndView mav = new ModelAndView();
        Map<String, Object> availableAccount = lGBMemJoinService.checkAvailableAccount(emfMap);
        Map<String, String> map = (Map) availableAccount.get("INTEGRATION");
        mav.setViewName("jsonView");
        mav.addObject("availableFlag", map.get("availableFlag"));
        return mav;
    }

    /**
     * 통합 아이디 중복 체크 - SSO
     *
     * @param emfMap
     * @return
     */
    @RequestMapping(value = "/integration/checkDuplicateId_sso.ajax")
    public ModelAndView checkDuplicateIdSso(EmfMap emfMap, HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView();
        Map<String, Object> availableAccount = lGBMemJoinService.checkAvailableAccountSso(emfMap, request);
        Map<String, String> map = (Map) availableAccount.get("INTEGRATION");
        mav.setViewName("jsonView");
        mav.addObject("availableFlag", map.get("availableFlag"));
        return mav;
    }

    /**
     * 통합 회원 정보 작성 화면
     *
     * @param emfMap
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/integration/write.do")
    public String getIntegrationWriteView(EmfMap emfMap, ModelMap modelMap) throws Exception {
        String url;
        try {
            // 본인 인증 후 세션에 저장된 정보를 가져온다(이름, 생년월일)
//			통합인증 테스트
//			EmfMap authMap = (EmfMap) EgovUserDetailsHelper.getIndividualInfAuth();
            modelMap.put("integrationId", emfMap.get("integrationId"));

            String homepageId = (String) emfMap.get("homepageId");
            EmfMap authMap = new EmfMap();
            EmfMap loginMem = lgaMemLoginService.getHomepageMemberInfo(null, homepageId, null);

            authMap.putAll(loginMem);

            if (authMap == null) {
                url = "redirect:/member/join/integration/agree.do";
            } else {
                modelMap.put("authInf", authMap);
                url = "front/lg/lgb/LGBIntegrationMemJoinWrite.front";
            }

            //공통코드 배열 셋팅
            ArrayList<String> cdDtlList = new ArrayList<String>();
            //회원 - 가입경로
            cdDtlList.add("JOIN_PATH_GB");
            //회원 - 관심정보
            cdDtlList.add("INTR_GB");
            //회원 - 선호정보
            cdDtlList.add("PFRN_GB");
            //정의된 코드id값들의 상세 코드 맵 반환
            modelMap.put("cdDtlList", cmmUseService.selectCmmCodeBindAll(cdDtlList));
//            System.out.println(modelMap);
        } catch (Exception he) {
            if (log.isDebugEnabled()) log.debug(he);
            throw new EmfException(he.getMessage());
        }
        return url;
    }

    /**
     * 통합 회원 정보 저장
     *
     * @param emfMap
     * @param request
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/integration/insert.do", method = RequestMethod.POST)
    public String setIntegrationMemInf(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception {
        String url = "";
        try {
            url = "redirect:/member/join/integration/complete.do";
            lGBMemJoinService.updateIntegrationMemInf(emfMap, request);

            modelMap.put("id", emfMap.get("integrationId"));
            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            modelMap.put("regDate", dateFormat.format(date));
            // 가입 완료시 본인인증 정보 세션에서 삭제
//			RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
        } catch (Exception he) {
            if (log.isDebugEnabled()) log.debug(he);
            throw new EmfException(he.getMessage());
        }
        return url;
    }

    /**
     * 통합 회원 정보 저장 - SSO
     *
     * @param emfMap
     * @param request
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/integration/insert_sso.do", method = RequestMethod.POST)
    public String setIntegrationMemInfSso(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception {
        String url = "";
        try {
            url = "redirect:/member/join/integration/complete.do";
            lGBMemJoinService.updateIntegrationMemInfSso(emfMap, request);

            modelMap.put("id", emfMap.get("integrationId"));
            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            modelMap.put("regDate", dateFormat.format(date));
            // 가입 완료시 본인인증 정보 세션에서 삭제
//			RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
        } catch (Exception he) {
            if (log.isDebugEnabled()) log.debug(he);
            throw new EmfException(he.getMessage());
        }
        return url;
    }

    /**
     * 아이디 / 이메일 중복 검사
     *
     * @param emfMap
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/overapCheck.ajax", method = RequestMethod.POST)
    public ModelAndView selectOverapCheck(EmfMap emfMap, ModelMap modelMap) throws Exception {
        ModelAndView mav = new ModelAndView();
        try {
//            System.out.print("selectOverapCheck :: ");
//            System.out.println(emfMap);
            mav.addObject("check", lGBMemJoinService.selectMemInf(emfMap));
            mav.setViewName("jsonView");
        } catch (Exception he) {
            if (log.isDebugEnabled()) log.debug(he);
            throw new EmfException(he.getMessage());
        }
        return mav;
    }

    /**
     * 통합회원 이메일 중복 체크
     *
     * @param emfMap
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/checkIntegrationEmail.ajax", method = RequestMethod.POST)
    public ModelAndView checkIntegrationEmail(EmfMap emfMap, ModelMap modelMap) throws Exception {
        ModelAndView mav = new ModelAndView();
        try {
            mav.addObject("checkDuplicateEmailFlag",
                    (lGBMemJoinService.checkIntegrationEmail(emfMap) > 0) ? false : true);
            mav.setViewName("jsonView");
        } catch (Exception he) {
            if (log.isDebugEnabled()) log.debug(he);
            throw new EmfException(he.getMessage());
        }
        return mav;
    }

}
