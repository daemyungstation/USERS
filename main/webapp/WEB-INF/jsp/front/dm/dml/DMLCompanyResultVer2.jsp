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
		<meta property="og:title" content="대명아임레디2016" />
		<meta property="og:description" content="대명아임레디" />
		<meta property="og:image" content="<fmt:message key="Globals.httpUrl" />/common/images/logo.gif" />
		<link rel="shortcut icon" href="javascript:" />
		<link rel="stylesheet" href="/common/css/mobile_m.css" />
		<script type="text/javascript" src="/common/js/jquery-1.8.2.min.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

		<script type="text/javascript" src="http://mtag.mman.kr/roianal.mezzo/tracking?cmp_no=208&depth=1"></script>
		<script type="text/javascript">
			function checkdate()
			{
				document.frm_search.submit();
				return;
			}
			function getList(url) {
				let f = document.frm_search;
				f.action = url;
				f.submit();
			}
		</script>

	</head>
	<body>
		<div id="contents">
			<div class="header">
				<img src="/common/images/btn/logo.png" width="299px" height="33px" />
			</div>
			<div class="header_2">
				<span style="color:yellow; display:inline-block; padding-top:8px;" onclick="getList('/dmlsourcing/dmreport.do')"><strong>일일실적 |</strong></span>
				<span style="display:inline-block; padding-top:8px;" onclick="getList('/dmlsourcing/dmreportresnprotect.do')"><strong>만기방어실적 |</strong></span>

				<div style="float:right">
					<form name="frm_search" method="post" action="/dmlsourcing/dmreport.do">							
					<!--<input name="s_que" type="text" />-->
						<input type="hidden" name="securityCd" id="securityCd" value=""/>
                        <input type="hidden" name="securityCdYN" id="securityCdYN" value="N"/>
					<div>
						<img src="/common/images/btn/search.png" width="65" height="33px" onclick="getList('/dmlsourcing/dmreport.do')">
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
							<%--B2C파트--%>
							<c:when test="${list.gubun eq 'LGU'}">
								<c:set var="lgu" value="${list.gubun}" />
								<c:set var="lgu_cnt1" value="${list.preCnt}" />
								<c:set var="lgu_cnt2" value="${list.nowCnt}" />
								<c:set var="lgu_cnt3" value="${list.monCnt}" />
								<c:set var="lgu_cnt4" value="${list.preMonCnt}" />
							</c:when>
							<c:when test="${list.gubun eq 'SDP'}">
								<c:set var="sdp" value="${list.gubun}" />
								<c:set var="sdp_cnt1" value="${list.preCnt}" />
								<c:set var="sdp_cnt2" value="${list.nowCnt}" />
								<c:set var="sdp_cnt3" value="${list.monCnt}" />
								<c:set var="sdp_cnt4" value="${list.preMonCnt}" />
							</c:when>
							<c:when test="${list.gubun eq 'CUC'}">
								<c:set var="cuc" value="${list.gubun}" />
								<c:set var="cuc_cnt1" value="${list.preCnt}" />
								<c:set var="cuc_cnt2" value="${list.nowCnt}" />
								<c:set var="cuc_cnt3" value="${list.monCnt}" />
								<c:set var="cuc_cnt4" value="${list.preMonCnt}" />
							</c:when>

							<%--B2B파트--%>
							<c:when test="${list.gubun eq 'SPE'}">
								<c:set var="spe" value="${list.gubun}" />
								<c:set var="spe_cnt1" value="${list.preCnt}" />
								<c:set var="spe_cnt2" value="${list.nowCnt}" />
								<c:set var="spe_cnt3" value="${list.monCnt}" />
								<c:set var="spe_cnt4" value="${list.preMonCnt}" />
							</c:when>
							<c:when test="${list.gubun eq 'DIR'}">
								<c:set var="dir" value="${list.gubun}" />
								<c:set var="dir_cnt1" value="${list.preCnt}" />
								<c:set var="dir_cnt2" value="${list.nowCnt}" />
								<c:set var="dir_cnt3" value="${list.monCnt}" />
								<c:set var="dir_cnt4" value="${list.preMonCnt}" />
							</c:when>
							<c:when test="${list.gubun eq 'HSP'}">
								<c:set var="hsp" value="${list.gubun}" />
								<c:set var="hsp_cnt1" value="${list.preCnt}" />
								<c:set var="hsp_cnt2" value="${list.nowCnt}" />
								<c:set var="hsp_cnt3" value="${list.monCnt}" />
								<c:set var="hsp_cnt4" value="${list.preMonCnt}" />
							</c:when>
							<c:when test="${list.gubun eq 'ONE'}">
								<c:set var="one" value="${list.gubun}" />
								<c:set var="one_cnt1" value="${list.preCnt}" />
								<c:set var="one_cnt2" value="${list.nowCnt}" />
								<c:set var="one_cnt3" value="${list.monCnt}" />
								<c:set var="one_cnt4" value="${list.preMonCnt}" />
							</c:when>
							<c:when test="${list.gubun eq 'ETC'}">
								<c:set var="etc" value="${list.gubun}" />
								<c:set var="etc_cnt1" value="${list.preCnt}" />
								<c:set var="etc_cnt2" value="${list.nowCnt}" />
								<c:set var="etc_cnt3" value="${list.monCnt}" />
								<c:set var="etc_cnt4" value="${list.preMonCnt}" />
							</c:when>


							<%--온라인파트버킷마켓--%>
							<c:when test="${list.gubun eq 'E03'}">
								<c:set var="e03" value="${list.gubun}" />
								<c:set var="e03_cnt1" value="${list.preCnt}" />
								<c:set var="e03_cnt2" value="${list.nowCnt}" />
								<c:set var="e03_cnt3" value="${list.monCnt}" />
								<c:set var="e03_cnt4" value="${list.preMonCnt}" />
							</c:when>

							<c:when test="${list.gubun eq 'LAT'}">
								<c:set var="lat" value="${list.gubun}" />
								<c:set var="lat_cnt1" value="${list.preCnt}" />
								<c:set var="lat_cnt2" value="${list.nowCnt}" />
								<c:set var="lat_cnt3" value="${list.monCnt}" />
								<c:set var="lat_cnt4" value="${list.preMonCnt}" />
							</c:when>

							<c:when test="${list.gubun eq 'TOT'}">
								<c:set var="tot" value="${list.gubun}" />
								<c:set var="tot_cnt1" value="${list.preCnt}" />
								<c:set var="tot_cnt2" value="${list.nowCnt}" />
								<c:set var="tot_cnt3" value="${list.monCnt}" />
								<c:set var="tot_cnt4" value="${list.preMonCnt}" />
							</c:when>																					
						</c:choose>
					</c:forEach>

					
				<img src="/common/images/btn/nemo.png" width="8" height="15px" />
				<strong>팀별 세부 실적</strong>
				<table border="0" cellspacing="0" cellpadding="0" class="List">
					<tr>
						<td class="titA">구분</td>
						<td class="titA">전일<br/>(${egov:convertDate(egov:addDay(nowDt, -1),'yyyyMMdd', 'MM-dd', '')})</td>
						<td class="titA">금일<br/>(${egov:convertDate(nowDt, 'yyyyMMdd', 'MM-dd', '')})</td>
						<td class="titA">당월 누계<br/>(${egov:convertDate(nowDt,'yyyyMMdd', 'yyyy-MM', '')})</td>
						<td class="titA">전월 누계<br/>(${egov:convertDate(egov:addMonth(nowDt, -1),'yyyyMM', 'yyyy-MM', '')})</td>
					</tr>
					<tr>
						<td class="titB">합계</td>
						<td class="titB">${tot_cnt1 }</td>
						<td class="titB">${tot_cnt2}</td>
						<td class="titB"><fmt:formatNumber value="${tot_cnt3}" type="number" maxFractionDigits="0" /></td>
						<td class="titB"><fmt:formatNumber value="${tot_cnt4}" type="number" maxFractionDigits="0" /></td>
					</tr> 
					
					<!-- 1팀 -->
					<tr>							
						<td class="tit6">1) B2C 채널</td>
						<td class="tit7">${ sdp_cnt1 + lgu_cnt1 + cuc_cnt1}</td>
						<td class="tit7 fntA">${sdp_cnt2 + lgu_cnt2 + cuc_cnt2}</td>
						<td class="tit7"><fmt:formatNumber value="${sdp_cnt3 + lgu_cnt3 + cuc_cnt3}" type="number" maxFractionDigits="0" /></td>
						<td class="tit7"><fmt:formatNumber value="${sdp_cnt4 + lgu_cnt4 + cuc_cnt4}" type="number" maxFractionDigits="0" /></td>
					</tr>
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;SDP</td>
						<td class="tit5">${sdp_cnt1}</td>
						<td class="tit5 fntA">${sdp_cnt2}</td>
						<td class="tit5"><fmt:formatNumber value="${sdp_cnt3}" type="number" maxFractionDigits="0" /></td>
						<td class="tit5"><fmt:formatNumber value="${sdp_cnt4}" type="number" maxFractionDigits="0" /></td>
					</tr>
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;LGU</td>
						<td class="tit5">${lgu_cnt1}</td>
						<td class="tit5 fntA">${lgu_cnt2}</td>
						<td class="tit5"><fmt:formatNumber value="${lgu_cnt3}" type="number" maxFractionDigits="0" /></td>
						<td class="tit5"><fmt:formatNumber value="${lgu_cnt4}" type="number" maxFractionDigits="0" /></td>
					</tr>					
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;쿠쿠</td>
						<td class="tit5">${cuc_cnt1}</td>
						<td class="tit5 fntA">${cuc_cnt2}</td>
						<td class="tit5"><fmt:formatNumber value="${cuc_cnt3}" type="number" maxFractionDigits="0" /></td>
						<td class="tit5"><fmt:formatNumber value="${cuc_cnt4}" type="number" maxFractionDigits="0" /></td>
					</tr>



					<!-- 2팀 -->
					<tr>							
						<td class="tit6">2) B2B 채널</td>
						<td class="tit7">${spe_cnt1 + hsp_cnt1 + one_cnt1 +  etc_cnt1 + dir_cnt1}</td>
						<td class="tit7 fntA">${spe_cnt2 + hsp_cnt2 + one_cnt2 + etc_cnt2 + dir_cnt2}</td>
						<td class="tit7"><fmt:formatNumber value="${spe_cnt3 + hsp_cnt3 + one_cnt3  + etc_cnt3 + dir_cnt3}" type="number" maxFractionDigits="0" /></td>
						<td class="tit7"><fmt:formatNumber value="${spe_cnt4 + hsp_cnt4 + one_cnt4  + etc_cnt4 + dir_cnt4}" type="number" maxFractionDigits="0" /></td>
					</tr>					
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;스페셜라이프</td>
						<td class="tit5">${spe_cnt1 + dir_cnt1}</td>
						<td class="tit5 fntA">${spe_cnt2 + dir_cnt2}</td>
						<td class="tit5"><fmt:formatNumber value="${spe_cnt3 + dir_cnt3}" type="number" maxFractionDigits="0" /></td>
						<td class="tit5"><fmt:formatNumber value="${spe_cnt4 + dir_cnt4}" type="number" maxFractionDigits="0" /></td>
					</tr>					
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;홈쇼핑</td>
						<td class="tit5">${hsp_cnt1}</td>
						<td class="tit5 fntA">${hsp_cnt2}</td>
						<td class="tit5"><fmt:formatNumber value="${hsp_cnt3}" type="number" maxFractionDigits="0" /></td>
						<td class="tit5"><fmt:formatNumber value="${hsp_cnt4}" type="number" maxFractionDigits="0" /></td>
					</tr>						
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;임직원</td>
						<td class="tit5">${one_cnt1}</td>
						<td class="tit5 fntA">${one_cnt2}</td>
						<td class="tit5"><fmt:formatNumber value="${one_cnt3}" type="number" maxFractionDigits="0" /></td>
						<td class="tit5"><fmt:formatNumber value="${one_cnt4}" type="number" maxFractionDigits="0" /></td>
					</tr>										
					<tr>							
						<td class="tit4">&nbsp;&nbsp;&nbsp;법인</td>
						<td class="tit5">${etc_cnt1}</td>
						<td class="tit5 fntA">${etc_cnt2}</td>
						<td class="tit5"><fmt:formatNumber value="${etc_cnt3}" type="number" maxFractionDigits="0" /></td>
						<td class="tit5"><fmt:formatNumber value="${etc_cnt4}" type="number" maxFractionDigits="0" /></td>
					</tr>					

					<!-- 3팀 -->
					<tr>							
						<td class="tit6">3) 버킷마켓</td>
						<td class="tit7">${e03_cnt1}</td>
						<td class="tit7 fntA">${e03_cnt2}</td>
						<td class="tit7"><fmt:formatNumber value="${e03_cnt3}" type="number" maxFractionDigits="0" /></td>
						<td class="tit7"><fmt:formatNumber value="${e03_cnt4}" type="number" maxFractionDigits="0" /></td>
					</tr>	
																
									
					<!-- 후불제 -->
					<tr>							
						<td class="tit6">4) 의전 즉발</td>
						<td class="tit7">${ lat_cnt1 }</td>
						<td class="tit7 fntA">${lat_cnt2}</td>
						<td class="tit7"><fmt:formatNumber value="${lat_cnt3}" type="number" maxFractionDigits="0" /></td>
						<td class="tit7"><fmt:formatNumber value="${lat_cnt4}" type="number" maxFractionDigits="0" /></td>
					</tr>
					
				</table>

				<br/>
				본 자료는 접수구좌 기준이며, 실시간 업데이트 됩니다.<br/>
				- 전월 누계: 이전달 1일부터 말일까지의 데이터 입니다.<br/>
				- 당월 누계: 이번달 1일부터 조회일까지의 데이터 입니다.<br/>
			 </div>
		</div>


		<div class="modal" id="securityCdModal" title="보안코드 입력" >
			<p class="form-group" style="text-align: center; vertical-align: center">
				<label for="securityCdPop" class="col-form-label">보안코드:</label>
				<input type="password" class="form-control" id="securityCdPop">
			</p>
		</div>
		<script>
			$("#securityCdModal").dialog({
				autoOpen:false, //자동으로 열리지않게
				position:{
					my:"center",
					at:"center",
					of:window
				}, //가운데
				minHeight: 50,
				modal:true, //모달대화상자
				resizable:true, //크기 조절 못하게
				show: {                // 애니메이션 효과 - 보여줄때
					effect: "blind",
					duration: 500
				},
				buttons:{
					"취소":function(){
						$(this).dialog("close");
					},"확인":function(){
						$("#securityCd").val($("#securityCdPop").val());
						$("#securityCdYN").val("Y");
						$(this).dialog("close");
						getList('/dmlsourcing/dmreport.do');
					}
				}
			});
		</script>
        <c:if test="${rtnMap.require eq 'SecurityCd'}">
            <script>
                $("#securityCdModal").dialog("open");
            </script>
        </c:if>
		<c:if test="${not empty msg}">
			<script>
				window.alert("${msg}")
			</script>
		</c:if>
	</body>
</html>