<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
							
						<c:choose>
							<c:when test="${fn:length(rtnMap.list) eq 0}">
								<div class="noCpro">
									전환서비스 신청 내역이 없습니다.
								</div>
		
								<p class="taR mt30">
									<a href="/my-lifeway/chage-service/request/index.do" class="prvBt"><img alt="" title="이전" src="/common/images/btn/prvpage_bt.gif"></a>
								</p>
							</c:when>
							<c:otherwise>
								<c:forEach var="list" items="${rtnMap.list}" varStatus="status1">
									<div class="scrollX <c:if test="${!status1.first}">mt20</c:if>">
										<div class="boradType7">
											<table class="type1" summary="">
												<caption></caption>
												<colgroup>
													<col width="130px" />
													<col width="165px" />
													<col width="165px" />
													<col width="130px" />
													<col width="100px" />
													<col width="130px" />
													<col width="100px" />
												</colgroup>
												<tbody>
													<tr>
														<th>회원명</th>
														<th>회원번호</th>
														<th>상품명</th>
														<th>상품금액</th>
														<th>납입 회차</th>
														<th>납입한 금액</th>
														<th>상조가입일</th>
													</tr>
													<tr>
														<td>${list.prdctInfo.memNm}</td>
														<td>
															<a href="javascript:selectDetails('${list.rqstSeq}');">
																<strong style="text-decoration:underline">${list.accntNo}</strong>
															</a>
														</td>
														<td>
															<a href="javascript:selectDetails('${list.rqstSeq}');">
																<strong style="text-decoration:underline">${list.prdctInfo.prodNm}</strong>
															</a>
														</td>
														<td><fmt:formatNumber value="${list.prdctInfo.prodAmt}" type="number" maxFractionDigits="0" />원</td>
														<td>${list.prdctInfo.trueCnt}회</td>
														<td><fmt:formatNumber value="${list.prdctInfo.trueAmt + list.prdctInfo.relatAmt + list.prdctInfo.addAmt}" type="number" maxFractionDigits="0" />원</td>
														<td>${egov:convertDate(list.prdctInfo.joinDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</td>
													</tr>
												</tbody>
											</table>
											<table class="type2" summary="">
												<caption></caption>
												<colgroup>
													<col width="150px" />
													<col width="800px" />
												</colgroup>
												<tbody>
													<tr>
														<th>현황</th>
														<td class="process">
															<c:set var="cdlist" value="${rtnMap.cdDtlList.chngPrcsStts}" />
															<c:forEach var="i" begin="1" end="${fn:length(cdlist) - 1}" varStatus="status2">
																<c:if test="${not status2.first}">
																	<span class="bar">&gt;</span>
																</c:if>
																<c:choose>
																	<c:when test="${list.prcsCd eq cdlist[i].cd}">
																		<strong style="text-align: center;">
																			${cdlist[i].cdNm}<br />
																			<c:choose>
																				<c:when test="${not empty list.prcsLog[i-1].modDtm}">
																					(${egov:convertDate(list.prcsLog[i-1].modDtm, 'yyyy-MM-dd HH:mm:ss', 'yy.MM.dd HH:mm', '')})
																				</c:when>
																				<c:otherwise>
																					&nbsp;
																				</c:otherwise>
																			</c:choose>
																		</strong>
																	</c:when>
																	<c:otherwise>
																		<span style="text-align: center;">
																			${cdlist[i].cdNm}<br />
																			<c:choose>
																				<c:when test="${not empty list.prcsLog[i-1].modDtm}">
																					(${egov:convertDate(list.prcsLog[i-1].modDtm, 'yyyy-MM-dd HH:mm:ss', 'yy.MM.dd HH:mm', '')})
																				</c:when>
																				<c:otherwise>
																					&nbsp;
																				</c:otherwise>
																			</c:choose>
																		</span>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</td>
													</tr>
													<c:if test="${list.prcsCd eq '04'}">
														<tr>
															<th>잔여금</th>
															<td class="remainArea">
																<span class="remain">
																	<strong>잔여금</strong>
																	<span class="money"><fmt:formatNumber value="${list.prdctInfo.prodAmt - (list.prdctInfo.trueAmt + list.prdctInfo.relatAmt + list.prdctInfo.addAmt)}" type="number" maxFractionDigits="0" />원</span>
																</span>
																<span class="bar">|</span>
																<span class="remain">
																	<strong>중도금</strong>
																	<span class="money"><fmt:formatNumber value="${list.itmdtPay}" type="number" maxFractionDigits="0" />원</span>
																</span>
																<span class="bar">|</span>
																<span class="remain">
																	<strong>납부할 금액</strong>
																	<span class="money"><fmt:formatNumber value="${list.prdctInfo.prodAmt - (list.prdctInfo.trueAmt + list.prdctInfo.relatAmt + list.prdctInfo.addAmt) - list.itmdtPay}" type="number" maxFractionDigits="0" />원</span>
																</span>
															</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
										<p class="widthScbg"></p>
									</div>
									
									<div class="warnBox mt10">
										전환서비스 신청 취소는 <strong class="red" style="text-decoration:underline">상담진행전</strong>까지만 가능합니다. 상담진행 이후로는 컨택센터 1588-8511로 전화 주시기바랍니다. 
									</div>
									
									<div class="mt10 taR">
										<c:if test="${list.prcsCd eq '01'}">
											<a href="javascript:updateCancel('${list.rqstSeq}');" class="btnRed2 wide">취소</a>
										</c:if>
										<a href="javascript:selectDetails('${list.rqstSeq}');" class="btnRed wide">신청내용 보기</a>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						
						<form name="frm" method="post" action="">
							<input type="hidden" name="rqstSeq" value="" />
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
							
							function updateCancel(rqstSeq)
							{
								if(confirm("취소시 신청한 내역이 삭제됩니다.\n취소하시겠습니까?"))
								{
									var f = document.frm;
									
									f.action = "./cancel.do";
									f.rqstSeq.value = rqstSeq;
									f.submit();
								}
							}
							
							function selectDetails(rqstSeq)
							{
								var f = document.frm;
								
								f.action = "./view.do";
								f.rqstSeq.value = rqstSeq;
								f.submit();
							}
							
						//]]>
						</script>