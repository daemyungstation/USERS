<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf"%>
<!doctype html>
<html lang="ko">
	<head> 
		<meta charset="utf-8" />
		<title>::::대명아임레디::::</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,maximum-scale=1.0,minimum-scale=1.0,target-densitydpi=medium-dpi" />
		<meta name="author" content="<fmt:message key="Globals.httpUrl" />" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name = "format-detection" content="telephone=no"/>
		<meta property="og:type" content="article" />
		<meta property="og:site_name" content="대명아임레디" />
		<meta property="og:title" content="대명아임레디 2016" />
		<meta property="og:description" content="대명아임레디" />
		<meta property="og:image" content="<fmt:message key="Globals.httpUrl" />/common/images/logo.gif" />
		<link rel="shortcut icon" href="javascript:" />
		<link rel="stylesheet" href="/common/css/mobile_m.css" />
		<script type="text/javascript" src="/common/js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="http://mtag.mman.kr/roianal.mezzo/tracking?cmp_no=208&depth=1"></script>
		<script type="text/javascript">
			function checkdate()
			{
				document.frm_search.submit();
				return;
			}
		</script>
	</head>
	<body>
		<div id="contents">
			<div class="header_2">
				<span style="display:inline-block; padding-top:8px;"><strong>[투어몰전용] 회원정보</strong></span>

			</div> 
			<br />
			<div class="st2pi">
					<!-- 날짜 가져오기 -->
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate var="nowDt" value="${now}" pattern="yyyyMMdd" />	

				
				<img src="/common/images/btn/nemo.png" width="8" height="15px" />
				<strong>회원 검색 정보</strong>
				</br>
								</br>
				<div>
					<form name="frm_search" method="post" action="/dmlsourcing/dmtourmall.do">
						<div>							
							회원번호 : &nbsp;<input name="accntno" id="accntno" type="input" style="width:150px" value=""/> &nbsp;&nbsp;&nbsp;&nbsp;															
							<input type="button" name="btnchek" value=" 검색   " onclick="checkdate()">
						</div>
					</form>
				</div>

				<table border="0" cellspacing="0" cellpadding="0" class="List">
					<tr>
						<td class="titA">구분</td>
						<td class="titA">내용</br</td>

					</tr>
					
					<c:forEach var="list" items="${rtnMap.list}">
						<c:set var="memnm" value="${list.memNm}" />
						<c:set var="cell" value="${list.cell}" />
						<c:set var="joindt" value="${list.joinDt}" />	
						
						<tr>
							<td class="tit7"><strong>회원명 </td>
							<td class="tit4">${memnm}</td>						
						</tr> 
																<tr>
							<td class="tit7"><strong>전화번호 </td>
							<td class="tit4">${cell}</td>						
						</tr> 
						<tr>
							<td class="tit7"><strong>가입일 </td>
							<td class="tit4">${joindt}</td>						
						</tr> 
				
						<tr>
							<td class="titA">&nbsp;</td>
							<td class="titA">&nbsp;</td>						
						</tr> 	
					</c:forEach>
																		
				</table>

				</br>			
			 </div>
		</div>
	</body>
</html>