<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>  
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%	
	// KCB 테스트서버를 호출할 경우
	//String idpUrl    = "https://tmpin.ok-name.co.kr:5443/tis/ti/POTI90B_SendCertInfo.jsp";
	// KCB 운영서버를 호출할 경우
	String idpUrl    = "https://ipin.ok-name.co.kr/tis/ti/POTI90B_SendCertInfo.jsp";

	// 아이핀 인증을 마치고 돌아올 페이지 주소. opener(ipin1.jsp)의 도메일과 일치하도록 설정해야 함.
	// (http://www.test.co.kr과 http://test.co.kr는 다른 도메인으로 인식하며, http 및 https도 일치해야 함)
	String returnUrl = "https://"+request.getServerName()+"/auth/ipinAuth2.do";		
	//String returnUrl = "http://"+request.getServerName()+":8080/auth/ipinAuth2.do";


	String idpCode   = "V";				//웹사이트 선호본인확인기관(KCB기관)코드
	String moduleType= "4";				//서버에 설치된 okname모듈의 유형 (1:exe, 2:com+, 3:php_ext, 4:jni)
	String cpCode    = "V18290000000";	//회원사코드 (테스트인 경우 'P00000000000'를 사용하며 운영시 발급받은 회원사코드를 설정)

	// 암호화키 파일 설정 (절대경로) - 파일은 주어진 파일명으로 자동 생성되며 매월마다 갱신됨. 웹서버에 해당파일을 생성할 권한 필요.
	//String keyPath = "C:\\okname\\ipin\\key\\okname_test.key";	// 테스트 키파일
	String keyPath = "/home/dmlifeweb/www/okname/ipin/key/okname_mng.key";	// 운영 키파일

	String rsv1 = "0";//reserved1
	String rsv2 = "0";//reserved2

	// endPointUrl
	//String endPointUrl = "http://twww.ok-name.co.kr:8888/KcbWebService/OkNameService";//테스트 서버
	String endPointUrl = "http://www.ok-name.co.kr/KcbWebService/OkNameService";// 운영 서버
	
	// 로그 경로 지정 및 권한 부여 (절대경로)
	// options값에 'L'을 추가하는 경우에만 로그가 생성됨.
	
	//String logPath = "C:\\okname\\ipin\\log";// logPath
	String logPath = "/home/dmlifeweb/www/okname/ipin/log";// logPath
	String options = "CUL";// options
	
	String[] cmd = new String[7];
	cmd[0]=keyPath;
	cmd[1]=cpCode;
	cmd[2]=rsv1;
	cmd[3]=rsv2;
	cmd[4]=endPointUrl;
	cmd[5]=logPath;
	cmd[6]=options;

	/*
	for(int i=0; i<cmd.length; i++) {
		out.println(cmd[i]+" ");
	}
	out.println("<br/>");
	*/
	
	String s = "", pubkey = "", sig = "", curtime = "";
	
	String retcode = null;
	List result = new ArrayList();	// 인증결과
	int ret = -999;
	try {
		kcb.jni.Okname okname = new kcb.jni.Okname();
		ret = okname.exec(cmd, result);
	
		// 외부 프로그램 반환값 출력 (이 부분은 필수가 아님)
		java.text.DecimalFormat dcf = new java.text.DecimalFormat("000");
		if (ret == 0) {//성공일 경우 변수를 결과에서 얻음
			retcode = "B" + dcf.format(ret);
			pubkey 	= (String)result.get(0);   //client publickey
			sig 	= (String)result.get(1);   //client signature
			curtime	= (String)result.get(2);   //cprequestnum
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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script language="JavaScript">
//<!--
function certKCBIpin(){
	document.kcbInForm.target = "_self";

	//KCB 테스트서버를 호출할 경우
	//document.kcbInForm.action = "https://tmpin.ok-name.co.kr:5443/tis/ti/POTI01A_LoginRP.jsp";

	//KCB 운영서버를 호출할 경우
	document.kcbInForm.action = "https://ipin.ok-name.co.kr/tis/ti/POTI01A_LoginRP.jsp";

	document.kcbInForm.submit();
	return	;
}
//-->
</script>
</head>
<body>
	<form name="kcbInForm" method="post" >
		<input type="hidden" name="IDPCODE" value="<%=idpCode%>" />
		<input type="hidden" name="IDPURL" value="<%=idpUrl %>" />
		<input type="hidden" name="CPCODE" value="<%=cpCode%>" />	
		<input type="hidden" name="CPREQUESTNUM" value="<%=curtime%>" />
		<input type="hidden" name="RETURNURL" value="<%=returnUrl %>" />
		<input type="hidden" name="WEBPUBKEY" value="<%=pubkey%>" />
		<input type="hidden" name="WEBSIGNATURE" value="<%=sig%>" />
		<input type="hidden" name="MODULETYPE" value="<%=moduleType%>" />
		
		<input type="hidden" name="FILLER01" value="<%=request.getParameter("rMsg")%>" />
	</form>	
</body>
<%
	if ("B000".equals(retcode)) {
		out.println("<script>certKCBIpin();</script>");
	} else {
		out.println("<script>alert('"+retcode+"'); self.close(); </script>");
	}
%>
</html>