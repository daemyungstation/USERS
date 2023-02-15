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
.boradType7 td { text-align:left; padding-left:10px; }
</style>
<div id="header">
	<div class="headDiv">
		<h1>
			<a href="/member/my/dashboard.do" class="my-back"><span></span></a>
			<img src="/common/images/my/logo.png"/>
			<span class="headTxt">해약접수 신청</span>
		</h1>
	</div>
</div> <!--// header -->

<div id="cBody">
	<div class="subBody">
		
		<p class="titTxt">상품명 - ${cnclRefndList[0].prodNm}</p>
		<div class="scrollX mt20">
			<div class="boradType7">
				<table class="type1" summary="">
					<caption></caption>
					<colgroup>
						<col width="98px" />
						<col width="98px" />
						<col width="98px" />
						<col width="98px" />
						<col width="98px" />
						<col width="98px" />
						<col width="98px" />
						<col width="98px" />
						<col width="98px" />
						<col width="98px" />
					</colgroup>
					<tbody>
						<tr>
							<th>회차</th>
							<th>해약금</th>
							<th>회차</th>
							<th>해약금</th>
							<th>회차</th>
							<th>해약금</th>
							<th>회차</th>
							<th>해약금</th>
							<th>회차</th>
							<th>해약금</th>
						</tr>
						<c:if test="${fn:length(cnclRefndList) eq 0}">
							<tr>
								<td colspan="10" style="text-align:center"><fmt:message key="common.nodata.msg" /></td>
							</tr>
						</c:if>
						<c:forEach var="list" items="${cnclRefndList}" varStatus="status">
							<c:if test="${status.index % 5 eq 0}">
								<tr>
							</c:if>
								<td>${list.no}</td>
								<td>
									<font <c:if test="${status.last or list.no eq rtnMap.trueCnt}">class="red" style="font-weight:bold;"</c:if>>
										<fmt:formatNumber value="${list.resnAmt}" type="number" maxFractionDigits="0" />
									</font>
								</td>
								<c:if test="${status.last and status.count % 5 gt 0}">
									<c:forEach var="i" begin="1" end="${5 - (status.count % 5)}" step="1">
										<td></td>
										<td></td>
									</c:forEach>
								</c:if>
							<c:if test="${status.count % 5 eq 0}">
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<p class="widthScbg"></p>
		</div>
		
		<div class="mt20 taR">
			<a href="./terminate.do" class="prvBt"><img src="/common/images/btn/prvpage_bt.gif" title="이전" alt="" /></a>
		</div>
		<div style="height:100px">
	</div>
</div>

