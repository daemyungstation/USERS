<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<div data-controller="MLAJoinPrdctController">	
							<span class="red">
								<font style="display:inline-block; margin-bottom:5px;">※ 회차별 납입 금액에 대한 상세 정보는 <a href="/my-lifeway/join-product-information/payment-status/index.do" class="red">[납입현황]</a>에서 확인 가능합니다.</font><br />
								<font>※ 자세한 상품정보는 회원증서를 참고하시기 바랍니다.</font>
							</span>
							
							<c:forEach var="list" items="${rtnMap.joinPtcList}" varStatus="status">
								<div class="scrollX <c:if test="${not status.first}">mt60</c:if>">
									<div class="boradType7 mt10">
										<table class="type1" summary="">
											<caption></caption>
											<colgroup>
												<col width="160px" />
												<col width="250px" />
												<col width="250px" />
												<col width="120px" />
												<col width="170px" />
											</colgroup>
											<tbody>
												<tr>
													<th>회원번호</th>
													<th>가입상품</th>
													<th>모델분류</th>
													<th>가입일자</th>
													<th>총 상품금액</th>
												</tr>
												<tr>
													<td>${list.accntNo}</td>
													<td>${list.prodNm}</td>
													<td><c:choose>
															<c:when test="${not empty list.prodModel}">${list.prodModel}</c:when>
															<c:otherwise>-</c:otherwise>
														</c:choose>
													</td>
													<td>${egov:convertDate(list.joinDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</td>
													<td><fmt:formatNumber value="${list.prodAmt}" type="number" maxFractionDigits="0" /></td>
												</tr>
												<tr>
													<th>만기회차</th>
													<th>특별할인회차(후할인)</th>
													<th>가입상태</th>
													<th>해약처리</th>
													<th>행사일자</th>
												</tr>
												<tr>
													<td>${list.exprNo}</td>
													<td>
														<c:choose>
															<c:when test="${list.newChanGunsu gt 0}">
																${list.newChanGunsu}회차
															</c:when>
															<c:otherwise>
																-
															</c:otherwise>
														</c:choose>
													</td>
													<td>${list.accStat}</td>
													<td>
														<c:choose>
															<c:when test="${empty list.resnCl}">
																-
															</c:when>
															<c:when test="${list.resnCl eq '02'}">
																미대상
															</c:when>
															<c:when test="${list.resnProcYn eq 'Y'}">
																처리
															</c:when>
															<c:otherwise>
																미처리
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														${egov:nvl(list.evntDay, '-')}
													</td>
												</tr>
											</tbody>
										</table>
										<c:if test="${not empty list.spplSrvcList}">
											<table class="type2" summary="">
												<caption></caption>
												<colgroup>
													<col width="150px" />
													<col width="325px" />
													<col width="150px" />
													<col width="325px" />
												</colgroup>
												<tbody>
													<c:forEach var="spplSrvcList" items="${list.spplSrvcList}" varStatus="status">
														<c:choose>
															<c:when test="${status.first}">
																<tr>
																	<th rowspan="${fn:length(list.spplSrvcList)}">부가서비스</th>
																	<td>${spplSrvcList.svcNm}</td>
																	<th rowspan="${fn:length(list.spplSrvcList)}">적용회차</th>
																	<td>
																		<c:choose>
																			<c:when test="${spplSrvcList.appNo eq '0'}">
																				후방
																			</c:when>
																			<c:otherwise>
																				${spplSrvcList.appNo}회차
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
															</c:when>
															<c:otherwise>
																<tr>
																	<td>${spplSrvcList.svcNm}</td>
																	<td>
																		<c:choose>
																			<c:when test="${spplSrvcList.appNo eq '0'}">
																				후방
																			</c:when>
																			<c:otherwise>
																				${spplSrvcList.appNo}회차
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</tbody>
											</table>
										</c:if>
									</div>
									<p class="widthScbg"></p>
								</div>
								<div class="mt20 taR btnsAlign">
									<!-- 2017-06-30 버튼 추가 -->
									<c:choose>
										<c:when test="${rtnMap.agreementForThirdParty eq 'Y'}">
											<a href="https://www.sonohotelsresorts.com/mv.dp/dmparse.dm?menuCd=5560000" class="btn333two mobNone btnResortY" target="_blank">소노호텔&리조트 예약하기</a>
										</c:when>
										<c:otherwise>
											<a href="/my-lifeway/member/resortagree/index.do" class="btn333two mobNone"  onclick="alert('대명리조트 예약을 위해서는 개인정보 제 3자 제공에 동의하셔야 합니다.\n나의 라이프웨이 리조트 객실 예약을 위한 (주)대명레저산업 개인정보 제공동의페이지로 이동합니다.');">대명리조트 예약하기</a>
										</c:otherwise>
									</c:choose>
									<!-- //2017-06-30 버튼 추가 -->
									<c:if test="${list.accStat eq '정상'}">
										<!-- <a href="javascript:" class="whtBt3 printCert" data-prdctCd="${list.prodCd}" data-joinDt="${list.joinDt}" data-accntNo="${list.accntNo}">회원증서 출력</a> -->
									
										<c:if test="${list.payType eq '002'}">
											<a href="javascript:" class="whtBt3 printContract" data-prdctCd="${list.prodCd}" data-joinDt="${list.joinDt}">계약안내 출력</a>
										</c:if>
										
								   <!-- <a href="javascript:" class="whtBt3 printTerm" data-prdctCd="${list.prodCd}" data-joinDt="${list.joinDt}">약관 출력</a> -->
										<a href="/my-lifeway/membership-card/index.do?accntNo=${list.accntNo}" class="btn333two">멤버십카드</a>
									</c:if>
								</div>
							</c:forEach>
						</div>
						
						<dl class="dotBox mt40">
							<!-- <dd>1회차 납입이 이루어지지 않은 회원은 납입회차가 ‘0’ 으로 표기되며, 정상적인 서비스를 제공받을 수 없습니다.<br />대명라이프웨이의 모든 서비스는 정상납입 회원에게 제공됨을 알려드립니다. (0 회차, 연체, 해약, 행사자 제외)</dd> -->
							<dd>일부 서비스 내용은 상황에 따라 차이가 있을 수 있습니다. 더 자세한 내용은 1대1 상담하기 또는 컨택센터(1588-8511)로 문의 바랍니다.</dd><!-- 2016-03-29 추가 -->
						</dl>
						
						<dl class="dotBox mt10">
							<dd>
								상품을 가입했는데 전체 상품내역이 보이지 않는 경우 [확인요청]을 클릭하시면 컨택센터에서 영업일 기준 3일 이내로 연락드립니다.&nbsp;&nbsp;&nbsp;
								<a href="javascript:" id="btnChkReqn" class="situ1">확인요청</a>
							</dd>
						</dl>
						
						<script type="text/javascript">
						//<![CDATA[
						           
						    jQuery(document).ready(function(){
								jQuery("#btnChkReqn").on("click", function(){
									if(confirm("접수하시겠습니까?"))
									{
										jQuery.post("/my-lifeway/check-requestion/insert.ajax",
											{
												"reqnGb" : "02"
											},
											function(r)
											{
												var status = r.status;
												
												if(status == "Y")
												{
													alert("확인요청이 접수되었습니다.");
												}
												else if(status == "N")
												{
													alert("확인요청이 이미 접수되었습니다.");
												}
											}
										).fail(function(){
											alert("예기치 않은 오류입니다.");
											return;
										});
									}
								});

								//var deviceChk = "win16|win32|win64|mac";
	 
								//if(navigator.platform){
									//if(0 > deviceChk.indexOf(navigator.platform.toLowerCase())){
										//jQuery(".mobNone").remove();
									//}
								//}

							});

								
						//]]>

						</script>