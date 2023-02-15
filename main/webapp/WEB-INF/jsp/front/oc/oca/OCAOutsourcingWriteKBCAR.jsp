<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

<h2 style="font-size: 36px; color: #333; line-height: 36px; margin-bottom: 50px; font-family: 'NanumSquareB'; font-weight: normal;">${info.title}</h2>

<style>
	.left_table {
		background-color : #cdcdcd;
		color : #000;
	}
	.kb_table {
		width : 300px;
		max-width : 400px;
		margin : 20px auto 0;
	}
	
	.kb_table td {
		border : 1px solid #232323;
		text-align : center;
	}
	
	.terms_table {
		width: 80%;
	}
	
	.terms_table th {
		border : 1px solid #232323;
		background-color : #cdcdcd;
		color : #000;
		text-align : center;
	}
	
	.terms_table td {
		border : 1px solid #232323;
		text-align : center;
		padding : 20px 0 20px 0;
	}
</style>

<div class="log-popup">
	<div class="log-popup-in" style="width:400px; height: 550px">
		<h2 style="width:400px;">KB 차차차 상품 소개<span class="ico"></span></h2>
		<div class="log-popup-box">
			<table class="kb_table mt20">
				<tr>
					<td class="left_table" colspan="2"><strong>상품명</strong></td>
					<td><strong>대명 오토라이프플랜</strong></td>
				</tr>
				<tr>
					<td class="left_table" colspan="2"><strong>총 상품금액</strong></td>
					<td>594만원</td>
				</tr>
				<tr>
					<td class="left_table" rowspan="2"><strong>월 납입금</strong></td>
					<td class="left_table"><strong>1~24회</strong></td>
					<td>47,700원</td>
				</tr>
				<tr>
					<td class="left_table"><strong>25~135회</strong></td>
					<td>43,200</td>
				</tr>
				<tr>
					<td class="left_table" colspan="2"><strong>납입회차</strong></td>
					<td>135회</td>
				</tr>
			</table>
			<p class="txt-info">
				<strong>[놓치지 마세요! “대명 오토라이프플랜” 혜택]</strong><br>
				<br>
				<font color="red">
				① KB차차차 중고차 구매 시, 100만원 지원!<br>
				② 대명그룹 멤버십 서비스 이용<br>
				</font>
				- 전국 15개 대명리조트 특별 우대 할인 제공<br>
				- 워터파크/스키월드 등 대명 부대시설 특별 우대 할인 제공<br>
				- 대명 아이스하키 홈 경기 관람 우대 혜택 제공<br><br>
				③ 하이브리드 서비스<br>
				- 원하는 시점에 필요한 라이프 서비스 자유 선택 가능<br>
				- 해외여행/크루즈/골프/어학연수/교육/웨딩/상조 중 택 1<br><br>
				④ 납입금 전액 100% 환급<br>
				- 라이프 서비스 미 이용 시, 납입금 594만원 전액 환급<br>
				- KB차차차 중고차 지원 금액 100만원 차감 없음
			</p>
		</div>
	</div>
	<div class="log-popup-bg"></div>
</div>
<script>
	window.onload = function(){
		$(".log-popup").fadeIn(350);
		$("html,body").css("overflow-y","hidden");
		
		$(".log-popup-in h2 span").click(function(){
			$(".log-popup").fadeOut(250);
			$("html,body").css("overflow-y","auto");
		});
		$(".log-popup-bg").click(function(e){
			$(".log-popup").fadeOut(250);
			$("html,body").css("overflow-y","auto");
		}); 
	}
</script>

<form name="frm" method="post" action="/outsourcing/insert.do">
<input type="hidden" name="b2bStts" value="${info.b2bStts}" />
<input type="hidden" name="b2bCd" value="${info.b2bCd}" class="notRequired" />
<input type="hidden" name="b2bNm" value="${info.b2bNm}" class="notRequired" />

<div data-controller="CommonController OutsourcingController">
	<c:if test="${info.agentInfoYn eq 'Y'}">
	<p class="titTxt mt40">판매사 정보 입력</p>
	<div class="boardType2 mt15">
		<table summary="">
			<caption></caption>
			<colgroup>
				<col width="20%" />
				<col width="80%" />
			</colgroup>
			<tbody>
				
				<!-- 주문번호 입력란 -->
				<c:if test="${info.orderNumYn eq 'Y'}">
					<tr>	
						<th scope="row"><span class="essen" title="필수입력">주문번호</span></th>
						<td>
							<input type="text" name="orderNum" title="주문번호" class="inputType1" style="border:0;" value="${orderNum}" readonly="readonly"/>
						</td>
					</tr>
				</c:if>
				<!-- 계약자명 입력란 -->
				<c:if test="${info.contractorNameYn eq 'Y'}">
					<tr>	
						<th scope="row"><span class="essen" title="필수입력">계약자명</span></th>
						<td>
							<input type="text" name="contractorName" title=계약자명 class="inputType1" style="border:0;" value="${contractorName}" readonly="readonly"/>
						</td>
					</tr>
				</c:if>
				<!-- 계약자 연락처 입력란 -->
				<c:if test="${info.contractorPhoneYn eq 'Y'}">
					<tr>
						<th scope="row"><span class="essen" title="필수입력">계약자 연락처</span></th>
						<td>
							<input type="text" name="contractorPhone" title="계약자 연락처" class="inputType1" style="border:0;" value="${contractorPhone}" readonly="readonly"/>
						</td>
					</tr>
				</c:if>
				<!-- 계약자 생년월일 입력란 -->
				<c:if test="${info.contractorBirthYn eq 'Y'}">
					<tr>	
						<th scope="row"><span class="essen" title="필수입력">계약자 생년월일</span></th>
						<td>
							<input type="text" name="contractorBirth" title="계약자 생년월일" class="inputType1" style="border:0;" value="${contractorBirth}" readonly="readonly"/>
						</td>
					</tr>
				</c:if>
				<!-- 주 계약 구좌 수 입력란 -->
				<c:if test="${info.orderQtyYn eq 'Y'}">
					<tr>	
						<th scope="row"><span class="essen" title="필수입력">주 계약 구좌 수</span></th>
						<td>
							<input type="text" name="orderQty" title="주 계약 구좌 수" class="inputType1" style="border:0;" value="${orderQty}" readonly="readonly"/>
						</td>
					</tr>
				</c:if>
				<!-- 주계약 서비스1 입력란 -->
				<c:if test="${info.mainContService1Yn eq 'Y'}">
					<tr>	
						<th scope="row"><span class="essen" title="필수입력">주계약 서비스1</span></th>
						<td>
							<input type="text" name="mainContService1" title="주계약 서비스1" class="inputType1" style="border:0;" value="${mainContService1}" readonly="readonly"/>
						</td>
					</tr>
				</c:if>
				<!--  주계약 서비스2 입력란 -->
				<c:if test="${info.mainContService2Yn eq 'Y'}">
					<tr>	
						<th scope="row"><span>주계약 서비스2</span></th>
						<td>
							<input type="text" name="mainContService2" title="주계약 서비스2" class="inputType1 notRequired" style="border:0;" value="${mainContService2}" readonly="readonly"/>
						</td>
					</tr>
				</c:if>
				<!-- 카드사 입력란 -->
				<c:if test="${info.cardCompanyYn eq 'Y'}">
					<tr>
						<th scope="row"><span class="essen" title="필수입력">신용카드사</span></th>
						<td>
							<input type="text" name="cardCompany" title="신용카드사" class="inputType1" style="border:0;" value="${cardCompany}" readonly="readonly"/>
						</td>
					</tr>
				</c:if>
				<!-- 카드번호(4자리) 입력란 -->
				<c:if test="${info.creditCardNumYn eq 'Y'}">
					<tr>
						<th scope="row"><span class="essen" title="필수입력">카드번호</span></th>
						<td>
							<input type="text" name="creditCardNum" title="카드번호" class="inputType1" style="border:0;" value="${creditCardNum}" readonly="readonly"/>
						</td>
					</tr>
				</c:if>
				<!-- 유효기간(MMYY) 입력란 -->
				<c:if test="${info.validThruYn eq 'Y'}">
					<tr>	
						<th scope="row"><span class="essen" title="필수입력">유효기간</span></th>
						<td>
							<input type="text" name="validThru" title="유효기간" class="inputType1" style="border:0;" value="${validThru}" readonly="readonly"/>
						</td>
					</tr>
				</c:if>
				<!-- 상사코드 입력란 -->
				<c:if test="${info.code2Yn eq 'Y'}">
					<tr>	
						<th scope="row"><span class="essen" title="필수입력">중고차 상사코드</span></th>
						<td>
							<input type="text" name="code2" title="상사코드" class="inputType1" style="border:0;" value="${code2}" readonly="readonly"/>
						</td>
					</tr>
				</c:if>
				<!-- 상사명 입력란 -->
				<c:if test="${info.agentNmYn eq 'Y'}">
					<tr>	
						<th scope="row"><span class="essen" title="필수입력">중고차 상사명</span></th>
						<td>
							<input type="text" name="agentNm" title="상사명" class="inputType1" style="border:0;" value="${agentNm}" readonly="readonly"/>
						</td>
					</tr>
				</c:if>
				<!-- 담당자명 입력란 -->
				<c:if test="${info.agentEmpNmYn eq 'Y'}">
					<tr>	
						<th scope="row"><span class="essen" title="필수입력">중고차 상사 담당자명</span></th>
						<td>
							<input type="text" name="agentEmpNm" title="담당자명" class="inputType1" style="border:0;" value="${agentEmpNm}" readonly="readonly"/>
						</td>
					</tr>
				</c:if>
				<!-- 담당자 연락처 입력란 -->
				<c:if test="${info.agentEmpTelYn eq 'Y'}">
					<tr>	
						<th scope="row"><span class="essen" title="필수입력">중고차 상사 연락처</span></th>
						<td>
							<input type="text" name="agentEmpTel" title="담당자 연락처" class="inputType1" style="border:0;" value="${agentEmpTel}" readonly="readonly"/>
						</td>
					</tr>
				</c:if>
				<!-- 차량번호 입력란 -->
				<c:if test="${info.plateNumYn eq 'Y'}">
					<tr>	
						<th scope="row"><span class="essen" title="필수입력">중고차 구매 차량번호</span></th>
						<td>
							<input type="text" name="plateNum" title="차량번호" class="inputType1" style="border:0;" value="${plateNum}" readonly="readonly"/>
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		
		<!-- 안내사항 표시란 -->
		<c:if test="${info.infoYn eq 'Y'}">
			<div id="info" style="white-space:pre-line">
				${info.info}
			</div>
		</c:if>
	</div>
</c:if>

<c:if test="${info.customerInfoYn eq 'Y'}">
	<p class="titTxt mt40">고객 정보 입력</p>
	<div class="boardType2 mt15">
		<table summary="">
			<caption></caption>
			<colgroup>
				<col width="20%" />
				<col width="80%" />
			</colgroup>
			<tbody>
				
				<!-- 상담 가능 시간대 입력란 -->
				<c:if test="${info.calltimeYn eq 'Y'}">
					<tr>	
						<th scope="row"><span class="essen" title="필수입력">상담 가능 시간대</span></th>
						<td>
							<select name="calltime" class="inputType1" title="상담 가능 시간대">
								<option value="">선택해 주세요</option>
								<option value="상시(빠른상담)">상시(빠른상담)</option>
								<option value="09:30 ~ 11:00">09:30 ~ 11:00</option>
								<option value="11:00 ~ 13:00">11:00 ~ 13:00</option>
								<option value="13:00 ~ 15:00">13:00 ~ 15:00</option>
								<option value="15:00 ~ 17:00">15:00 ~ 17:00</option>
								<option value="17:00 ~ 18:30">17:00 ~ 18:00</option>
							</select>
						</td>
					</tr>
				</c:if>
				
				<!-- 주소 입력란 -->
				<c:if test="${info.addressYn eq 'Y'}">
					<tr>	
						<th scope="row"><span class="essen" title="필수입력">주소</span>
						<span style="display: block;font-size: 12px;color: #b12b1d;padding-top: 8px;padding-left:20px;">※글자수 40자 제한</span>
						<span style="display: block;font-size: 12px;color: #777;padding-top: 8px;padding-left:20px;">예시) 서울시 송파구 문정동/ 서울시 송파구 법원로 135</span>
						</th>
						<td>
							<input type="text" name="adr" title="주소" class="inputType1" maxlength="40" />
						</td>
					</tr>
				</c:if>
				
				<!-- 이메일 입력란 -->
				<c:if test="${info.emailYn eq 'Y'}">
					<tr>	
						<th scope="row"><span>이메일</span>
						<span style="display: block;font-size: 12px;color: #777;padding-top: 8px;padding-left:20px;">예시) kbcar@daemyung.com</span>
						</th>
						<td>
							<input type="text" name="email" title="이메일" class="inputType1 notRequired" maxlength="100" />
						</td>
					</tr>
				</c:if>
				
				<!-- 비상연락처 입력란 -->
				<c:if test="${info.hpYn eq 'Y'}">
					<tr>	
						<th scope="row"><span>비상연락처</span>
						<span style="display: block;font-size: 12px;color: #777;padding-top: 8px;padding-left:20px;">※자택 유선번호, 가족 연락처</span>
						</th>
						<td>
							<input type="text" name="hp" title="비상연락처" class="inputType1 phoneChk notRequired" maxlength="13" />
						</td>
					</tr>
				</c:if>
				
				<!-- 메모 입력란 -->
				<c:if test="${info.memoYn eq 'Y'}">
					<tr>	
						<th scope="row"><span>메모</span>
						<span style="display: block;font-size: 12px;color: #b12b1d;padding-top: 8px;padding-left:20px;">※글자수 250자 제한</span>
						</th>
						<td>
							<textarea name="memo" title="메모" class="inputType4 notRequired" style="height:60px;" maxlength="250"></textarea>
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		
		<!-- 고객정보 안내사항 표시란 -->
		<c:if test="${info.cinfoYn eq 'Y'}">
			<div id="cinfo" style="white-space:pre-line">
				${info.cinfo}
			</div>
		</c:if>
	</div>
</c:if>				

<div class="termDiv mt40">
	<p class="tit">1. 포인트 구매계약에 대한 안내</p>
	<button type="button" class="check checkBtn">
		<strong>동의합니다.</strong>
		<img src="/common/images/btn/check_bt.gif" alt="체크">
	</button>
	<input type="checkbox" name="agree1" class="agree1" style="display: none" />
	
	<div class="termBox">
		<p class="txt" style="font-size: 13.33px;">▶ 안내사항</p>
		<p class="txt" style="font-size: 13.33px;">1. “DL포인트”는 ㈜대명스테이션이 제공하는 ‘DL포인트 결합상품’ (이하 “결합상품”이라 함)과 함께 구매할 수 있으며 DL포인트 구매 고객은 본인의 의사에 따라 DL포인트 구매계약(이하 “본 계약”이라 함)을 체결하고 계약 내용을 준수할 것을 확인합니다.</p> 
		<p class="txt" style="font-size: 13.33px;">2. “DL포인트”는 “본 계약”에 따라 매월 자동 구매되며, “결합상품” 월 납입금 미납 또는 연체 시에는 구매가 중단됨을 인지합니다. </p>
		<p class="txt" style="font-size: 13.33px;">3. 구매한 “DL포인트”는 “고객”이 가입한 “결합상품”에 해당하는 제휴 혜택 이용을 위해 매월 자동으로 사용됨을 인지합니다. </p>
		<p class="txt" style="font-size: 13.33px;">4. 고객의 사정으로 “결합상품” 계약 해지 시, “본 계약”도 자동으로 해지됩니다. </p>
		<br style="font-size: 13.33px;">
		<br style="font-size: 13.33px;">
		<p class="tit" style="font-size: 13.33px; font-weight: bold;">DL포인트 구매 약관</p>
		<p class="txt" style=" font-size : 13.33px;">제1조(목적)</p> 
		<p class="txt" style=" font-size : 13.33px;">“본 계약”은 “DL포인트” 구매와 관련된 “판매자”(이하 “대명”이라 함)와 “구매자”(이하 “고객”이라 함)간 권리 및 의무 기타 제반사항을 규정함을 목적으로 합니다.</p> 
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">제2조(용어의 정의)</p> 
		<p class="txt" style=" font-size : 13.33px;">“본 계약”에서 사용하는 용어의 정의는 다음과 같습니다.</p> 
		<p class="txt" style=" font-size : 13.33px;">1. “결합상품”이란 “대명”이 판매 및 관리하는 상품으로서 “ 주계약서비스”와 “DL포인트”가 결합된 상품을 말합니다.</p> 
		<p class="txt" style=" font-size : 13.33px;">2. “DL포인트”란 “대명”이 판매 및 관리하는 포인트로서 “고객”이 “결합상품”의 월 납입금을 결제함에 “고객”이 가입한 결합상품의 제휴혜택 제공 기간 동안 자동 구매되며,</p> 
		<p class="txt" style=" font-size : 13.33px;">구매한 “DL포인트”는 “고객”이 가입한 “결합상품”의 제휴 혜택 이용을 위해 매월 자동으로 사용되는 포인트를 말합니다. </p>
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">제3조(계약의 적용)</p>
		<p class="txt" style=" font-size : 13.33px;">“고객”이 “대명”이 판매하는 “결합상품”에 가입하여 청약철회 없이 1회차 납입금 납입이 완료된 경우 자동으로 “본 계약”이 적용됩니다.</p> 
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">제4조(DL포인트의 구매 및 이용)</p>
		<p class="txt" style=" font-size : 13.33px;">1. “본 계약”에 따라  “고객”이 “결합상품”의 월 납입금 납입 시, 자동으로 구매하게 되는 “DL포인트”는 구매 당월 이후 취소 처리가 불가합니다.</p>
		<p class="txt" style=" font-size : 13.33px;">2. “고객”이 월 납입금을 정상적으로 납입하음에도 불구하고 “DL포인트 구매”가 정상적으로 이루어지지 못한 경우, “대명”은 누락된 “DL포인트 구매”건 만큼 다음 회차에 누적 적용하여 제공합니다.</p> 
		<p class="txt" style=" font-size : 13.33px;">3. “고객”이 “DL포인트” 이용에 대한 이용자의 권리, 의무 및 책임 사항과 기타 필요한 사항은 “본 계약”에 명시된 약관을따릅니다. </p>
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">제5조(이용제한)</p>
		<p class="txt" style=" font-size : 13.33px;">“대명”은 다음 각 호에 해당하는 경우 “고객”의 “DL포인트” 구매를 제한할 수 있습니다.</p>
		<p class="txt" style=" font-size : 13.33px;">- “고객”의 사정으로 인해 “고객”이 가입한 “결합상품”에 해당하는 제휴 혜택 제공이 불가능한 경우,</p>  
		<p class="txt" style=" font-size : 13.33px;">- 기술상의 이유로 “대명”의 서비스 제공이 불가능한 경우 </p>
		<p class="txt" style=" font-size : 13.33px;">- “대명”의 서비스 정책 또는 “본 계약”에 위반하여 “고객”이 서비스를 이용하고자 하는 경우</p> 
		<p class="txt" style=" font-size : 13.33px;">- 기타 “대명”이 정한 요건이 충족되지 않는 경우</p>
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">제6조(권리 양도)</p>
		<p class="txt" style=" font-size : 13.33px;">“고객”은 “결합상품’에 대한 권리를 “본 계약” 기간 중에는 타인에게 양도할 수 없으며, ”본 계약” 기간이 종료된 후부터 타인에게 양도가 가능합니다.</p> 
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">제7조(서비스의 변경 및 중지)</p>
		<p class="txt" style=" font-size : 13.33px;">1. “대명”은 다음 각 호에 해당하는 경우 서비스의 전부 또는 일부를 제한하거나 중지 할 수 있습니다.</p>  
		<p class="txt" style=" font-size : 13.33px;">- 서비스용 설비의 보수 등 공사로 인한 부득이한 경우</p>
		<p class="txt" style=" font-size : 13.33px;">- “고객”이 “대명”의 업활동을 방해하는 경우</p>
		<p class="txt" style=" font-size : 13.33px;">- 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우</p> 
		<p class="txt" style=" font-size : 13.33px;">- “대명”과 제휴사의 계약 종료 등과 같은 사정으로 “DL포인트” 사용이 불가능한 경우</p> 
		<p class="txt" style=" font-size : 13.33px;">- 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우</p>
		<p class="txt" style=" font-size : 13.33px;">- 기타 서비스를 유지할 수 없는 중대한 사유가 발생한 경우</p>
		<p class="txt" style=" font-size : 13.33px;">- “고객”이 법인인 경우</p>
		<p class="txt" style=" font-size : 13.33px;">- “고객”의 사정으로 “본 계약”이 해지된 경우</p> 
		<p class="txt" style=" font-size : 13.33px;">2. “대명”은 제12조에 정한 방법으로 변경될 서비스의 내용 및 제공일자를 “고객”에게 통지하고 서비스를 변경하여 제공할 수 있습니다.</p> 
		<p class="txt" style=" font-size : 13.33px;">단, “대명”이 통제할 수 없는 사유로 사전 통지가 불가능한 경우에는 사후 통지하거나 통지가 이루어지지 않을 수 있습니다.</p>
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">제9조(“고객”의 의무와 책임) </p>
		<p class="txt" style=" font-size : 13.33px;">1. “고객”은 “결합상품”의 월 납입금을 매월 정상적으로 납입해야 할 책임이 있습니다.</p> 
		<p class="txt" style=" font-size : 13.33px;">2. “고객”이 “결합상품”의 월 납입금을 미납하는 경우 “DL포인트” 구매는 자동 중단됩니다.</p> 
		<p class="txt" style=" font-size : 13.33px;">3. “고객”은 “본 계약” 종료 전에 “고객”이 가입한 “결합상품”의 제휴 혜택 이용과 관련하여 변동사항이 생겼거나,</p> 
		<p class="txt" style=" font-size : 13.33px;">개인정보(휴대전화번호, 주소, E-mail, 회원ID 등)가 변경되는 경우 즉시 “대명”에 통지하여야 하며, 통지하지 않아 발생하는 불이익에 대해서는 “대명”에게 이의를 제기할 수 없습니다.</p>
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">제10조(중도 일시납입)</p> 
		<p class="txt" style=" font-size : 13.33px;">“고객”은 “본 계약” 기간 중 “결합상품”의 서비스를 이용할 경우 “결합상품”의 잔여 납입금을 일시불로 완납하여야 합니다. 이 경우 “대명”은 “고객”에게 제공되어야 하는 “DL포인트” 계약기간 중 잔여회차 기간의 “DL포인트”를 일시에 제공합니다.</p>
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">제11조(계약기간 및 해지) </p>
		<p class="txt" style=" font-size : 13.33px;">1. “본 계약” 기간은 “고객”이 최초로 “결합상품”의 월 납입금을 납입한 시점부터 “회원증서”에 명시된 “DL포인트 구매 계약기간”에 이를 때 까지 입니다.</p> 
		<p class="txt" style=" font-size : 13.33px;">2. “대명”은 “고객”이 “결합상품”의 월 납입금을 2회 이상 연체하여 “고객”에게 연체금의 납입을 서면으로 최고하음에도 “고객”이 30일 이내에 지급하지 않는 경우 “본 계약”을 해지할 수 있습니다.</p> 
		<p class="txt" style=" font-size : 13.33px;">3. “대명”은 제7조 1항의 사유가 발생하여 “본 계약”의 목적을 달성하기 어려운 경우에는 “본 계약”을 해지할 수 있습니다. </p>
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">제12조(“고객”에 대한 통지) </p>
		<p class="txt" style=" font-size : 13.33px;">1. “대명”이 “고객”에 대한 통지를 필요로 하는 경우 “고객”이 제공한 개인정보(휴대전화, SMS, E-mail, 주소 등)을 이용할 수 있습니다.</p> 
		<p class="txt" style=" font-size : 13.33px;">2. “대명”이 다수의 “고객”에게 통지하고자 하는 경우 “대명”의 홈페이지에 게시함으로써 개별 통지에 갈음할 수 있습니다. </p>
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">제13조(손해배상)</p>
		<p class="txt" style=" font-size : 13.33px;">1. “고객”이 “본 계약”의 규정을 위반함으로 인하여 “대명”에게 손해가 발생하게 되는 경우, “고객”은 그 손해를 배상하여야 합니다.</p> 
		<p class="txt" style=" font-size : 13.33px;">2. “고객”은 “DL포인트” 구매를 함에 있어 행한 불법 행위나 계약 내용을 위반함으로 인하여 “대명”이 제3자로부터 손해배상청구 또는 소송을 비롯한 각종 이의제기를 받는 경우</p> 
		<p class="txt" style=" font-size : 13.33px;">“고객” 본인의 책임과 비용 으로 “대명”을 면책시켜야 하며, “대명”이 면책되지 못한 경우 “고객”은 그로 인하여 발생한 “대명”의 손해를 배상하여야 합니다. </p>
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">제14조(관할법원) </p>
		<p class="txt" style=" font-size : 13.33px;">1. “본 계약”과 관련하여 “대명”과 “고객” 사이에 분쟁이 발생한 경우 “대명”과 “고객”은 분쟁의 해결을 위해 성실히 협의합니다.</p> 
		<p class="txt" style=" font-size : 13.33px;">2. 본 조 제1항의 협의에서도 분쟁이 해결되지 않을 경우 양 당사자는 서울동부지방법원으로 하여 소를 제기합니다. </p>
		<p class="txt" style=" font-size : 13.33px;">3. “본 계약”과 관련하여 발생하는 분쟁에 대해서는 대한민국의 법률을 적용합니다.</p>
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">※ 구매고객은 본 계약과 관련하여 「개인정보보호법」 제15조, 제22조, 제24조, 「신용정보의 이용 및 보호에 관한 법률」 제32조, 제33조, 제34조, 「정보통신망 이용촉진 및 정보보호에 관한 법률」 제22조에 따라</p> 
		<p class="txt" style=" font-size : 13.33px;">계약자 본인 (대리인)의 개인(신용)정보를 조회, 수집, 이용하거나, 제 3자에게 제공 및 활용하는 것에 대해 동의하였습니다 .</p>
	</div>
</div>


<!-- 개인 정보 활용 동의 표시란 -->
<c:if test="${info.termsYn eq 'Y'}">
	<div class="termDiv mt40">
		<p class="tit">2. 주계약 서비스(여행/크루즈/골프/상조)에 대한 안내</p>
		<button type="button" class="check checkBtn">
			<strong>동의합니다.</strong>
			<img src="/common/images/btn/check_bt.gif" alt="체크">
		</button>
		<input type="checkbox" name="agree2" class="agree2" style="display:none" />

		<div class="termBox">
			${info.terms}
		</div>
	</div>
</c:if>

<div class="termDiv mt40">
	<p class="tit">3. 개인정보 수집 및 이용동의에 대한 안내</p>
	<button type="button" class="check checkBtn">
		<strong>동의합니다.</strong>
		<img src="/common/images/btn/check_bt.gif" alt="체크">
	</button>
	<input type="checkbox" name="agree3" class="agree3" style="display: none" />
	<div class="termBox">
		<p class="txt" style=" font-size : 13.33px; font-weight: bold;"><font color="red">개인정보 수집 및 이용 동의 거부시에는 본 상품 가입이 어려움을 분명히 고지하여 기재하여 주시기 바랍니다</font></p>
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">본 계약과 관련하여 ㈜대명스테이션이 취득한 회원의 개인정보는 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법 등</p>
		<p class="txt" style=" font-size : 13.33px;">관련 법령에 따라 정보주체의 동의를 얻어야 하는 정보에 해당합니다. 이에 아래와 같이 계약자의 서면 동의를 얻고자 하는 바입니다.</p>
		<p class="txt" style=" font-size : 13.33px;">㈜대명스테이션은 회원가입 및 주계약서비스 제공을 위하여 최소한의 회원정보를 수집하고 있습니다.</p>
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">1. 개인정보의 수집 및 이용동의</p>
		<p class="txt" style=" font-size : 13.33px;">㈜대명스테이션은 주계약의 가입을 위하여 회원님의 개인정보를 아래와 같이 수집, 이용하고자 합니다. 다음의 사항을 충분히 읽어보신 후 동의하여 주시기 바랍니다.</p>
		<p class="txt" style=" font-size : 13.33px;">▷ 수집, 이용하는 자 : ㈜대명스테이션</p>
		<p class="txt" style=" font-size : 13.33px;">▷ 수집, 이용하려는 개인정보 항목 : 성명, 주민등록번호 앞 7자리(생년월일/성별), 연락처(자택/이동전화), 주소(자택/직장),</p>
		<p class="txt" style=" font-size : 13.33px;">이메일, 기타 결제정보 중 CMS정보(은행명 및 계좌번호) 또는 신용카드번호 중 택일</p>
		<br style="font-size: 13.33px;">
			<table class="terms_table">
				<tr>
					<th>개인정보 수집 목적(내용)</th>
					<th>수집 / 이용기간</th>
				</tr>
				<tr>
					<td>
						㉠ ㈜대명스테이션 대명아임레디의 회원가입 본인인증<br style="font-size: 13.33px;">
						㉡ ㈜대명스테이션이 제공하는 주계약서비스 및 부가서비스를 위한 본인인증<br style="font-size: 13.33px;">
						㉢ 회원에 대한 공지사항 전달, 각종 청구서 송부,<br style="font-size: 13.33px;">
						회원 민원 및 불편사항 처리<br style="font-size: 13.33px;">
						㉣ 기타 개인 맟춤서비스 제공을 위한 자료로 이용<br style="font-size: 13.33px;">
					</td>
					<td>
						개인정보 수집 및 이용목적 달성 시 또는 탈퇴 시까지.<br style="font-size: 13.33px;">
						※ 탈퇴 시를 기점으로 충분한 법률적 근거가 있을 경우<br style="font-size: 13.33px;">
						※ 관계 법령에 적시된 보존기간(5년)동안 보존<br style="font-size: 13.33px;">
					</td>
				</tr>
			</table>
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">※ 회원님께서는 개인정보 수집 및 이용 동의에 거부할 권리가 있습니다. 다만, 이는 ㈜대명스테이션 주계약 가입에 요한 사항으로 이를 거부하실 경우, 주계약의 가입이 어려움을 알려드립니다.</p>
	</div>
</div>

<div class="termDiv mt40">
	<p class="tit">4. 개인정보 제 3자 제공 및 처리위탁에 대한 안내</p>
	<button type="button" class="check checkBtn">
		<strong>동의합니다.</strong>
		<img src="/common/images/btn/check_bt.gif" alt="체크">
	</button>
	<input type="checkbox" name="agree4" class="agree4" style="display: none" />
	<div class="termBox">
		<p class="txt" style=" font-size : 13.33px;">1. 개인정보 제 3자 제공(필수)</p>
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">가. 상조보증공제조합</p>
		<p class="txt" style=" font-size : 13.33px;">㈜대명스테이션이 소비자피해보상계약을 위하여 아래에 기재된</p>
		<p class="txt" style=" font-size : 13.33px;">내용대로 회원님의 개인정보를 상조보증공제조합에 제공합니다.</p>
		<p class="txt" style=" font-size : 13.33px;">▷ 제공받는자 : 상조보증공제조합</p>
		<p class="txt" style=" font-size : 13.33px;">▷ 제공하는 개인정보 항목 : 성명, 주민등록번호 앞 7자리(생년월일/성별),</p>
		<p class="txt" style=" font-size : 13.33px;">연락처(자택/이동전화), 주소(자택/직장), 가입상품, 증서번호, 납입금액,</p>
		<p class="txt" style=" font-size : 13.33px;">납입회수, 계약일자 등 기타 상조보증공제조합이 필요하다고 인정하는 사항</p>
		<table class="terms_table">
			<tr>
				<th>개인정보 수집 목적(내용)</th>
				<th>제공 / 이용기간</th>
			</tr>
			<tr>
				<td>
					㉠ 할부거래에 관한 법률<br style="font-size: 13.33px;">
					제27조에 따른 공제계약 및<br style="font-size: 13.33px;">
					소비자피해보상<br style="font-size: 13.33px;">
				</td>
				<td>
					상조보증공제조합이 납부금에 대한<br style="font-size: 13.33px;">
					담보금을 보유하는 동안 또는 상조<br style="font-size: 13.33px;">
					보증공제조합과의 공제계약 기간 동안<br style="font-size: 13.33px;">
				</td>
			</tr>
		</table>
		<p class="txt" style=" font-size : 13.33px;">나. 대명소노그룹 계열사</p>
		<p class="txt" style=" font-size : 13.33px;">㈜대명스테이션은 주계약의 부가서비스인 멤버십서비스 제공을 위하여</p>
		<p class="txt" style=" font-size : 13.33px;">회원님의 개인정보를 아래에 기재된 내용대로 제3자에게 제공할 수 있습니다.</p>
		<p class="txt" style=" font-size : 13.33px;">▷ 제공하는 개인정보 항목 : 성명, 연락처(자택/이동전화), CI값</p>
		<p class="txt" style=" font-size : 13.33px;">▷ 제공 및 보존기간 : 제공목적 달성 시 또는 회원탈퇴 시까지</p>
		<p class="txt" style=" font-size : 13.33px;">(보존기간 : 탈퇴 후 5년)</p>
		<table class="terms_table">
			<tr>
				<th>제공 받는 자</th>
				<th>개인정보 수집 목적(내용)</th>
			</tr>
			<tr>
				<td>
					㈜소노호텔앤리조트<br style="font-size: 13.33px;">
					㈜소노호텔앤리조트제주<br style="font-size: 13.33px;">
					㈜대명티피앤이<br style="font-size: 13.33px;">
				</td>
				<td>
					멤버십서비스 중 소노호텔&리조트<br style="font-size: 13.33px;">
					주요 시설의 예약 및 확인<br style="font-size: 13.33px;">
				</td>
			</tr>
			<tr>
				<td>
					㈜대명코퍼레이션 / ㈜대명소노<br style="font-size: 13.33px;">
				</td>
				<td>
					멤버십서비스의 원활한 제공<br style="font-size: 13.33px;">
				</td>
			</tr>
		</table>
		<p class="txt" style=" font-size : 13.33px;">※ 회원님께서는 개인정보 처리에 거부할 권리가 있습니다. 다만, 거부하실 경우 ㈜대명스테이션의 멤버십 서비스 제공이 어려움을 알려드립니다</p>
		<br style="font-size: 13.33px;">
		<br style="font-size: 13.33px;">
		<p class="txt" style=" font-size : 13.33px;">2. 개인정보 처리업무 위탁고지</p>
		<p class="txt" style=" font-size : 13.33px;">아래 업체는 ㈜대명스테이션과 계약된 모든 위탁 업체의 현황입니다.</p>
		<p class="txt" style=" font-size : 13.33px;">효율적인 업무 처리를 위하여 고객님의 상품에 해당되는 업체에만</p>
		<p class="txt" style=" font-size : 13.33px;">업무수행에 필요한 최소한의 정보만을 제공합니다.</p>
		<p class="txt" style=" font-size : 13.33px;">자세한 사항은 ㈜대명스테이션이 운영하는</p>
		<p class="txt" style=" font-size : 13.33px;">대명아임레디 웹사이트(www.daemyungimready.com)의</p>
		<p class="txt" style=" font-size : 13.33px;">“개인정보취급방침”에 공개하고 있습니다.</p>
		<p class="txt" style=" font-size : 13.33px;">▷ 제공하는 개인정보 항목 : 성명, 주민등록번호 앞 7자리(생년월일/성별),</p>
		<p class="txt" style=" font-size : 13.33px;">연락처(자택/이동전화),</p>
		<p class="txt" style=" font-size : 13.33px;">주소(자택/직장), 이메일 중</p>
		<p class="txt" style=" font-size : 13.33px;">위탁업무에 필요한 정보</p>
		<p class="txt" style=" font-size : 13.33px;">▷ 제공 및 이용기간 : 제공목적 달성 시 또는 위탁계약 종료 시점까지</p>
		<table class="terms_table">
			<tr>
				<th>위탁 받는 자</th>
				<th>위탁업무의 목적(내용)</th>
			</tr>
			<tr>
				<td>
					상조/골프/하이브리드 서비스 제공 업체<br style="font-size: 13.33px;">
				</td>
				<td>
					서비스 제공<br style="font-size: 13.33px;">
				</td>
			</tr>
			<tr>
				<td>
					여행/크루즈 서비스 제공 업체<br style="font-size: 13.33px;">
				</td>
				<td>
					서비스 제공, 현지 행사 진행<br style="font-size: 13.33px;">
					여행자 보험 가입 진행<br style="font-size: 13.33px;">
				</td>
			</tr>
			<tr>
				<td>
					㈜포비즈코리아<br style="font-size: 13.33px;">
				</td>
				<td>
					상품 주문 정보 및 상품 가입 정보 확인<br style="font-size: 13.33px;">
				</td>
			</tr>
		</table>
		<br style="font-size: 13.33px;">
		<br style="font-size: 13.33px;">
		<table class="terms_table">
			<tr>
				<th>위탁 받는 자</th>
				<th>위탁업무의 목적(내용)</th>
			</tr>
			<tr>
				<td>
					㈜지아이데이타<br style="font-size: 13.33px;">
				</td>
				<td>
					업무용 ERP 개발에 따른<br style="font-size: 13.33px;">
					유지보수 및 호스팅 서비스<br style="font-size: 13.33px;">
				</td>
			</tr>
			<tr>
				<td>
					금옥로지스<br style="font-size: 13.33px;">
				</td>
				<td>
					회원증서 발송<br style="font-size: 13.33px;">
				</td>
			</tr>
			<tr>
				<td>
					NICE 신용평가정보㈜<br style="font-size: 13.33px;">
				</td>
				<td>
					본인인증, 신용정보 조회,<br style="font-size: 13.33px;">
					연체정보 등 신용도판단정보<br style="font-size: 13.33px;">
				</td>
			</tr>
			<tr>
				<td>
					NICE 정보통신㈜<br style="font-size: 13.33px;">
				</td>
				<td>
					카드납입금 결제<br style="font-size: 13.33px;">
				</td>
			</tr>
			<tr>
				<td>
					금융결제원<br style="font-size: 13.33px;">
				</td>
				<td>
					자동이체(CMS) 관련<br style="font-size: 13.33px;">
				</td>
			</tr>
			<tr>
				<td>
					MG신용정보<br style="font-size: 13.33px;">
				</td>
				<td>
					체납금 추심<br style="font-size: 13.33px;">
				</td>
			</tr>
			<tr>
				<td>
					㈜브랜즈웰 / ㈜비투퀄리티<br style="font-size: 13.33px;">
					㈜씨에스비전<br style="font-size: 13.33px;">
				</td>
				<td>
					고객상담 업무 및 회원등록,<br style="font-size: 13.33px;">
					모집, 유지, 관리<br style="font-size: 13.33px;">
				</td>
			</tr>
			<tr>
				<td>
					㈜브랜즈웰 / ㈜씨에스비전<br style="font-size: 13.33px;">
				</td>
				<td>
					전자제품 구매/배송 관련 업무<br style="font-size: 13.33px;">
				</td>
			</tr>
			<tr>
				<td>
					우체국<br style="font-size: 13.33px;">
				</td>
				<td>
					내용증명(직권해지 시)<br style="font-size: 13.33px;">
				</td>
			</tr>
		</table>
	</div>
</div>

<div class="termDiv mt40">
	<p class="tit">5. (선택)마케팅 목적 개인정보 이용동의에 대한 안내</p>
	<button type="button" class="check checkBtn">
		<strong>동의합니다.</strong>
		<img src="/common/images/btn/check_bt.gif" alt="체크">
	</button>
	<input type="checkbox" name="agree5" class="agree5" style="display: none" />
	<div class="termBox">
		<p class="txt" style=" font-size : 13.33px; font-weight: bold;"><font color="red">마케팅 목적 개인정보 이용 동의 의 경우, 거부하시는 경우에도 계약체결에는 지장이 없으나 회사가 제공하는 신규서비스 및 이벤트 안내등의 정보를 제공해드릴 수 없습니다.</font></p>
	
		<p class="txt" style=" font-size : 13.33px;">4. 마케팅 목적의 개인정보 이용에 관한 사항(선택)</p>
		<p class="txt" style=" font-size : 13.33px;">㈜대명스테이션이 다양한 신규서비스 및 이벤트 안내 등의 마케팅 목적을 위하여 아래에 기재된 내용대로 회원님의 개인정보를 이용합니다.</p>
		<p class="txt" style=" font-size : 13.33px;">▷ 이용기간 : 목적 달성 시까지 또는 회원탈퇴 시까지</p>
		<p class="txt" style=" font-size : 13.33px;">※ 회원님은 동의를 거부할 수 있습니다. 도의 거부 시에는 해당 서비스를 이용하실 수 없습니다.</p>
	
	</div>
</div>

		<div class="mt30 taC">
			<a href="javascript:goSave()" class="btnRed">신청</a>
		</div>
	</div>
	
	<input type="hidden" id="termAgree" name="termAgree"/>
</form>

<script type='text/javascript'>
	var term1 = "N";
	var term2 = "N";
	var term3 = "N";
	var term4 = "N";
	var term5 = "N";
	
	

	//상담 등록 validate 로직
	function goSave() {
		if(frm.agree1.checked) {
			term1 = "Y";
		} else {
			term1 = "N";
		}
		if(frm.agree2.checked) {
			term2 = "Y";
		} else {
			term2 = "N";
		}
		if(frm.agree3.checked) {
			term3 = "Y";
		} else {
			term3 = "N";
		}
		if(frm.agree4.checked) {
			term4 = "Y";
		} else {
			term4 = "N";
		}
		if(frm.agree5.checked) {
			term5 = "Y";
		} else {
			term5 = "N";
		}
		$("#termAgree").val(term1+"/"+term2+"/"+term3+"/"+term4+"/"+term5+"/")
		console.log($("#termAgree").val());
		
		if(frm.orderNum.value == ""){
			alert("주문번호를 입력하세요.");
			frm.orderNum.focus();
			return;
		}

		if(frm.contractorName.value == ""){
			alert("계약자명을 입력하세요.");
			frm.contractorName.focus();
			return;
		}

		if(frm.contractorPhone.value == ""){
			alert("계약자 연락처를 입력하세요.");
			frm.contractorPhone.focus(); 
			return;
		}

		if(frm.contractorBirth.value == ""){
			alert("계약자 생년월일을 입력하세요.");
			frm.contractorBirth.focus();
			return;
		}
		
		if(frm.orderQty.value == ""){
			alert("주계약 구좌 수를 입력하세요.");
			frm.orderQty.focus();
			return;
		}

		if(frm.mainContService1.value == ""){
			alert("주계약 서비스1을 입력하세요.");
			frm.mainContService1.focus();
			return;
		}

/*
		if(frm.mainContService2.value == ""){
			alert("주계약 서비스2을 입력하세요.");
			frm.mainContService2.focus();
			return;
		}
*/

		if(frm.cardCompany.value == ""){
			alert("신용카드사를 입력하세요.");
			frm.cardCompany.focus();
			return;
		}
		
		if(frm.creditCardNum.value == ""){
			alert("카드번호를 입력하세요.");
			frm.creditCardNum.focus();
			return;
		}

		if(frm.validThru.value == ""){
			alert("유효기간을 입력하세요.");
			frm.validThru.focus();
			return;
		}

		if(frm.code2.value == ""){
			alert("중고차 상사코드를 입력하세요.");
			frm.code2.focus();
			return;
		}

		if(frm.agentNm.value == ""){
			alert("중고차 상사명을 입력하세요.");
			frm.agentNm.focus();
			return;
		}
		
		if(frm.agentEmpNm.value == ""){
			alert("중고차 상사 담당자명을 입력하세요.");
			frm.agentEmpNm.focus();
			return;
		}
		
		if(frm.agentEmpTel.value == ""){
			alert("중고차 상사 연락처를 입력하세요.");
			frm.agentEmpTel.focus();
			return;
		}
		
		if(frm.plateNum.value == ""){
			alert("중고차 구매 차량번호를 입력하세요.");
			frm.plateNum.focus();
			return;
		}
		
		if (!frm.agree1.checked) {
			alert("포인트 구매계약에 체크해 주세요.");
			return;
		}

		if (!frm.agree2.checked) {
			alert("주계약 서비스에 체크해 주세요.");
			return;
		}
		if (!frm.agree3.checked) {
			alert("개인정보 수집 및 이용동의에 체크해 주세요.");
			return;
		}

		if (!frm.agree4.checked) {
			alert("개인정보 제 3자 제공 및 처리위탁에 체크해 주세요.");
			return;
		}
		if(!confirm("진행하시겠습니까?")) {
			return;
		}
		var formObj = document.frm;
		formObj.action = "/outsourcing/insert.do";
		formObj.submit();
	};

	var selectList = {};


	$(document).ready(function(){
		console.log("hello");
		
		<c:set var = "high" value="" />
		
		<c:forEach var="list" items="${prdctList.goods}">
			<c:if test="${list.highrDtlCd ne high}">
				selectList['${list.highrDtlCd}'] = {};
			</c:if>
			selectList['${list.highrDtlCd}']['${list.cd}'] = '${list.cdNm}';
			
			<c:set var = "high" value="${list.highrDtlCd}" />
		</c:forEach>
	});

	$("#prdctCd").change(function() {
		var indexer = $(this).val();
		var i = 0;
		
		var optionString = "";
		
		optionString += "<option value>[상품선택]</option>";
		for(var key in selectList[indexer]){
			optionString += "<option value='" + key + "'>" + selectList[indexer][key] + "</option>";
		}
		
		$("#fusionPrdctCd").html(optionString);

	});
	

	$("#prdctCd2").change(function() {
		var indexer = $(this).val();
		var i = 0;
		
		var optionString = "";
		
		optionString += "<option value>[상품선택]</option>";
		for(var key in selectList[indexer]){
			optionString += "<option value='" + key + "'>" + selectList[indexer][key] + "</option>";
		}
		
		$("#fusionPrdctCd2").html(optionString);

	});
</script>