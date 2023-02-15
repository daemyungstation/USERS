<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<form name="frm" method="post" action="">
							<input type="hidden" name="pageIndex" value="${rtnMap.pageIndex}" />
							<input type="hidden" name="rsvtnSeq" value="" />
						
							<c:choose>
								<c:when test="${fn:length(rtnMap.list) eq 0}">
									<div class="noCpro mt30">
										목록이 없습니다.
									</div>
								</c:when>
								<c:otherwise>
									<div class="scrollX">
										<div class="boradType7">
											<table summary="">
												<caption></caption>
												<colgroup>
													<col width="100px" />
													<col width="125px" />
													<col width="175px" />
													<col width="150px" />
													<col width="150px" />
													<col width="150px" />
													<col width="100px" />
												</colgroup>
												<thead>
													<tr>
														<th>번호</th>
														<th>회원번호</th>
														<th>공연명</th>
														<th>예약일시</th>
														<th>예약 접수일시</th>
														<th>예약 취소일시</th>
														<th>현황</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="list" items="${rtnMap.list}" varStatus="status">
														<tr style="cursor:pointer;" onclick="selectPfmcRsvtnDtl('${list.rsvtnSeq}');">
															<td>
																${list.totCnt - (rtnMap.pageIndex - 1) * rtnMap.paginationInfo.pageSize - status.count + 1}
															</td>
															<td>
																${list.accntNo}
															</td>
															<td class="taL">
																${egov:tldCutString(list.pfmcNm, '...', '10')}
															</td>
															<td>
																<c:choose>
																	<c:when test="${not empty list.lastRsvtnDtm}">
																		${egov:convertDate(list.lastRsvtnDtm, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd HH:mm', '')}
																	</c:when>
																	<c:otherwise>
																		-
																	</c:otherwise>
																</c:choose>
															</td>
															<td>
																${egov:convertDate(list.regDtm, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd HH:mm', '')}
															</td>
															<td>
																<c:choose>
																	<c:when test="${not empty list.cnclDtm}">
																		${egov:convertDate(list.cnclDtm, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd HH:mm', '')}
																	</c:when>
																	<c:otherwise>
																		-
																	</c:otherwise>
																</c:choose>
															</td>
															<td>
																<c:choose>
																	<c:when test="${list.prcsCd eq '01' and list.prcsCd eq '02'}">
																		<c:set var="state" value="1"/>
																	</c:when>
																	<c:when test="${list.prcsCd eq '03'}">
																		<c:set var="state" value="2"/>
																	</c:when>
																	<c:otherwise>
																		<c:set var="state" value="3"/>
																	</c:otherwise>
																</c:choose>
																<span class="state${state}">${list.rsvtnPrcsStts}</span>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<p class="widthScbg"></p>
									</div>
								</c:otherwise>
							</c:choose>
	
							<div class="paging mt30">
								<ui:pagination paginationInfo="${rtnMap.paginationInfo}" type="image" jsFunction="getPageList" />
							</div>
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
						           
							//리스트 가져오기
							function getPageList()
							{	
								var f = document.frm;
								
								if(arguments.length > 0)
								{
									f.pageIndex.value = arguments[0];
								}
								else
								{
									f.pageIndex.value = 1;
								}
								
								f.action = "./list.do";
								f.submit();
							}
							
							//상세 가져오기
							function selectPfmcRsvtnDtl(rsvntSeq)
							{
								var f = document.frm;
								
								f.action = "./view.do";
								f.rsvtnSeq.value = rsvntSeq;
								f.submit();
							}
							
						//]]>
						</script>