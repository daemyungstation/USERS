<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
							
						<div data-controller="MLAPmtPtcController">
							<span class="red">
								<font style="display:inline-block;">※ 가입 상품의 납입현황입니다. 행사/해약 상품 내역은 표시되지 않습니다.</font>
							</span>
										
							<c:forEach var="list" items="${pmtPtcList}" varStatus="status">
								<div class="scrollX <c:if test="${not status.first}">mt60</c:if>">
									<div class="boradType7 mt10">
										<table class="type1" summary="">
											<caption></caption>
											<colgroup>
												<col width="150px" />
												<col width="260px" />
												<col width="180px" />
												<col width="180px" />
												<col width="180px" />
											</colgroup>
											<tbody>
												<tr>
													<th>회원번호</th>
													<th>상품명</th>
													<th>공제번호</th>
													<th>납입방법</th>
													<th>납입상태</th>
												</tr>
												<tr>
													<td>${list.accntNo}</td>
													<td>${list.prodNm}</td>
													<td>${egov:nvl(list.dedNo, '-')}</td>
													<td>${list.payMthdNm}</td>
													<td>${list.payStat}</td>
												</tr>
												<tr>
													<th>납입회차</th>
													<th>총납입금액</th>
													<th>상조부금<br />납입금</th>
													<th>결합상품<br />납입금</th>
													<th>결합상품<br />추가납입금</th>
												</tr>
												<tr>
													<td>${list.trueCnt}</td>
													<td><fmt:formatNumber value="${list.trueAmt + list.relatAmt + list.addAmt}" type="number" maxFractionDigits="0" /></td>
													<td><fmt:formatNumber value="${list.trueAmt}" type="number" maxFractionDigits="0" /></td>
													<td><fmt:formatNumber value="${list.relatAmt}" type="number" maxFractionDigits="0" /></td>
													<td><fmt:formatNumber value="${list.addAmt}" type="number" maxFractionDigits="0" /></td>
												</tr>
											</tbody>
										</table>
									</div>
									<p class="widthScbg"></p>
								</div>
								<div class="mt20 taR">
									<a href="javascript:selectPmtPtcDtl('${list.accntNo}');" class="whtBt3">납입현황 상세보기</a>
									<a href="javascript:" class="whtBt3 printPayment" data-accntNo="${list.accntNo}">납입내역 출력</a>
								</div>
							</c:forEach>		
						</div>
						
						<dl class="dotBox mt40">
							<dd>납입금액은 상조부금, 결합상품 금액, 추가부담금 등을 종합하여 표기 됩니다. 상세 내역은 [납입현황 상세보기]를 통해 확인하시기 바랍니다.</dd>
							<dd>[납입내역 출력]을 누르시면 기간별 납입내역을 조회하실 수 있습니다. </dd>
							<dd>결제계좌 조회 바로가기 <a href="/my-lifeway/join-product-information/payment-account/index.do"><strong class="red">[결제계좌 조회]</strong></a></dd>
						</dl>

						<div class="warnBox mt10">
							※ 공제번호는 소비자 피해보상 증서번호이며, 상조보증공제조합 홈페이지에서 조회가 가능합니다.
							<a href="http://www.ksmac.or.kr/main/main.do;jsessionid=pQrjpVchfRTHtKwCW1SRJ8JX2C8JL2DSvj4jCgnYyFyrJsTh1JT0!-1539299249" target="_blank" class="btnRed">사이트 방문</a>
						</div>
						
						<form name="frm" method="post" action="./list.do">
							<input type="hidden" name="accntNo" value="" />
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
						    
							function selectPmtPtcDtl(accntNo)
							{
								var f = document.frm;
								
								f.action = "./list.do";
								f.accntNo.value = accntNo;
								f.submit();
							}
							
						//]]>
						</script>