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
		<meta property="og:site_name" content="대명라이프웨이" />
		<meta property="og:title" content="대명라이프웨이 2016" />
		<meta property="og:description" content="대명라이프웨이" />
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
			<div class="header">
				<img src="/common/images/btn/logo.png" width="299px" height="33px" />
			</div>
			<div class="header_2">
				<span style="display:inline-block; padding-top:8px;"><strong>일일실적 |</strong></span>
				<div style="float:right">
					<form name="frm_search" method="post" action="/dmlsourcing/dmreport.do">							
					<!--<input name="s_que" type="text" />-->
					<div>
						<img src="/common/images/btn/search.png" width="65" height="33px" onclick="checkdate()">
					</div>
					</form>
				</div>
			</div> 
			<br />
			<div class="st2pi">
					<!-- 날짜 가져오기 -->
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate var="nowDt" value="${now}" pattern="yyyyMMdd" />	

					<c:forEach var="list" items="${rtnMap.list}">
						<c:choose>
							<c:when test="${list.gubun eq 'LGU'}">
								<c:set var="lgu" value="${list.gubun}" />
								<c:set var="lgu_cnt1" value="${list.preCnt}" />
								<c:set var="lgu_cnt2" value="${list.nowCnt}" />
								<c:set var="lgu_cnt3" value="${list.monCnt}" />
							</c:when>						

							<c:when test="${list.gubun eq 'L01'}">
								<c:set var="l01" value="${list.gubun}" />
								<c:set var="l01_cnt1" value="${list.preCnt}" />
								<c:set var="l01_cnt2" value="${list.nowCnt}" />
								<c:set var="l01_cnt3" value="${list.monCnt}" />
							</c:when>
							
							<c:when test="${list.gubun eq 'S02'}">
								<c:set var="s02" value="${list.gubun}" />
								<c:set var="s02_cnt1" value="${list.preCnt}" />
								<c:set var="s02_cnt2" value="${list.nowCnt}" />
								<c:set var="s02_cnt3" value="${list.monCnt}" />
							</c:when>
							
							<c:when test="${list.gubun eq 'HSM'}">
								<c:set var="hsm" value="${list.gubun}" />
								<c:set var="hsm_cnt1" value="${list.preCnt}" />
								<c:set var="hsm_cnt2" value="${list.nowCnt}" />
								<c:set var="hsm_cnt3" value="${list.monCnt}" />
							</c:when>
							
							<c:when test="${list.gubun eq 'FRE'}">
								<c:set var="fre" value="${list.gubun}" />
								<c:set var="fre_cnt1" value="${list.preCnt}" />
								<c:set var="fre_cnt2" value="${list.nowCnt}" />
								<c:set var="fre_cnt3" value="${list.monCnt}" />
							</c:when>
							
							<c:when test="${list.gubun eq 'PTN'}">
								<c:set var="ptn" value="${list.gubun}" />
								<c:set var="ptn_cnt1" value="${list.preCnt}" />
								<c:set var="ptn_cnt2" value="${list.nowCnt}" />
								<c:set var="ptn_cnt3" value="${list.monCnt}" />
							</c:when>							
							
							<c:when test="${list.gubun eq 'SDP'}">
								<c:set var="sdp" value="${list.gubun}" />
								<c:set var="sdp_cnt1" value="${list.preCnt}" />
								<c:set var="sdp_cnt2" value="${list.nowCnt}" />
								<c:set var="sdp_cnt3" value="${list.monCnt}" />
							</c:when>
							
							<c:when test="${list.gubun eq 'G01'}">
								<c:set var="g01" value="${list.gubun}" />
								<c:set var="g01_cnt1" value="${list.preCnt}" />
								<c:set var="g01_cnt2" value="${list.nowCnt}" />
								<c:set var="g01_cnt3" value="${list.monCnt}" />
							</c:when>
							
							<c:when test="${list.gubun eq 'HSP'}">
								<c:set var="hsp" value="${list.gubun}" />
								<c:set var="hsp_cnt1" value="${list.preCnt}" />
								<c:set var="hsp_cnt2" value="${list.nowCnt}" />
								<c:set var="hsp_cnt3" value="${list.monCnt}" />
							</c:when>
							
							<c:when test="${list.gubun eq 'POM'}">
								<c:set var="pom" value="${list.gubun}" />
								<c:set var="pom_cnt1" value="${list.preCnt}" />
								<c:set var="pom_cnt2" value="${list.nowCnt}" />
								<c:set var="pom_cnt3" value="${list.monCnt}" />
							</c:when>												
							
							<c:when test="${list.gubun eq 'ETC'}">
								<c:set var="etc" value="${list.gubun}" />
								<c:set var="etc_cnt1" value="${list.preCnt}" />
								<c:set var="etc_cnt2" value="${list.nowCnt}" />
								<c:set var="etc_cnt3" value="${list.monCnt}" />
							</c:when>
							
							<c:when test="${list.gubun eq 'LAT'}">
								<c:set var="lat" value="${list.gubun}" />
								<c:set var="lat_cnt1" value="${list.preCnt}" />
								<c:set var="lat_cnt2" value="${list.nowCnt}" />
								<c:set var="lat_cnt3" value="${list.monCnt}" />
							</c:when>
							
							<c:when test="${list.gubun eq 'ONE'}">
								<c:set var="one" value="${list.gubun}" />
								<c:set var="one_cnt1" value="${list.preCnt}" />
								<c:set var="one_cnt2" value="${list.nowCnt}" />
								<c:set var="one_cnt3" value="${list.monCnt}" />
							</c:when>
							
							<c:when test="${list.gubun eq 'SPE'}">
								<c:set var="spe" value="${list.gubun}" />
								<c:set var="spe_cnt1" value="${list.preCnt}" />
								<c:set var="spe_cnt2" value="${list.nowCnt}" />
								<c:set var="spe_cnt3" value="${list.monCnt}" />
							</c:when>
							
							<c:when test="${list.gubun eq 'DIR'}">
								<c:set var="dir" value="${list.gubun}" />
								<c:set var="dir_cnt1" value="${list.preCnt}" />
								<c:set var="dir_cnt2" value="${list.nowCnt}" />
								<c:set var="dir_cnt3" value="${list.monCnt}" />
							</c:when>							
							
							<c:when test="${list.gubun eq 'TOT'}">
								<c:set var="tot" value="${list.gubun}" />
								<c:set var="tot_cnt1" value="${list.preCnt}" />
								<c:set var="tot_cnt2" value="${list.nowCnt}" />
								<c:set var="tot_cnt3" value="${list.monCnt}" />
							</c:when>																					
						</c:choose>
					</c:forEach>

					
<img src="/common/images/btn/nemo.png" width="8" height="15px" />
				<strong>팀별 세부 실적</strong>
				<table border="0" cellspacing="0" cellpadding="0" class="List">
					<tr>
						<td class="titA">구분</td>
						<td class="titA">전일</br>(${egov:convertDate(egov:addDay(nowDt, -1),'yyyyMMdd', 'MM-dd', '')})</td>
						<td class="titA">금일</br>(${egov:convertDate(nowDt, 'yyyyMMdd', 'MM-dd', '')})</td>
						<td class="titA">월 누계</td>
					</tr>
					<tr>
						<td class="titB">합계</td>
						<td class="titB">${tot_cnt1 }</td>
						<td class="titB">${tot_cnt2}</td>
						<td class="titB"><fmt:formatNumber value="${tot_cnt3}" type="number" maxFractionDigits="0" /></td>
					</tr> 
					
					<!-- 1팀 -->
					<tr>							
						<td class="tit6">1) 인프라영업팀</td>
						<td class="tit7">${hsp_cnt1 + one_cnt1 + ptn_cnt1 + spe_cnt1 + pom_cnt1 + etc_cnt1 }</td>
						<td class="tit7 fntA">${hsp_cnt2 + one_cnt2 + ptn_cnt2 + spe_cnt2 + pom_cnt2 + etc_cnt2 }</td>
						<td class="tit7"><fmt:formatNumber value="${hsp_cnt3 + one_cnt3 + ptn_cnt3 + spe_cnt3 + pom_cnt3 + etc_cnt3}" type="number" maxFractionDigits="0" /></td>
					</tr>
					
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;스페셜라이프</td>
						<td class="tit5">${spe_cnt1}</td>
						<td class="tit5 fntA">${spe_cnt2}</td>
						<td class="tit5">${spe_cnt3}</td>
					</tr>
					
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;홈쇼핑</td>
						<td class="tit5">${hsp_cnt1}</td>
						<td class="tit5 fntA">${hsp_cnt2}</td>
						<td class="tit5">${hsp_cnt3}</td>
					</tr>	
					
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;DB영업(POM등)</td>
						<td class="tit5">${pom_cnt1}</td>
						<td class="tit5 fntA">${pom_cnt2}</td>
						<td class="tit5">${pom_cnt3}</td>
					</tr>					
									
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;임직원</td>
						<td class="tit5">${etc_cnt1 + one_cnt1}</td>
						<td class="tit5 fntA">${etc_cnt2 + one_cnt2}</td>
						<td class="tit5">${etc_cnt3 + one_cnt3}</td>
					</tr>
																							
					<!-- 2팀 -->
					<tr>							
						<td class="tit6">2) 채널시너지팀</td>
						<td class="tit7">${ sdp_cnt1 + lgu_cnt1  + hsm_cnt1 + fre_cnt1 + dir_cnt1 + g01_cnt1 + l01_cnt1 + s02_cnt1 }</td>
						<td class="tit7 fntA">${sdp_cnt2 + lgu_cnt2  + hsm_cnt2 + fre_cnt2 + dir_cnt2 + g01_cnt2 + l01_cnt2 + s02_cnt2}</td>
						<td class="tit7"><fmt:formatNumber value="${sdp_cnt3 + lgu_cnt3  + hsm_cnt3 + fre_cnt3 + dir_cnt3 + g01_cnt3 + l01_cnt3 + s02_cnt3}" type="number" maxFractionDigits="0" /></td>
					</tr>					
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;SDP</td>
						<td class="tit5">${sdp_cnt1}</td>
						<td class="tit5 fntA">${sdp_cnt2}</td>
						<td class="tit5"><fmt:formatNumber value="${sdp_cnt3}" type="number" maxFractionDigits="0" /></td>
					</tr>
										
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;LGU</td>
						<td class="tit5">${lgu_cnt1}</td>
						<td class="tit5 fntA">${lgu_cnt2}</td>
						<td class="tit5">
							<fmt:formatNumber value="${lgu_cnt3}" type="number" maxFractionDigits="0" />
						</td>
					</tr>
					
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;다이렉트</td>
						<td class="tit5">${dir_cnt1}</td>
						<td class="tit5 fntA">${dir_cnt2}</td>
						<td class="tit5">${dir_cnt3}</td>
					</tr>	
										
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;기타</td>
						<td class="tit5">${g01_cnt1 + l01_cnt1 + s02_cnt1 + hsm_cnt1 + fre_cnt1}</td>
						<td class="tit5 fntA">${g01_cnt2 + l01_cnt2 + s02_cnt2 + hsm_cnt2 + fre_cnt2}</td>
						<td class="tit5">${g01_cnt3 + l01_cnt3 + s02_cnt3 + hsm_cnt3 + fre_cnt3}</td>
					</tr>					
									
					<!-- 후불제 -->
					<tr>							
						<td class="tit6">3) 후불제</td>
						<td class="tit7">${ lat_cnt1 }</td>
						<td class="tit7 fntA">${lat_cnt2}</td>
						<td class="tit7">${lat_cnt3}</td>
					</tr>
					
				</table>

				</br>
				본 자료는 접수구좌 기준이며, 실시간 업데이트 됩니다.</br>
				※ 1) 인프라영업팀 '임직원' : 더원라이프, 일반, 법인 등</br>
				※ 2) 채널시너지팀 '기타' : 웨딩, 한샘, 여행, 기타결합 등</br>		
			 </div>
		</div>
	</body>
</html>