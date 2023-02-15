<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf"%>
<!doctype html>
<html lang="ko">
	<head> 
		<meta charset="utf-8" />
		<title>::::대명라이프웨이::::</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,maximum-scale=1.0,minimum-scale=1.0,target-densitydpi=medium-dpi" />
		<meta name="author" content="<fmt:message key="Globals.httpUrl" />" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name = "format-detection" content="telephone=no"/>
		<meta property="og:type" content="article" />
		<meta property="og:site_name" content="대명라이프웨이" />
		<meta property="og:title" content="대명라이프웨이 2016" />
		<meta property="og:description" content="대명라이프웨이" />
		<meta property="og:image" content="<fmt:message key="Globals.httpUrl" />/common/images/logo.gif" />
		<link rel="shortcut icon" href="javascript:" />
		<link rel="stylesheet" href="/common/css/mobile_m.css" />
		<script type="text/javascript" src="/common/js/jquery-1.8.2.min.js"></script>
<%-- 
		<script type="text/javascript" src="http://mtag.mman.kr/roianal.mezzo/tracking?cmp_no=208&depth=1"></script>
--%>		
		<script type="text/javascript">
			function checkdate()
			{
				var frm = document.frm_search;
				
				if(frm.name.value.trim() == "" && frm.cell.value.trim() == ""){
					alert('회원명, 전화번호 중 1개 이상은 필수입력 항목입니다.');
					return;
				}
				
				frm.submit();
				return;
			}
		</script>
	</head>
	<body>
		<div id="contents">
			<div class="header_2">
				<span style="display:inline-block; padding-top:8px;"><strong>[의전전용] 회원정보</strong></span>
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
					<form name="frm_search" method="post" action="/dmlsourcing/dmevent.do">
					<div> 							
						회원명 : &nbsp;<input name="name" id="name" type="input" style="width:50px" value="${emfMap.name}"/> &nbsp;&nbsp;&nbsp;&nbsp;
						전화번호 : &nbsp;<input name="cell" type="tel" style="width:100px" maxlength="13" value="${emfMap.cell}" />&nbsp;&nbsp;
<%-- 
						<select id="searchType" name="searchType">
							<option value="1" <c:if test="${emfMap.searchType eq '1'}">selected</c:if>>회원명</option>
							<option value="2" <c:if test="${emfMap.searchType eq '2'}">selected</c:if>>전화번호</option>
							<option value="3" <c:if test="${emfMap.searchType eq '3'}">selected</c:if>>회원명 + 전화번호</option>
						</select>	
						<input name="searchValue" id="searchValue" type="input" style="width:50px" value="${emfMap.searchValue}"/>
--%>											
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
						<c:set var="accnt_no" value="${list.accnt_no}" />
						<c:set var="memnm" value="${list.memNm}" />
						<c:set var="cell" value="${list.cell}" />
						<c:set var="birth" value="${list.birth}" />
						<c:set var="prod_nm" value="${list.prodNm}" />	
						<c:set var="trucnt" value="${list.trueCnt}" />
						<c:set var="totamt" value="${list.totAmt}" />	
						<c:set var="diffa" value="${list.diffaAmt}" />	
						<c:set var="diffb" value="${list.diffbAmt}" />	
						<c:set var="diffc" value="${list.diffcAmt}" />	
						<c:set var="diffamt" value="${list.diffAmt}" />		
						<tr>
							<td class="tit7"><strong>회원명 </td>
							<td class="tit4">${memnm}</td>						
						</tr> 
						<tr>
							<td class="tit7"><strong>전화번호 </td>
							<td class="tit4">${cell}</td>						
						</tr> 
						<tr>
							<td class="tit7"><strong>생년월일 </td>
							<td class="tit4">${birth}</td>						
						</tr> 
						<tr>
							<td class="tit7"><strong>상품명 </td>
							<td class="tit4">${prod_nm}</td>						
						</tr> 
						<tr>
							<td class="tit7"><strong>납입회차 </td>
							<td class="tit4">${trucnt}</td>						
						</tr> 		
						<tr>
							<td class="tit7"><strong>납입금액 </td>
							<td class="tit4"><fmt:formatNumber value="${totamt}" type="number" maxFractionDigits="0" /></td>						
						</tr> 	
						<tr>
							<td class="tit7"><strong>상조잔액 </td>
							<td class="tit4"><fmt:formatNumber value="${diffa}" type="number" maxFractionDigits="0" /></td>						
						</tr> 
						<tr>
							<td class="tit7"><strong>결합잔액 </td>
							<td class="tit4"><fmt:formatNumber value="${diffb}" type="number" maxFractionDigits="0" /></td>						
						</tr> 
						<tr>
							<td class="tit7"><strong>추가잔액 </td>
							<td class="tit4"><fmt:formatNumber value="${diffc}" type="number" maxFractionDigits="0" /></td>						
						</tr> 																			
						<tr>
							<td class="tit7"><strong>전체잔액 </td>
							<td class="tit4"><fmt:formatNumber value="${diffamt}" type="number" maxFractionDigits="0" /></td>						
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