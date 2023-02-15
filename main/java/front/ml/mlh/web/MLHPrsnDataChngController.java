package front.ml.mlh.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.ml.mlh.service.MLHPrsnDataChngService;

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
@RequestMapping("/my-lifeway/member/personal-data-change")
public class MLHPrsnDataChngController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="mLHPrsnDataChngService")
    private MLHPrsnDataChngService mLHPrsnDataChngService;

	/**
	 * 비밀번호 확인 페이지.
	 *
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/index.do")
	public String getPwdChkWritePage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ml/mlh/MLHPwdChkWrite.front";
	}

	/**
	 * 회원정보를 조회한다.
	 *
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String selectMemInf(EmfMap emfMap, ModelMap modelMap) throws Exception {
		String url = "error/blank.error";
		try {
			EmfMap rtnMap = mLHPrsnDataChngService.selectMemInf(emfMap);
			modelMap.addAttribute("rtnMap", rtnMap);
			url = "front/ml/mlh/MLHPrsnDataChngWrite.front";
		} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			if ("비밀번호오류".equals(EgovStringUtil.nullConvert(he.getMessage()))) {
				modelMap.addAttribute("msg", "비밀번호를 정확하게 입력해주세요.");
				modelMap.addAttribute("url", "/my-lifeway/member/personal-data-change/index.do");
			} else {
				throw new EmfException(he.getMessage());
			}
		} 
		return url;
	}

	@RequestMapping(value="/write_sso.do", method=RequestMethod.POST)
	public String selectMemInfSso(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception {
		String url = "error/blank.error";
		try {
			EmfMap rtnMap = mLHPrsnDataChngService.selectMemInfSso(emfMap, request);		
			modelMap.addAttribute("rtnMap", rtnMap);
			url = "front/ml/mlh/MLHPrsnDataChngWrite.front";
		} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			if ("비밀번호오류".equals(EgovStringUtil.nullConvert(he.getMessage()))) {
				modelMap.addAttribute("msg", "비밀번호를 정확하게 입력해주세요.");
				modelMap.addAttribute("url", "/my-lifeway/member/personal-data-change/index.do");
			} else {
				throw new EmfException(he.getMessage());
			}
		} 
		return url;
	}

	/**
	 * 회원정보를 수정한다.
	 *
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String updateMemInf(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		String url = "error/blank.error";
		
		try
		{
			mLHPrsnDataChngService.updateMemInf(emfMap);
			
			modelMap.addAttribute("msg", "회원정보 변경이 완료되었습니다.");
			modelMap.addAttribute("url", "/my-lifeway/join-product-information/join-details/index.do");
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
	 * 회원정보를 수정한다. - SSO
	 *
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/update_sso.do", method=RequestMethod.POST)
	public String updateMemInfSso(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception
	{
		String url = "error/blank.error";
		
		try
		{
			mLHPrsnDataChngService.updateMemInfSso(emfMap, request);
			
			modelMap.addAttribute("msg", "회원정보 변경이 완료되었습니다.");
			modelMap.addAttribute("url", "/my-lifeway/join-product-information/join-details/index.do");
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
	 * 개명신청 안내 페이지.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/renaming.do")
	public String getRenamingWritePage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ml/mlh/MLHRnmgWritePop.pop";
	}
	
	/**
	 * 개명신청 이름 변경 확인 페이지.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/check.do")
	public String updateRenamingWritePage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		String url = "error/blankPop.error";
		
		try
		{
			EmfMap lgnMap = (EmfMap)EgovUserDetailsHelper.getAuthenticatedUser();	
			EmfMap authMap = (EmfMap)EgovUserDetailsHelper.getIndividualInfAuth();	// 본인인증 후 넘어온 값

			if(lgnMap != null)
			{				
				if(authMap != null)
				{
					if(lgnMap.getString("name").equals(authMap.getString("name")))
					{
						modelMap.addAttribute("msg", "변경된 이름이 없습니다.");
					}
					else
					{
						emfMap.put("id", lgnMap.getString("id"));
						emfMap.put("name", authMap.getString("name"));
						emfMap.put("regId", lgnMap.getString("id"));
						emfMap.put("regIp", lgnMap.getString("loginIp"));
						emfMap.put("modId", lgnMap.getString("id"));
						emfMap.put("modIp", lgnMap.getString("loginIp"));
						
						mLHPrsnDataChngService.updateMemRenameInf(emfMap);	// 개명된 이름 변경
						
						lgnMap.put("name", authMap.getString("name"));					
						RequestContextHolder.getRequestAttributes().setAttribute("userLgnMap", lgnMap, RequestAttributes.SCOPE_SESSION);	// 변경된 이름으로 세션 재설정
						
						modelMap.addAttribute("msg", "개명된 이름으로 변경되었습니다.");
						modelMap.addAttribute("target", true);
						modelMap.addAttribute("reload", true);
					}
					
					modelMap.addAttribute("close", true);
				}
				else
				{
					modelMap.addAttribute("msg", "인증에 실패했습니다. 다시 시도해주세요.");
					modelMap.addAttribute("url", "/my-lifeway/member/personal-data-change/renaming.do");
				}				
			}
			else
			{
				modelMap.addAttribute("msg", "다시 로그인해 주세요.");
				modelMap.addAttribute("url", "/member/login/Login.do");
				modelMap.addAttribute("target", true);
				modelMap.addAttribute("close", true);
			}
			
			RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);			
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
	 * 개명신청 이름 변경 확인 페이지.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/check_sso.do")
	public String updateRenamingWritePageSso(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception
	{
		String url = "error/blankPop.error";
		
		try
		{
			EmfMap lgnMap = (EmfMap)EgovUserDetailsHelper.getAuthenticatedUser();	
			EmfMap authMap = (EmfMap)EgovUserDetailsHelper.getIndividualInfAuth();	// 본인인증 후 넘어온 값

			if(lgnMap != null)
			{				
				if(authMap != null)
				{
					if(lgnMap.getString("name").equals(authMap.getString("name")))
					{
						modelMap.addAttribute("msg", "변경된 이름이 없습니다.");
					}
					else
					{
						emfMap.put("id", lgnMap.getString("id"));
						emfMap.put("name", authMap.getString("name"));
						emfMap.put("regId", lgnMap.getString("id"));
						emfMap.put("regIp", lgnMap.getString("loginIp"));
						emfMap.put("modId", lgnMap.getString("id"));
						emfMap.put("modIp", lgnMap.getString("loginIp"));
						
						mLHPrsnDataChngService.updateMemRenameInfSso(emfMap, request);	// 개명된 이름 변경
						
						lgnMap.put("name", authMap.getString("name"));					
						RequestContextHolder.getRequestAttributes().setAttribute("userLgnMap", lgnMap, RequestAttributes.SCOPE_SESSION);	// 변경된 이름으로 세션 재설정
						
						modelMap.addAttribute("msg", "개명된 이름으로 변경되었습니다.");
						modelMap.addAttribute("target", true);
						modelMap.addAttribute("reload", true);
					}
					
					modelMap.addAttribute("close", true);
				}
				else
				{
					modelMap.addAttribute("msg", "인증에 실패했습니다. 다시 시도해주세요.");
					modelMap.addAttribute("url", "/my-lifeway/member/personal-data-change/renaming.do");
				}				
			}
			else
			{
				modelMap.addAttribute("msg", "다시 로그인해 주세요.");
				modelMap.addAttribute("url", "/member/login/Login.do");
				modelMap.addAttribute("target", true);
				modelMap.addAttribute("close", true);
			}
			
			RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);			
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

}
