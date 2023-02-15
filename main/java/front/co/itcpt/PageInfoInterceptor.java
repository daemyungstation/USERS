package front.co.itcpt;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovNetworkState;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.co.coa.service.COAMenuService;
import front.lg.lga.service.LGAMemLoginService;
import front.lg.lgb.service.LGBMemJoinService;
import front.lg.lgb.service.dao.LGBMemJoinDAO;
import front.lg.sso.exception.SsoException;
import front.lg.sso.service.SSOService;


/**
 * <pre> 
 * 페이지정보를 가져오기 위한 Interceptor
 * </pre>
 * 
 * @ClassName		: PageInfoInterceptor.java
 * @Description		:  페이지정보를 가져오기 위한 Interceptor
 * @author 박주석
 * @since 2015.11.22
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since			author					description
 *   ===========    ==============    =============================
 *    2015.11.22		박주석					최초생성
 * </pre>
 */
public class PageInfoInterceptor extends HandlerInterceptorAdapter {
	
	//외부 주입용 URL
	private String[] permittedURL;
	
	@Resource(name= "cOAMenuService")
    private COAMenuService cOAMenuService;
	
	
	@Resource(name="lGBMemJoinService")
    private LGBMemJoinService lGBMemJoinService;

	@Resource(name = "ssoService")
	private SSOService ssoService;

	@Resource(name = "lGAMemLoginService")
	private LGAMemLoginService lGAMemLoginService;

	@Resource(name="lGBMemJoinDAO")
	private LGBMemJoinDAO lGBMemJoinDAO;
	
	public void setPermittedURL(String strpermittedURL) 
	{
		this.permittedURL = strpermittedURL.split(",");
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception 
	{
		String currentUri = request.getRequestURI();
		
		if(!currentUri.startsWith("/cmm/"))
		{
			String[] array = currentUri.split("/");
			currentUri = "";
			
			for (int i = 0; i < array.length - 1; i++)
			{
				currentUri = currentUri + array[i] + "/";
			}
			
			request.setAttribute("currentUri", currentUri);
			
			//접근허용 URL인지 확인
			String requestUri = request.getRequestURI();
			
			// 스마트라이프 이전 url 접근시 새로운 url로 이동
			if(requestUri.endsWith("smartlife.html"))
			{
				response.sendRedirect("/smart/agree.do");
				
				return false;
			}
			
			boolean isPermittedURL = false;
			
			try
			{
				Pattern p;
				Matcher m;
				
				for(int q = 0; q < permittedURL.length; q++)
				{			
					String regex = (String) permittedURL[q].trim();	
					p = Pattern.compile(regex);
					m = p.matcher(requestUri);
					
					if(m.matches())
					{
						// 정규표현식을 이용해서 요청 URI가 허용된 URL에 맞는지 점검함.
						isPermittedURL = true;
					}
				}

				if(!isPermittedURL)
				{
					List<EmfMap> menuList = (List<EmfMap>) RequestContextHolder.getRequestAttributes().getAttribute("menuList", RequestAttributes.SCOPE_SESSION);
					
					if(menuList == null)
					{
						menuList = cOAMenuService.getMenuList();
						
						RequestContextHolder.getRequestAttributes().setAttribute("menuList", menuList, RequestAttributes.SCOPE_SESSION);
					}
					
					request.setAttribute("menuList", menuList);
					
					List<EmfMap> gnbMenuList = new ArrayList<EmfMap>();
					
					EmfMap menuMap = null;
					
					String pageLink = "";
					String pageTitl = "";
					int pageMenuSeq = -1;
					int pageParntSeq = -1;
					
					for(int i = 0; i < menuList.size(); i++)
					{
						menuMap = (EmfMap) menuList.get(i);
						
						pageLink = getUrlFolder(EMFStringUtil.nullConvert(menuMap.getString("userLink")));
						
						if(!"".equals(pageLink) && requestUri.indexOf(pageLink) > -1)
						{
							pageMenuSeq = Integer.parseInt(menuMap.getString("menuSeq"));
							pageParntSeq = Integer.parseInt(menuMap.getString("parntSeq"));
							pageTitl = EMFStringUtil.nullConvert(menuMap.getString("menuNm"));
						}
						
						gnbMenuList.add(menuMap);
					}
					
					request.setAttribute("pageMenuSeq", pageMenuSeq);
					request.setAttribute("pageParntSeq", pageParntSeq);
					request.setAttribute("pageTitl", pageTitl);
					request.setAttribute("gnbMenuList", gnbMenuList);
					
					//페이지 인디게이터
					List<EmfMap> parntMenuList = new ArrayList<EmfMap>();
					
					if(pageMenuSeq > -1)
					{
						parntMenuList = cOAMenuService.getParntMenuList(pageMenuSeq);
					}
					
					request.setAttribute("parntMenuList", parntMenuList);

					if (!EgovUserDetailsHelper.isAuthenticated()) {
						Cookie[] cookies = request.getCookies();
						String ssoToken = null;

						//System.out.println("[preHandle cookies]"+cookies);
/*						
						if (cookies != null) {
							for (Cookie cookie : cookies) {
								System.out.println("[cookies]"+cookie.getName()+":"+cookie.getValue());
								if (cookie.getName().equals("_tk")) {
									ssoToken = cookie.getValue();
								}
							}
						}
*/						

						if (ssoToken != null && ssoToken != "") { // SSO 통합 로그인
							try
							{
								String clientIp = EgovNetworkState.getMyIPaddress(request);
								HashMap ssoMap = ssoService.validateToken(ssoToken, clientIp);
								if (ssoMap != null)
								{
									String uid = (String) ssoMap.get("uid");
									String ci = (String) ssoMap.get("ci");

									HashMap ssoUserInfo = ssoService.find(null, uid, ci, clientIp);
									if (ssoUserInfo != null)
									{
										EmfMap emfMap = new EmfMap();
										emfMap.put("ci", ssoUserInfo.get("ci"));
										emfMap.put("check", "ci");
										emfMap = lGBMemJoinService.selectMemInf(emfMap);

										EmfMap homepageMemberInfo = (EmfMap)emfMap.get("info");
										if (homepageMemberInfo == null)
										{
											// 대명홈페이지 디비에 회원 정보 INSERT
											ssoUserInfo.put("clientIp", clientIp);
											ssoUserInfo.put("newId", ssoUserInfo.get("uid"));
											lGAMemLoginService.syncUserInfo(ssoUserInfo);
											EmfMap infoMap = new EmfMap();
											infoMap.put("ci", ssoUserInfo.get("ci"));
											homepageMemberInfo = lGBMemJoinDAO.selectMemInfFromMemAndQscnMem(infoMap);
										}
										homepageMemberInfo.put("integrationId", ssoUserInfo.get("id"));
										RequestContextHolder.getRequestAttributes().setAttribute("userLgnMap", homepageMemberInfo, RequestAttributes.SCOPE_SESSION);
									}
								}
							}
							catch (SsoException ex)
							{
								System.out.println("[PageInfoInterceptor] SsoException");
							}
						}
					}
					else
					{
						//EmfMap memMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
						//System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
						// System.out.println(memMap.get("agreementForThirdParty"));
						EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
						EmfMap memMap = new EmfMap();
						//memMap.put("check", "loginid");
						memMap.put("id", lgnMap.get("id"));
						memMap = lGBMemJoinService.selectMemInf(memMap);
						
						String agreementForThirdParty = (String) ((EmfMap)memMap.get("info")).get("agreementForThirdParty");
						
						//System.out.println(agreementForThirdParty);
						//System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
						request.setAttribute("agreementForThirdParty", agreementForThirdParty);
						//RequestContextHolder.getRequestAttributes().setAttribute("memMap", memMap, RequestAttributes.SCOPE_SESSION);
						/*
						EmfMap memMap = new EmfMap();
						memMap.put("check", "id");
						memMap = lGBMemJoinService.selectMemInf(memMap);
						
						RequestContextHolder.getRequestAttributes().setAttribute("memMap", memMap, RequestAttributes.SCOPE_SESSION);
						*/
					}
				}
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception
	{
		String requestURI = request.getRequestURI();
		
		if(!requestURI.startsWith("/cmm/"))
		{
			boolean isPermittedURL = false; 
			
			try
			{
				Pattern p;
				Matcher m;
				
				for(int q = 0; q < permittedURL.length; q++)
				{
					String regex = (String) permittedURL[q].trim();	
					p = Pattern.compile(regex);
					m = p.matcher(requestURI);
					
					if(m.matches())
					{
						// 정규표현식을 이용해서 요청 URI가 허용된 URL에 맞는지 점검함.
						isPermittedURL = true;
					}
				}
				
				if(!isPermittedURL)
				{
					List<EmfMap> menuList = (List<EmfMap>) request.getAttribute("menuList");
					List<EmfMap> lnbMenuList = new ArrayList<EmfMap>();
					
					EmfMap lnbMenuMap = null;
					
					int votLft = 0, fstLft = 0, votRht = 0, fstRht = 0;
					
					if(menuList != null && menuList.size() > 0)
					{
						if(modelAndView != null)
						{
							List<EmfMap> parntMenuList = (List<EmfMap>) request.getAttribute("parntMenuList");
							
							EmfMap lnbFstMap = (EmfMap) parntMenuList.get(0);
							
							for(int i = 0; i < menuList.size(); i++)
							{
								lnbMenuMap = (EmfMap) menuList.get(i);
								
								if(lnbMenuMap.getString("userLink").indexOf("/qscn/") == -1 && lnbMenuMap.getString("userLink").indexOf("/old/") == -1)
								{
									votLft = Integer.parseInt(lnbMenuMap.getString("lftVal"));
									fstLft = Integer.parseInt(lnbFstMap.getString("lftVal"));
									votRht = Integer.parseInt(lnbMenuMap.getString("rhtVal"));
									fstRht = Integer.parseInt(lnbFstMap.getString("rhtVal"));
									
									if(votLft >= fstLft && votRht <= fstRht)
									{
										lnbMenuList.add(lnbMenuMap);
									}
								}
							}
	
							List<EmfMap> gnbMenuList = (List<EmfMap>) request.getAttribute("gnbMenuList");
							
							EmfMap tmpMap = null;
							
							for(int j = 0; j < parntMenuList.size(); j++)
							{
								tmpMap = parntMenuList.get(j);
	
								List<EmfMap> dpthList = new ArrayList<EmfMap>();
								
								for(int k = 0; k < gnbMenuList.size(); k++)
								{
									if(parntMenuList.get(j).getString("parntSeq").equals(gnbMenuList.get(k).getString("parntSeq")))
									{
										if(gnbMenuList.get(k).getString("userLink").indexOf("/qscn/") == -1 && gnbMenuList.get(k).getString("userLink").indexOf("/old/") == -1)
										{
											dpthList.add(menuList.get(k));
										}
									}
								}
								
								tmpMap.put("dpthList", dpthList);
								
								parntMenuList.set(j, tmpMap);
							}
	
							modelAndView.addObject("lnbMenuList", lnbMenuList);
							modelAndView.addObject("parntMenuList", parntMenuList);
						}
					}
				}
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}
	}
	
	/**
	 * 메뉴의 링크를 파싱한다.
	 * @param String
	 * @return String
	 * @exception Exception
	 */
	private String getUrlFolder(String str)
	{		
		String rtn = "";
		String val = "";
		
		if(str.indexOf(".do") > -1)
		{
			String[] arrFolder = str.split("/");
			
			for(int i = 0; i < arrFolder.length-1; i++)
			{
				val = arrFolder[i];
				
				if(!"".equals(val))
				{
					rtn = rtn  + "/" + arrFolder[i];
				}
			}
		}
		else
		{
			rtn = str;
		}
		
		return rtn;
	}
}