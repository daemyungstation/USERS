<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

						
						<c:set var="memInfo" value="${rtnMap.memInfo}" />
						<c:set var="memInfo2" value="${rtnMap.memInfo2}" />

						<div data-controller="CommonController JoinController" data-gb="modify" onload="mktDisable();">
							<!-- form name="frm" method="post" action="./update.do" -->
							<form name="frm" method="post" action="./update_sso.do">
								<input type="hidden" name="csrfPreventionSalt" value="${csrfPreventionSalt}" class="notRequired" />
								
								<p class="titTxt mt40">회원정보</p>
								<div class="boardType2 mt15">
									<table summary="">
										<caption></caption>
										<colgroup>
											<col width="20%" />
											<col width="80%" />
										</colgroup>
										<tbody>
											<tr>	
												<th scope="row"><span>회원이름</span></th>
												<td>
													${memInfo.name}&nbsp;&nbsp;&nbsp;
													<a href="javascript:" id="renaming" class="btn333">개명신청 안내</a>
												</td>
											</tr>
											<tr>	
												<th scope="row"><span>생년월일</span></th>
												<td>${egov:convertDate(memInfo.birth, 'yyyyMMdd', 'yyyy년 MM월 dd일', '')}</td>
											</tr>
											<tr>	
												<th scope="row"><span>아이디</span></th>
												<td>${rtnMap.integrationId}</td>
											</tr>
											<tr>	
											<th scope="row"><span class="essen" title="필수입력">이메일</span></th>
												<td>
													<input type="text" id="email" name="email" value="${memInfo.email}" title="이메일계정" class="inputType1 emailChk" maxlength="40" data-state="false">
													
													<select id="maillist" class="notRequired">
														<option value="">[도메인 선택]</option>
														<option value="naver.com">naver.com</option>
														<option value="daum.net">daum.net</option>
														<option value="nate.com">nate.com</option>												
														<option value="gmail.com">gmail.com</option>
													</select>
													<a href="javascript:" class="btn333" id="emailOverapCheck" >중복확인</a>
												</td>
											</tr>
											<tr>	
												<th scope="row"><span class="essen" title="필수입력">휴대전화</span></th>
												<td>
													<input type="text" name="hp" value="${memInfo.cellPhone}" title="휴대전화" class="inputType1 mobileChk" maxlength="13" id="hp" />
													&nbsp;<span class="red">※한번 더 확인해주십시오. 오기입으로 발생하는 문제는 이용자에게 있습니다.</span><!-- 번호 입력 문구 추가 2017-07-25 -->
													<!-- 
													<select name="hpa" class="inputType3" title="휴대전화 첫자리">
														<option value="010">010</option>
													</select>
													-
													<input type="text" id="hps" name="hps" value="" title="휴대전화 둘째자리" class="inputType3" style="" />
													-
													<input type="text" id="hpi" name="hpi" value="" title="휴대전화 셋째자리" class="inputType3" style="" />
													-->
												</td>
											</tr>
											<tr>	
												<th scope="row"><span>전화번호</span></th>
												<td>
													<input type="text" name="tel" value="${memInfo.phone}" title="전화번호" class="inputType1 phoneChk notRequired" maxlength="13" id="tel" />
													<!-- 
													<select name="tela" class="inputType3" title="전화번호 첫자리 선택">
														<option>02</option>
													</select>
													-
													<input type="text" id="tels" name="tels" value="" title="전화번호 둘째자리" class="inputType3" style="" />
													-
													<input type="text" id="teli" name="teli" value="" title="전화번호 셋째자리" class="inputType3" style="" />
												 	-->
												</td>
											</tr>
											<tr>	
												<th scope="row"><span class="essen" title="필수입력">주소</span></th>
												<td>
													<div class="">
														<input type="text" name="zipcd" value="${memInfo.zipCode}" title="우편번호" class="inputType3 add1 notRequired" maxlength="7" readonly="readonly" />
														<input type="text" name="adr" value="${memInfo.address}" title="주소" class="inputType5" maxlength="100" readonly="readonly" />
														<a href="javascript:" id="zipcode" class="btn333">우편번호 찾기</a>
													</div>
													<p class="mt10"><input type="text" name="adr_dtl" value="${memInfo.addressDetail}" title="상세주소" class="inputType4" maxlength="100" placeholder="상세주소" /></p>
												</td>
											</tr>
										</tbody>
									</table>
									<div class="" style="width: 99%">
										<div id="daum_zipcode_wrap" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative; margin-top:30px;">
											<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:-1px;top:-20px;z-index:1" onclick="javascript:jQuery('#daum_zipcode_wrap').hide();" alt="접기 버튼">
										</div>
									</div>
									<p class="red mt5">※ 상품 가입고객은 회원정보 수정 시 컨택센터 1588-8511로 연락바랍니다. </p>
									<p class="red mt5">※ 개인정보 오기입으로 인한 문제발생 시 이용자에게 책임이 있습니다.</p>
								</div>
								<!-- 2017-06-29 추가 -->
								<!-- 
								<p class="titTxt mt55">개인정보 제 3자 제공 동의 (<span class="titCol">필수사항</span>)</p>
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
												<td>㈜대명레저산업</td>
												<td>암호화된 동일인 식별정보(CI)</td>
												<td>멤버십서비스 중 대명리조트 주요 시설의 예약 및 확인</td>
												<td>제공 목적 달성시 또는 대명라이프웨이 웹회원 탈퇴 시까지</td>
											</tr>
										</tbody>
									</table>
									<div class="radioChk">
										<span class="list">
										    <input type="radio" id="children1" name="agreementForThirdParty" value="Y" title="예" class="checkbox notRequired" <c:if test="${memInfo.agreementForThirdParty eq 'Y'}">checked</c:if> />
										    <label for="children1">예</label>
										</span>
										<span class="list">
										    <input type="radio" id="children2" name="agreementForThirdParty" value="N" title="아니오" class="checkbox notRequired"  <c:if test="${memInfo.agreementForThirdParty eq 'N'}">checked</c:if>  />
										    <label for="children2">아니오</label>
										</span>
									</div>
									<p class="mt5">※ 위 제공받는 자는 해당 법인의 법인명이 변경되어도 동일하게 적용됩니다.</p>
									<p class="red mt5">※ 고객님은 개인정보 제3자 제공에 대한 동의를 거부할 권리가 있으며, 미동의 시 리조트 서비스 이용에 제한이 있을 수 있습니다.</p>
									<p class="mt5">※ 대명라이프웨이 상품 가입 회원 일 경우에만, 상기 정보가 제공됩니다.</p>
								</div>
								 -->
								<!-- //2017-06-29 추가 -->

								<!-- 2017-07-20 추가 -->
								<p class="titTxt mt55">마케팅 목적의 개인정보 이용에 관한 사항 (선택사항)</p>
								<div class="memDesc">
									<div class="marketingAgree">
										<p>㈜대명스테이션이 다양한 신규서비스 및 이벤트 안내 등의 마케팅 목적을 위하여 아래에 기재된 내용대로 개인정보를 이용합니다.</p>
										<ul class="notice_list">
											<li>- 미 동의 시 다양한 이벤트와 혜택이 안내되지 않을 수 있습니다.</li>
											<li>- 이용기간 : 목적 달성 시까지 또는 회원탈퇴 시까지</li>
											<li>- 전송방법 : 아래에 동의한 항목으로만</li>
										</ul>

										<ul class="check_list">
											<li><input type="checkbox" id="agree_all_yn" name="all_check" value="Y" class="checkbox notRequired"  /><label for="all_check">전체</label></li>
											<li><input type="checkbox" id="telRcvYn" name="telRcvYn" value="Y" class="checkbox notRequired" <c:if test="${memInfo2.telRcvYn eq 'Y'}">checked</c:if> /><label for="telRcvYn">전화</label></li>
											<li><input type="checkbox" id="smsRcvYn" name="smsRcvYn" value="Y" class="checkbox notRequired" <c:if test="${memInfo2.smsRcvYn eq 'Y'}">checked</c:if> /><label for="smsRcvYn">문자</label></li>
											<li><input type="checkbox" id="emailRcvYn" name="emailRcvYn" value="Y" class="checkbox notRequired" <c:if test="${memInfo2.emailRcvYn eq 'Y'}">checked</c:if> /><label for="emailRcvYn">이메일</label></li>
											<li><input type="checkbox" id="ctlgRcvYn" name="ctlgRcvYn" value="Y" class="checkbox notRequired" <c:if test="${memInfo2.ctlgRcvYn eq 'Y'}">checked</c:if> /><label for="ctlgRcvYn">우편물</label></li>
											<!--<li><input type="checkbox" name="telRcvYn" value="Y" class="checkbox notRequired" <c:if test="${memInfo.telRcvYn eq 'Y'}">checked</c:if> />전화</li>
											<li><input type="checkbox" name="smsRcvYn" value="Y" class="checkbox notRequired" <c:if test="${memInfo.smsRcvYn eq 'Y'}">checked</c:if> />문자</li>
											<li><input type="checkbox" name="emailRcvYn" value="Y" class="checkbox notRequired" <c:if test="${memInfo.emailRcvYn eq 'Y'}">checked</c:if> />이메일</li>
											<li><input type="checkbox" name="ctlgRcvYn" value="Y" class="checkbox notRequired" <c:if test="${memInfo.ctlgRcvYn eq 'Y'}">checked</c:if> />우편물</li>-->
										</ul>
									</div>
<!--
									<p>※ 회원님은 동의를 거부할 수 있습니다. 동의 거부 시에는 해당 서비스를 이용하실 수 없습니다.</p>
									<dl class="selectPack selectPackBlock">
										<dd onclick="mktAgree(1)">
											<input type="radio" id="mkInfo1" name="marketingYn" title="마케팅 목적 수신동의" class="checkbox notRequired" value="Y" <c:if test="${memInfo.marketingYn eq 'Y'}">checked</c:if> />
											<label for="mkInfo1">예</label>
										</dd>
										<dd onclick="mktAgree(0)">
											<input type="radio" id="mkInfo2" name="marketingYn" title="마케팅 목적 수신동의" class="checkbox notRequired" value="N" <c:if test="${memInfo.marketingYn eq 'N'}">checked</c:if> >
											<label for="mkInfo2">아니오</label>
										</dd>
									</dl>
-->
								</div>
								<p class="titTxt mt55">추가정보 (선택사항)</p>
								<div class="boardType2 mt15">
									<table summary="">
										<caption></caption>
										<colgroup>
											<col width="20%" />
											<col width="80%" />
										</colgroup>
										<tbody>
											<tr>	
												<th scope="row">결혼 유/무</th>
												<td>
													<span class="list">
														<input type="radio" id="marry1" name="mrrg_yn" value="Y" title="결혼 유/무" class="checkbox notRequired" <c:if test="${memInfo.mrrgYn eq 'Y'}">checked</c:if> />
														<label for="marry1">유</label>
													</span>
													<span class="list">
														<input type="radio" id="marry2" name="mrrg_yn" value="N" title="결혼 유/무" class="checkbox notRequired" <c:if test="${memInfo.mrrgYn eq 'N'}">checked</c:if> />
														<label for="marry2">무</label>
													</span>
												</td>
											</tr>
											<tr>	
												<th scope="row">자녀 여부</th>
												<td>
													<span class="list">
														<input type="radio" id="children1" name="chdrn_gb" value="0" title="자녀 여부" class="checkbox notRequired" <c:if test="${memInfo.chdrnGb eq '0'}">checked</c:if> />
														<label for="children1">없음</label>
													</span>
													<span class="list">
														<input type="radio" id="children2" name="chdrn_gb" value="1" title="자녀 여부" class="checkbox notRequired" <c:if test="${memInfo.chdrnGb eq '1'}">checked</c:if> />
														<label for="children2">1</label>
													</span>
													<span class="list">
														<input type="radio" id="children3" name="chdrn_gb" value="2" title="자녀 여부" class="checkbox notRequired" <c:if test="${memInfo.chdrnGb eq '2'}">checked</c:if> />
														<label for="children3">2</label>
													</span>
													<span class="list">
														<input type="radio" id="children4" name="chdrn_gb" value="3" title="자녀 여부" class="checkbox notRequired" <c:if test="${memInfo.chdrnGb eq '3'}">checked</c:if> />
														<label for="children4">3이상</label>
													</span>
												</td>
											</tr>
											
											<c:forEach var="list" items="${rtnMap.cdDtlList.intrGb}" varStatus="status">
												<c:if test="${status.index % 5 eq 0}">
													<c:choose>
														<c:when test="${status.first}">
															<tr>	
																<th scope="row" rowspan="3">관심정보<br />(3가지 선택)</th>
																<td>
														</c:when>
														<c:otherwise>
															<tr>
																<td>
														</c:otherwise>
													</c:choose>
												</c:if>
												<span class="list">
													<input type="checkbox" id="favorInfo${status.count}" name="intr_ptc" value="${list.cd}" title="관심정보" class="checkbox notRequired" <c:if test="${fn:contains(memInfo.intrPtc, list.cd)}">checked</c:if>/>
													<label for="favorInfo${status.count}">${list.cdNm}</label>
												</span>
												<c:if test="${status.count % 5 eq 0}">
													</tr>
												</c:if>
											</c:forEach>
											<tr>
												<td>
													<span class="red">※ 정보를 입력하시면 각종 이벤트 /쿠폰 등 다양한 혜택을 안내받으실 수 있습니다 .</span>
												</td>
											</tr>
											<c:forEach var="list" items="${rtnMap.cdDtlList.joinPathGb}" varStatus="status">
												<c:if test="${status.index % 4 eq 0}">
													<c:choose>
														<c:when test="${status.first}">
															<tr>	
																<th scope="row" rowspan="2">가입경로</th>
																<td>
														</c:when>
														<c:otherwise>
															<tr>
																<td>
														</c:otherwise>
													</c:choose>
												</c:if>
												<span class="list${egov:decode(list.cdNm, '기타', '2', '')}">
													<input type="radio" id="joinway${status.count}" name="join_path" value="${list.cd}" title="가입경로" class="checkbox notRequired" <c:if test="${memInfo.joinPath eq list.cd}">checked</c:if>/>
													<label for="joinway${status.count}">${list.cdNm}</label>
													<c:if test="${list.cdNm eq '기타'}">
														&nbsp;&nbsp;
														<input type="text" name="join_path_etc" value="${memInfo.joinPathEtc}" title="기타" class="lginInput inputType5 notRequired" maxlength="100" <c:if test="${memInfo.joinPath ne list.cd}">readonly</c:if>/>
													</c:if>
												</span>
												<c:if test="${status.count % 4 eq 0}">
													</tr>
												</c:if>
											</c:forEach>
											<tr>	
												<th scope="row">상품가입 시,<br />가장 끌렸던 점은?<br />(2가지 선택)</th>
												<td>
													<c:forEach var="list" items="${rtnMap.cdDtlList.pfrnGb}" varStatus="status">
														<c:choose>
															<c:when test="${status.first}">
																<p>
															</c:when>
															<c:otherwise>
																<p class="mt10">
															</c:otherwise>
														</c:choose>
														<input type="checkbox" id="merit${status.count}" name="pfrn_ptc" value="${list.cd}" title="상품가입 시, 가장 끌렸던 점" class="checkbox notRequired" <c:if test="${fn:contains(memInfo.pfrnPtc, list.cd)}">checked</c:if>/>
														<label for="merit${status.count}">${list.cdNm}</label>
														<c:if test="${list.cdNm eq '기타'}">
															&nbsp;&nbsp;
															<input type="text" name="pfrn_etc" value="${memInfo.pfrnEtc}" title="기타" class="lginInput inputType1 notRequired" maxlength="100" <c:if test="${not fn:contains(memInfo.pfrnPtc, list.cd)}">readonly</c:if>/>
														</c:if>
														</p>
													</c:forEach>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
		
								<div class="mt30 taR" style="position:relative;">
							   <!-- <span id="btn_submit_mask" style="position:absolute;display:block;right: 0;width:100px;height:40px;" class="hide" onclick="alert('마케팅 목적의 개인정보 이용의  전송방법을 선택해주세요.')"></span> -->
									<a href="javscript:" id="reg" class="btnRed">확인</a>
									<input type="submit" style="display:none" />
								</div>
							</form>
						</div>
						

<script type="text/javascript">
	
	//체크박스 jQeury
	jQuery(document).ready(function(){
		//체크박스 전체 선택 & 해제
		jQuery("input:checkbox[name='all_check']").click(function(){
			if(jQuery(this).is(":checked"))
			{
				jQuery("input:checkbox[name='telRcvYn']").prop("checked", true);
				jQuery("input:checkbox[name='smsRcvYn']").prop("checked", true);
				jQuery("input:checkbox[name='emailRcvYn']").prop("checked", true);
				jQuery("input:checkbox[name='ctlgRcvYn']").prop("checked", true);
			}
			else
			{
				jQuery("input:checkbox[name='telRcvYn']").prop("checked", false);
				jQuery("input:checkbox[name='smsRcvYn']").prop("checked", false);
				jQuery("input:checkbox[name='emailRcvYn']").prop("checked", false);
				jQuery("input:checkbox[name='ctlgRcvYn']").prop("checked", false);
			}	
		});
	});

</script>	
	