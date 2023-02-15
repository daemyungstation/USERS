package front.co.itcpt;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import egovframework.com.utl.sim.service.EgovNetworkState;
import emf.core.vo.EmfMap;
import front.lg.lga.service.LGAMemLoginService;
import front.lg.lgb.service.LGBMemJoinService;
import front.lg.lgb.service.dao.LGBMemJoinDAO;
import front.lg.sso.exception.SsoException;
import front.lg.sso.service.SSOService;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

import java.util.HashMap;

/**
 * <pre> 
 * 로그인 여부 확인 Interceptor
 * </pre>
 * 
 * @ClassName		: AuthenticInterceptor.java
 * @Description		: 로그인 여부 확인 Interceptor
 * @author 허진영
 * @since 2016.02.29
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		 since			author				   description
 *   ===========    ==============    =============================
 *    2016.02.29		허진영					최초 생성
 * </pre>
 */
public class AuthenticInterceptor extends HandlerInterceptorAdapter {

	@Resource(name = "ssoService")
	private SSOService ssoService;

	@Resource(name = "lGAMemLoginService")
	private LGAMemLoginService lGAMemLoginService;

	@Resource(name = "lGBMemJoinService")
	private LGBMemJoinService lGBMemJoinService;

	@Resource(name="lGBMemJoinDAO")
	private LGBMemJoinDAO lGBMemJoinDAO;

	//외부 주입용 URL
	private String[] permittedURL;

	public void setPermittedURL(String strpermittedURL) {
		this.permittedURL = strpermittedURL.split(",");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//로그인 정보 체크
//		EmfMap authUserInfo = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();

		if (!EgovUserDetailsHelper.isAuthenticated()) {
			ModelAndView modelAndView = new ModelAndView("error/blank");
			modelAndView.addObject("msg", "로그인이 필요한 페이지입니다.");
			modelAndView.addObject("url", "/member/login/Login.do?vwUrl=" + request.getRequestURI());
			throw new ModelAndViewDefiningException(modelAndView);
		}

		return true;
	}
}