<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
<%@ page session="true" %>

<style>
#popup { background:none; }
.headDiv h1 {display:flex; align-items: center; color: #333; font-size: 20px;}
.headDiv h1 img { margin-left:10px; }
.headDiv h1 .headTxt { margin-left:10px; }
.my-back { position: relative; width: 20px; height: 20px; }
.my-back span { width: 20px; height: 20px; border-top: 2px solid #121212; border-right: 2px solid #121212; display: inline-block; transform: rotate(225deg); position: absolute; top: 0px; }
.my-mus { display:flex; justify-content: center; }
.my-mus .my-menu { display:flex; justify-content: center; align-items: center; width:20%; margin:50px 0 0 50px; background:#f7f7f7; border:1px solid #e5e5e5;padding: 50px 0; cursor:pointer; }
.my-mus .my-menu:first-child { margin-left:0; }
.my-mus .my-menu .my-icon img { width:60px; }
.my-mus .my-menu .my-txt { width:100px; text-align:center; font-size: 20px; color: #333; font-weight:bold; }
</style>
<div id="header">
	<div class="headDiv">
		<h1>
			<a href="/member/my/dashboard.do" class="my-back"><span></span></a>
			<img src="/common/images/my/logo.png"/>
			<span class="headTxt">가입내역</span>
		</h1>
	</div>
</div> <!--// header -->

<div id="cBody">
	<div class="subBody">
		<c:forEach var="list" items="${pmtPtcList}" varStatus="status">
			<div class="scrollX <c:if test="${not status.first}">mt60</c:if>">
				<div class="boradType7 mt10">
					<table class="type1" summary="">
						<caption></caption>
						<colgroup>
							<col width="30%" />
							<col width="30%" />
							<col width="30%" />
						</colgroup>
						<tbody>
							<tr>
								<th>회원번호</th>
								<th>상품명</th>
								<th>납입방법</th>
							</tr>
							<tr>
								<td>${list.accntNo}</td>
								<td>${list.prodNm}</td>
								<td>${list.payMthdNm}</td>
							</tr>
							<tr>
								<th>납입회차</th>
								<th>남은회차</th>
								<th>납입상태</th>
							</tr>
							<tr>
								<td>${list.trueCnt}</td>
								<td>${list.remainCnt}</td>
								<td>${list.payStat}</td>
							</tr>
							<tr>
								<th>최종납월</th>
								<th>납입일</th>
								<th>납입금</th>
							</tr>
							<tr>
								<td>${egov:convertDate(list.latestPayDay, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM', '')}</td>
								<td>${egov:convertDate(list.latestPayDay, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')}</td>
								<td><fmt:formatNumber value="${list.trueAmt + list.relatAmt + list.addAmt}" type="number" maxFractionDigits="0" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				<p class="widthScbg"></p>
			</div>
		</c:forEach>
		<div style="height:100px">
	</div>
</div>

