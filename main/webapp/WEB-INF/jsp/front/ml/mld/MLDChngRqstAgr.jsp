<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
							
						<div data-controller="CommonController chngRqstAgrController">
							<form id="frm" method="post" action="./insert.do">
								<p class="joinTxt taC"><img src="/common/images/txt/change_service_txt2.gif" alt="약관동의" /></p>
		
								<p class="titTxt mt40">전환서비스 제공내역</p>
								<ul class="dotBox2 mt15">
									<li class="tit2">대명 라이프웨이 전환 서비스는 상조 서비스 미사용 고객에 한하여 제공되는 서비스입니다.<br />제공되는 서비스 중 하나를 선택하여 이용하실 수 있습니다.</li>
									<li class="tit mt30">꼭 확인해 주세요! </li>
									<li>전환서비스는 상조계약을 종료하고 선택하신 전환서비스를 이용할 수 있는 서비스이며, 잔여금을 일시로 완납 후 이용이 가능합니다.</li>
									<li>아래의 페이지에서 확인하신 내용 외에는 별도의 상품 변경은 어려우시며, 만약 제공서비스 외에 추가서비스를 원하실 경우, 신청접수 이후 제공업체 담당자와 상담 시 진행해 주시면 됩니다.</li>
								</ul>
								
								<div class="csConDiv">
									${prdctInfo.prdctCntn}
								</div>
								
								<c:if test="${not empty prdctInfo.prdctDtlNm}">
									<div class="boxTxt mt35">
										<strong>추가정보 선택</strong> : ${prdctInfo.prdctDtlNm}
									</div>
								</c:if>
								
								<div class="allTerm mt10">
									<button type="button" class="check" id="allAgree">
										<strong>전체 동의합니다.</strong>
										<img src="/common/images/btn/check_bt.gif" alt="체크" />
									</button>
									
									<input type="checkbox" name="allAgree" class="agree notRequired" style="display:none" />
								</div> 
								
								<div class="termDiv mt40">
									<p class="tit">안내사항</p>
									<button type="button" class="check checkBtn">
										<strong>안내사항을 모두 확인하였습니다.</strong>
										<img src="/common/images/btn/check_bt.gif" alt="체크" />
									</button>
									
									<input type="checkbox" name="agree1" style="display:none;" />
		
									<div class="termBox">
										${prdctInfo.oprtGuide}
									</div>
								</div>
								
								<div class="termTxtBox mt40">
									<p class="tit">[개인정보 수집 이용 제3자 제공 동의]</p>
									<p class="txt">대명 라이프웨이에서는 전환서비스 상담 및 이용을 위하여 귀하의 개인정보를 아래와 같이 수집·이용 및 제3자 제공을 하고자 합니다.<br />다음의 사항에 대해 충분히 읽어보신 후 동의 여부를 체크하여 주시기 바랍니다.</p>
								</div>
		
								<div class="termDiv mt30">
									<p class="tit">개인정보 수집 및 이용 동의</p>
		
									<button type="button" class="check checkBtn">
										<strong>동의합니다.</strong>
										<img src="/common/images/btn/check_bt.gif" alt="체크" />
									</button>
									
									<input type="checkbox" name="agree2" style="display:none;" />
		
									<div class="termBox">
										<div class="txt mt5">
											<table summary="">
												<caption></caption>
												<colgroup>
													<col width="30%" />
													<col width="35%" />
													<col width="35%" />
												</colgroup>
												<thead>
													<tr>
														<th>수집·이용하려는 개인정보의 항목</th>
														<th>개인정보의 수집·이용 목적</th>
														<th>개인정보 이용기간 및 보유기간</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>성명, 생년월일, 성별, 연락처, 이메일, 가입상품, 가입일자, 신청서비스, 납입현황</td>
														<td>서비스 제공에 관한 계약 이행 및 상담</td>
														<td>처리 종료 시</td>
													</tr>
												</tbody>
											</table>
										</div>
										<p class="txt">※ 귀하께서는 개인정보 제공 및 활용에 거부할 권리가 있습니다.</p>
										<p class="txt">거부에 따른 불이익 : 위 제공사항은 대명 스마트라이프 전환서비스 신청에 반드시 필요한 사항으로 거부하실 경우 서비스 이용이 불가함을 알려드립니다.</p>
									</div>
								</div>
		
								<div class="termDiv mt60">
									<p class="tit">개인정보의 제3자 제공 동의</p>
		
									<button type="button" class="check checkBtn">
										<strong>동의합니다.</strong>
										<img src="/common/images/btn/check_bt.gif" alt="체크" />
									</button>
									
									<input type="checkbox" name="agree3" style="display:none;" />
		
									<div class="termBox">
										<div class="txt mt5">
											<table summary="">
												<caption></caption>
												<colgroup>
													<col width="25%" />
													<col width="25%" />
													<col width="25%" />
													<col width="25%" />
												</colgroup>
												<thead>
													<tr>
														<th>개인정보를 제공받는자</th>
														<th>제공하는 개인정보의 항목</th>
														<th>개인정보를 제공받는 자의 개인정보 이용 목적</th>
														<th>제공받는 개인정보의 이용기간 및 보유기간</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>㈜대명본웨딩, ㈜대명투어몰, ㈜대명레저산업, ㈜통인익스프레스, ㈜까사미아, ㈜아가월드 ㈜파이브식스, ㈜대교, ㈜해외영어캠프</td>
														<td>성명, 성별, 연락처, 가입상품, 신청서비스, 납입현황</td>
														<td>① 신청 서비스 상담 및 컨텐츠 제공<br />② 상담을 위한 일정 및 정보제공 (전화, E-DM 발송)</td>
														<td>처리 종료 시</td>
													</tr>
												</tbody>
											</table>
										</div>
										<p class="txt red">※ 고개님의 개인정보는 선택하신 전환서비스 제공업체만 제공됩니다.</p>
										<p class="txt">※ 귀하께서는 개인정보 제공 및 활용에 거부할 권리가 있습니다.</p>
										<p class="txt">거부에 따른 불이익 : 위 제공사항은 대명 스마트라이프 전환서비스 신청에 반드시 필요한 사항으로 거부하실 경우 서비스 이용이 불가함을 알려드립니다.</p>
									</div>
								</div>
		
								<dl class="dotBox mt20">
									<dd>본인은 본 「개인정보 수집 · 이용 · 제3자 제공 동의서」 내용을 읽고 명확히 이해하였으며, 이에 동의합니다.</dd>
									<dd>본인은 전환서비스 신청에 대한 내용을 확인하였으며, 선택한 상위 상품으로 전환 하는 것에 최종 동의합니다.</dd>
									<dd>또한 최종 사용자를 위와 같이 하는 것에 동의하며, 이에 발생되는 제반 문제는 계약자 본인에게 귀속됨을 확인합니다.</dd>
								</dl>
		
								<p class="taC mt30">
									<a href="javascript:" id="submitLink" class="btnRed wide">전환서비스 신청접수</a>
									<input type="submit" value="전송" style="display:none;" />
								</p>
							</form>
						</div>
						
						<script type="text/javascript">
						//<![CDATA[
							
						//]]>
						</script>