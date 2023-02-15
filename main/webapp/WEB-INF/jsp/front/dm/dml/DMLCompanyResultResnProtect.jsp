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
				<span style="display:inline-block; padding-top:8px;" onclick="getList('/dmlsourcing/dmreport.do')"><strong>일일실적 |</strong></span>
				<span style="color:yellow; display:inline-block; padding-top:8px;" onclick="getList('/dmlsourcing/dmreportresnprotect.do')"><strong>만기방어실적 |</strong></span>
				<div style="float:right">
					<form name="frm_search" method="post" action="/dmlsourcing/dmreportresnprotect.do">							
					<!--<input name="s_que" type="text" />-->
						<input type="hidden" name="securityCd" id="securityCd" value=""/>
						<input type="hidden" name="securityCdYN" id="securityCdYN" value="N"/>
					<div>
						<img src="/common/images/btn/search.png" width="65" height="33px" onclick="getList('/dmlsourcing/dmreportresnprotect.do')">
					</div>
					</form>
				</div>
			</div> 
			<br />
			<div class="st2pi">
				<!-- 날짜 가져오기 -->
				<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate var="nowDt" value="${now}" pattern="yyyyMMdd" />	
				
				<img src="/common/images/btn/nemo.png" width="8" height="15px" />
				<strong>일별 만기방어 실적</strong>
				
				<table border="0" cellspacing="0" cellpadding="0" class="List">
					<tr>
						<td class="titA">접수일</td>
						<td class="titA">접수건</td>
						<td class="titA">日성공건</td>
						<td class="titA">日성공율</td>
						<td class="titA">해약처리</td>						
						<td class="titA">해약미처리</td>
					</tr>
				
					<c:forEach var="list" items="${rtnMap.list}">
						<c:set var="resn_day" value="${egov:convertDate(list.resnDay, 'yyyyMMdd', 'MM-dd', '')} (${list.resnWk})" />
						<c:set var="tot_cnt" value="${list.totCnt}" />
						<c:set var="return_cnt" value="${list.returnCnt}" />
						<c:set var="return_pc" value="${list.returnPc}" />							
						<c:set var="proc_y" value="${list.procY}" />
						<c:set var="proc_n" value="${list.procN}" />
						<tr>
							<td class="tit5">${resn_day}</td>						
							<td class="tit5"><fmt:formatNumber value="${tot_cnt}" type="number" maxFractionDigits="0" /></td>
							<td class="tit5"><fmt:formatNumber value="${return_cnt}" type="number" maxFractionDigits="0" /></td>
							<td class="tit5">${return_pc}%</td>							
							<td class="tit5"><fmt:formatNumber value="${proc_y}" type="number" maxFractionDigits="0" /></td>
							<td class="tit5"><fmt:formatNumber value="${proc_n}" type="number" maxFractionDigits="0" /></td>														
						</tr> 				
					</c:forEach>
				</table>

				</br>
				본 자료는 해약구좌 별 만기방어 데이터 기준이며, 실시간 업데이트 됩니다.</br>	
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