﻿<%@page import="kcb.jni.Okname"%>
<%@ page import="java.io.*, java.util.*, java.text.SimpleDateFormat, java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
    //**************************************************************************
	// 파일명 : hs_cnfrm_popup2.jsp
	//
	// 본인확인서비스 개인정보 암호화 및 인증페이지 호출 화면
    //
    // ※주의
    // 	실제 운영시에는 
    // 	response.write를 사용하여 화면에 보여지는 데이터를 
    // 	삭제하여 주시기 바랍니다. 방문자에게 사이트데이터가 노출될 수 있습니다.
    //**************************************************************************

	
	/**************************************************************************
	 * okname 본인확인서비스 파라미터
	 **************************************************************************/
	String name 		= "x";											// 성명 
	String birthday 	= "x";											// 생년월일 
	String sex 			= "x";											// 성별
	String nation		= "x";											// 내외국인구분 
	String telComCd 	= "x";											// 이동통신사코드 
	String telNo 		= "x";											// 휴대폰번호
	
	//String inTpBit 		= request.getParameter("in_tp_bit");			// 입력구분코드
	String inTpBit 		= "0";
	
	if(!inTpBit.matches("^[0-9]*")) {
		out.println("<script>alert('입력구분코드에 유효하지 않은 문자열이 있습니다.'); self.close();</script>");
		return;
	}
	int inTpBitVal = Integer.parseInt(inTpBit);

	String rqstCausCd	=	request.getParameter("rqst_caus_cd");	// 인증요청사유코드 2byte  (00:회원가입, 01:성인인증, 02:회원정보수정, 03:비밀번호찾기, 04:상품구매, 99:기타)

	if(!rqstCausCd.matches("^[0-9]*")) {
		out.println("<script>alert('인증요청사유코드에 유효하지 않은 문자열이 있습니다.'); self.close();</script>");
		return;
	}

	// ########################################################################
	// # KCB로부터 부여받은 회원사코드(아이디) 설정 (12자리)
	// ########################################################################
	String memId = "V18290000000";										// 회원사코드(아이디)

	// ########################################################################
	// # 회원사 모듈설치서버 IP 및 회원사 도메인 설정
	// ########################################################################
	String serverIp = "x";												// 모듈이 설치된 서버IP (서버IP검증을 무시하려면 'x'로 설정)
	String siteDomain = "ok-name.co.kr";								// 회원사 도메인. (휴대폰인증번호 발송시 제휴사명에 노출)
	
	// 거래일련번호 ( 20자리의 문자열. 0-9,A-Z,a-z 사용.)
	/**  거래 일련 번호는 아래와 같이 생성하는 것을 추천. *********************************
	** 별도 생성하여 사용할 경우 동일 거래번호를 두번 사용할 수 없는 것에 주의하여 작성. **/
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	String svcTxSeqno = df.format(cal.getTime()); 
	//**********************************************************************************/
	
	// 예약 항목
	String rsv1 = "0";					// 예약 (고정값 '0')
	String rsv2 = "0";					// 예약 (고정값 '0')
	String rsv3 = "0";					// 예약 (고정값 '0')
	
	String hsCertMsrCd	=	"10";		// 인증수단코드 2byte  (10:핸드폰)
	
	//String returnMsg = "x";
	String returnMsg = request.getParameter("rMsg");

	// ########################################################################
	// # 리턴 URL 설정
	// ########################################################################
	// opener(hs_cnfrm_popup1.jsp)의 도메일과 일치하도록 설정해야 함. 
	// (http://www.test.co.kr과 http://test.co.kr는 다른 도메인으로 인식하며, http 및 https도 일치해야 함)
	String returnUrl = "https://"+request.getServerName()+"/outsourcing/phoneAuthSMART3.do";// 본인인증 완료후 리턴될 URL (도메인 포함 full path)
	//String returnUrl = "http://"+request.getServerName()+":8080/outsourcing/phoneAuthSMART3.do";// 본인인증 완료후 리턴될 URL (도메인 포함 full path)
	
	// ########################################################################
	// # 운영전환시 변경 필요
	// ########################################################################
	//String endPointUrl = "http://tsafe.ok-name.co.kr:29080/KcbWebService/OkNameService";	// 테스트 서버
     String endPointUrl = "http://safe.ok-name.co.kr/KcbWebService/OkNameService";		// 운영 서버
	
	// ########################################################################
	// # 로그 경로 지정 및 권한 부여 (절대경로)
	// ########################################################################
	//String logPath = "C:\\okname\\log";
	String logPath = "/home/okname/phone/log";	// 리눅스용

	// ########################################################################
	// # 옵션값에 'L'을 추가하는 경우에만 로그(logPath변수에 설정된)가 생성됨.
	// # 시스템(환경변수 LANG설정)이 UTF-8인 경우 'U'옵션 추가 ex)$option='QLU'
	// ########################################################################
	String options = "QLU";			// Q:인증요청데이터 암호화

	String[] cmd = new String[21];
	cmd[0]=svcTxSeqno;
	cmd[1]=name;
	cmd[2]=birthday;
	cmd[3]=sex;
	cmd[4]=nation;
	cmd[5]=telComCd;
	cmd[6]=telNo;
	cmd[7]=rsv1;
	cmd[8]=rsv2;
	cmd[9]=rsv3;
	cmd[10]=returnMsg;
	cmd[11]=returnUrl;
	cmd[12]=inTpBit;
	cmd[13]=hsCertMsrCd;
	cmd[14]=rqstCausCd;
	cmd[15]=memId;
	cmd[16]=serverIp;
	cmd[17]=siteDomain;
	cmd[18]=endPointUrl;
	cmd[19]=logPath;
	cmd[20]=options;

	
	/*for(int i=0; i<cmd.length; i++) {
		out.println(cmd[i]+" ");
	}
	out.println("<br/>");*/
	
	
	/**************************************************************************
	okname 응답 정보
	**************************************************************************/
	String retcode = null;		
	String retmsg = "";
	String e_rqstData = "";

	/**************************************************************************
	okname 실행
	**************************************************************************/
	List result = new ArrayList();	// 인증결과
	int ret = -999;			// 프로세스 리턴값
	try {
		kcb.jni.Okname okname = new kcb.jni.Okname();
		
		ret = okname.exec(cmd, result);
     
		if (ret == 0) {//성공일 경우 변수를 결과에서 얻음
			retcode = (String)result.get(0);
			e_rqstData = (String)result.get(2);
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

//	out.println("ret="+ret+"<br/>");
	
	/**************************************************************************
	hs_cnfrm_popup3.jsp 실행 정보(SOAP호출에서는 사용하지 않고 POPUP시에만 사용함)
	**************************************************************************/
	String targetId = "";// 타겟ID (결과를 전달할 팝업이 따로 있을 경우 해당 팝업명(window.name 설정값)을 설정. 일반적으로 ""으로 설정)
	 
	// ########################################################################
	// # 운영전환시 변경 필요
	// ########################################################################
    //String commonSvlUrl = "https://tsafe.ok-name.co.kr:2443/CommonSvl";	// 테스트 URL
    String commonSvlUrl = "https://safe.ok-name.co.kr/CommonSvl";	// 운영 URL
%>


<html>
<title>KCB 본인확인서비스 샘플</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">

	function request(){

		window.name = "<%=targetId%>";

		document.form1.action = "<%=commonSvlUrl%>";
		document.form1.method = "post";

		document.form1.submit();
	}
</script>
</head>

<body>
	<form name="form1">
	<!-- 인증 요청 정보 -->
	<!--// 필수 항목 -->
	<input type="hidden" name="tc" value="kcb.oknm.online.safehscert.popup.cmd.P901_CertChoiceCmd"/>				<!-- 변경불가-->
	<input type="hidden" name="rqst_data"		value="<%=e_rqstData%>"/>		<!-- 요청데이터 -->
	<input type="hidden" name="target_id"		value="<%=targetId%>"/>			<!-- 타겟ID --> 
	<!-- 필수 항목 //-->	
	</form>
		

</body>
<%
 	if ("B000".equals(retcode)) {
		//인증요청
		out.println("<script>request();</script>");
	} else {
		//요청 실패 페이지로 리턴
		out.println("<script>alert('"+retcode+"'); self.close(); </script>");
	}
%>
</html>


