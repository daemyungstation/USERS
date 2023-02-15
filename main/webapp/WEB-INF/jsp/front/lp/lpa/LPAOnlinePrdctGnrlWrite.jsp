<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>


					<div data-controller="CommonController OnlinePrdctController BackBlockController">
						<p class="memberTxt taC"><img src="/common/images/txt/member_txt3.gif" alt="상품선택"></p>
						
						<form name="frm" method="post" action="./insert.do" >
							<input type="hidden" name="prdct_cs_gb" value="${rtnMap.prdctCsGb}" />
							<input type="hidden" name="pmt_co_grp_gb" value="" class="notRequired" />
							
						<p class="titTxt mt40">상품정보 입력</p>
								
						<div id="productDiv">								
							<div id="productForm0" class="boardType2 mt15 productForm" data-index="0">
								<input type="hidden" name="prdct_cd" value="" class="notRequired" readonly="readonly"  />								
								<input type="hidden" name="prdct_nm" value="" class="notRequired" readonly="readonly"  />
								
								<input type="hidden" name="pay_mtd" value="" class="notRequired" readonly="readonly"  />
								<input type="hidden" name="asgn_yn" value="" class="notRequired" readonly="readonly"  />
								<input type="hidden" name="asgn_cd" value="" class="asgn_cd notRequired" readonly="readonly"  />

								<table summary="" >
									<caption></caption> 
									<colgroup>
										<col width="25%">
										<col width="75%">
									</colgroup>
									<tbody>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">상품선택</span></th>
											<td>
												<span class="list">
													<select name="prdctGrpCd" title="상품">
														<option value="">[선택]</option>
														<c:forEach var="prdctGrpList" items="${rtnMap.prdctGrpList}" varStatus="status">
															<option value="${prdctGrpList.prdctGrpCd}" data-productcd="${prdctGrpList.prdctCd}" data-productnm="${prdctGrpList.prdctPrtNm}">${prdctGrpList.prdctPrtNm}</option>
														</c:forEach>
													</select>					
																	
													<input type="text" name="prdct_acnt" value="" class="inputType3 numberChk" title="구좌" maxlength="1" />구좌
													<a href="" class="btn333 productInfo">상품내용 확인</a>																							
												</span>
											</td>
										</tr>
										<tr>	
											<th rowspan="2" scope="row"><span class="essen" title="필수입력">납입방식(CMS이체)</span></th>
											<td class="paymentMethod" style="border-bottom:none;">
												<span>상품을 선택해주세요.</span>
												<!-- <span class="list">
													<input type="radio" id="marry1" name="" value="" title="" class="checkbox" style="">
													<label for="marry1">월 31,920원 x 125회</label>
												</span>
												<span class="list">
													<input type="radio" id="marry2" name="" value="" title="" class="checkbox" style="">
													<label for="marry2">399만원(일시납)</label>
												</span><span>상품을 선택해주세요.</span>-->
											</td>
										</tr>
										<tr>
											<td style="padding-top:0;"><span class="red">* 해당 금액은 1구좌 기준임을 알려드립니다.</span></td>
										</tr>
										<!--  <tr>	
											<th scope="row"><span class="essen" title="필수입력">가입구분</span></th>
											<td>
												<span class="list">
													<input type="radio" id="join" name="" value="" title="" class="checkbox" style="">
													<label for="join">일반 (신규)</label>
												</span>
											</td>
										</tr>-->
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">담당자</span></th>
											<td>
												<span class="list">
													<input type="radio" id="charge1" name="radio0" value="N" title="담당자" class="checkbox asgn_yn" style="">
													<label for="charge1">없음</label>
												</span>
												<span>
													<input type="radio" id="charge2" name="radio0" value="Y" title="담당자" class="checkbox asgn_yn" style="">
													<label for="charge2">있음</label>
												</span>
												
												
												<input type="text" id="" name="asgn_nm" value="" title="담당자 이름" class="inputType2 asgn_nm notRequired" style="" readonly="readonly" >
												<a href="" class="btn333 searchEmp" data-target='0'>담당자 검색</a>
												
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						<p class="titTxt mt55">결제계좌 정보</p>
						<div class="boardType2 mt15">
							<table summary="">
								<caption></caption>
								<colgroup>
									<col width="20%">
									<col width="80%">
								</colgroup>
								<tbody>
									<tr>	
										<th scope="row">결제구분</th>
										<td>
											<span class="list">
												<input type="radio" id="cms" name="pmt_gb" value="${rtnMap.cms}" title="" class="checkbox" style="">
												<label for="cms">CMS 계좌</label>
											</span>
											<span class="list">
												<input type="radio" id="ccard" name="pmt_gb" value="${rtnMap.creditCard}" title="" class="checkbox" style="">
												<label for="ccard">신용카드</label>
											</span>
										</td>
									</tr>
									<tr>	
										<th scope="row">예금주명(카드주명)</th>
										<td>
											${memInfo.info.name}
											<input type="hidden" id="" name="acnthd" value="${memInfo.info.name}" title="예금주명(카드주명)" class="inputType1" style="">
											<p class="red mt5">※ 예금주명(카드주명)은 가입자명과 동일해야 합니다.</p>
											<p class="red mt5">※ 대리납을 원하실 경우에는 추후 컨택센터(1588-8511)로 문의해주시기 바랍니다.</p>
										</td>
									</tr>
									<tr>	
										<th scope="row">생년월일</th>
										<td>${egov:convertDate(memInfo.info.birth, 'yyyyMMdd', 'yyyy년 MM월 dd일', '')}
											<!--  <input type="text" id="birthY" name="" value="" title="년도" class="inputType3 numberChk" style="" maxlength="4">
											년&nbsp;
											<input type="text" id="birthM" name="" value="" title="월" class="inputType3 numberChk" style="" maxlength="2">
											월&nbsp;
											<input type="text" id="birthD" name="" value="" title="일" class="inputType3 numberChk" style="" maxlength="2">
											일-->
											
											<input type="hidden" name="acnt_birth" value="${memInfo.info.birth}" class="notRequired" />
										</td>
									</tr>
									<tr>	
										<th scope="row">연락처</th>
										<td>
											<input type="text" id="" name="acnt_hp" value="" title="연락처" class="inputType1 mobileChk" style="" maxlength="13">
										</td>
									</tr>
									<tr>	
										<th scope="row" rowspan="2" id="pmtCo">은행명</th>
										<td id="pmtCoGb">
											<select id="bank" name="pmt_co_gb" class="inputType1" title="은행명">
												<option value="">[선택]</option>
												<c:forEach var="cdlist" items="${rtnMap.bankGb}" varStatus="status">
													<option value="${cdlist.comCd}" data-grpcd="${cdlist.grpCd}">${cdlist.cdNm}</option>
												</c:forEach>									
											</select>&nbsp;&nbsp;&nbsp;
											
											
											<select id="card" name="pmt_co_gb" class="inputType1" title="카드사명">
												<option value="">[선택]</option>
												<c:forEach var="cdlist" items="${rtnMap.cardGb}" varStatus="status">
													<option value="${cdlist.comCd}" data-grpcd="${cdlist.grpCd}">${cdlist.cdNm}</option>
												</c:forEach>									
											</select>															
										</td>
									</tr>
									<tr>
										<td>
											<span class="red bankDesc">※ 휴대폰 번호 등 평생 계좌는 등록이 불가능합니다.</span>
										</td>
									</tr>
									<tr>	
										<th id="payNo" scope="row" rowspan="2">계좌번호</th>
										<td>
											<input type="text" id="" name="pmt_no" value="" title="번호" class="inputType1 numberChk" style="" maxlength="16">&nbsp;&nbsp;&nbsp;
											
											<div id="cardExp" style="display:inline">
												<span class="dark">유효기간</span>
												<input type="text" id="" name="exp_yr" value="" title="년도" class="inputType3 notRequired numberChk" style="" maxlength="4">년
												
												<select name="exp_mm" class="notRequired">
													<option value="">월</option>													
													<option value="01">01월</option>
													<option value="02">02월</option>
													<option value="03">03월</option>
													<option value="04">04월</option>
													<option value="05">05월</option>
													<option value="06">06월</option>
													<option value="07">07월</option>
													<option value="08">08월</option>
													<option value="09">09월</option>
													<option value="10">10월</option>
													<option value="11">11월</option>
													<option value="12">12월</option>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<td><span class="red">※ (-) 없이 입력해 주세요.</span></td>
									</tr>
									<tr>	
										<th scope="row">납부일자 선택</th>
										<td>
											<span class="list">
												<input type="radio" name="pmt_day_gb" value="05" /> 05일&nbsp;
											</span>
											<span class="list">
												<input type="radio" name="pmt_day_gb" value="10" /> 10일&nbsp;
											</span>
											<span class="list">
												<input type="radio" name="pmt_day_gb" value="15" /> 15일&nbsp;
											</span>
											<span class="list">
												<input type="radio" name="pmt_day_gb" value="20" /> 20일&nbsp;
											</span>
											<span class="list">
												<input type="radio" name="pmt_day_gb" value="25" /> 25일&nbsp;
											</span>																																												
											<!--<c:forEach var="cdlist" items="${rtnMap.cdDtlList.pmtDayGb}" varStatus="status">
											<span class="list">
												<input type="radio" name="pmt_day_gb" value="${cdlist.cd}" />${cdlist.cdNm}&nbsp;
											</span>
											</c:forEach>-->													
										</td>
									</tr>
									<tr>	
										<th scope="row">해피콜 가능시간</th>
										<td>
											<select name="happy_call_gb" class="inputType1" title="해피콜 가능시간">
												<option value="">[선택]</option>
												<c:forEach var="cdlist" items="${rtnMap.cdDtlList.happyCall}" varStatus="status">
													<option value="${cdlist.cd}" <c:if test="${info.happyCallGb eq cdlist.cd}">selected</c:if>>${cdlist.cdNm}</option>
												</c:forEach>									
											</select>&nbsp;&nbsp;&nbsp;
											<span class="red">※ 18시 이후에는 해피콜을 운영하지 않습니다.</span>					
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="termTab" style="display: block;">
							<div class="termDiv mt20">
								<p class="tit">CMS출금이체 약관 및 개인정보 제공 동의</p>
							
								<button type="button" class="check checkBtn">
									<strong>동의합니다.</strong>
									<img src="/common/images/btn/check_bt.gif" alt="체크">
								</button>
								<input type="checkbox" name="agree2" style="display:none" />
							
								<div class="termBox">
									<p class="tit">[CMS출금이체약관]</p>
									<p class="txt">1. 위의 본인(신청인)은 납부하여야 할 요금에 대하여 별도의 통지 없이 본인의 지정출금계좌에서 수납기관이 정한 지정 출금일(휴일인 경우 익영업일)에 출금대체 납부하여 주십시오.</p>
									<p class="txt">2. 출금이체를 위하여 지정출금계좌의 예금을 출금하는 경우에는 예금약관이나 약정서의 규정에 불구하고 예금청구서나 수표 없이 출금이체 처리절차에 의하여 출금하여도 이의가 없습니다.</p>
									<p class="txt">3. 출금이체 지정계좌의 예금잔액(자동대출약정이 있는 경우 대출한도 포함)이 지정 출금일 현재 수납기관의 청구금액보다 부족하거나, 예금의 지급제한 또는 약정대출의 연체 등으로 대체납부가 불가능한 경우의 손해는 본인의 책임으로 하겠습니다.</p>
									<p class="txt">4. 지정출금일에 동일한 수종의 출금이체청구가 있는 경우의 출금우선순위는 출금은행이 정하는 바에 따르도록 하겠습니다.</p>
									<p class="txt">5. 출금이체 신규신청에 의한 이체개시일은 수납기관의 사정에 의하여 결정됩니다.</p>
									<p class="txt">6. 출금이체신청(신규, 해지)은 해당납기일 5일전까지 신청서를 제출하여야 합니다.</p>
									<p class="txt">7. 출금이체 신청에 의한 지정계좌에서의 출금은 수납기관의 청구대로 출금키로 하며 출금요금에 이의가 있는 경우에는 본인과 수납기관이 협의하여 조정키로 합니다.</p>
									<p class="txt">8. 출금이체금액은 해당 지정출금일 은행 영업시간 내에 입금된 예금(지정출금일에 입금된 타점권은 제외)에 한하여 출금처리 됩니다.</p>
									<p class="txt">9. 이 약관은 신청서를 수납기관에 직접 제출하여 출금이체를 신청한 경우에도 적용합니다.</p>
									<p class="txt">10. 본 신청과 관련하여 본인은 금융거래정보를 출금이체를 신규 신청하는 때로부터 해지 신청할 때까지 상기 수납기관에 제공하는 것에 대하여 「금융실명거래 및 비밀보장에관한법률」의 규정에 따라 동의합니다.</p>
									<p class="tit mt25">[CMS이체 개인정보 제공 동의]</p>
									<p class="txt">1. 개인정보의 제공 (CMS결제 시)</p>
									<p class="txt mt10">본인(예금주)은 (주)대명스테이션 CMS자동이체와 관련하여 아래와 같이 개인정보를  제공하는 것에 동의합니다.</p>
									<p class="txt2 mt5">- 제공받는자 : 금융결제원</p>
									<p class="txt2">- 제공하는 개인정보 항목 : 예금주(법인명), 은행명, 계좌번호, 연락처, 주민번호 앞 7자리(생년월일/성별)</p>
									<p class="txt2">- 제공목적 : CMS자동이체(상조서비스 대금납부/ 전자제품 할부대금 납부), CMS 신규 등록 및 해지 사실 통지</p>
									<p class="txt2">- 제공기간 : (주)대명스테이션 서비스 탈퇴 시 까지</p>
									<p class="txt">예금주 본인은 동의를 거부할 권리가 있으며, 거부 시 CMS자동이체(상조서비스 대금/전자제품 할부대금 납부)가 불가합니다.</p>
								</div>
							</div>
						</div>
						
						<div class="termTab" style="display:none">
							<div class="termDiv mt20">
								<p class="tit">카드출금이체 약관 및 개인정보 제공 동의</p>
							
								<button type="button" class="check checkBtn">
									<strong>동의합니다.</strong>
									<img src="/common/images/btn/check_bt.gif" alt="체크">
								</button>
								<input type="checkbox" name="agree3" style="display:none" />
							
								<div class="termBox">
									<p class="tit">[카드출금이체약관]</p>
									<p class="txt">1. 위의 본인(카드주)는 납부하여야 할 요금에 대해서 별도의 통지 없이 본인의 지정카드번호에서 수납기관이 정한 지정된 결제일(휴일인 경우 익영 영업일)에 결제됩니다.</p>
									<p class="txt">2. 카드청구결제일에 카드한도초과, 연체로 인한 정지등으로 대체납부가 불가능한 경우의 손해는 본인의 책임으로 하겠습니다.</p>
									<p class="txt">3. 지정청구일에 동일한 수종의 청구가 있는 경우의 청구우선순위는 해당카드사가 정하는 바에 따르도록 하겠습니다.</p>
									<p class="txt">4. 카드청구 신규신청에 의한 청구 개시일은 수납기관의 사정에 의하여 결정됩니다.</p>
									<p class="txt">5. 카드청구(신규, 해지)는 해당납기일 5일전까지 신청서를 제출하여야 합니다.</p>
									<p class="tit mt25">[신용카드결제 개인(신용)정보 제공 동의서]</p>
									<p class="txt">1. 개인정보의 제공 (카드결제 시) </p>
									<p class="txt mt10">본인(카드주)은 (주)대명스테이션 신용카드결제와 관련하여 아래와 같이 개인정보를 제공하는 것에 동의합니다. </p>
									<p class="txt2">- 제공받는자 : NICE 정보통신㈜</p>
									<p class="txt2">- 제공하는 개인정보 항목 : 주민번호 앞 7자리, 신용카드번호, 금액, 가입일자, 거래종류, 거래승인번호 등 거래내역에 관련된 정보</p>
									<p class="txt2">- 제공목적 : 신용카드 결제(상조서비스 및 전자제품 할부매매 대금납부)</p>
									<p class="txt2">- 제공기간 : (주)대명스테이션 서비스 탈퇴 시 까지</p>
									<p class="txt">카드주 본인은 동의를 거부할 권리가 있으며, 거부 시 카드자동이체(상조서비스 대금/전자제품 할부대금 납부)가 불가합니다. </p>
								</div>
							</div>
						</div>	
						
						<div class="mt30 taR">
							<a href="" class="btnRed" id="submit">신청 완료</a>
							<a href="" class="btnRed2">취소</a>
							
							<input type="submit" style="display:none" />
						</div>
						</form>
					</div>