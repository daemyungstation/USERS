<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<div data-controller="MLAPmtPtcController">	
							<p class="titTxt">상품명 - ${pmtPtcDtlList[0].prodNm}</p>
							<div class="scrollX mt20">
								<div class="boradType7">
									<table class="type1" summary="">
										<caption></caption>
										<colgroup>
											<col width="100px" />
											<col width="100px" />
											<col width="110px" />
											<col width="110px" />
											<col width="110px" />
											<col width="110px" />
											<col width="110px" />
											<col width="100px" />
											<col width="100px" />
										</colgroup>
										<tbody>
											<tr>
												<th>회차</th>
												<th>월분</th>
												<th>납입일자</th>
												<th>상조부금<br />납입금</th>
												<th>결합상품<br />납입금</th>
												<th>결합상품<br />추가납입금</th>
												<th>월납입금총액</th>
												<th>납입방법</th>
												<th>상태</th>
											</tr>
											<c:forEach var="list" items="${pmtPtcDtlList}" varStatus="status">
												<tr>
													<td>${list.no}</td>
													<td>
														<c:choose>
															<c:when test="${status.first}">
																${egov:convertDate(list.payDay, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM', '')}
															</c:when>
															<c:otherwise>
																<c:set var="mmBun" value="${egov:addMonth(egov:convertDate(pmtPtcDtlList[0].payDay, 'yyyy-MM-dd HH:mm:ss', 'yyyyMMdd', ''), status.index)}" />
																${egov:convertDate(mmBun, 'yyyyMMdd', 'yyyy-MM', '')}
															</c:otherwise>
														</c:choose>
													</td>
													<td>${egov:convertDate(list.payDay, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</td>
													<td>
														<fmt:formatNumber value="${egov:nvl(list.trueAmt, 0)}" type="number" maxFractionDigits="0" />
													</td>
													<td>
														<fmt:formatNumber value="${egov:nvl(list.relatAmt, 0)}" type="number" maxFractionDigits="0" />
													</td>
													<td>
														<fmt:formatNumber value="${egov:nvl(list.addAmt, 0)}" type="number" maxFractionDigits="0" />
													</td>
													<td><fmt:formatNumber value="${list.trueAmt + list.relatAmt + list.addAmt}" type="number" maxFractionDigits="0" /></td>
													<td>${list.payMthd}</td>
													<td>
														<c:choose>
															<c:when test="${list.stat eq 0}">
																정상
															</c:when>
															<c:when test="${list.stat eq 1}">
																선납
															</c:when>
															<c:when test="${list.stat eq 2}">
																연체
															</c:when>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<p class="widthScbg"></p>
							</div>
							
							<div class="mt20 taR">
								<a href="./index.do" class="prvBt"><img src="/common/images/btn/prvpage_bt.gif" title="이전" alt="" /></a>
								<a href="javascript:" class="whtBt3 printPayment" data-accntNo="${emfMap.accntNo}">납입내역 출력</a>
							</div>
						</div>
						
						<script type="text/javascript">
						//<![CDATA[
							
						//]]>
						</script>