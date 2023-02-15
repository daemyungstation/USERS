<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

<c:set var="payInfo" value="${rtnMap.payInfo}" />

<c:set var="exceInfo" value="${rtnMap.exceInfo}" />

<c:set var="pmtAcntInfo" value="${rtnMap.pmtAcntInfo}" />

<form id="frm" method="post" action="./method_insert.do">
	<input type="hidden" name="csrfPreventionSalt" value="${csrfPreventionSalt}" class="notRequired" />
	<input type="hidden" name="accntNo" value="" />
	
	<p class="titTxt mt60">결제계좌 정보</p>
	
	<div class="boardType2 mt20">
		<table summary="">
			<caption></caption>
			<colgroup>
				<col width="20%" />
				<col width="80%" />
			</colgroup>
			<tbody>
				<tr>
					<th>결제유형</th>
					<td>	
						<span class="list">
							<input type="radio" id="payType1" name="pmtGb" value="04" title="결제유형" class="checkbox check_on" <c:if test="${payInfo.payMthd eq '04'}">checked</c:if>/>
							<label for="payType1">CMS 계좌 결제</label>
						</span>
						<span class="list">
							<input type="radio" id="payType2" name="pmtGb" value="06" title="결제유형" class="checkbox" <c:if test="${payInfo.payMthd eq '06'}">checked</c:if>/>
							<label for="payType2">카드 결제</label>
						</span>
					</td>
				</tr>
				<tr class="cmsTr">
					<th>은행명</th>
					<td>
						<select id="bankInfo" name="bankInfo" title="은행명" class="inputType1">
							<c:forEach var="banklist" items="${rtnMap.banklist}" varStatus="status">
								<option value="${banklist.comCd},${banklist.cdNm}" <c:if test="${pmtAcntInfo.bankCd eq banklist.comCd}">selected</c:if>>${banklist.cdNm}</option>
							</c:forEach>
						</select>&nbsp;&nbsp;&nbsp;
						<span class="red">※ 변경 신청 시에는 가입자명과 동일한 계좌/카드만 가능합니다.</span>
						<span class="red">※ 일부 가입 상품에 따라 대리납부 신청이 불가능할 수 있습니다.</span>
					</td>
				</tr>
				<tr class="cmsTr">
					<th>계좌번호</th>
					<td>
						<input type="text" name="acntNo" value="${pmtAcntInfo.bankAccntNo}" title="계좌번호" class="inputType1 numberChk" maxlength="16" />&nbsp;&nbsp;&nbsp;
						<span class="red">※ 휴대폰 번호 등 평생 계좌는 등록이 불가능합니다.</span>
						<!-- 계좌 인증 -->
						&nbsp;&nbsp;&nbsp;
						<button type="button" onclick="javascript:accountAuth();" class="btn333 width-md waves-light">계좌 인증</button>
						<input type="hidden" name="RDP_MST_BNK_ACT_CHECK">
					</td>
				</tr>
				<tr class="cardTr">
					<th>카드명</th>
					<td>
						<select name="cardInfo" title="카드명" class="inputType1">
							<c:forEach var="cardlist" items="${rtnMap.cardlist}" varStatus="status">
								<option value="${cardlist.comCd},${cardlist.cdNm}" ext-cardcd="${cardlist.comCd}" <c:if test="${pmtAcntInfo.cardCd eq cardlist.comCd}">selected</c:if>>${cardlist.cdNm}</option>
							</c:forEach>
						</select>&nbsp;&nbsp;&nbsp;
						<span class="red">※ 변경 신청 시에는 가입자명과 동일한 계좌/카드만 가능합니다.</span>
						<span class="red">※ 일부 가입 상품에 따라 대리납부 신청이 불가능할 수 있습니다.</span>
					</td>
				</tr>
				<tr class="cardTr">
					<th>카드번호</th>
					<td>
						<input type="text" name="cardNo" value="${pmtAcntInfo.cardNo}" title="카드번호" class="inputType1 numberChk" maxlength="16" />
						<span class="displayC">
							<strong class="subTit">유효기간</strong>
							<input type="text" name="cardExprYr" value="${fn:substring(pmtAcntInfo.expireDate, 0, 2)}" title="유효기간 년도" class="inputType3 numberChk" maxlength="2" />
							<span>년</span>&nbsp;&nbsp;
							<input type="text" name="cardExprMm" value="${fn:substring(pmtAcntInfo.expireDate, 2, 4)}" title="유효기간 월" class="inputType3 numberChk" maxlength="2" />
							<span>월</span>
						</span>
						&nbsp;&nbsp;&nbsp;
						<!-- 카드 인증 -->
						<button type="button" onclick="javascript:cardAuth();" class="btn333 width-md waves-light">카드 인증</button>
					</td>
				</tr>
				<tr>
					<th>납부일자 선택</th>
					<td>
						<c:choose>
							<c:when test="${not empty exceInfo}">
								<c:if test="${exceInfo.payDay1UseYn eq 'Y'}">
									<span class="list">
										<input type="radio" id="payday1" name="pmtDay" value="05" title="납부일자" class="checkbox" />
										<label for="payday1">5일</label>
									</span>
								</c:if>
								<c:if test="${exceInfo.payDay2UseYn eq 'Y'}">
									<span class="list">
										<input type="radio" id="payday2" name="pmtDay" value="10" title="납부일자" class="checkbox" />
										<label for="payday2">10일</label>
									</span>
								</c:if>
								<c:if test="${exceInfo.payDay3UseYn eq 'Y'}">
									<span class="list">
										<input type="radio" id="payday3" name="pmtDay" value="15" title="납부일자" class="checkbox" />
										<label for="payday3">15일</label>
									</span>
								</c:if>
								<c:if test="${exceInfo.payDay4UseYn eq 'Y'}">
									<span class="list">
										<input type="radio" id="payday4" name="pmtDay" value="20" title="납부일자" class="checkbox" />
										<label for="payday4">20일</label>
									</span>
								</c:if>
								<c:if test="${exceInfo.payDay5UseYn eq 'Y'}">
									<span class="list">
										<input type="radio" id="payday5" name="pmtDay" value="25" title="납부일자" class="checkbox" />
										<label for="payday5">25일</label>
									</span>
								</c:if>
							</c:when>
							<c:otherwise>
								<span class="list">
									<input type="radio" id="payday1" name="pmtDay" value="05" title="납부일자" class="checkbox" />
									<label for="payday1">5일</label>
								</span>
								<span class="list">
									<input type="radio" id="payday2" name="pmtDay" value="10" title="납부일자" class="checkbox" />
									<label for="payday2">10일</label>
								</span>
								<span class="list">
									<input type="radio" id="payday3" name="pmtDay" value="15" title="납부일자" class="checkbox" />
									<label for="payday3">15일</label>
								</span>
								<c:if test="${empty payInfo.kbNo}">
									<span class="list">
										<input type="radio" id="payday4" name="pmtDay" value="20" title="납부일자" class="checkbox" />
										<label for="payday4">20일</label>
									</span>
									<span class="list">
										<input type="radio" id="payday5" name="pmtDay" value="25" title="납부일자" class="checkbox" />
										<label for="payday5">25일</label>
									</span>
								</c:if>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>해피콜 가능시간</th>
					<td>
						<select name="hyclAbleTime" title="해피콜 가능시간" class="inputType1">
							<option value="">선택해 주세요</option>
							<c:forEach var="happylist" items="${rtnMap.cdDtlList.happyCall}" varStatus="status">
								<option value="${happylist.cd}">${happylist.cdNm}</option>
						</c:forEach>
						</select>&nbsp;&nbsp;&nbsp;
						<span class="red">※ 18시 이후에는 해피콜을 운영하지 않습니다.</span>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div id="cms_desc">
		<ul class="warnBox2 mt20">
			<li>CMS 계좌 변경의 경우, 변경 접수 후 3영업일 이내 컨택센터(1588-8511)에서 전화를 드립니다.</li>
			<li><span class="red">금융결제원 정책에 따라 녹취 증빙이 반드시 필요하므로, 통화가 완료되어야 정상 반영됩니다.<br>(완료되기까지 계좌정보는 이전 내용으로 적용되니 참고바랍니다.)</span></li>
		</ul>
	</div>
	<div id="card_desc">
		<ul class="warnBox2 mt20">
			<li>결제 계좌 변경에는 3영업일이 소요됩니다. (결제계좌 변경 후 접수 신청을 하셔도 계좌정보는 이전 계좌가 나옵니다.)</li>
			<li>계좌정보에 특이사항이 있을 경우 정상 신청되지 않을 수 있으며, 컨택센터에서 연락을 드립니다.</li>
			<li>정보가 검색되지 않을 경우는 컨택센터 (1588 - 8511) 로 문의 바랍니다.</li>
		</ul>
	</div>

	
	<input type="hidden" id="agreeYn" name="agreeYn" value="N" class="notRequired" />
	
	
	<div class="termTab mt40 cardTr">
		<div class="termDiv mt20">
			<p class="tit">카드출금이체 약관 및 개인정보 제공 동의</p>
		
			<button type="button" class="check">
				<strong>동의합니다.</strong>
				<img src="/common/images/btn/check_bt.gif" alt="체크" />
			</button>
		
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
	
	<div class="mt20" style="text-align:center;">
		<c:choose>
			<c:when test="${fn:indexOf('F4,M2,M5,S7,S8,S9,T0,X5,X6,Z6', rtnMap.payInfo.prodCd) != -1 && rtnMap.payInfo.trueCnt < 37 }">
				<a name="changeSubmit" href="javascript:" class="btnRed" style="cursor: default">변경접수</a>
				<p style="margin-top: 5px;"><span class="red">※ 가입하신 상품은 36회차 납입 이전에 변경이 불가합니다.</span></p>
			</c:when>
			<c:otherwise>
				<a name="changeSubmit" href="javascript:" id="submitLink" class="btnRed">변경접수</a>
				<input type="submit" value="전송" style="display:none;" />
			</c:otherwise>
		</c:choose>
	</div>

</form>

<script type="text/javascript">
//<![CDATA[
	// 20171024 추가 시작
	// 20171024 추가 끝
	jQuery(document).ready(function(){
		if($("#payType1").is(":checked")){
			$(".dotBox2.txt_cms").css("display","block");
			$(".dotBox2.txt_card").css("display","none");
		}else if($("#payType2").is(":checked")){
			$(".dotBox2.txt_cms").css("display","none");
			$(".dotBox2.txt_card").css("display","block");
		}
		//유효성 체크
		jQuery("#frm").validation({
			msg : {
				confirm : "처리완료까지 3영업일이 소요되며, 그안에는 재신청이 불가합니다.\n진행하시겠습니까?"
			}, 
	        customfunc : function(obj, id) {
	        	if(id == "agreeYn")
	        	{
	        		if("Y" != jQuery(obj).val())
	        		{
	        			var pmtGb = jQuery("input[name='pmtGb']:checked").val();

	        			if(pmtGb == "06")
	        			{
	        				alert("카드출금이체 약관 및 개인정보 제공에 동의하셔야 합니다.");
		        			jQuery(".termDiv .check").focus();
		        			return false;
	        			}
	        			else
	        			{
	        				//alert("CMS출금이체 약관 및 개인정보 제공에 동의하셔야 합니다.");	
	        			}
	        		}
	        	}
	        }
		});								
		
		// 20171024 추가 시작
		$(".boardType2 td .list input[type='radio']").click(function(){
			$(".boardType2 td .list input[type='radio']").removeClass("check_on");
			if($("#payType1").is(":checked")){
				$(".dotBox2.txt_cms").css("display","block");
				$(".dotBox2.txt_card").css("display","none");
			}else if($("#payType2").is(":checked")){
				$(".dotBox2.txt_cms").css("display","none");
				$(".dotBox2.txt_card").css("display","block");
			}
		});
		// 20171024 추가 끝


		setPmtGbDisp("${payInfo.payMthd}");
		
		//동의 클릭
		jQuery(".termDiv .check").on("click", function(){
			if(jQuery(this).find("img").attr("src").indexOf("_on.gif") > -1)
			{
				jQuery(this).find("img").attr("src", jQuery(this).find("img").attr("src").replace("_on.gif", ".gif"));
				jQuery("input[name='agreeYn']").val("N");
			}
			else
			{
				jQuery(this).find("img").attr("src", jQuery(this).find("img").attr("src").replace(".gif", "_on.gif"));
				jQuery("input[name='agreeYn']").val("Y");
			}
		});
		
		
		
		jQuery("#submitLink").on("click", function(e){
			e.preventDefault();
			
			jQuery("input[name='accntNo']").val("${rtnMap.accntNo}");

			var payMthd = jQuery("input:radio[name='pmtGb']:checked").val();

			if(payMthd == "04")
			{
				jQuery("input[name='cardNo']").removeClass("numberChk");
				jQuery("input[name='cardExprYr']").removeClass("numberChk");
				jQuery("input[name='cardExprMm']").removeClass("numberChk");
				jQuery("input[name='acntNo']").addClass("numberChk");
			}
			else if(payMthd == "06")
			{
				jQuery("input[name='cardNo']").addClass("numberChk");
				jQuery("input[name='cardExprYr']").addClass("numberChk");
				jQuery("input[name='cardExprMm']").addClass("numberChk");
				jQuery("input[name='acntNo']").removeClass("numberChk");
			}
			jQuery("input[type='submit']").trigger("click");
		});
		
		jQuery("input:radio[name='pmtGb']").on("change", function(){
			setPmtGbDisp(jQuery(this).val());
		});
	});
	
	function setPmtGbDisp(payMthd)
	{
		jQuery(".termDiv .check").find("img").attr("src", jQuery(".termDiv .check").find("img").attr("src").replace("_on.gif", ".gif"));
		jQuery("input[name='agreeYn']").val("N");
		
		if(payMthd == "04")
		{
			jQuery(".cmsTr").show();
			jQuery(".cardTr").hide();
			
			jQuery(".cmsTr").find("input, select").removeClass("notRequired");
			jQuery(".cardTr").find("input, select").addClass("notRequired");
			jQuery("input[name^='cardExpr']").removeClass("lengthChk");
			
			jQuery("input:radio[name='pmtDay']").each(function(){
				var pmtDay = jQuery(this).next().text().replace("일", "");
				
				if(parseInt("${pmtAcntInfo.ichaeDt}") == parseInt(pmtDay))
				{
					jQuery(this).prop("checked", true);
					return false;
				}
			});
			
			$('#cms_desc').show();
			$('#card_desc').hide();
			
			Feel.Validation.confirm = "녹취 증빙을 위해 3영업일 이내 컨택센터(1588-8511)에서 전화드립니다.\n본 통화가 완료되어야 정상 변경됩니다.";
		}
		else if(payMthd == "06")
		{
			jQuery(".cmsTr").hide();
			jQuery(".cardTr").show();
			
			jQuery(".cmsTr").find("input, select").addClass("notRequired");
			jQuery(".cardTr").find("input, select").removeClass("notRequired");
			jQuery("input[name^='cardExpr']").addClass("lengthChk");
			
			jQuery("input:radio[name='pmtDay']").each(function(){
				var pmtDay = jQuery(this).next().text().replace("일", "");
				
				if(parseInt("${pmtAcntInfo.payDt}") == parseInt(pmtDay))
				{
					jQuery(this).prop("checked", true);
					return false;
				}
			});
			
			$('#cms_desc').hide();
			$('#card_desc').show();			
			
			Feel.Validation.confirm = "처리완료까지 3영업일이 소요되며, 그안에는 재신청이 불가합니다.\n진행하시겠습니까?";
		}
		else
		{
			jQuery(".cmsTr").show();
			jQuery(".cardTr").hide();
			
			jQuery(".cmsTr").find("input, select").removeClass("notRequired");
			jQuery(".cardTr").find("input, select").addClass("notRequired");
			jQuery("input[name^='cardExpr']").removeClass("lengthChk");
			
			$('#cms_desc').show();
			$('#card_desc').hide();
		}
	}
// birthday : $('#birthday').val(),
// 		sex : $('#sex').val(),
// 		buyerName : $('#name').val(),
// 		hp : $('#hp').val(),
function cardAuth() {
	let cardNum =  $("input[name='cardNo']").val();
	let cardMon =  $("input[name='cardExprMm']").val();
	let cardYear =  $("input[name='cardExprYr']").val();
	if( cardNum.indexOf("*")  >= 0 || cardMon.indexOf("*")  >= 0  ||  cardYear.indexOf("*")  >= 0 ) {
		alert("카드번호, 유효기간을 확인 해 주세요 ")
		return ;
	}
	$.ajax({
		type : 'POST',
		url : '/outsourcing/cardAuthLGU.ajax',
		data : {
			accntNo: "${rtnMap.accntNo}",
			cardNum : cardNum,
			cardMon : cardMon,
			cardYear : cardYear
		},

		success : function(data) {
			if (data.resultCode == "00") {
				var cardCode = data.cardCode;
				$("select[name='cardInfo'] option").removeAttr("selected");
				$("select[name='cardInfo'] option[ext-cardcd=" + cardCode + "]").attr("selected", "selected")
				$("input[name='cardNo']").attr("readonly", true);
				$("input[name='cardExprMm']").attr("readonly", true);
				$("input[name='cardExprYr']").attr("readonly", true);
				$("#resultCode").val("00");
				$("a[name='changeSubmit']").removeClass("disable");
				alert("카드정보가 인증되었습니다.");
			} else {
				let resultMessage = data.resultMsg;
				$("a[name='changeSubmit']").addClass("disable");
				if( resultMessage > 0 ) {
					alert("카드정보 인증이 실패하였습니다. : " + resultMessage);
				} else {
					alert("카드정보 인증이 실패하였습니다.");
				}
			}
		},
		error : function() {
			console.log(data);
		}
	});
}

function accountAuth() {
	let bankCode = $("select[name='bankInfo']").find("option:selected").val().split(",")[0];
	let bankNm = $("select[name='bankInfo']").find("option:selected").val().split(",")[1];
	let accountNum = $("input[name='acntNo']").val();
	if( accountNum.indexOf("*")  >= 0  ) {
		alert("계좌번호를 확인 해 주세요")
		return ;
	}

	$.ajax({
		type : 'POST',
		url : '/outsourcing/bankAccount.ajax',
		data: {
			bankCode: bankCode,
			accountNum: accountNum
		},
		error: function (data){
		},
		success : function(data) {
			if (data.isSuccess) {
				$(".cmsTr").find("input[name='RDP_MST_BNK_ACT_CHECK']").val("Y");
				$(".cmsTr").find("select[name='bankInfo']").attr("disabled", true);
				$("input[name='acntNo']").attr("readonly", true);
				let seletedVal = $("select[name='bankInfo'] option:contains(" + bankNm +")").val();
				$("select[name='bankInfo']").val(seletedVal);
				$("a[name='changeSubmit']").removeClass("disable");
				alert("계좌정보가 인증되었습니다.");
			} else {
				$("a[name='changeSubmit']").addClass("disable");
				alert("계좌정보가 인증이 실패하였습니다. : " + data.message); // 오류 메세지
				$(".cmsTr").find("input[name='RDP_MST_BNK_ACT_CHECK']").val("");
			}

		}
	});
}
			
//]]>
</script>