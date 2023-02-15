<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page import="java.io.*, java.util.*, java.text.SimpleDateFormat, java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	//**************************************************************************
	// 파일명 : hs_cnfrm_popup3.jsp
	//
	// 본인확인서비스 결과 화면(return url)
	// 암호화된 인증결과정보를 복호화한다.
	//**************************************************************************

	/* 세션체크 다이렉트 접근 불허 */
	String phoneAuthCheck = (String)session.getAttribute("phoneAuthCheck");
	session.removeAttribute("phoneAuthCheck");
	if(phoneAuthCheck != "Y") {
		out.println("<script>alert('정상적인 접근이 아닙니다.'); self.close();</script>");
		return;
	}
	
	/* 공통 리턴 항목 */
	String rqstSiteNm =	request.getParameter("rqst_site_nm");			// 접속도메인	
	String rqstCausCd =	request.getParameter("hs_cert_rqst_caus_cd");	// 인증요청사유코드 2byte  (00:회원가입, 01:성인인증, 02:회원정보수정, 03:비밀번호찾기, 04:상품구매, 99:기타) 

	/**************************************************************************
	 * 모듈 호출	; 본인확인서비스 결과 데이터를 복호화한다.
	 **************************************************************************/
	 // 인증결과 암호화정보
	String encInfo = request.getParameter("encInfo");
	//KCB서버 공개키와 서명값
	String WEBPUBKEY = request.getParameter("WEBPUBKEY") == null || "".equals(request.getParameter("WEBPUBKEY").trim()) ? "" : request.getParameter("WEBPUBKEY").trim();
	String WEBSIGNATURE = request.getParameter("WEBSIGNATURE") == null || "".equals(request.getParameter("WEBSIGNATURE").trim()) ? "" : request.getParameter("WEBSIGNATURE").trim();

	// 파라미터 유효성 검증
	if(!encInfo.matches("^[0-9a-zA-Z+/=]*")) {out.print("입력 값 확인이 필요합니다"); return;}
	if(!WEBPUBKEY.matches("^[0-9a-zA-Z+/=]*")) {out.print("입력 값 확인이 필요합니다"); return;}
	if(!WEBSIGNATURE.matches("^[0-9a-zA-Z+/=]*")) {out.print("입력 값 확인이 필요합니다"); return;}

    // 모듈 파라미터 설정.

	// ########################################################################
	// # KCB로부터 부여받은 회원사코드(아이디) 설정 (12자리)
	// ########################################################################
	String memId = "V18290000000";										// 회원사코드(아이디)

	// ########################################################################
	// # 운영전환시 변경 필요
	// ########################################################################
	//String endPointUrl = "http://tsafe.ok-name.co.kr:29080/KcbWebService/OkNameService";	//테스트 endPointUrl
    String endPointUrl = "http://safe.ok-name.co.kr/KcbWebService/OkNameService";		// 운영 endPointUrl

	// ########################################################################
	// # 암호화키 파일 설정 (절대경로) - 파일은 주어진 파일명으로 자동 생성되며 생성되지 않으면 S211오류가 발생됨
	// # 파일은 매월초에 갱신되며 만일 파일이 갱신되지 않으면 복화화데이터가 깨지는 현상이 발생됨.
	// ########################################################################
	//String keyPath = "C:\\project\\#okname\\safecert_"+memId+".key";		// 테스트 키파일(윈도우용)
	String keyPath = "/home/dmlifeweb/www/okname/phone/key/safecert_"+memId+"_mng.key";		// 운영 키파일(리눅스용)

	// ########################################################################
	// # 로그 경로 지정 및 권한 부여 (hs_cnfrm_popup2.jsp에서 설정된 값)
	// ########################################################################
	//String logPath = "C:\\okname\\log";
	String logPath = "/home/dmlifeweb/www/okname/phone/log";	// 리눅스용

	// ########################################################################
	// # 옵션값에 'L'을 추가하는 경우에만 로그(logPath변수에 설정된)가 생성됨.
	// # 시스템(환경변수 LANG설정)이 UTF-8인 경우 'U'옵션 추가 ex)$option='SLU'
	// ########################################################################
	String options ="SUL";			// S:인증결과복호화

	String[] cmd = new String[8];
	cmd[0]=keyPath;
	cmd[1]=memId;
	cmd[2]=endPointUrl;
	cmd[3]=WEBPUBKEY;
	cmd[4]=WEBSIGNATURE;
	cmd[5]=encInfo;
	cmd[6]=logPath;
	cmd[7]=options;

	/*
	for(int i=0; i<cmd.length; i++) {
		out.println(cmd[i]+" ");
	}
	out.println("<br/>");
	*/
	
	String retcode = null;
	List result = new ArrayList(); 		//인증결과
	int ret = -999;
	try {
		kcb.jni.Okname okname = new kcb.jni.Okname();
		ret = okname.exec(cmd, result);
	
		// okname 모듈 프로그램 반환값 출력
		if (ret == 0) {//성공일 경우 변수를 결과에서 얻음
			retcode = (String)result.get(0);
		
			session.setAttribute("phoneAuthInfo", result);
		}
		else {
			java.text.DecimalFormat dcf = new java.text.DecimalFormat("000");
			if(ret <=200) {
				retcode = "B" + dcf.format(ret);
			}
			else {
				retcode = "S" + dcf.format(ret);
			}
		}
	}
    catch(Exception e) {
        e.printStackTrace();
    }
	//out.println("ret=" + ret + "<br/>");
%>
<title>KCB 본인확인서비스 샘플</title>
<script language="javascript" type="text/javascript" >
	function fncOpenerSubmit() {
		opener.document.kcbResultForm.result_cd.value = "<%=retcode%>";
<%	if (ret == 0) { %>
		opener.document.kcbResultForm.result_msg.value = "<%=result.get(1)%>";
		opener.document.kcbResultForm.di.value = "<%=result.get(4)%>";
		opener.document.kcbResultForm.ci.value = "<%=result.get(5)%>";
		opener.document.kcbResultForm.name.value = "<%=result.get(7)%>";
		opener.document.kcbResultForm.birthday.value = "<%=result.get(8)%>";
		opener.document.kcbResultForm.sex.value = "<%=result.get(9)%>";
		opener.document.kcbResultForm.tel_com_cd.value = "<%=result.get(11)%>";
		opener.document.kcbResultForm.tel_no.value = "<%=result.get(12)%>";
		opener.document.kcbResultForm.return_msg.value = "<%=result.get(16)%>";
<%	} %>

		opener.document.kcbResultForm.action = "/auth/getPhoneAuthInf.do";
		opener.document.kcbResultForm.submit();
		
		self.close();
	}	
</script>
</head>
<body>
	<%--
	//**************************************************************************
	// 복호화된 본인확인 결과 데이터 
	// 개발시 확인 용도로 사용하며 운영시 주석 또는 삭제 처리 필요
	//**************************************************************************
	--%>
	<input type="hidden" name="고객사코드"		 value="<%=memId%>"/>
	<input type="hidden" name="접속도메인"		 value="<%=rqstSiteNm%>"/>
	<input type="hidden" name="인증요청사유코드" value="<%=rqstCausCd%>"/>
 	<input type="hidden" name="결과코드"		 value="<%=retcode%>"/>
<%	if (ret == 0) { %>
	<input type="hidden" name="처리결과메시지"		value="<%=result.get(1)%>"/>		 
	<input type="hidden" name="거래일련번호"		value="<%=result.get(2)%>"/>		 
	<input type="hidden" name="인증일시"			value="<%=result.get(3)%>"/>		 
	<input type="hidden" name="DI"					value="<%=result.get(4)%>"/>		 
	<input type="hidden" name="CI"					value="<%=result.get(5)%>"/>		 
	<input type="hidden" name="성명"				value="<%=result.get(7)%>"/>		 
	<input type="hidden" name="생년월일"			value="<%=result.get(8)%>"/>		 
	<input type="hidden" name="성별"				value="<%=result.get(9)%>"/>		 
	<input type="hidden" name="내외국인구분"		value="<%=result.get(10)%>"/>	 
	<input type="hidden" name="통신사코드"			value="<%=result.get(11)%>"/>	 
	<input type="hidden" name="휴대폰번호"			value="<%=result.get(12)%>"/>	 
	<input type="hidden" name="리턴메시지"			value="<%=result.get(16)%>"/>	 
<%	} %>
</body>
<%
	if (ret == 0) {
		//인증결과 복호화 성공
		// 인증결과를 확인하여 페이지분기등의 처리를 수행해야한다.
		if ("B000".equals(retcode)) {
			out.println("<script>alert('본인인증성공'); fncOpenerSubmit();</script>");
		}
		else {
			out.println("<script>alert('본인인증실패 : "+result.get(1)+"'); fncOpenerSubmit();</script>");
		}
	} else {
		//인증결과 복호화 실패
		out.println("<script>alert('인증결과복호화 실패 : "+retcode+"'); self.close(); </script>");
	}
%>
</html>

