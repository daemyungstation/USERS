package front.co.itcpt;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import egovframework.com.cmm.service.EgovFileMngUtil;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.ml.mla.service.MLAAcntChngService;

/**
 * <pre> 
 * MyLifeway 이용가능한 메뉴 여부 확인 Interceptor
 * </pre>
 * 
 * @ClassName		: MyLifewayInterceptor.java
 * @Description		: MyLifeway 이용가능한 메뉴 여부 확인 Interceptor
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
public class MyLifewayInterceptor extends HandlerInterceptorAdapter {
	private static final Logger LOG = Logger.getLogger(MyLifewayInterceptor.class.getName());
	
	//외부 주입용 URL
	private String[] permittedURL;
	
	@Resource(name="mLAAcntChngService")
    private MLAAcntChngService mLAAcntChngService;
	
	public void setPermittedURL(String strpermittedURL) 
	{
		this.permittedURL = strpermittedURL.split(",");
	}
	private List<String> semiBlockUrls = Arrays.asList(
			"/my-lifeway/join-product-information/payment-status/index.do",
			"/my-lifeway/join-product-information/refund/index.do",
			"/my-lifeway/service-guide/cancel-refund/index.do" );

//		    <mvc:mapping path="/my-lifeway/join-product-information/**" />
//			<mvc:mapping path="/my-lifeway/membership-card/**" />
//			<mvc:mapping path="/my-lifeway/performance/**" />
//			<mvc:mapping path="/my-lifeway/chage-service/**" />
//			<mvc:mapping path="/my-lifeway/service-guide/**" />
//			<mvc:mapping path="/my-lifeway/obituary-notification/**" />
//			<mvc:mapping path="/my-lifeway/member/resortagree/**" />
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception 
	{
		//상품회원여부 체크
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();



//		CASE WHEN MPA.KSTBIT IN ('01') THEN '대기'
//		WHEN MPA.KSTBIT IN ('02') THEN '가입'
//		WHEN MPA.KSTBIT IN ('03') THEN '해약'
//		WHEN MPA.KSTBIT IN ('04') THEN '행사'
//		WHEN MPA.KSTBIT IN ('09') THEN '만기'
		boolean isWebMeberOnly = false;
		boolean isSemiMember = false;
		if("".equals(EMFStringUtil.nullConvert(lgnMap.getString("unqNo"))))
		{
			isWebMeberOnly = true;
		}
		else
		{
			EmfMap emfMap = new EmfMap();
			
			emfMap.put("memNo", lgnMap.getString("unqNo"));
			
			List<EmfMap> list = mLAAcntChngService.selectJoinPrdctListForLogin(emfMap);
			
			if(list.size() < 1)
			{
				isWebMeberOnly = true;
			}
			for(EmfMap member : list) {
				String accStat = member.getString("accStat");
				if( "정상".equals(accStat)  ){
					isWebMeberOnly = false;
					isSemiMember = false;
					break;
				} else if( "행사".equals(accStat) || "해약".equals(accStat)  ) {
					isSemiMember = true;
				} else if( "청약쵤회".equals(accStat) ) {
					isWebMeberOnly = true;
				}
			}

		}
		if( isSemiMember )
			isWebMeberOnly = false;
		if(isWebMeberOnly)
		{
			ModelAndView modelAndView = new ModelAndView("error/blank");
			modelAndView.addObject("msg", "");
			modelAndView.addObject("url", "/my-lifeway/access/index.do");
			throw new ModelAndViewDefiningException(modelAndView);
		} else if( isSemiMember ) { //행사 또는 해약 상태인 계약이 있는경우 , 정상계약은 없음
//			if( semiBlockUrls.contains(request.getRequestURI()) ) {
//				ModelAndView modelAndView = new ModelAndView("error/blank");
//				modelAndView.addObject("msg", "");
//				modelAndView.addObject("url", "/my-lifeway/access/associate_index.do");
//				throw new ModelAndViewDefiningException(modelAndView);
//			} else {
//				LOG.info("SemiMember Url Path:", request.getRequestURI());
//			}
		}
		return true;
	}
}