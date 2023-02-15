package front.oc.oca.web;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovNetworkState;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.lg.lgb.service.DMLifeMemService;
import front.lg.lgf.service.LGFMemMyService;
import front.oc.oca.service.DoznBankingService;
import front.oc.oca.service.OCAOutsourcingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * <pre> 
 * 외주업체 상담신청 위한 Controller
 * </pre>
 * 
 * @ClassName		: OCAOutsourcingController.java
 * @Description		: 외주업체 상담신청 위한 Controller
 * @author 김필기
 * @since 2016.03.22
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.22		김필기				최초 생성
 *   2020.03.31		김은식				PRODUCT(상담신청)으로 URL변경으로 폐쇄	
 * </pre>
 */ 
@Controller
public class OCAOutsourcingController extends EmfController {
	
	@Resource(name="oCAOutsourcingService")
    private OCAOutsourcingService oCAOutsourcingService;	
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
	
	@Resource(name="dMLifeMemService")
	private DMLifeMemService dmLifeMemService;

	@Resource(name = "doznBankingService")
    private DoznBankingService doznBankingService;

	@Resource(name="lGFMemMyService")
	private LGFMemMyService lGFMemMyService;
	/**
     * 약관동의 화면
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value={"/{agentnm}/agree.do", "/mobile/smartlife.html"})
	public String getAgreeView(HttpServletResponse response, HttpServletRequest request, EmfMap emfMap, ModelMap modelMap, @PathVariable String agentnm) throws Exception
	{
		String url = "error/blank.error";
		
		if(agentnm.toUpperCase().equals("ONLIFECC"))
		{
			modelMap.addAttribute("msg", "잘못된 접근입니다.");
			modelMap.addAttribute("url", "/main/index.do");
			
			return url;
		}
		
		boolean isAllow = false;
		
		if(!"".equals(EMFStringUtil.nullConvert(agentnm)))
		{
			agentnm = agentnm.toUpperCase();
		}
		
		//공통코드 배열 셋팅
		ArrayList<String> cdDtlList = new ArrayList<String>();		
		
		//외주업체 코드	
		cdDtlList.add("OUTSOURCING");
		
		//정의된 코드id값들의 상세 코드 맵 반환
		EmfMap outsourcingMap = cmmUseService.selectCmmCodeBindAll(cdDtlList);
		
		List<EmfMap> listOutsorucing = (ArrayList<EmfMap>)outsourcingMap.get("outsourcing");
		
		// 등록된 외주업체코드인지 확인
		for(int i = 0 ; i < listOutsorucing.size() ; i++)
		{
			EmfMap tempMap = listOutsorucing.get(i);
			
			if(tempMap.getString("cd").toUpperCase().equals(agentnm))
			{
				isAllow = true;
			}
		}
		
		if(isAllow)
		{
			// 동의/인증화면 사용여부
			String useOutsourcingAgree = EgovProperties.getProperty("Globals.useOutsourcingAgree");	
			
			if("Y".equals(useOutsourcingAgree))
			{
				url = "front/oc/oca/OCAOutsourcingAgree.front2";	
			}
			else
			{				
				url = "redirect:/"+agentnm+"/write.do";
			}
			
			// 외주업체코드 정보 세션저장
			// RequestContextHolder.getRequestAttributes().setAttribute("outsourcingCode", agentnm.toUpperCase(), RequestAttributes.SCOPE_SESSION);
			// 쿠키로 대체
			Cookie cookie = new Cookie("agentnm", agentnm);
		    cookie.setMaxAge(60*60*24*365);						// 쿠키 유지 기간 - 1년
		    cookie.setPath("/");                        	 	// 모든 경로에서 접근 가능하도록 
		    response.addCookie(cookie);             			// 쿠키저장

			if("LGU".equals(agentnm))
			{
/*				
				System.out.println("utf-8 -> euc-kr        : " + new String(emfMap.getString("uDlrNm").getBytes("utf-8"), "euc-kr"));
				System.out.println("utf-8 -> ksc5601       : " + new String(emfMap.getString("uDlrNm").getBytes("utf-8"), "ksc5601"));
				System.out.println("utf-8 -> x-windows-949 : " + new String(emfMap.getString("uDlrNm").getBytes("utf-8"), "x-windows-949"));
				System.out.println("utf-8 -> iso-8859-1    : " + new String(emfMap.getString("uDlrNm").getBytes("utf-8"), "iso-8859-1"));
				System.out.println("iso-8859-1 -> euc-kr        : " + new String(emfMap.getString("uDlrNm").getBytes("iso-8859-1"), "euc-kr"));
				System.out.println("iso-8859-1 -> ksc5601       : " + new String(emfMap.getString("uDlrNm").getBytes("iso-8859-1"), "ksc5601"));
				System.out.println("iso-8859-1 -> x-windows-949 : " + new String(emfMap.getString("uDlrNm").getBytes("iso-8859-1"), "x-windows-949"));
				System.out.println("iso-8859-1 -> utf-8         : " + new String(emfMap.getString("uDlrNm").getBytes("iso-8859-1"), "utf-8"));
				System.out.println("euc-kr -> utf-8         : " + new String(emfMap.getString("uDlrNm").getBytes("euc-kr"), "utf-8"));
				System.out.println("euc-kr -> ksc5601       : " + new String(emfMap.getString("uDlrNm").getBytes("euc-kr"), "ksc5601"));
				System.out.println("euc-kr -> x-windows-949 : " + new String(emfMap.getString("uDlrNm").getBytes("euc-kr"), "x-windows-949"));
				System.out.println("euc-kr -> iso-8859-1    : " + new String(emfMap.getString("uDlrNm").getBytes("euc-kr"), "iso-8859-1"));
				System.out.println("ksc5601 -> euc-kr        : " + new String(emfMap.getString("uDlrNm").getBytes("ksc5601"), "euc-kr"));
				System.out.println("ksc5601 -> utf-8         : " + new String(emfMap.getString("uDlrNm").getBytes("ksc5601"), "utf-8"));
				System.out.println("ksc5601 -> x-windows-949 : " + new String(emfMap.getString("uDlrNm").getBytes("ksc5601"), "x-windows-949"));
				System.out.println("ksc5601 -> iso-8859-1    : " + new String(emfMap.getString("uDlrNm").getBytes("ksc5601"), "iso-8859-1"));
				System.out.println("x-windows-949 -> euc-kr     : " + new String(emfMap.getString("uDlrNm").getBytes("x-windows-949"), "euc-kr"));
				System.out.println("x-windows-949 -> utf-8      : " + new String(emfMap.getString("uDlrNm").getBytes("x-windows-949"), "utf-8"));
				System.out.println("x-windows-949 -> ksc5601    : " + new String(emfMap.getString("uDlrNm").getBytes("x-windows-949"), "ksc5601"));
				System.out.println("x-windows-949 -> iso-8859-1 : " + new String(emfMap.getString("uDlrNm").getBytes("x-windows-949"), "iso-8859-1"));
*/				
				//String uDlrNm = new String(emfMap.getString("uDlrNm").getBytes("8859_1"), "KSC5601");
/*				
				System.out.println("==== 대명 가입번호(dmEntrNo)	: " + emfMap.getString("dmEntrNo"));
				System.out.println("==== 대리점/직영점 코드(uDlrCd)	: " + emfMap.getString("uDlrCd"));
				System.out.println("==== 상담등록자 사번(uIndcEmpno)	: " + emfMap.getString("uIndcEmpno"));
				System.out.println("==== 상담등록자 마당 ID(uIntgUserId)	: " + emfMap.getString("uIntgUserId"));
				System.out.println("==== U+ 가입번호(uEntrNo)	: " + emfMap.getString("uEntrNo"));
				System.out.println("==== U+ 서비스명(uProdNm)	: " + emfMap.getString("uProdNm"));
				System.out.println("==== 채널유형코드(uCmmnCd)	: " + emfMap.getString("uCmmnCd"));
				System.out.println("==== 채널유형코드명(uCmmnCdNm)	: " + emfMap.getString("uCmmnCdNm"));
				System.out.println("==== 유치대리점명(uDlrNm)	: " + emfMap.getString("uDlrNm"));
				System.out.println("==== U+ 상품번호(uProdNo)	: " + emfMap.getString("uProdNo"));
*/				
				if(!"".equals(EMFStringUtil.nullConvert(emfMap.getString("dmEntrNo"))))
				{
					// LGU일때 대명가입번호 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("dmEntrNo", emfMap.getString("dmEntrNo"), RequestAttributes.SCOPE_SESSION);
				}
				
				if(!"".equals(EMFStringUtil.nullConvert(emfMap.getString("uDlrCd"))))
				{
					// LGU일때 대리점코드 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("uDlrCd", emfMap.getString("uDlrCd"), RequestAttributes.SCOPE_SESSION);	
				}
				
				if(!"".equals(EMFStringUtil.nullConvert(emfMap.getString("uIndcEmpno"))))
				{
					// LGU일때 유치자사번 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("uIndcEmpno", emfMap.getString("uIndcEmpno"), RequestAttributes.SCOPE_SESSION);	
				}
				
				if(!"".equals(EMFStringUtil.nullConvert(emfMap.getString("uIntgUserId"))))
				{
					// LGU일때 유치자마당ID 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("uIntgUserId", emfMap.getString("uIntgUserId"), RequestAttributes.SCOPE_SESSION);	
				}
				
				if(!"".equals(EMFStringUtil.nullConvert(emfMap.getString("uEntrNo"))))
				{
					// LGU일때 U+ 가입번호 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("uEntrNo", emfMap.getString("uEntrNo"), RequestAttributes.SCOPE_SESSION);	
				}

				if(!"".equals(EMFStringUtil.nullConvert(emfMap.getString("uProdNm"))))
				{
					// LGU일때 서비스명 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("uProdNm", emfMap.getString("uProdNm"), RequestAttributes.SCOPE_SESSION);	
				}

				if(!"".equals(EMFStringUtil.nullConvert(emfMap.getString("uCmmnCd"))))
				{
					// LGU일때 유치조직코드 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("uCmmnCd", emfMap.getString("uCmmnCd"), RequestAttributes.SCOPE_SESSION);	
				}

				if(!"".equals(EMFStringUtil.nullConvert(emfMap.getString("uCmmnCdNm"))))
				{
					// LGU일때 유치조직명 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("uCmmnCdNm", emfMap.getString("uCmmnCdNm"), RequestAttributes.SCOPE_SESSION);	
				}

				if(!"".equals(EMFStringUtil.nullConvert(emfMap.getString("uDlrNm"))))
				{
					// LGU일때 유치대리점명 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("uDlrNm", emfMap.getString("uDlrNm"), RequestAttributes.SCOPE_SESSION);	
				}

				if(!"".equals(EMFStringUtil.nullConvert(emfMap.getString("uProdNo"))))
				{
					// LGU일때 상품번호 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("uProdNo", emfMap.getString("uProdNo"), RequestAttributes.SCOPE_SESSION);	
				}
			} else if("KBCAR".equals(agentnm)) {
				
				//emfMap으로 파라미터를 바인딩하면 자동으로 소문자로 변환되기 때문에 Request로 받는다
				String OrderNo		= EMFStringUtil.nullConvert(request.getParameter("OrderNo"));
				String OrderName	= EMFStringUtil.nullConvert(request.getParameter("OrderName"));
				String OrderPhone	= EMFStringUtil.nullConvert(request.getParameter("OrderPhone"));
				String OrderBirth	= EMFStringUtil.nullConvert(request.getParameter("OrderBirth"));
				String OrderQty		= EMFStringUtil.nullConvert(request.getParameter("OrderQty"));
				String OrderType1	= EMFStringUtil.nullConvert(request.getParameter("OrderType1"));
				String OrderType2	= EMFStringUtil.nullConvert(request.getParameter("OrderType2"));
				String PayCard		= EMFStringUtil.nullConvert(request.getParameter("PayCard"));
				String PayCardNo	= EMFStringUtil.nullConvert(request.getParameter("PayCardNo"));
				String PayCardMMYY	= EMFStringUtil.nullConvert(request.getParameter("PayCardMMYY"));
				String ShopCode		= EMFStringUtil.nullConvert(request.getParameter("ShopCode"));
				String ShopName		= EMFStringUtil.nullConvert(request.getParameter("ShopName"));
				String ShopEmp		= EMFStringUtil.nullConvert(request.getParameter("ShopEmp"));
				String ShopPhone	= EMFStringUtil.nullConvert(request.getParameter("ShopPhone"));
				String CarNumber	= EMFStringUtil.nullConvert(request.getParameter("CarNumber"));
				
				if(!"".equals(OrderNo))
				{
					// KB일때 주문번호 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("orderNum", OrderNo, RequestAttributes.SCOPE_SESSION);
				}
				
				if(!"".equals(OrderName))
				{
					// KB일때 계약자명 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("contractorName", OrderName, RequestAttributes.SCOPE_SESSION);
				}
				
				if(!"".equals(OrderBirth))
				{
					// KB일때 계약자 생년월일 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("contractorBirth", OrderBirth, RequestAttributes.SCOPE_SESSION);
				}
				
				if(!"".equals(OrderPhone))
				{
					// KB일때 계약자 연락처 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("contractorPhone", OrderPhone, RequestAttributes.SCOPE_SESSION);
				}
				
				if(!"".equals(OrderQty))
				{
					// KB일때 주계약 구좌수 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("orderQty", OrderQty, RequestAttributes.SCOPE_SESSION);
				}
				
				if(!"".equals(OrderType1))
				{
					// KB일때 주계약 서비스1 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("mainContService1", OrderType1, RequestAttributes.SCOPE_SESSION);
				}

				if(!"".equals(OrderType2))
				{
					// KB일때 주계약 서비스2 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("mainContService2", OrderType2, RequestAttributes.SCOPE_SESSION);
				}
				
				if(!"".equals(PayCard))
				{
					// KB일때 카드사 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("cardCompany", PayCard, RequestAttributes.SCOPE_SESSION);
				}

				if(!"".equals(PayCardNo))
				{
					// KB일때 카드번호 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("creditCardNum", PayCardNo, RequestAttributes.SCOPE_SESSION);
				}
				
				if(!"".equals(PayCardMMYY))
				{
					// KB일때 유효기간 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("validThru", PayCardMMYY, RequestAttributes.SCOPE_SESSION);
				}
				
				if(!"".equals(ShopCode))
				{
					// KB일때 중고차 상사코드 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("code2", ShopCode, RequestAttributes.SCOPE_SESSION);
				}
				
				if(!"".equals(ShopName))
				{
					// KB일때 중고차 상사명 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("agentNm", ShopName, RequestAttributes.SCOPE_SESSION);
				}
				
				if(!"".equals(ShopEmp))
				{
					// KB일때 중고차 상사 담당자명 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("agentEmpNm", ShopEmp, RequestAttributes.SCOPE_SESSION);
				}
				
				if(!"".equals(ShopPhone))
				{
					// KB일때 중고차 상사 연락처 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("agentEmpTel", ShopPhone, RequestAttributes.SCOPE_SESSION);
				}
				
				if(!"".equals(CarNumber))
				{
					// KB일때 중고차 구매 차량번호 세션에 저장
					RequestContextHolder.getRequestAttributes().setAttribute("plateNum", CarNumber, RequestAttributes.SCOPE_SESSION);
				}
			}
		}
		else
		{
			modelMap.addAttribute("msg", "잘못된 접근입니다.");
			modelMap.addAttribute("url", "/main/index.do");
		}	
	
		return url;
	}
	
	/**
	 * (selectCmmLinkCode 메서드로 합쳐지면서 사용하지 않음)
     * 정보 작성화면
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 *
	 */
//	@RequestMapping("/LGB2B/write.do")
	public String getOutsourcingLGB2BWrite(HttpServletRequest request, EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		String url = "error/blank.error";

		String agentnm = "LGB2B";

		/*
		if(agentnm.toUpperCase().equals("ONLIFECC"))
		{
			modelMap.addAttribute("msg", "잘못된 접근입니다.");
			modelMap.addAttribute("url", "/main/index.do");
			
			return url;
		}
		*/

		// 동의/인증화면 사용여부
		String useOutsourcingAgree = EgovProperties.getProperty("Globals.useOutsourcingAgree");
		
		String uDlrCd = (String)RequestContextHolder.getRequestAttributes().getAttribute("uDlrCd", RequestAttributes.SCOPE_SESSION);
		String uIndcEmpno = (String)RequestContextHolder.getRequestAttributes().getAttribute("uIndcEmpno", RequestAttributes.SCOPE_SESSION);
		String uIntgUserId = (String)RequestContextHolder.getRequestAttributes().getAttribute("uIntgUserId", RequestAttributes.SCOPE_SESSION);
		String dmEntrNo = (String)RequestContextHolder.getRequestAttributes().getAttribute("dmEntrNo", RequestAttributes.SCOPE_SESSION);
		String uEntrNo = (String)RequestContextHolder.getRequestAttributes().getAttribute("uEntrNo", RequestAttributes.SCOPE_SESSION);

		if(!"".equals(EMFStringUtil.nullConvert(agentnm)))
		{
			agentnm = agentnm.toUpperCase();
		}		
		
		String tempAgentnm = "";
		
		Cookie[] cookies = request.getCookies();
		
		for (int i = 0; i < cookies.length; i++)
		{
			if("agentnm".equals(cookies[i].getName()))
			{
				tempAgentnm = cookies[i].getValue().toUpperCase();
			}
		}
		
		if("".equals(EMFStringUtil.nullConvert(tempAgentnm)))
		{
			//modelMap.addAttribute("msg", "잘못된 접근입니다.");
			modelMap.addAttribute("url", "/"+agentnm+"/agree.do");			
		}
		else
		{
			if(agentnm.equals(tempAgentnm))
			{
				if("Y".equals(useOutsourcingAgree))
				{
					String ci = "", name = "";
					
					EmfMap authMap = (EmfMap)EgovUserDetailsHelper.getIndividualInfAuth();
					
					ci = authMap.getString("ci");
					name = authMap.getString("name");
				}
				
				emfMap.put("oscCd", agentnm);
				
				modelMap.put("info", oCAOutsourcingService.selectOutsourcingPageMngInfo(emfMap));
				modelMap.put("prdctList", oCAOutsourcingService.selectOutsourcingPrdctListLGB2B(emfMap));	// 링크코드에 등록된 상품(결합제품) 목록
				
				modelMap.put("uDlrCd", uDlrCd);
				modelMap.put("uIndcEmpno", uIndcEmpno);
				modelMap.put("uIntgUserId", uIntgUserId);
				modelMap.put("dmEntrNo", dmEntrNo);
				modelMap.put("uEntrNo", uEntrNo);
				
				url = "front/oc/oca/OCAOutsourcingWrite"+agentnm+".front2";	
			}
			else
			{
				//modelMap.addAttribute("msg", "잘못된 접근입니다.");
				modelMap.addAttribute("url", "/"+agentnm+"/agree.do");
			}
		}
		
		return url; 
	}

	/**
     * 정보 작성화면
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
//	@RequestMapping(value="/{agentnm}/write.do")
	public String getOutsourcingWrite(HttpServletRequest request, EmfMap emfMap, ModelMap modelMap, @PathVariable String agentnm) throws Exception
	{ 
		String url = "error/blank.error";
		
		if(agentnm.toUpperCase().equals("ONLIFECC"))
		{
			modelMap.addAttribute("msg", "잘못된 접근입니다.");
			modelMap.addAttribute("url", "/main/index.do");
			
			return url;
		}

		// 동의/인증화면 사용여부
		String useOutsourcingAgree = EgovProperties.getProperty("Globals.useOutsourcingAgree");
		
		String uDlrCd = (String)RequestContextHolder.getRequestAttributes().getAttribute("uDlrCd", RequestAttributes.SCOPE_SESSION);
		String uIndcEmpno = (String)RequestContextHolder.getRequestAttributes().getAttribute("uIndcEmpno", RequestAttributes.SCOPE_SESSION);
		String uIntgUserId = (String)RequestContextHolder.getRequestAttributes().getAttribute("uIntgUserId", RequestAttributes.SCOPE_SESSION);
		String dmEntrNo = (String)RequestContextHolder.getRequestAttributes().getAttribute("dmEntrNo", RequestAttributes.SCOPE_SESSION);
		String uEntrNo = (String)RequestContextHolder.getRequestAttributes().getAttribute("uEntrNo", RequestAttributes.SCOPE_SESSION);
		String uProdNm = (String)RequestContextHolder.getRequestAttributes().getAttribute("uProdNm", RequestAttributes.SCOPE_SESSION);
		String uCmmnCd = (String)RequestContextHolder.getRequestAttributes().getAttribute("uCmmnCd", RequestAttributes.SCOPE_SESSION);
		String uCmmnCdNm = (String)RequestContextHolder.getRequestAttributes().getAttribute("uCmmnCdNm", RequestAttributes.SCOPE_SESSION);
		String uDlrNm = (String)RequestContextHolder.getRequestAttributes().getAttribute("uDlrNm", RequestAttributes.SCOPE_SESSION);
		String uProdNo = (String)RequestContextHolder.getRequestAttributes().getAttribute("uProdNo", RequestAttributes.SCOPE_SESSION);

		String orderNum = (String)RequestContextHolder.getRequestAttributes().getAttribute("orderNum", RequestAttributes.SCOPE_SESSION);
		String contractorName = (String)RequestContextHolder.getRequestAttributes().getAttribute("contractorName", RequestAttributes.SCOPE_SESSION);
		String contractorBirth = (String)RequestContextHolder.getRequestAttributes().getAttribute("contractorBirth", RequestAttributes.SCOPE_SESSION);
		String contractorPhone = (String)RequestContextHolder.getRequestAttributes().getAttribute("contractorPhone", RequestAttributes.SCOPE_SESSION);
		String cardCompany = (String)RequestContextHolder.getRequestAttributes().getAttribute("cardCompany", RequestAttributes.SCOPE_SESSION);
		String creditCardNum = (String)RequestContextHolder.getRequestAttributes().getAttribute("creditCardNum", RequestAttributes.SCOPE_SESSION);
		String validThru = (String)RequestContextHolder.getRequestAttributes().getAttribute("validThru", RequestAttributes.SCOPE_SESSION);
		String code2 = (String)RequestContextHolder.getRequestAttributes().getAttribute("code2", RequestAttributes.SCOPE_SESSION);
		String agentNm = (String)RequestContextHolder.getRequestAttributes().getAttribute("agentNm", RequestAttributes.SCOPE_SESSION);
		String agentEmpNm = (String)RequestContextHolder.getRequestAttributes().getAttribute("agentEmpNm", RequestAttributes.SCOPE_SESSION);
		String agentEmpTel = (String)RequestContextHolder.getRequestAttributes().getAttribute("agentEmpTel", RequestAttributes.SCOPE_SESSION);
		String plateNum = (String)RequestContextHolder.getRequestAttributes().getAttribute("plateNum", RequestAttributes.SCOPE_SESSION);
		String orderQty = (String)RequestContextHolder.getRequestAttributes().getAttribute("orderQty", RequestAttributes.SCOPE_SESSION);
		String mainContService1 = (String)RequestContextHolder.getRequestAttributes().getAttribute("mainContService1", RequestAttributes.SCOPE_SESSION);
		String mainContService2 = (String)RequestContextHolder.getRequestAttributes().getAttribute("mainContService2", RequestAttributes.SCOPE_SESSION);
		if(!"".equals(EMFStringUtil.nullConvert(agentnm)))
		{
			agentnm = agentnm.toUpperCase();
		}		
		
		String tempAgentnm = "";
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){	
			if(cookies.length != 0){
				for (int i = 0; i < cookies.length; i++)
				{
					if("agentnm".equals(cookies[i].getName()))
					{
						tempAgentnm = cookies[i].getValue().toUpperCase();
					}
				}
			}
		}
		
		if("".equals(EMFStringUtil.nullConvert(tempAgentnm)))
		{
			//modelMap.addAttribute("msg", "잘못된 접근입니다.");
			modelMap.addAttribute("url", "/"+agentnm+"/agree.do");			
		}
		else
		{
			if(agentnm.equals(tempAgentnm))
			{
				if("Y".equals(useOutsourcingAgree))
				{
					String ci = "", name = "";
					
					EmfMap authMap = (EmfMap)EgovUserDetailsHelper.getIndividualInfAuth();
					
					ci = authMap.getString("ci");
					name = authMap.getString("name");
					
				}
				
				emfMap.put("oscCd", agentnm);
				
				modelMap.put("info", oCAOutsourcingService.selectOutsourcingPageMngInfo(emfMap));
				modelMap.put("prdctList", oCAOutsourcingService.selectOutsourcingPrdctList(emfMap));	// 링크코드에 등록된 상품(결합제품) 목록
				
				modelMap.put("uDlrCd", uDlrCd);
				modelMap.put("uIndcEmpno", uIndcEmpno);
				modelMap.put("uIntgUserId", uIntgUserId);
				if ("LGU".equals(agentnm))
				{
					if (dmEntrNo == null)
					{
						modelMap.put("dmEntrNo", dmEntrNo);
					}
					else
					{
						String[] dmEntrNoArray = dmEntrNo.trim().split("\\s*,\\s*");
						modelMap.put("dmEntrNo", dmEntrNoArray[0]);
						if (dmEntrNoArray.length > 1)
							modelMap.put("dmEntrNo2", dmEntrNoArray[1]);
						if (dmEntrNoArray.length > 2)
							modelMap.put("dmEntrNo3", dmEntrNoArray[2]);
					}
				}
				else
				{
					modelMap.put("dmEntrNo", dmEntrNo);
				}
				modelMap.put("uEntrNo", uEntrNo);
				modelMap.put("uProdNm", uProdNm);
				modelMap.put("uCmmnCd", uCmmnCd);
				modelMap.put("uCmmnCdNm", uCmmnCdNm);
				modelMap.put("uDlrNm", uDlrNm);
				modelMap.put("uProdNo", uProdNo);
				
				modelMap.put("orderNum", orderNum);
				modelMap.put("contractorName", contractorName);
				modelMap.put("contractorBirth", contractorBirth);
				modelMap.put("contractorPhone", contractorPhone);
				modelMap.put("cardCompany", cardCompany);
				modelMap.put("creditCardNum", creditCardNum);
				modelMap.put("validThru", validThru);
				modelMap.put("code2", code2);
				modelMap.put("agentNm", agentNm);
				modelMap.put("agentEmpNm", agentEmpNm);
				modelMap.put("agentEmpTel", agentEmpTel);
				modelMap.put("plateNum", plateNum);
				modelMap.put("orderQty", orderQty);
				modelMap.put("mainContService1", mainContService1);
				modelMap.put("mainContService2", mainContService2);
				
				if (agentnm.equals("EXPIRATION")) agentnm = "RENEW";
				
				url = "front/oc/oca/OCAOutsourcingWrite"+agentnm+".front2";	
			}
			else
			{
				//modelMap.addAttribute("msg", "잘못된 접근입니다.");
				modelMap.addAttribute("url", "/"+agentnm+"/agree.do");
			}
		}
		
		return url; 
	}
	
	/**
     * 신청 정보 저장한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/outsourcing/insert.do", method=RequestMethod.POST)
	public String insertOutsourcingInf(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception
	{
		String url = "error/blank.error";
		
		//String agentnm = (String)RequestContextHolder.getRequestAttributes().getAttribute("outsourcingCode", RequestAttributes.SCOPE_SESSION);
		
		// 동의/인증화면 사용여부
		String useOutsourcingAgree = EgovProperties.getProperty("Globals.useOutsourcingAgree");
		
		String tempAgentnm = "";
		
		boolean isOk = false;
		
		Cookie[] cookies = request.getCookies();
		
		for (int i = 0; i < cookies.length; i++) 
		{
			if("agentnm".equals(cookies[i].getName()))
			{
				tempAgentnm = cookies[i].getValue().toUpperCase();
			}
		}
		
		try
		{	
			if("".equals(EMFStringUtil.nullConvert(tempAgentnm)))
			{
				modelMap.addAttribute("msg", "잘못된 접근입니다.");
				modelMap.addAttribute("url", "/main/index.do");
			}
			else
			{
				EmfMap overrapMap = null;
				// 삼성 상담접수 일경우 AgentCode1 값 저장
				if("SMART".equals(tempAgentnm) || "SMARTMOBILE".equals(tempAgentnm) || "SMARTHOMEPLUS".equals(tempAgentnm)) {
					EmfMap agentMap = oCAOutsourcingService.agentAuthCheck(request, emfMap);
					emfMap.put("agentCode1", agentMap.getString("ci"));
					//emfMap.put("agentCode1", RequestContextHolder.getRequestAttributes().getAttribute("ci", RequestAttributes.SCOPE_SESSION));
					overrapMap = new EmfMap();
					overrapMap.put("cnt", "0");
				} else {
					// 중복가입 검사
					overrapMap = oCAOutsourcingService.getOverrapSid(emfMap);
				}


				if ("0".equals(overrapMap.getString("cnt"))) {
					if ("Y".equals(useOutsourcingAgree)) {
						// 본인 인증 후 세션에 저장된 정보를 가져온다(이름, 생년월일)
						EmfMap authMap = (EmfMap) EgovUserDetailsHelper.getIndividualInfAuth();
						if(authMap == null) {
							url = "redirect:/"+tempAgentnm.toUpperCase()+"/agree.do";
						} else {
							emfMap.put("ci", authMap.getString("ci"));
							emfMap.put("birth", authMap.getString("birth"));
							  
							isOk = oCAOutsourcingService.insertOutsourcingInf(emfMap, request);

							// 신청 완료시 본인인증 정보 세션에서 삭제
					    	RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
					    	
					    	//RequestContextHolder.getRequestAttributes().setAttribute("outsourcingCode", null, RequestAttributes.SCOPE_SESSION);
					    	RequestContextHolder.getRequestAttributes().setAttribute("uDlrCd", null, RequestAttributes.SCOPE_SESSION);
					    	RequestContextHolder.getRequestAttributes().setAttribute("uIndcEmpno", null, RequestAttributes.SCOPE_SESSION);
					    	RequestContextHolder.getRequestAttributes().setAttribute("uIntgUserId", null, RequestAttributes.SCOPE_SESSION);
					    	RequestContextHolder.getRequestAttributes().setAttribute("dmEntrNo", null, RequestAttributes.SCOPE_SESSION);
					    	RequestContextHolder.getRequestAttributes().setAttribute("uEntrNo", null, RequestAttributes.SCOPE_SESSION);
						}					
					} else {
						if("HANSSEM".equals(emfMap.get("b2bStts"))){
							if( "2구좌".equals(emfMap.get("joinProd"))){
								isOk = oCAOutsourcingService.insertOutsourcingInf(emfMap, request);
							}
						} else if ("WEDDING".equals(emfMap.get("b2bStts"))) {
							if( "2구좌".equals(emfMap.get("joinProd"))){
								isOk = oCAOutsourcingService.insertOutsourcingInf(emfMap, request);
							}
						}
						isOk = oCAOutsourcingService.insertOutsourcingInf(emfMap, request);
					}
				} else {
					isOk = false;
				}
				
				if (isOk) {
 					modelMap.addAttribute("msg", "등록되었습니다.");
				} else {
					modelMap.addAttribute("msg", "실패하였습니다. 오늘 접수된 내용입니다.(고객명 + 핸드폰 + 접수코드 + 상품코드)");
				}
				modelMap.addAttribute("url", "/"+tempAgentnm+"/agree.do");
			}	
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
     * 신청 정보 저장한다.(LGU)
     * 
     * @param emfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
//	@RequestMapping(value="/LGU/insert.do", method=RequestMethod.POST)
	public String insertOutsourcingInf_lgu(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception {
		String url = "error/blank.error";
		boolean isOk = false;
		
		try {
			// 중복가입 검사
			EmfMap overrapMap = oCAOutsourcingService.getOverrapSid(emfMap);
			
			if("0".equals(overrapMap.getString("cnt"))) {
				isOk = oCAOutsourcingService.insertOutsourcingInf(emfMap, request);
			} else {
				isOk = false;
			}

			if(isOk) {
				//modelMap.addAttribute("msg", "등록되었습니다.");
				url = "redirect:/LGU/complete.do";
			} else {
				modelMap.addAttribute("msg", "실패하였습니다. 오늘 접수된 내용입니다.(고객명 + 핸드폰 + 접수코드 + 상품코드)");
				modelMap.addAttribute("url", "javascript:history.back(-1)");
			}
								
		} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			throw new EmfException(he.getMessage());
		} 
		
		return url;		
	}
	
	@RequestMapping(value={"/outsourcing/complete.do", "/LGU/complete.do", "/EXPIRATION/complete.do"})
	public String getCompleteView(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/oc/oca/OCAOutsourcingComplete.front2";
	}

	/**
     * 정보 작성화면 (THE ONE)
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
//	@RequestMapping(value="/THEONE/write.do")
	public String getOutsourcingTHEONEWrite(HttpServletRequest request, EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		String url = "error/blank.error";
		
		String agentnm = "THEONE";
		/*
		if(agentnm.toUpperCase().equals("ONLIFECC"))
		{
			modelMap.addAttribute("msg", "잘못된 접근입니다.");
			modelMap.addAttribute("url", "/main/index.do");
			
			return url;
		}
*/
		// 동의/인증화면 사용여부
		String useOutsourcingAgree = EgovProperties.getProperty("Globals.useOutsourcingAgree");
		
		String uDlrCd = (String)RequestContextHolder.getRequestAttributes().getAttribute("uDlrCd", RequestAttributes.SCOPE_SESSION);
		String uIndcEmpno = (String)RequestContextHolder.getRequestAttributes().getAttribute("uIndcEmpno", RequestAttributes.SCOPE_SESSION);
		String uIntgUserId = (String)RequestContextHolder.getRequestAttributes().getAttribute("uIntgUserId", RequestAttributes.SCOPE_SESSION);
		String dmEntrNo = (String)RequestContextHolder.getRequestAttributes().getAttribute("dmEntrNo", RequestAttributes.SCOPE_SESSION);
		String uEntrNo = (String)RequestContextHolder.getRequestAttributes().getAttribute("uEntrNo", RequestAttributes.SCOPE_SESSION);

		if(!"".equals(EMFStringUtil.nullConvert(agentnm)))
		{
			agentnm = agentnm.toUpperCase();
		}
		
		String tempAgentnm = "";
		
		Cookie[] cookies = request.getCookies();
		
		for (int i = 0; i < cookies.length; i++)
		{
			if("agentnm".equals(cookies[i].getName()))
			{
				tempAgentnm = cookies[i].getValue().toUpperCase();
			}
		}
		
		if("".equals(EMFStringUtil.nullConvert(tempAgentnm)))
		{
			//modelMap.addAttribute("msg", "잘못된 접근입니다.");
			modelMap.addAttribute("url", "/"+agentnm+"/agree.do");			
		}
		else
		{
			if(agentnm.equals(tempAgentnm))
			{
				if("Y".equals(useOutsourcingAgree))
				{
					String ci = "", name = "";
					
					EmfMap authMap = (EmfMap)EgovUserDetailsHelper.getIndividualInfAuth();
					
					ci = authMap.getString("ci");
					name = authMap.getString("name");
				}
				
				emfMap.put("oscCd", agentnm);
				
				modelMap.put("info", oCAOutsourcingService.selectOutsourcingPageMngInfo(emfMap));
				modelMap.put("prdctList", oCAOutsourcingService.selectOutsourcingPrdctListTHEONE(emfMap));	// 링크코드에 등록된 상품(결합제품) 목록
				
				modelMap.put("uDlrCd", uDlrCd);
				modelMap.put("uIndcEmpno", uIndcEmpno);
				modelMap.put("uIntgUserId", uIntgUserId);
				modelMap.put("dmEntrNo", dmEntrNo);
				modelMap.put("uEntrNo", uEntrNo);
				
				url = "front/oc/oca/OCAOutsourcingWrite"+agentnm+".front2";	
			}
			else
			{
				//modelMap.addAttribute("msg", "잘못된 접근입니다.");
				modelMap.addAttribute("url", "/"+agentnm+"/agree.do");
			}
		}
		
		return url; 
	}
	
	@RequestMapping(value =  "/outsourcing/agentAuthCheck.ajax", method=RequestMethod.POST)
	public ModelAndView agentAuthCheck(EmfMap paramMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		try {
/*			
			System.out.println("1 : " + paramMap.getString("sllrCtel"));
			System.out.println("2 : " + paramMap.getString("birthDay"));
			System.out.println("3 : " + paramMap.getString("agentEmpNm"));
			System.out.println("4 : " + paramMap.getString("ci"));
*/			
			EmfMap resultMap = oCAOutsourcingService.agentAuthCheck(request, paramMap);

			RequestContextHolder.getRequestAttributes().setAttribute("regIp", EgovNetworkState.getMyIPaddress(request), 1);
			
			if (resultMap == null) {
//				System.out.println("Null");
				RequestContextHolder.getRequestAttributes().setAttribute("authPhoneNo", paramMap.getString("sllrCtel"), 1);
				RequestContextHolder.getRequestAttributes().setAttribute("birthDay", paramMap.getString("birthDay"), 1);
				RequestContextHolder.getRequestAttributes().setAttribute("ci", null, 1);
				mav.addObject("status", "N");
				
			} else {
//				System.out.println("Not Null" + resultMap.getString("cnt"));
				RequestContextHolder.getRequestAttributes().setAttribute("ci", resultMap.getString("ci"), 1);
				mav.addObject("status", "Y");
			}
			
			mav.setViewName("jsonView");
			
		} catch (Exception he) {
			if (log.isDebugEnabled()) {
				log.debug(he.getMessage());
			}
			
			throw new EmfException(he.getMessage());
		}
		
		return mav;
	}
	@RequestMapping(value =  "/outsourcing/agentCdCheck.ajax", method=RequestMethod.POST)
	public ModelAndView agentCdCheck(EmfMap paramMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		try {
//			System.out.println("agentCd : " + paramMap.getString("agentCd"));
			
			EmfMap resultMap = oCAOutsourcingService.agentCdCheck(request, paramMap);
			
			if(resultMap == null){
//				System.out.println("Null");
			}else{
//				System.out.println("Not Null" + resultMap.getString("agentNm"));
				mav.addObject("agentNm", resultMap.getString("agentNm"));
			}
			mav.setViewName("jsonView");
		} catch (Exception he) {
			if (log.isDebugEnabled()) {
				log.debug(he.getMessage());
			}
			throw new EmfException(he.getMessage());
		}
		return mav;
	}

	@RequestMapping(value =  "/outsourcing/phoneAuthSMART.do", method=RequestMethod.POST)
	public String getPhoneAuth(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
		return "front/okname/hs_cnfrm_popup6.pop";
	}

	@RequestMapping({ "/outsourcing/phoneAuthSMART3.do" })
	public String getPhoneAuth3(EmfMap emfMap, ModelMap modelMap) throws Exception {
		return "front/okname/hs_cnfrm_popup7.pop";
	}

	@RequestMapping(value =  "/outsourcing/getPhoneAuthInfSMART.ajax", method=RequestMethod.POST)
	public ModelAndView getPhoneAuthInfSMART(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
		String url = "error/blank.error";
		String ci = "";
		String di = "";
		String name = "";
		String birth = "";
		String telNo = "";
		String sex = "";
		String hp = "";
		
		ModelAndView mav = new ModelAndView();
		
		try {
			List result = new ArrayList();
			result = (List) RequestContextHolder.getRequestAttributes().getAttribute("phoneAuthInfo", 1);
			if ((result.get(5) != "") && (result.get(5) != null)) {
				ci = result.get(5).toString();
				di = result.get(4).toString();
				name = result.get(7).toString();
				birth = result.get(8).toString();
				sex = result.get(9).toString();
				telNo = result.get(12).toString();

				hp = (String) RequestContextHolder.getRequestAttributes().getAttribute("authPhoneNo", 1);

				emfMap.put("ci", ci);
				emfMap.put("di", di);
				emfMap.put("name", name);
				emfMap.put("birth", birth);
				emfMap.put("sex", sex);
				emfMap.put("telNo", telNo);
				emfMap.put("hp", telNo);
				emfMap.put("authPhoneIpinGubun", "1");
				emfMap.put("birthDay", RequestContextHolder.getRequestAttributes().getAttribute("birthDay", 1));
				emfMap.put("regIp", RequestContextHolder.getRequestAttributes().getAttribute("regIp", 1));
/*
				System.out.println(emfMap.getString("ci"));
				System.out.println(emfMap.getString("di"));
				System.out.println(emfMap.getString("name"));
				System.out.println(emfMap.getString("birth"));
				System.out.println(emfMap.getString("sex"));
				System.out.println(emfMap.getString("telNo"));
				System.out.println(emfMap.getString("hp"));
				System.out.println(emfMap.getString("authPhoneIpinGubun"));
				System.out.println(emfMap.getString("birthDay"));
				System.out.println(emfMap.getString("regIp"));
				System.out.println(hp);
*/
				EmfMap resultMap = oCAOutsourcingService.agentAuthCheck(request, emfMap);
				
				if (resultMap != null) {
					mav.addObject("authYn", "R");
					
				} else if (!telNo.equals(hp.replaceAll("-", ""))) {
					mav.addObject("authYn", "H");
					
				} else {
					oCAOutsourcingService.insertAuthInf(emfMap);

					RequestContextHolder.getRequestAttributes().setAttribute("phoneAuthInfo", null, 1);
					RequestContextHolder.getRequestAttributes().setAttribute("ci", ci, 1);
					RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", emfMap, 1);

					mav.addObject("authYn", "Y");
				}
			} else {
				mav.addObject("authYn", "N");
			}
			
			mav.setViewName("jsonView");
			
		} catch (Exception he) {
			if (log.isDebugEnabled()) {
				log.debug(he);
			}
			
			throw new EmfException(he.getMessage());
		}
		return mav;
	}

	@RequestMapping({ "/outsourcing/ipinAuthSMART.do" })
	public String getIpinAuth(EmfMap emfMap, ModelMap modelMap) throws Exception {
		return "front/okname/ipin6.pop";
	}

	@RequestMapping({ "/outsourcing/ipinAuthSMART2.do" })
	public String getIpinAuth3(EmfMap emfMap, ModelMap modelMap) throws Exception {
		return "front/okname/ipin7.pop";
	}

	@RequestMapping(value =  "/outsourcing/getIpinAuthInfSMART.ajax", method=RequestMethod.POST)
	public ModelAndView getIpinAuthInf(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
		String url = "error/blank.error";
		String ci = "";
		String di = "";
		String name = "";
		String birth = "";
		String sex = "";
		String hp = "";
		ModelAndView mav = new ModelAndView();
		try {
			List result = new ArrayList();
			result = (List) RequestContextHolder.getRequestAttributes().getAttribute("ipinAuthInfo", 1);
			if (result.size() > 0) {
				if ((result.get(1).toString() != "") && (result.get(1) != null)) {
					ci = result.get(1).toString();
					di = result.get(0).toString();
					name = result.get(6).toString();
					sex = result.get(9).toString();
					birth = result.get(11).toString();

					hp = (String) RequestContextHolder.getRequestAttributes().getAttribute("authPhoneNo", 1);

					emfMap.put("ci", ci);
					emfMap.put("di", di);
					emfMap.put("name", name);
					emfMap.put("birth", birth);
					emfMap.put("sex", sex);
					emfMap.put("hp", hp);
					emfMap.put("authPhoneIpinGubun", "2");
					emfMap.put("birthDay", RequestContextHolder.getRequestAttributes().getAttribute("birthDay", 1));
					emfMap.put("regIp", RequestContextHolder.getRequestAttributes().getAttribute("regIp", 1));
/*
					System.out.println(emfMap.getString("ci"));
					System.out.println(emfMap.getString("di"));
					System.out.println(emfMap.getString("name"));
					System.out.println(emfMap.getString("birth"));
					System.out.println(emfMap.getString("sex"));
					System.out.println(emfMap.getString("hp"));
					System.out.println(emfMap.getString("authPhoneIpinGubun"));
					System.out.println(emfMap.getString("birthDay"));
					System.out.println(emfMap.getString("regIp"));
*/
					EmfMap resultMap = oCAOutsourcingService.agentAuthCheck(request, emfMap);
					
					if (resultMap != null) {
						mav.addObject("authYn", "R");
						
					} else {
						oCAOutsourcingService.insertAuthInf(emfMap);

						RequestContextHolder.getRequestAttributes().setAttribute("phoneAuthInfo", null, 1);
						RequestContextHolder.getRequestAttributes().setAttribute("ci", ci, 1);
						RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", emfMap, 1);

						mav.addObject("authYn", "Y");
					}
					
				} else {
					mav.addObject("authYn", "N");
				}
				
			} else {
				mav.addObject("authYn", "N");
			}
			
			mav.setViewName("jsonView");
			
		} catch (Exception he) {
			if (log.isDebugEnabled()) {
				log.debug(he);
			}
			
			throw new EmfException(he.getMessage());
		}
		
		return mav;
	}
	
	//카드 본인인증
	@RequestMapping(value =  "/outsourcing/cardAuthSMART.do", method=RequestMethod.POST)
	public String getCardAuth(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
		return "front/okname/hs_cnfrm_card1.pop";
	}
	@RequestMapping({ "/outsourcing/cardAuthSMART2.do" })
	public String getCardAuth2(EmfMap emfMap, ModelMap modelMap) throws Exception {
		return "front/okname/hs_cnfrm_card2.pop";
	}


	@RequestMapping(value = "/outsourcing/bankAccount.ajax")
	public ModelAndView checkBankAccountAjax(EmfMap emfMap, HttpServletRequest request) throws Exception {
		JSON json = new JSON();
		String accountNum = emfMap.getString("accountNum");
		String bankCode = emfMap.getString("bankCode");
		emfMap.put("accountNum", accountNum);
		emfMap.put("bankCode", bankCode);
		Map<String, Object> result = doznBankingService.inquireDepositor(emfMap);
		json.addObject("isSuccess", result.get("result"));
		json.addObject("depositor", result.get("depositor"));
		json.addObject("message", result.get("message"));
		return json;
	}
	@RequestMapping(value =  "/outsourcing/cardAuthLGU.ajax")
	public ModelAndView cardAuthLGU(EmfMap emfMap, HttpServletRequest request) throws Exception {
		INICISPayController inicisPay = new INICISPayController();
		String ip = null;

		EmfMap userLgnMap = (EmfMap) RequestContextHolder.getRequestAttributes().getAttribute("userLgnMap", RequestAttributes.SCOPE_SESSION);
		if(userLgnMap != null) {
			try {
				EmfMap memInfoSso = lGFMemMyService.selectMemInfSso(emfMap, request);
			} catch (Exception he) {
				if (log.isDebugEnabled()) {
					log.debug(he);
				}
				throw new EmfException(he.getMessage());
			}
		}
		request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		ip = request.getRemoteAddr();
		String birth = ((String)((HashMap)emfMap.get("memInfo")).get("birth")).substring(2);
		String name = (String)((HashMap)emfMap.get("memInfo")).get("name");
		String cellPhone = (String)((HashMap)emfMap.get("memInfo")).get("cellPhone");
		String cardMon = emfMap.getString("cardMon");
		String cardYear = emfMap.getString("cardYear");
		String cardExpire = cardYear+cardMon;
		inicisPay.setInicisKey("hmPLjIdyekyylSx9");
		inicisPay.setInicisiv("fS7oGOerwBsEcQ==");
		inicisPay.setData("mid", "daemyungT1");
		inicisPay.setData("clientIp", ip);
		inicisPay.setData("moid", "OID2313151");
		inicisPay.setData("goodName", "상품명");
		inicisPay.setData("buyerName", name);
		inicisPay.setData("buyerEmail", "k");
		inicisPay.setData("buyerTel", cellPhone);
		inicisPay.setData("cardNumber", emfMap.getString("cardNum"));
		inicisPay.setData("cardExpire", cardExpire);
		inicisPay.setData("regNo", birth );

		inicisPay.authBillkey();

		String resultCode = inicisPay.getData("resultCode");
		String resultMsg = inicisPay.getData("resultMsg");
//		String tid = inicisPay.getData("tid");
		String cardNumber = inicisPay.getData("cardNumber");
		cardExpire = inicisPay.getData("cardExpire");
		String billKey = inicisPay.getData("billKey");
		String cardCode = inicisPay.getData("cardCode");
		if(cardCode.equals("01")){
			cardCode = "외한카드";
		}else if(cardCode.equals("03")){
			cardCode = "롯데카드";
		} else if(cardCode.equals("04")){
			cardCode = "현대카드";
		} else if(cardCode.equals("06")){
			cardCode = "국민카드";
		} else if(cardCode.equals("11")){
			cardCode = "비씨카드";
		} else if(cardCode.equals("12")){
			cardCode = "삼성카드";
		} else if(cardCode.equals("14")){
			cardCode = "신한카드";
		} else if(cardCode.equals("15")){
			cardCode = "한미카드";
		} else if(cardCode.equals("16")){
			cardCode = "농협카드";
		} else if(cardCode.equals("17")){
			cardCode = "하나SK카드";
		}

		System.out.println(resultCode);
		System.out.println(resultMsg);
		System.out.println(billKey);
		System.out.println(cardCode);

		JSON json = new JSON();
		json.addObject("cardCode", cardCode);
		json.addObject("cardNumber", cardNumber);
		json.addObject("cardExpire", cardExpire);
		json.addObject("resultCode", resultCode);
		json.addObject("resultMsg", resultMsg);
		json.addObject("billKey", billKey);
		return json;
	}
	@RequestMapping(value =  "/outsourcing/getCardAuthInfSMART.ajax", method=RequestMethod.POST)
	public ModelAndView getCardAuthInf(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
		String url = "error/blank.error";
		String ci = "";
		String di = "";
		String name = "";
		String birth = "";
		String sex = "";
		String hp = "";
		String card = "";
		ModelAndView mav = new ModelAndView();
		try {
			List result = new ArrayList();
			result = (List) RequestContextHolder.getRequestAttributes().getAttribute("cardAuthInfo", 1);
			if (result.size() > 0) {
				if ((result.get(8).toString() != "") && (result.get(8) != null)) {
					ci = result.get(8).toString();
					di = result.get(7).toString();
					name = result.get(3).toString();
					sex = result.get(5).toString();
					birth = result.get(4).toString();
					card = result.get(0).toString();
					hp = (String) RequestContextHolder.getRequestAttributes().getAttribute("authPhoneNo", 1);

					emfMap.put("ci", ci);
					emfMap.put("di", di);
					emfMap.put("name", name);
					emfMap.put("birth", birth);
					emfMap.put("sex", sex);
					emfMap.put("hp", hp);
					emfMap.put("card", card);
					emfMap.put("authPhoneIpinGubun", "3");
					emfMap.put("birthDay", RequestContextHolder.getRequestAttributes().getAttribute("birthDay", 1));
					emfMap.put("regIp", RequestContextHolder.getRequestAttributes().getAttribute("regIp", 1));

					System.out.println(emfMap.getString("ci"));
					System.out.println(emfMap.getString("di"));
					System.out.println(emfMap.getString("name"));
					System.out.println(emfMap.getString("birth"));
					System.out.println(emfMap.getString("sex"));
					System.out.println(emfMap.getString("hp"));
					System.out.println(emfMap.getString("authPhoneIpinGubun"));
					System.out.println(emfMap.getString("birthDay"));
					System.out.println(emfMap.getString("regIp"));

					EmfMap resultMap = oCAOutsourcingService.agentAuthCheck(request, emfMap);
					
					if (resultMap != null) {
						mav.addObject("authYn", "R");
					} else {
						oCAOutsourcingService.insertAuthInf(emfMap);

						RequestContextHolder.getRequestAttributes().setAttribute("phoneAuthInfo", null, 1);
						RequestContextHolder.getRequestAttributes().setAttribute("ci", ci, 1);
						RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", emfMap, 1);

						mav.addObject("authYn", "Y");
					}
					
				} else {
					mav.addObject("authYn", "N");
				}
				
			} else {
				mav.addObject("authYn", "N");
			}
			
			mav.setViewName("jsonView");
			
		} catch (Exception he) {
			if (log.isDebugEnabled()) {
				log.debug(he);
			}
			
			throw new EmfException(he.getMessage());
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/outsourcing/userCheck.ajax", method = RequestMethod.POST)
	public ModelAndView getUserCheck(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {

		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		TimeZone tz = TimeZone.getTimeZone("Asia/Seoul");
		df.setTimeZone(tz);

		Date now = df.parse(df.format(date));
		String limitDate = "2018-12-13 01:00:00";

		ModelAndView mav = new ModelAndView();
		mav.addObject("serverTime", now);

		if (now.before(df.parse(limitDate))) {
			List<EmfMap> loginUserInfo = (List) dmLifeMemService.selectDMLifeMemInf(emfMap).get("info");
//			System.out.println(loginUserInfo.size());
			EmfMap joinProducts = null;
			boolean activeJoinPtc = false;

			if(loginUserInfo.size() == 1) {
				joinProducts = dmLifeMemService.selectJoinPtcList(loginUserInfo.get(0));
				List<EmfMap> joinPtcList = (List<EmfMap>) joinProducts.get("joinPtcList");

				for (int i = 0; i < joinPtcList.size(); i++) {
					String accStat = (String) joinPtcList.get(i).get("accStat");
					if ("정상".equals(accStat)) {
						activeJoinPtc = true;
						break;
					}
				}
			}

			mav.setViewName("front/oc/oca/ajax/OCARenewProductsAjax");
			mav.addObject("activeJoinPtc", activeJoinPtc);
			mav.addObject("joinProducts", joinProducts);
			mav.addObject("user", loginUserInfo);
			mav.addObject("userCount", loginUserInfo.size());
		} else {
			mav.setViewName("jsonView");
			mav.addObject("EXPIRE", true);
		}

//		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value="/EXPIRATION/insert.do", method=RequestMethod.POST)
	public String setRenewInfo(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception
	{
		String url = "error/blank.error";
		
		try {				
//			중복가입 검사
//			EmfMap overrapMap = oCAOutsourcingService.getOverrapSid(emfMap);
			log.info(emfMap);
			
			oCAOutsourcingService.insertOutsourcingInf(emfMap, request);
			url = "redirect:/EXPIRATION/complete.do";
								
		} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			throw new EmfException(he.getMessage());
		} 
		
		return url;		
	}
}

