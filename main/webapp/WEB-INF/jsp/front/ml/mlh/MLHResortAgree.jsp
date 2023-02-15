<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<form id="frm" method="post" action="./update.do">
							<input type="hidden" name="csrfPreventionSalt" value="${csrfPreventionSalt}" class="notRequired" />
							
							<!-- 2017-07-27 추가 -->
							<p class="titTxt mt55">리조트 객실 예약을 위한 개인정보 제공 동의 (<span class="titCol">필수사항</span>)</p>
							<div class="boardType2 mt15">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="25%">
										<col width="25%">
										<col width="25%">
										<col width="25%">
									</colgroup>
									<tbody>
										<tr>	
											<th scope="row" class="taC">제공받는자</th>
											<th scope="row" class="taC">제공정보</th>
											<th scope="row" class="taC">이용목적</th>
											<th scope="row" class="taC">이용기간</th>
										</tr>
										<tr class="colTdc">
											<td><span style="display:inline-block;text-align:left;">(주)소노인터내셔널</span><br/></td>
											<td>암호화된 동일인 식별정보(CI)</td>
											<td>멤버십 서비스 중 소노호텔&리조트 주요시설의 예약 및 확인</td>
											<td>제공 목적 달성시 또는 회원 자격 유지시</td>
										</tr>
									</tbody>
								</table>
								<!-- <div class="radioChk">
									<span class="list">
										<input type="radio" id="children1" name="agreementForThirdParty" value="Y" title="예" class="checkbox notRequired" <c:if test="${memInfo.agreementForThirdParty eq 'Y'}">checked</c:if> />
										<label for="children1">예</label>
									</span>
									<span class="list">
										<input type="radio" id="children2" name="agreementForThirdParty" value="N" title="아니오" class="checkbox notRequired"  <c:if test="${memInfo.agreementForThirdParty eq 'N'}">checked</c:if>  />
										<label for="children2">아니오</label>
									</span>
								</div> -->
								<p class="mt20">※ 위 제공받는 자는 해당 법인의 법인명이 변경되어도 동일하게 적용됩니다.</p>
								<p class="red mt5">※ 고객님은 개인정보 제3자 제공에 대한 동의를 거부할 권리가 있으며, 미동의 시 리조트 서비스 이용에 제한이 있을 수 있습니다.</p>
								<p class="mt5">※ 대명아임레디 상품 가입 회원 일 경우에만, 상기 정보가 제공됩니다.</p>
							</div>

							<div class="mt30 taC">
								<a href="javscript:" id="reg" class="btnRed <c:if test="${rtnMap.agreementForThirdParty eq 'Y'}"> disable </c:if>"  >확인</a>
								<input type="submit" style="display:none" />
								<a href="https://www.sonohotelsresorts.com/mv.dp/dmparse.dm?menuCd=5560000" target="_blank" class="btnRed2 btnWide f-purple btnResortY <c:if test="${rtnMap.agreementForThirdParty eq 'N'}">hide</c:if>" >리조트 예약하기</a>
							</div>
							<!-- //2017-07-27 추가 -->
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
							
							jQuery(document).ready(function(){
								//유효성 체크
								jQuery("#frm").validation({
									msg : {
										confirm : "리조트 객실 예약을 위한 (주)대명레저산업 개인정보 제공에 동의하시겠습니까?"
									},
							        loadingbar : {
										use : true
									}
								});
								
								jQuery("#reg").on("click", function(e){
									//기본이벤트 제거
									e.preventDefault();
									if($('#reg').hasClass("disable") == false){
										jQuery("input[type='submit']").trigger("click");
									}
								});
								/*
								jQuery("#reg").on("click", function(e){
									$('#frm').submit();
								});
								*/
								
							});
							
						//]]>
						</script>