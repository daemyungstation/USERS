<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
							
						<p class="titTxt">상품명 - ${refndPtcDtlList[0].prodNm}</p>
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
										<c:if test="${fn:length(refndPtcDtlList) eq 0}">
											<tr>
												<td colspan="10" style="text-align:center"><fmt:message key="common.nodata.msg" /></td>
											</tr>
										</c:if>
										<c:forEach var="list" items="${refndPtcDtlList}" varStatus="status">
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
							<a href="./index.do" class="prvBt"><img src="/common/images/btn/prvpage_bt.gif" title="이전" alt="" /></a>
						</div>
						
						<script type="text/javascript">
						//<![CDATA[
						           
						//]]>
						</script>