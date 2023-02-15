<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>  
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
	//아이핀으로부터 받는 parameter는  encPsnlInfo, WEBPUBKEY, WEBSIGNATURE으로 대소문자 동일하여야 한다.
    //아이핀팝업에서 조회한 PERSONALINFO이다.
	String encPsnlInfo = request.getParameter("encPsnlInfo");
	//KCB서버 공개키
	String WEBPUBKEY = request.getParameter("WEBPUBKEY") == null || "".equals(request.getParameter("WEBPUBKEY").trim()) ? "" : request.getParameter("WEBPUBKEY").trim();
	//KCB서버 서명값
	String WEBSIGNATURE = request.getParameter("WEBSIGNATURE") == null || "".equals(request.getParameter("WEBSIGNATURE").trim()) ? "" : request.getParameter("WEBSIGNATURE").trim();

	// 파라미터 유효성 검증
	if(!encPsnlInfo.matches("^[0-9a-zA-Z+/=]*")) {out.print("입력 값 확인이 필요합니다"); return;}
	if(!WEBPUBKEY.matches("^[0-9a-zA-Z+/=]*")) {out.print("입력 값 확인이 필요합니다"); return;}
	if(!WEBSIGNATURE.matches("^[0-9a-zA-Z+/=]*")) {out.print("입력 값 확인이 필요합니다"); return;}
	
	// 회원사코드
	String cpCode    = "V18290000000";				//중복가입확인정보 생성을 위한 사이트 식별번호 (회원사코드를 사용)
	
	// endPointUrl
	//String endPointUrl = "http://twww.ok-name.co.kr:8888/KcbWebService/OkNameService";// 테스트 서버
	String endPointUrl = "http://www.ok-name.co.kr/KcbWebService/OkNameService";// 운영 서버

    // 암호화키 파일 설정 (ipin2.jsp에서 설정된 값과 동일)
	//String keyPath = "C:\\okname\\ipin\\key\\okname_test.key";	// 테스트 키파일
	String keyPath = "/home/dmlifeweb/www/okname/ipin/key/okname_mng.key";	// 운영 키파일

    // 로그 경로 지정 및 권한 부여 (ipin2.jsp에서 설정된 값과 동일)
	//String logPath = "C:\\okname\\ipin\\log";// logPath
	String logPath = "/home/dmlifeweb/www/okname/ipin/log";// logPath
	String options ="SUL";			// S:인증결과복호화

	String[] cmd = new String[8];
	cmd[0]=keyPath;
	cmd[1]=cpCode;
	cmd[2]=endPointUrl;
	cmd[3]=WEBPUBKEY;
	cmd[4]=WEBSIGNATURE;
	cmd[5]=encPsnlInfo;
	cmd[6]=logPath;
	cmd[7]=options;

	/*
	for(int i=0; i<cmd.length; i++) {
		out.println(cmd[i]+" ");
	}
	out.println("<br/>");
	*/
	
	String retcode = null;
	ArrayList result = new ArrayList(0); 		//인증결과
	int ret = -999;		
	try {
		kcb.jni.Okname okname = new kcb.jni.Okname();
		ret = okname.exec(cmd, result);

		java.text.DecimalFormat dcf = new java.text.DecimalFormat("000");
		if (ret == 0) {//성공일 경우 변수를 결과에서 얻음
			retcode = "B" + dcf.format(ret);
		
			session.setAttribute("ipinAuthInfo", result);
		}
		else {
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
<script language="JavaScript">

function fncOpenerSubmit() {

<%	if (ret == 0) { %>	
	opener.document.kcbOutForm.dupinfo.value 			= "<%=result.get(0) %>";
	opener.document.kcbOutForm.coinfo1.value            = "<%=result.get(1) %>";
	opener.document.kcbOutForm.coinfo2.value            = "<%=result.get(2) %>";
	opener.document.kcbOutForm.realname.value 			= "<%=result.get(6) %>";
	opener.document.kcbOutForm.sex.value 				= "<%=result.get(9) %>";
	opener.document.kcbOutForm.birthdate.value 			= "<%=result.get(11)%>";
	opener.document.kcbOutForm.return_msg.value 			= "<%=request.getParameter("FILLER01")%>";
	
<%	} %>	
	//opener.document.kcbOutForm.action = "/auth/ipinAuth3.do";

	window.opener.returnIpinAuth();

/* 	opener.document.kcbOutForm.action = "/auth/getIpinAuthInf.do";
	opener.document.kcbOutForm.submit(); */
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
	<input type="hidden" name="retcode" value="<%=retcode%>"/>
<%	if (ret == 0) { %>
	<input type="hidden" name="dupinfo"         value="<%=result.get(0) %>"/>
	<input type="hidden" name="coinfo1"  		value="<%=result.get(1) %>"/>
	<input type="hidden" name="coinfo2"  		value="<%=result.get(2) %>"/>
	<input type="hidden" name="ciupdate"  		value="<%=result.get(3) %>"/>
	<input type="hidden" name="virtualno"   	value="<%=result.get(4) %>"/>
	<input type="hidden" name="cpcode"          value="<%=result.get(5) %>"/>
	<input type="hidden" name="realname"  		value="<%=result.get(6) %>"/>
	<input type="hidden" name="cprequestnumber" value="<%=result.get(7) %>"/>
	<input type="hidden" name="age"  			value="<%=result.get(8) %>"/>
	<input type="hidden" name="sex"  			value="<%=result.get(9) %>"/>
	<input type="hidden" name="nationalinfo"  	value="<%=result.get(10)%>"/>
	<input type="hidden" name="birthdate"  		value="<%=result.get(11)%>"/>
	<input type="hidden" name="authinfo"        value="<%=result.get(12)%>"/>
<%	} %>
</body>
<%
	if (ret == 0) {
		//인증결과 복호화 성공
		out.println("<script>alert('본인인증성공'); fncOpenerSubmit();</script>");
	} else {
		//인증결과 복호화 실패
		out.println("<script>alert('인증결과복호화 실패 : "+retcode+"'); self.close(); </script>");
	}
%>
</html>