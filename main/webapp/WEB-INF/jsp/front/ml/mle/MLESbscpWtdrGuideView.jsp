<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
							
						<c:choose>
							<c:when test="${fn:length(joinPrdctList) eq 0}">
								<div class="termTxtBox service mt40">
									<p class="tit">청약철회 가능한 상품 내역이 없습니다.</p>
									<p class="txt">청약철회 가능한 상품은 약관을 받은 날부터 <span class="red">14일이내</span>에만 가능합니다.</p>
								</div>
							</c:when>
							<c:otherwise>
								<div class="scrollX">
									<div class="boradType7">
										<table summary="" class="type1">
											<caption></caption>
											<colgroup>
												<col width="150px">
												<col width="225px">
												<col width="225px">
												<col width="100px">
												<col width="150px">
												<col width="100px">
											</colgroup>
											<tbody>
												<tr>
													<th>회원번호</th>
													<th>상품명</th>
													<th>가입일자</th>
													<th>납입회차</th>
													<th>가입상태</th>
													<th>계약담당자</th>
												</tr>
												<c:forEach var="list" items="${joinPrdctList}" varStatus="status">
													<tr>
														<td>${list.accntNo}</td>
														<td>${list.prodNm}</td>
														<td>${egov:convertDate(list.joinDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</td>
														<td>${list.trueCnt}회차</td>
														<td>${egov:decode(list.accStat, '', '정상', list.accStat)}</td>
														<td>${list.empleNm}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<p class="widthScbg"></p>
								</div>
		
								<p class="titTxt mt60">청약철회 기간 안내</p>
		
								<ul class="dotBox2 mt15">
									<li>청약철회는 상조서비스 회원 약관 ‘제 4조 철회권의 행사 1항’에 따라, ‘약관을 받은 날부터 <span class="red">14일 이내</span>에만 가능합니다. </li>
								</ul>
		
								<p class="titTxt mt60">청약철회 가능 상품 안내</p>
		
								<ul class="dotBox2 mt15">
									<li>약관 수령 후 <span class="red">14일 이내</span> 컨택센터(1588-8511, 운영시간 09시~18시)로 연락주셔서 청약철회 의사를 밝히시면 계약철회가 가능합니다.</li>
								</ul>
							</c:otherwise>
						</c:choose>
						
						<script type="text/javascript">
						//<![CDATA[
						           
						//]]>
						</script>