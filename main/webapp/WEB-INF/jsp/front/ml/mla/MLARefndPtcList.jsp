<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
							
<p class="taC"><img src="/common/images/icon/product_info6_img.gif" class="reactImg" alt="" /></p>
<div class="lifeWayDiv3">
	<p class="top">
		환급금 조회 페이지 입니다.<br />현재 가입중인 상품의 <span class="red">해약환급금 정책</span>을 확인할 수 있습니다.
	</p>
	<!--
	<p class="mid">현재 납입 기준으로의 환급금은 아래 내용을 참고하시기 바라며 , 대명아임레디의 만기 환급 정책은 필독하시기 바랍니다.</p>
	-->
	<ul class="newbot">
		<li class="one">
			<img src="/common/images/icon/product_info6_icon1.png" alt="" />
			<p>대명아임레디의 <span class="red">만기 환급금은 납입 금액의 100%</span> 입니다. <br />(만기 납입 완료 후 익월 해약 신청 시)</p>
		</li>
		<li>
			<img src="/common/images/icon/product_info6_icon2.png" alt="" />
			<p style="letter-spacing:-1px;">중도해약에 대한 환급 기준은 상조서비스 약관 규정에 의해 환급됩니다. <br />
			(결합상품 가입의 경우, 지원혜택은 <span class="red">상조서비스 이용 또는 만기 납입완료<br />시에만 제공</span>되며,
			<span class="red">중도해약시 결합상품 지원금액은 본인 부담</span>입니다.)</p>
		</li>
		<li>
			<img src="/common/images/icon/product_info6_icon3.png" alt="" />
			<p>이미 해약했거나, 행사(서비스 이용 완료) 내역은 표시되지 않습니다.</p>
		</li>
	</ul>
</div>

<c:forEach var="list" items="${refndPtcList}" varStatus="status">
	<p class="titTxt ${egov:decode(status.index, 0, 'mt30', 'mt60')}">상품명 - ${list.prodNm}</p>
	<div class="pBox2">
		<div class="scrollX mt20">
			<div class="boradType7 shrt">
				<table class="type1" summary="">
					<caption></caption>
					<colgroup>
						<col width="20%" />
						<col width="20%" />
						<col width="20%" />
						<col width="20%" />
						<col width="20%" />
					</colgroup>
					<tbody>
						<tr>
							<th>회원번호</th>
							<th>상품금액</th>
							<th>총 회차</th>
							<th>만기환급률</th>
							<th>해약 환급금 산식</th>
						</tr>
						<tr>
							<td>${list.accntNo}</td>
							<td><fmt:formatNumber value="${list.prodAmt}" type="number" maxFractionDigits="0" /></td>
							<td>${list.exprNo}</td>
							<td>100%</td>
							<td>
								<c:choose>
									<c:when test="${list.payType eq '001'}">
										정기형
									</c:when>
									<c:when test="${list.payType eq '002'}">
										부정기형
									</c:when>
									<c:otherwise>
										-
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>가입상태</th>
							<th>상조부금 납입금</th>
							<th>납입회차</th>
							<th>중도해약 환급률</th>
							<th>중도해약 환급금</th>
						</tr>
						<tr>
							<td>${list.accStat}</td>
							<td><fmt:formatNumber value="${list.trueAmt}" type="number" maxFractionDigits="0" /></td>
							<td>${list.trueCnt}</td>
							<td>
								<c:choose>
									<c:when test="${list.payType eq '001'}">
										환급금 상세보기 참조
									</c:when>
									<c:when test="${list.payType eq '002'}">
										환급금 상세보기 참조
									</c:when>
									<c:otherwise>
										-
									</c:otherwise>
								</c:choose>
							</td>
							<td><fmt:formatNumber value="${list.resnAmt}" type="number" maxFractionDigits="0" /></td>
						</tr>
					</tbody>
				</table>

				<div id="area-${list.accntNo}"></div>

			</div>
			<p class="widthScbg"></p>
		</div>
	</div>
	<div class="mt20 taR">
		<a href="javascript:selectRefndDtl('${list.accntNo}', '${list.trueCnt}');" class="whtBt3">환급금 상세보기</a>
	</div>
</c:forEach>
<p style="line-height:20px;" class="mt20"><span class="red">※ 상조부금 납입금이란?</span><br />
	결합상품의 경우, 만기 환급 시에만 결합상품 지원 할부금을 포함하여 100% 환급이 되며, 중도해약 시 해약환급금은 결합상품 금액을 제외한 상조부금 납입금에서만 <br />
	책정됩니다. (일반상품은 전액 상조부금 납입금으로 해당사항 없음) <br /><br />
	<span class="red">※ 총 납입현황은 <a href="/my-lifeway/join-product-information/payment-status/index.do" class="red">[납입현황]</a> 에서 확인 바랍니다.</span>
</p>

<div class="newBg mt40">
	<p class="newTit">대명아임레디 해약환급금 정책 안내</p>
	<p class="mt20"><span class="red">※ 회원 약관 ‘상조서비스 약관 제15조 계약의 해지 및 해약환급금’의 산식 관련 내용입니다.</span></p>
	<p>
		① 회원이 상조서비스를 이용할 의사가 없을 경우 계약을 해지할 수 있다.<br />
		② 회원의 사정으로 해지된 경우 회사는 회원의 납입금에서 모집수당, 기타 관리비 등을 공제한 아래 산식에 따른 해약환급금을 회원의 신청완료일로부터 3영업일 <br />
		이내에 회원에게 환급하여야 한다. <br />
		단, 납입금의 범위 내에서 회원이 다른 서비스를 이용하였을 경우 해약환급금은 산식에 따른 환급금에서 회원이 이용한 서비스의 상품금액을 공제하여 환급한다. <br /><br />

		[해약환급금 산식]<br />
		<strong>정기형<br />
			- 해약환급금 = 납입금 – 관리비 누계 – 모집수당 공제액</strong><br />
		- 모집수당 공제액 = 모집수당 Ⅹ 0.75 + 모집수당 Ⅹ 0.25 Ⅹ (기 납입 월수 / 총 납입기간 월수)<br />
		- 관리비 = 납입금의 5%(총 관리비 상한 50만원)<br />
		- 모집수당 = 계약대금의 10%(상한 50만원)<br />
		납입금 누계가 관리 누계와 모집수당 공제액의 합보다 적은 경우에는 해약환급금을 0으로 한다.<br />
		모집수당은 총 계약대금 대비 10%로 하되, 500,000원을 초과할 수 없음.<br />
		<strong>부정기형<br />
			- 해약환급금 = 납입금 누계 Ⅹ 0.85</strong><br />
		※ 중도 해약 시 해약환급금은 정해진 산식에 따라 산정되며, 별도 신청절차를 거쳐, 최종 해약처리 이후 3영업일 이내 환급함.(최종 만기 시에는 <br />
		만기 익월부터 100% 환급)<br />
		※ 정기형이란, 총 계약대금을 1년 이상의 기간을 두고 월별로 균분하여, 납입하는 선불식 할부계약 형태를 말한다.<br />
		※ 부정기형이란, 정기형을 제외한 선불식 할부계약 형태를 말한다.<br />
		※ 위의 산식은 공정거래위원회 ‘상조해약환급금 산정기준 고시’을 준수하고 있으며, 상품 및 회차에 따른 해약환급률은 홈페이지(www.daemyungimready.com)를 <br />
		통하여 확인 가능합니다.
	</p>
</div>

<form name="frm" method="post" action="./list.do">
	<input type="hidden" name="accntNo" value="" />
	<input type="hidden" name="trueCnt" value="" />
</form>

<script type="text/javascript">
	function selectRefndDtl(accntNo, trueCnt) {
		var f = document.frm;

		f.action = "./list.do";
		f.accntNo.value = accntNo;
		f.trueCnt.value = trueCnt;
		f.submit();
	}

	function getRefundPtcHistoryList(page, accntNo, resnAmt) {
		console.log(page, accntNo, resnAmt);
		jQuery.ajax({
			url : "./history.ajax",
			method: 'GET',
			data : {
				"pageIndex": page ? page : 1,
				"cntPage": 1,
				"accntNo": accntNo,
				"resnAmt": resnAmt
			},
			success : function(result){
				$('#area-' + accntNo).append(result);
			},
			error: function(err) {
				console.log(err)
			}
		});
	};

	function onClickMoreBtn(e) {
		var $target = $(e).closest('tbody').find('.historyTr.hidden');
		var index = 0;
		while(index < 10) {
			if($target.eq(index).hasClass('hidden')) {
				$target.eq(index).removeClass('hidden');
			}
			index++;
		}
		if ($target.length <= 10) {
			$(e).closest('tbody').find('.moreTr').addClass('hidden');
		}
	}

	window.onload = function() {
		var refndPtcList = [];
		<c:forEach var="list" items="${refndPtcList}" varStatus="status">
			var obj = {};
			obj.accntNo = '${list.accntNo}';
			obj.resnAmt = '${list.resnAmt}';
			refndPtcList.push(obj);
		</c:forEach>
		console.log(refndPtcList);

		for (var i = 0; i < refndPtcList.length; i++) {
			getRefundPtcHistoryList(1, refndPtcList[i].accntNo, refndPtcList[i].resnAmt);
		}

	}


</script>