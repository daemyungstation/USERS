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
				<img src="/common/images/btn/nemo.png" width="8" height="15px" />
				<strong>종합 실적</strong>
				<table border="0" cellspacing="0" cellpadding="0" class="List">

					<c:forEach var="list" items="${rtnMap.list}">
						<c:set var="sdp" value="${fn:split(list.sdp,';')}" />
						<c:set var="s01" value="${fn:split(list.s01,';')}" />
						<c:set var="s02" value="${fn:split(list.s02,';')}" />
						<c:set var="l03" value="${fn:split(list.l03,';')}" />
						<c:set var="g25" value="${fn:split(list.g25,';')}" />
						<c:set var="skt" value="${fn:split(list.skt,';')}" />
						<c:set var="nor" value="${fn:split(list.nor,';')}" />
						<!-- 						
						<c:set var="eps" value="${fn:split(list.eps,';')}" />
						<c:set var="epl" value="${fn:split(list.epl,';')}" />
						-->
						<c:set var="lgu" value="${fn:split(list.lgu,';')}" />
						<c:set var="epd" value="${fn:split(list.epd,';')}" />
						<c:set var="rbt" value="${fn:split(list.rbt,';')}" />
						<c:set var="lat" value="${fn:split(list.lat,';')}" />
						<c:set var="etc" value="${fn:split(list.etc,';')}" />
						<c:set var="gsp" value="${fn:split(list.gsp,';')}" />
					</c:forEach>
					
					<!-- 1 : 전일, 2 : 금일, 3 : 월누계 -->
					<c:set var="sdp_1"  value="${sdp[0]}"/>
					<c:set var="sdp_2"  value="${sdp[1]}"/>
					<c:set var="sdp_3"  value="${sdp[2]}"/>
					
					<c:set var="s01_1"  value="${s01[0]}"/>
					<c:set var="s01_2"  value="${s01[1]}"/>
					<c:set var="s01_3"  value="${s01[2]}"/>
					
					<c:set var="s02_1"  value="${s02[0]}"/>
					<c:set var="s02_2"  value="${s02[1]}"/>
					<c:set var="s02_3"  value="${s02[2]}"/>
										
					<c:set var="l03_1"  value="${l03[0]}"/>
					<c:set var="l03_2"  value="${l03[1]}"/>
					<c:set var="l03_3"  value="${l03[2]}"/>
					
					<c:set var="g25_1"  value="${g25[0]}"/>
					<c:set var="g25_2"  value="${g25[1]}"/>
					<c:set var="g25_3"  value="${g25[2]}"/>
					
					<c:set var="gsp_1"  value="${gsp[0]}"/>
					<c:set var="gsp_2"  value="${gsp[1]}"/>
					<c:set var="gsp_3"  value="${gsp[2]}"/>
					

					
					<c:set var="skt_1"  value="${skt[0]}"/>
					<c:set var="skt_2"  value="${skt[1]}"/>
					<c:set var="skt_3"  value="${skt[2]}"/>
					
					<c:set var="nor_1"  value="${nor[0]}"/>
					<c:set var="nor_2"  value="${nor[1]}"/>
					<c:set var="nor_3"  value="${nor[2]}"/>

					<c:set var="epd_1"  value="${epd[0]}"/>
					<c:set var="epd_2"  value="${epd[1]}"/>
					<c:set var="epd_3"  value="${epd[2]}"/>
					
					<c:set var="rbt_1"  value="${rbt[0]}"/>
					<c:set var="rbt_2"  value="${rbt[1]}"/>
					<c:set var="rbt_3"  value="${rbt[2]}"/>
					
					<c:set var="lat_1"  value="${lat[0]}"/>
					<c:set var="lat_2"  value="${lat[1]}"/>
					<c:set var="lat_3"  value="${lat[2]}"/>
					
					<c:set var="etc_1"  value="${etc[0]}"/>
					<c:set var="etc_2"  value="${etc[1]}"/>
					<c:set var="etc_3"  value="${etc[2]}"/>
					
					<c:set var="lgu_1"  value="${lgu[0]}"/>
					<c:set var="lgu_2"  value="${lgu[1]}"/>
					<c:set var="lgu_3"  value="${lgu[2]}"/>
					
					<!-- 날짜 가져오기 -->
					<jsp:useBean id="now" class="java.util.Date" />
					
					<fmt:formatDate var="nowDt" value="${now}" pattern="yyyyMMdd" />	
							
					<tr>
						<td class="titA">구분</td>
						<td class="titA">전일</br>(${egov:convertDate(egov:addDay(nowDt, -1),'yyyyMMdd', 'MM-dd', '')})</td>
						<td class="titA">금일</br>(${egov:convertDate(nowDt, 'yyyyMMdd', 'MM-dd', '')})</td>
						<td class="titA">월 누계</td>
						<!--<td class="titA">전월 누계</td>-->
					</tr>
					<tr>
						<td class="titB">합계</td>
						<td class="titB">${etc_1}</td>
						<td class="titB">${etc_2}</td>
						<td class="titB"><fmt:formatNumber value="${etc_3}" type="number" maxFractionDigits="0" /></td>
					</tr>
					<tr>
						<td class="tit4">1) SDP</td>
						<td class="tit5">${sdp_1}</td>
						<td class="tit5 fntA">${sdp_2}</td>
						<td class="tit5"><fmt:formatNumber value="${sdp_3}" type="number" maxFractionDigits="0" /></td>
					</tr>
					<tr>
						<td class="tit4">2) 결합S 홈쇼핑</td>
						<td class="tit5">${s01_1}</td>
						<td class="tit5 fntA">${s01_2}</td>
						<td class="tit5">${s01_3}</td>
					</tr>

					<tr>
						<td class="tit4">3) 결합S 기타</td>
						<td class="tit5">${s02_1}</td>
						<td class="tit5 fntA">${s02_2}</td>
						<td class="tit5">${s02_3}</td>
					</tr>
					<tr>
						<td class="tit4">4) 결합L 기타</td>
						<td class="tit5">${l03_1}</a></td>
						<td class="tit5 fntA">${l03_2}</td>
						<td class="tit5">${l03_3}</td>
					</tr>
					<tr>
						<td class="tit4">5) LGU</td>
						<td class="tit5">${lgu_1}</a></td>
						<td class="tit5 fntA">${lgu_2}</td>
						<td class="tit5">${lgu_3}</td>
					</tr>
					<tr>
						<td class="tit4">6) 기타상품</td>
						<td class="tit5">${etc_1 - (sdp_1 + s01_1 + s02_1 + l03_1 + lgu_1) }</td>
						<td class="tit5 fntA">${etc_2 - (sdp_2 + s01_2 + s02_2 + l03_2 + lgu_2)}</td>
						<td class="tit5">${etc_3 - (sdp_3 + s01_3 + s02_3 + l03_3 + lgu_3)}</td>
					</tr>
				</table>
				
				</br>

				<img src="/common/images/btn/nemo.png" width="8" height="15px" />
				<strong>파트별 세부 실적</strong>
				<table border="0" cellspacing="0" cellpadding="0" class="List">
					<tr>
						<td class="titA">구분</td>
						<td class="titA">전일</br>(${egov:convertDate(egov:addDay(nowDt, -1),'yyyyMMdd', 'MM-dd', '')})</td>
						<td class="titA">금일</br>(${egov:convertDate(nowDt, 'yyyyMMdd', 'MM-dd', '')})</td>
						<td class="titA">월 누계</td>
					</tr>
					<tr>
						<td class="titB">합계</td>
						<td class="titB">${etc_1}</td>
						<td class="titB">${etc_2}</td>
						<td class="titB"><fmt:formatNumber value="${etc_3}" type="number" maxFractionDigits="0" /></td>
					</tr> 
					<!-- 1팀 -->
					<tr>							
						<td class="tit6">1) 1팀</td>
						<td class="tit7">${ l03_1 + lgu_1 + skt_1 }</td>
						<td class="tit7 fntA">${l03_2 + lgu_2  + skt_2 }</td>
						<td class="tit7">${l03_3 + lgu_3  + skt_3 }</td>
						<!--<td class="tit7"><?=number_format($cnt_g25_m + $cnt_l02_m + $cnt_l03_m + $cnt_lgu_m + $cnt_skt_m) ?></td>-->
					
					</tr>
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;결합L(기타)</td>
						<td class="tit5">${l03_1}</a></td>
						<td class="tit5 fntA">${l03_2}</td>
						<td class="tit5">${l03_3}</td>
							<!--<td class="tit5"><?=number_format($cnt_l02_m + $cnt_l03_m )?></td>-->
					</tr>
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;LGU</td>
						<td class="tit5">${lgu_1}</a></td>
						<td class="tit5 fntA">${lgu_2}</td>
						<td class="tit5">${lgu_3}</td>
							<!--<td class="tit5"><?=number_format($cnt_l02_m + $cnt_l03_m )?></td>-->
					</tr>
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;기타</td>
						<td class="tit5">${skt_1}</td>
						<td class="tit5 fntA">${skt_2}</td>
						<td class="tit5">${skt_3}</td>
							<!--<td class="tit5"><?=number_format($cnt_skt_m)?></td>-->
					</tr>
					<!-- 2팀 -->
					<tr>							
						<td class="tit6">2) 2팀</td>
						<td class="tit7">${sdp_1 + g25_1 + gsp_1 + epd_1}</td>
						<td class="tit7 fntA">${sdp_2 + g25_2 + gsp_2 + epd_2}</td>
						<td class="tit7"><fmt:formatNumber value="${sdp_3 + g25_3 + gsp_3 + epd_3}" type="number" maxFractionDigits="0" /></td>
					</tr>
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;SDP</td>
						<td class="tit5">${sdp_1}</td>
						<td class="tit5 fntA">${sdp_2}</td>
						<td class="tit5"><fmt:formatNumber value="${sdp_3}" type="number" maxFractionDigits="0" /></td>
					</tr>
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;기타</td>
						<td class="tit5">${g25_1 + gsp_1 + epd_1 }</td>
						<td class="tit5 fntA">${g25_2 + gsp_2 + epd_2}</td>
						<td class="tit5"><fmt:formatNumber value="${g25_3 + gsp_3 + epd_3}" type="number" maxFractionDigits="0" /></td>
					</tr>
					<!--  
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;GS(가전)</td>
						<td class="tit5">${g25_1}</td>
						<td class="tit5 fntA">${g25_2}</td>
						<td class="tit5"><fmt:formatNumber value="${g25_3}" type="number" maxFractionDigits="0" /></td>
					</tr>
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;GS(팝카드)</td>
						<td class="tit5">${gsp_1}</td>
						<td class="tit5 fntA">${gsp_2}</td>
						<td class="tit5"><fmt:formatNumber value="${gsp_3}" type="number" maxFractionDigits="0" /></td>
					</tr>
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;대교임직원</td>
						<td class="tit5">${epd_1}</td>
						<td class="tit5 fntA">${epd_2}</td>
						<td class="tit5">${epd_3}</td>
					</tr>
					-->

					<!--
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;LGU</td>
						<td class="tit5">${lgu_1}</td>
						<td class="tit5 fntA">${lgu_2}</td>
						<td class="tit5">${lgu_3}</td>
					</tr>
					-->

					<!-- 3팀 -->
					<tr>							
						<td class="tit6">3) 3팀</td>
						<td class="tit7">${etc_1 - (sdp_1  + l03_1 + skt_1 + lgu_1 + g25_1 + gsp_1 + epd_1 )}</td>
						<td class="tit7 fntA">${etc_2 - (sdp_2 + l03_2 + skt_2 + lgu_2 + g25_2 + gsp_2 + epd_2 )}</td>
						<td class="tit7">${etc_3 - (sdp_3 + l03_3 + skt_3 + lgu_3 + g25_3 + gsp_3 + epd_3 )}</td>
						<!--<td class="tit7"><?=number_format(($cnt_etc_m) - ($cnt_sdp_m +  $cnt_l02_m + $cnt_l03_m + $cnt_skt_m + $cnt_lgu_m + $cnt_g25_m + $cnt_epd_m  ))?>-->
					</tr>

					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;결합S(홈쇼핑)</td>
						<td class="tit5">${s01_1}</td>
						<td class="tit5 fntA">${s01_2}</td>
						<td class="tit5">${s01_3}</td>
							<!--<td class="tit5"><?=number_format($cnt_s01_m)?></td>-->
					</tr>	
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;결합S(기타)</td>
						<td class="tit5">${s02_1}</td>
						<td class="tit5 fntA">${s02_2}</td>
						<td class="tit5">${s02_3}</td>
						<!--<td class="tit5"><?=number_format($cnt_s02_m)?></td>-->
					</tr>
					<!--  
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;리바트</td>
						<td class="tit5">${rbt_1}</td>
						<td class="tit5 fntA">${rbt_2}</td>
						<td class="tit5">${rbt_3}</td>
						<td class="tit5"><?=number_format($cnt_s02_m)?></td>
					</tr>
					-->
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;후불제</td>
						<td class="tit5">${lat_1}</td>
						<td class="tit5 fntA">${lat_2}</td>
						<td class="tit5">${lat_3}</td>
							<!--<td class="tit5"><?=number_format($cnt_lat_m)?></td>-->
					</tr>
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;일반상품 外</td>
						<td class="tit5">${etc_1 - (sdp_1 + s01_1 + s02_1  + l03_1 + skt_1 + g25_1 + gsp_1 + lat_1 + epd_1 + lgu_1 )}</td>
						<td class="tit5 fntA">${etc_2 - (sdp_2 + s01_2 + s02_2  + l03_2 + skt_2 +  g25_2 + gsp_2 + lat_2 + epd_2 + lgu_2 )}</td>
						<td class="tit5">${etc_3 - (sdp_3 + s01_3 + s02_3  + l03_3 + skt_3 + g25_3 + gsp_3 + lat_3 + epd_3 + lgu_3 )}</td>
					</tr>

				</table>
				</br>
				본 자료는 접수구좌 기준이며, 실시간 업데이트 됩니다.
			 </div>
		</div>
	</body>
</html>