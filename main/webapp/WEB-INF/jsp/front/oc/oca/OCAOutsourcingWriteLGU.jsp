<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
<script type="text/javascript">
$(document).ready(function(){
	
	var count1 = 0;
	var count2 = 0;
	var count3 = 0;
	
    $("#agentGubun").change(function(){
        if($("#agentGubun").is(":checked")){
            $("#agentGubun").val("Y");
        }else{
        	$("#agentGubun").val("N");
        }
    });
    
	$('.inputType4').keyup(function (e){
		var content = $(this).val();
		//$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
		$('.max_counter').html(content.length + '/250');

		if(content.length == 250){
			alert('250자만 입력 가능합니다.');
		}
	});
	/*도매점 판매구분에 따른 입력란 노출 및 활성화*/
	$("#salesType").change(function(){
		var val = $(this).val();
		if(val == '판매점 유치') {
			$(".wholesaleInput").show();
			$("input:text[name='whPosCd']").removeClass("notRequired");
			$("input:text[name='whStoreNm']").removeClass("notRequired");
		}
		else {
			$("input:text[name='whPosCd']").addClass("notRequired");
			$("input:text[name='whStoreNm']").addClass("notRequired");
			$("input:text[name='whPosCd']").val("");
			$("input:text[name='whStoreNm']").val("");
			$(".wholesaleInput").hide();
		}
	})
	
	//대명가입번호2 존재할때 입력란 노출 및 활성화
    if($('#idNoInput2').val() != null && $('#idNoInput2').val() != undefined && $('#idNoInput2').val() != ""){
    	$(".invisible1").show();
    	$("input:text[name='prdctCd3']").removeClass("notRequired");
    }
	//대명가입번호3 존재할때 입력란 노출 및 활성화
    if($('#idNoInput3').val() != null && $('#idNoInput3').val() != undefined && $('#idNoInput3').val() != ""){
    	$(".invisible2").show();
		$("input:text[name='prdctCd3']").removeClass("notRequired");
    }
	
	/*상품선택1 모바일 요금 할인 선택시 할인받을 연락처 입력란 노출 및 활성화*/
	$("#prdctCd").change(function() {
		var val = $(this).val();	
		var uEntrNo_tmp = $("#uEntrNo_tmp").text();
		
		if(val === 'LGU4') {
			$("#discount_ctn").show();
			$("input:text[name='discountCtn']")
			count1 = 1; //선 할인 상품
//			$("#discount_pin").show();
//			$("input:text[name='discountPin']").removeClass("notRequired");
		} else if( val === 'LGU1') {
			$("#discount_ctn").hide();
			$("input:text[name='discountCtn']").val("");
			$("input:text[name='discountCtn']").addClass("notRequired");
			$("input:text[name='discountCtn']").val("");
			count1 = 1; //선 할인 상품
		} else if(val === 'LGU9'){
			$("#discount_ctn").show();
			$("input:text[name='discountCtn']")
			count1 = 0;
		} else {
			$("#discount_ctn").hide();
			$("input:text[name='discountCtn']").val("");
			$("input:text[name='discountCtn']").addClass("notRequired");
			$("input:text[name='discountCtn']").val("");
			count1 = 0;
//			$("#discount_pin").hide();
//			$("input:text[name='discountPin']").val("");
//			$("input:text[name='discountPin']").addClass("notRequired");
//			$("input:text[name='discountPin']").val("");
		}
	});
	/*상품선택2 모바일 요금 할인 선택시 할인받을 연락처 입력란 노출 및 활성화*/
	$("#prdctCd2").change(function() {
		var val = $(this).val();	
		var uEntrNo_tmp = $("#uEntrNo_tmp").text();

		if(val === 'LGU4') {
			$("#discount_ctn2").show();
			$("input:text[name='discountCtn2']")
			count2 = 1; //선 할인 상품
		} else if( val === 'LGU1') {
			$("#discount_ctn2").hide();
			$("input:text[name='discountCtn2']").val("");
			$("input:text[name='discountCtn2']").addClass("notRequired");
			$("input:text[name='discountCtn2']").val("");
			count2 = 1; //선 할인 상품
		} else if(val === 'LGU9'){
			$("#discount_ctn").show();
			$("input:text[name='discountCtn']")
			count2 = 0;
		} else {
			$("#discount_ctn2").hide();
			$("input:text[name='discountCtn2']").val("");
			$("input:text[name='discountCtn2']").addClass("notRequired");
			$("input:text[name='discountCtn2']").val("");
			count2 = 0;
		}
	});
	/*상품선택3 모바일 요금 할인 선택시 할인받을 연락처 입력란 노출 및 활성화*/
	$("#prdctCd3").change(function() {
		var val = $(this).val();	
		var uEntrNo_tmp = $("#uEntrNo_tmp").text();

		if(val === 'LGU4' || val === 'LGU9') {
			$("#discount_ctn3").show();
			$("input:text[name='discountCtn3']")
			count3 = 1; //선 할인 상품
		} else if( val === 'LGU1') {
			$("#discount_ctn3").hide();
			$("input:text[name='discountCtn3']").val("");
			$("input:text[name='discountCtn3']").addClass("notRequired");
			$("input:text[name='discountCtn3']").val("");
			count3 = 1; //선 할인 상품
		} else if(val === 'LGU9'){
			$("#discount_ctn").show();
			$("input:text[name='discountCtn']")
			count3 = 0;
		} else {
			$("#discount_ctn3").hide();
			$("input:text[name='discountCtn3']").val("");
			$("input:text[name='discountCtn3']").addClass("notRequired");
			$("input:text[name='discountCtn3']").val("");
			count3 = 0;
		}
	});
	
	/*선 할인 상품 2구좌 제한*/
	$("#prdctCd").change(function() {
		var temp = 0;
		temp += (count1 + count2 + count3);
		if(temp > 2){
			alert("선할인 상품은 2구좌까지 선택이 가능합니다.");
			$('#prdctCd').prop('selectedIndex',0);
			$("#discount_ctn").hide();
		}
	})
	/*선 할인 상품 2구좌 제한*/
	$("#prdctCd2").change(function() {
		var temp = 0;
		temp += (count1 + count2 + count3);
		if(temp > 2){
			alert("선할인 상품은 2구좌까지 선택이 가능합니다.");
			$('#prdctCd2').prop('selectedIndex',0);
			$("#discount_ctn2").hide();
		}
	})
	/*선 할인 상품 2구좌 제한*/
	$("#prdctCd3").change(function() {
		var temp = 0;
		temp += (count1 + count2 + count3);
		if(temp > 2){
			alert("선할인 상품은 2구좌까지 선택이 가능합니다.");
			$('#prdctCd3').prop('selectedIndex',0);
			$("#discount_ctn3").hide();
		}
	})
	
	$("input:text[name='homePrdNum']").keyup(function (e){
		var content = $(this).val();

		if(content.length > 12){
			alert('12자만 입력 가능합니다.');
		}
	});
	$('.max_counter').keyup();
	
	$("#submit").click(function() {
		console.log("click");
	});
	
});
</script>

<!-- 2019.09.17 팝업 내용 추가및 css 수정(width, height 값 조절)  -->
<div class="log-popup">
	<div class="log-popup-in">
		<h2>U라이프클럽 상품 운영 안내<span class="ico"></span></h2>
		<div class="log-popup-box">
			<p class="txt-info">
				안녕하십니까? U라이프클럽 상품 운영과 관련하여 안내드립니다.<br/>
				<br/>
				20년 02월 28일 U라이프클럽 신규 상품이 출시됨에 따라, 현재 운영중인 상품에<br/> 
				대한 가입 상담 접수가 20년 02월 29일부로 종료됩니다.<br/>
				<br/>
				이에 02월 29일 이후 접수되는 기존 상품에 대한 가입 상담은 자동 취소처리될 수<br/>
				있으니, 이점 양지하여 주시기 바랍니다.<br/>
				<br/>
				* 기존 상품 : U라이프클럽 429 (신한카드 캐시백 / 통신요금 할인 / TV결합)<br/>
				* 신규 상품 : U라이프클럽 594 (통신요금할인)
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
<!-- EOD : 2020.02.28 팝업  -->

   						<h2 style="font-size: 36px; color: #333; line-height: 36px; margin-bottom: 50px; font-family: 'NanumSquareB'; font-weight: normal;">${info.title}</h2>
						
						<form name="frm" method="post" action="/LGU/insert.do">
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
												<col width="25%" />
												<col width="75%" />
											</colgroup>
											<tbody>
												<!-- 멤버십 블루 선불카드번호 입력란 -->
												<c:if test="${info.prepaidCardNumYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">멤버십 블루<br>선불카드번호</span></th>
														<td>
															<input type="text" name="prepaidCardNum" title="선불카드 번호" class="inputType1 numberChk" maxlength="8" />
															<span class="red">※ 뒤 8자리</span>
														</td>
													</tr>
												</c:if>
												
												<!-- 대리점/직영점 코드 -->
												<c:if test="${info.uDlrCdYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="" title="필수입력">대리점/직영점 코드</span></th>
														<td>
															<input type="text" name="uDlrCd" value="${uDlrCd}" title="대명 가입 번호" class="inputType1" style="border:0;" readonly="readonly" />
														</td>
													</tr>
												</c:if>
												
												<!-- 유치대리점명 입력란 -->
												<c:if test="${info.uDlrNmYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="" title="필수입력">유치대리점명</span></th>
														<td>
															<input type="text" name="uDlrNm" value="${uDlrNm}" title="유치대리점명" class="inputType1" style="border:0;" readonly="readonly" />
														</td>
													</tr>
												</c:if>
												
												<!-- 유치조직코드 입력란 -->
												<c:if test="${info.uCmmnCdYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="" title="필수입력">채널유형코드</span></th>
														<td>
															<input type="text" name="uCmmnCd" value="${uCmmnCd}" title="채널유형코드" class="inputType1" style="border:0;" readonly="readonly" />
														</td>
													</tr>
												</c:if>
												<!-- 유치조직명 입력란 -->
												<c:if test="${info.uCmmnCdNmYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="" title="필수입력">채널유형코드명</span></th>
														<td>
															<input type="text" name="uCmmnCdNm" value="${uCmmnCdNm}" title="채널유형코드명" class="inputType1" style="border:0;" readonly="readonly" />
														</td>
													</tr>
												</c:if>
												
												<!-- 상담등록자 사번 -->
												<c:if test="${info.uIndcEmpnoYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="" title="필수입력">상담등록자 사번</span></th>
														<td>
															<input type="text" name="uIndcEmpno" value="${uIndcEmpno}" title="대명 가입 번호" class="inputType1" style="border:0;" readonly="readonly" />
														</td>
													</tr>
												</c:if>
												
												<!-- 상담등록자 마당 ID -->
												<c:if test="${info.uIntgUserIdYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="" title="필수입력">상담등록자 마당 ID</span></th>
														<td>
															<input type="text" name="uIntgUserId" value="${uIntgUserId}" title="대명 가입 번호" class="inputType1" style="border:0;" readonly="readonly" />
														</td>
													</tr>
												</c:if>

												<!-- 판매사원 성명 입력란 -->
												<c:if test="${info.agentEmpNmYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">실제 판매자 성명</span></th>
														<td>
															<input type="text" name="agentEmpNm" title="판매사원명" class="inputType1" maxlength="20" />
															<!-- 18.04.19 고객사 요청 삭제
															<input type="checkbox" id="agentGubun" name="agentGubun" value="N"  class="checkbox notRequired"/> <label for="agentGubun" class="red">직영점 FM사원/점장일 경우 반드시 체크</label>
															-->
															<!-- 19.07.15 고객사 요청 삭제
															<span class="red">* 판매점 직접 유치 건이면, POS코드 입력.</span>
															-->
														</td>
													</tr>
												</c:if>
												
												<!-- 매장코드 입력란 -->
												<c:if test="${info.agentCdYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">매장 코드</span></th>
														<td>
															<input type="text" name="agentCd" title="매장코드 번호" class="inputType1" maxlength="8" />&nbsp;&nbsp;
															<span class="red">※ 매장 코드 형식 (삼판 : Z*** / 대리점 : D***)</span>
														</td>
													</tr>
												</c:if>

												<!-- 대리점명 입력란 -->
												<c:if test="${info.agentNmYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">대리점명</span></th>
														<td>
															<input type="text" name="agentNm" title="대리점명" class="inputType1" maxlength="20" />
															<span class="red">* 판매점 직접 유치 건이면, 판매점명 입력.</span>									
														</td>
													</tr>
												</c:if>
												
												<!-- 실제 판매자 연락처 입력란 -->
												<c:if test="${info.agentEmpTelYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">실제 판매자 연락처</span></th>
														<td>
															<input type="text" name="agentEmpTel" title="담당자 연락처" class="inputType1 phoneChk" maxlength="13" />
														</td>
													</tr>
												</c:if>
												<!-- 도매직영점 판매구분 입력란 -->
												<c:if test="${info.salesTypeYn eq 'Y'}">
													<tr>	
														<th scope="row"><span>도매직영점 판매구분</span></th>
														<td>
															<select id="salesType" name="salesType" title="도매직영점 판매구분" class="notRequired">
																<option value="">선택하세요.</option>
																<option value="판매점 유치">판매점 유치</option>
																<option value="점장/FM 유치">점장/FM 유치</option>
															</select>
															<span class="red">* 도매직영점인 경우 반드시 선택.</span>
														</td>
													</tr>
												</c:if>
												
												<!-- 도매 판매점 POS코드 입력란 -->
												<c:if test="${info.whPosCdYn eq 'Y'}">
													<tr class="wholesaleInput" style="display:none;">
														<th scope="row"><span class="essen" title="필수 입력">도매 판매점 POS코드</span></th>
														<td>
															<input type="text" name="whPosCd" title="도매 판매점 POS코드" class="inputType1 notRequired" maxlength="20" />
														</td>
													</tr>
												</c:if>
												<!-- 도매 판매점명 입력란 -->
												<c:if test="${info.whStoreNmYn eq 'Y'}">
													<tr class="wholesaleInput" style="display:none;">
														<th scope="row"><span class="essen" title="필수 입력">도매 판매점명</span></th>
														<td>
															<input type="text" name="whStoreNm" title="도매 판매점명" class="inputType1 notRequired" maxlength="20" />
														</td>
													</tr>
												</c:if>
		
												<!-- 가입회사명 입력란 -->
												<c:if test="${info.companyNmYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">가입회사명</span></th>
														<td>
															<input type="text" name="companyNm" title="가입회사명" class="inputType1" maxlength="50" />
														</td>
													</tr>
												</c:if>
												
												<!-- 담당자명 입력란 -->
												<c:if test="${info.b2bEmpCdYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">담당자명</span></th>
														<td>
															<input type="text" name="b2bEmpCd" title="담당자명" class="inputType1" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- 영업채널1 입력란 -->
												<c:if test="${info.code1Yn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">영업채널1</span></th>
														<td>
															<select name="code1"  class="inputType1" title="영업채널1">
																<option value="">[영업채널1 선택]</option>
																<c:forEach var="list" items="${prdctList.channel}">
																	<option value="${list.cd}">${list.cdNm}</option>
																</c:forEach>
															</select>
														</td>
													</tr>
												</c:if>
												
												<!-- 영업채널2 입력란 -->
												<c:if test="${info.code3Yn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">영업채널2</span></th>
														<td>
															<input type="text" name="code3" title="영업채널2" class="inputType1" maxlength="20" />&nbsp;&nbsp;
															<span class="red"> * 세부 채널명을 입력해주세요. 예시) 강남점 / 제1국 등</span>
														</td>
													</tr>
												</c:if>										
		
												<!-- 판매사코드/사번 입력란 -->
												<c:if test="${info.code2Yn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">판매사코드 / 사번입력</span></th>
														<td>
															<input type="text" name="code2" title="판매사코드 / 사번입력" class="inputType1" maxlength="20" />&nbsp;&nbsp;
															<span class="red"> * 정확히 입력되었는지 다시 한 번 확인해주세요!</span>
														</td>
													</tr>
												</c:if>
												
												<!-- 코드(국문) 입력란 -->
												<c:if test="${info.agentCodeKrYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">코드</span></th>
														<td>
															<input type="text" name="agentCode1" title="코드" class="inputType1" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- 주문번호 입력란 -->
												<c:if test="${info.orderNumYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">주문번호</span></th>
														<td>
															<input type="text" name="orderNum" title="주문번호" class="inputType1" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- 판매사원 사번 입력란 -->
												<c:if test="${info.agentEmpNumYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">판매사원 사번</span></th>
														<td>
															<input type="text" name="agentEmpNum" title="판매사원 사번" class="inputType1" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- NUMBER 입력란 -->
												<c:if test="${info.agentNumYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">NUMBER</span></th>
														<td>
															<input type="text" name="agentNum" title="NUMBER" class="inputType1" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- 코드(영문) 입력란 -->
												<c:if test="${info.agentCodeEnYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">CODE</span></th>
														<td>
															<input type="text" name="agentCode2" title="CODE" class="inputType1" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- 기타 입력란 -->
												<c:if test="${info.agentEtcYn eq 'Y'}">
													<tr>
														<th scope="row"><span>기타</span></th>
														<td>
															<textarea name="agentEtc" title="기타" class="inputType4 notRequired" style="height:60px;" maxlength="2000"></textarea>
														</td>
													</tr>
												</c:if>
												
												<!-- 고유번호 입력란 -->
												<c:if test="${info.agentUnqNumYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">고유번호</span></th>
														<td>
															<input type="text" name="agentUnqNum" title="고유번호" class="inputType1" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- 판매자 번호 입력란 -->
												<c:if test="${info.sllrNumYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">판매자 번호</span></th>
														<td>
															<input type="text" name="sllrNum" title="판매자 번호" class="inputType1" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- 판매자 소속 입력란 -->
												<c:if test="${info.sllrPartYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">판매자 소속</span></th>
														<td>
															<input type="text" name="sllrPart" title="판매자 소속" class="inputType1" maxlength="50" />
														</td>
													</tr>
												</c:if>
												
												<!-- 판매자 연락처 입력란 -->
												<c:if test="${info.sllrCtelYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">판매자 연락처</span></th>
														<td>
															<input type="text" name="sllrCtel" title="판매자 연락처" class="inputType1 phoneChk" maxlength="13" />
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
												<col width="25%" />
												<col width="75%" />
											</colgroup>
											<tbody>
											
												<!-- 상품1 선택란 -->
												<c:if test="${info.prdctNmYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">상품 선택1</span></th>
														<td style="display:flex;">
															<select id="prdctCd" name="prdctCd" title="상품">
																<option value="">[상품선택]</option>
																<c:forEach var="list" items="${prdctList.product}">
																	<option value="${list.cd}">${list.cdNm}</option>
																</c:forEach>
																<option value="LGU9">통신요금 지원 – 96만원(청구 할인)</option>
															</select>
														</td>
													</tr>
													<!-- 사용 안함 
													<tr id="M5_">
														<th scope="row"><span class="essen" title="필수입력">U+인터넷/<br />IPTV 가입번호</span></th>
														<td>
															<input type="text" name="lguHomeNo" maxlength="12" title="U+인터넷/IPTV 가입번호" class="numberChk" />
															<label style="color:red; font-size:12px">&nbsp;할인대상인 인터넷/IPTV 가입번호만 입력</label>											
														</td>
													</tr>
													<tr id="M6">
														<th scope="row"><span class="essen" title="필수입력">U+모바일/<br />070 CTN</span></th>
														<td>
															<input type="text" name="lguMobileNo"  maxlength="14" title="U+모바일/070 CTN" class="numberChk" />
															<label style="color:red; font-size:12px">&nbsp;할인대상인 모바일/070 CTN 입력</label>											
														</td>
													</tr>
													 -->
												</c:if>
												
												<!-- 할인받을 연락처 입력란 -->
												<c:if test="${info.discountCtnYn eq 'Y'}">
													<tr id="discount_ctn" style="display:none;">	
														<th scope="row"><span class="" title="필수입력">할인 받을 연락처(CTN)</span></th>
														<td>
															<input type="text" name="discountCtn" title="할인 받을 연락처" class="inputType1 phoneChk notRequired" maxlength="13" style="float: left;"/>
															<div style="float: left;">
																<span class="red">* 실제 할인 받을 U+ CTN 기재 부탁드립니다.</span><br>
																<span class="red">* U+ CTN이 없는 경우 U-Cube 상담 등록 시 가입번호로 할인 적용 되오니 참고 바랍니다.</span>
															</div>
														</td>
													</tr>
												</c:if>
												
												<!-- 가입 희망 구좌 -->
												<c:if test="${info.mainContTypeYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">주 계약1</span></th>
														<td>
															<input type="radio" name="mainContType" value="여행" id="mainContType2" title="주 계약" checked> <label for="mainContType2" >여행</label>&nbsp;&nbsp;
															<input type="radio" name="mainContType" value="크루즈" id="mainContType3" title="주 계약"> <label for="mainContType3">크루즈</label>&nbsp;&nbsp;
															<input type="radio" name="mainContType" value="어학연수" id="mainContType5" title="주 계약"> <label for="mainContType5" >어학연수</label>
															<input type="radio" name="mainContType" value="골프" id="mainContType4" title="주 계약"> <label for="mainContType4" >골프</label>
															<input type="radio" name="mainContType" value="상조" id="mainContType1" title="주 계약"> <label for="mainContType1" >상조</label>&nbsp;&nbsp;
														</td>
													</tr>
												</c:if>
												
												<!-- 대명 가입번호 입력란 -->
												<c:if test="${info.idNoYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="" title="필수입력">대명 가입 번호1</span></th>
														<td> 
															 <input type="text" name="idNo" value="${dmEntrNo}" title="대명 가입 번호" class="inputType1 numberChk" style="border:0;" readonly="readonly" />
														</td>
													</tr>
												</c:if>
												
												<!-- 상품2 선택란 -->
												<c:if test="${info.prdctNm2Yn eq 'Y'}">
													<tr class="invisible1" style="display:none;">
														<th scope="row"><span>상품 선택2</span></th>
														<td>
															<select id="prdctCd2"name="prdctCd2" title="상품" class="notRequired">
																<option value="">[상품선택]</option>
																<c:forEach var="list" items="${prdctList.product}">
																	<option value="${list.cd}">${list.cdNm}</option>
																</c:forEach>
																<option value="LGU9">통신요금 지원 – 96만원(청구 할인)</option>
															</select>
														</td>
													</tr>
												</c:if>
												<!-- 할인받을 연락처 입력란 -->
												<c:if test="${info.discountCtnYn eq 'Y'}">
													<tr id="discount_ctn2" style="display:none;">	
														<th scope="row"><span class="" title="필수입력">할인 받을 연락처(CTN)</span></th>
														<td>
															<input type="text" name="discountCtn2" title="할인 받을 연락처" class="inputType1 phoneChk notRequired" maxlength="13" style="float: left;"/>
															<div style="float: left;">
																<span class="red">* 실제 할인 받을 U+ CTN 기재 부탁드립니다.</span><br>
																<span class="red">* U+ CTN이 없는 경우 U-Cube 상담 등록 시 가입번호로 할인 적용 되오니 참고 바랍니다.</span>
															</div>
														</td>
													</tr>
												</c:if>
												
												<!-- 가입 희망 구좌 -->
												<c:if test="${info.mainContTypeYn eq 'Y'}">
													<tr class="invisible1" style="display:none;">	
														<th scope="row"><span class="essen" title="필수입력">주 계약2</span></th>
														<td>
															<input type="radio" name="mainContType2" value="여행" id="secondContType2" title="주 계약" checked> <label for="secondContType2" >여행</label>&nbsp;&nbsp;
															<input type="radio" name="mainContType2" value="크루즈" id="secondContType3" title="주 계약"> <label for="secondContType3">크루즈</label>&nbsp;&nbsp;
															<input type="radio" name="mainContType2" value="어학연수" id="secondContType5" title="주 계약"> <label for="secondContType5">어학연수</label>&nbsp;&nbsp;
															<input type="radio" name="mainContType2" value="골프" id="secondContType4" title="주 계약"> <label for="secondContType4" >골프</label>																													
															<input type="radio" name="mainContType2" value="상조" id="secondContType1" title="주 계약"> <label for="secondContType1" >상조</label>&nbsp;&nbsp;
														</td>
													</tr>
												</c:if>
												
												<!-- 대명 가입번호2 입력란 -->
												<c:if test="${info.idNoYn eq 'Y'}">
													<tr class="invisible1" style="display:none;">	
														<th scope="row"><span class="" title="필수입력">대명 가입 번호2</span></th>
														<td>
															<input id="idNoInput2" type="text" name="idNo2" value="${dmEntrNo2}" title="대명 가입 번호" class="inputType1 numberChk notRequired" style="border:0;" readonly="readonly" />
														</td>
													</tr>
												</c:if>
												
												<!-- 상품3 선택란 -->
												<c:if test="${info.prdctNm3Yn eq 'Y'}">
													<tr class="invisible2" style="display:none;">
														<th scope="row"><span>상품 선택3</span></th>
														<td>
															<select id="prdctCd3" name="prdctCd3" title="상품" class="notRequired">
																<option value="">[상품선택]</option>
																<c:forEach var="list" items="${prdctList.product}">
																	<option value="${list.cd}">${list.cdNm}</option>
																</c:forEach>
																<option value="LGU9">통신요금 지원 – 96만원(청구 할인)</option>
															</select>
														</td>
													</tr>
												</c:if>
												
												<!-- 할인받을 연락처 입력란 -->
												<c:if test="${info.discountCtnYn eq 'Y'}">
													<tr id="discount_ctn3" style="display:none;">	
														<th scope="row"><span class="" title="필수입력">할인 받을 연락처(CTN)</span></th>
														<td>
															<input type="text" name="discountCtn3" title="할인 받을 연락처" class="inputType1 phoneChk notRequired" maxlength="13" style="float: left;"/>
															<div style="float: left;">
																<span class="red">* 실제 할인 받을 U+ CTN 기재 부탁드립니다.</span><br>
																<span class="red">* U+ CTN이 없는 경우 U-Cube 상담 등록 시 가입번호로 할인 적용 되오니 참고 바랍니다.</span>
															</div>
														</td>
													</tr>
												</c:if>
												
												<!-- 가입 희망 구좌 -->
												<c:if test="${info.mainContTypeYn eq 'Y'}">
													<tr class="invisible2" style="display:none;">	
														<th scope="row"><span class="essen" title="필수입력">주 계약3</span></th>
														<td>
															  <input type="radio" name="mainContType3" value="여행" id="thirdContType2" title="주 계약" checked> <label for="thirdContType2" >여행</label>&nbsp;&nbsp;
  															  <input type="radio" name="mainContType3" value="크루즈" id="thirdContType3" title="주 계약"> <label for="thirdContType3">크루즈</label>&nbsp;&nbsp;
  															  <input type="radio" name="mainContType3" value="어학연수" id="thirdContType5" title="주 계약"> <label for="thirdContType5">어학연수</label>&nbsp;&nbsp;
  															  <input type="radio" name="mainContType3" value="골프" id="thirdContType4" title="주 계약"> <label for="thirdContType4" >골프</label>														
															  <input type="radio" name="mainContType3" value="상조" id="thirdContType1" title="주 계약"> <label for="thirdContType1" >상조</label>&nbsp;&nbsp;
														</td>
													</tr>
												</c:if>
												
												<!-- 대명 가입번호3 입력란 -->
												<c:if test="${info.idNoYn eq 'Y'}">
													<tr class="invisible2" style="display:none;">	
														<th scope="row"><span class="" title="필수입력">대명 가입 번호3</span></th>
														<td>
															<input id="idNoInput3" type="text" name="idNo3" value="${dmEntrNo3}" title="대명 가입 번호" class="inputType1 numberChk notRequired" style="border:0;" readonly="readonly" />
														</td>
													</tr>
												</c:if>
												
												<!-- U+ 서비스명, 상품번호 -->
												<c:if test="${info.uProdNmYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="" title="필수입력">U+ 서비스명</span></th>
														<td>
															<input type="text" name="uProdNm" value="${uProdNm}" title="U+ 서비스명" class="inputType1" style="border:0;" readonly="readonly" />
														</td>
													</tr>
												</c:if>
												<c:if test="${info.uProdNoYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="" title="필수입력">U+ 상품번호</span></th>
														<td>
															<input type="text" name="uProdNo" value="${uProdNo}" title="U+ 상품번호" class="inputType1" style="border:0;" readonly="readonly" />
														</td>
													</tr>
												</c:if>
												
												<!-- 결합 상품 선택란 -->
												<c:if test="${info.fusionPrdctYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">결합상품 선택</span></th>
														<td>
															<select name="fusionPrdctCd" title="결합상품">
																<option value="">[상품선택]</option>
																<c:forEach var="list" items="${prdctList.goods}">
																	<option value="${list.cd}">${list.cdNm}</option>
																</c:forEach>
															</select>
														</td>
													</tr>
												</c:if>
											
												<!-- U+ 가입번호 입력란 -->
												<c:if test="${info.homePrdNumYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="" title="필수입력">U+ 가입번호</span></th>
														<td>
															<p id="uEntrNo_tmp" style="display: none;">${uEntrNo }</p>
															<input type="text" name="homePrdNum" value="${uEntrNo }" title="U+홈상품 가입번호" class="inputType1 notRequired numberChk" maxlength="12" readonly="readonly" style="border:0;"/>
															<span class="prdComment hidden" style="color: red;" > ※ 홈상품 가입번호가 맞는지 확인 바랍니다. </span>
														</td>
													</tr>
												</c:if>
												
												<!-- 고객명 입력란 -->
												<c:if test="${info.nameYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">고객명</span></th>
														<td>
															<input type="text" name="name" title="고객명" class="inputType1" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- 점포명 입력란 -->
												<c:if test="${info.storeNmYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">점포명(GS수퍼)</span></th>
														<td>
															<input type="text" name="storeNm" title="점포명" class="inputType1" maxlength="50" />
														</td>
													</tr>
												</c:if>
												
												<!-- 고객 연락처(핸드폰) 입력란 -->
												<c:if test="${info.hpYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">고객 연락처(핸드폰)</span></th>
														<td>
															<c:if test="${info.telecomYn eq 'Y'}">
																<select name="telecom" class="inputType2" title="통신사">
																	<option value="">선택하세요.</option>
																	<option value="LGU">LGU+</option>
																	<option value="SKT">SKT</option>
																	<option value="KT">KT</option>
																</select>
															</c:if>
															<input type="text" name="hp" title="고객 연락처" class="inputType1 phoneChk" maxlength="13" />
														</td>
													</tr>
												</c:if>
												
												<!-- 고객 연락처(유선전화) 입력란 -->
												<c:if test="${info.telYn eq 'Y'}">
													<tr>	
														<th scope="row">고객 연락처(유선전화)</th>
														<td>
															<input type="text" name="tel" title="고객 연락처" class="inputType1 phoneChk notRequired" maxlength="13" />
														</td>
													</tr>
												</c:if>

												<!-- 할인받을 명의자 생년월일 입력란 -->
<%--
												<c:if test="${info.discountPinYn eq 'Y'}">
													<tr id="discount_pin" style="display:none;">	
														<th scope="row"><span class="essen" title="필수입력">할인 받을 명의자 생년월일</th>
														<td>
															<input type="text" name="discountPin" title="할인 받을 명의자 생년월일" class="inputType1 numberChk" maxlength="6" />
															<span class="red">* 주민번호 앞 6자리 숫자만 입력 부탁드립니다.</span>									
														</td>
													</tr>
												</c:if>
--%>
												
												<!-- 이메일 입력란 -->
												<c:if test="${info.emailYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">이메일</span></th>
														<td>
															<input type="text" name="email" title="이메일" class="inputType1 emailChk" maxlength="30" />
														</td>
													</tr>
												</c:if>
												
												<!-- 주소 입력란 -->
												<c:if test="${info.addressYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">주소</span></th>
														<td>
															<div>
																<input type="text" id="zipcd" name="zipcd" class="inputType3 add1 notRequired" maxlength="7"  /> <!-- maxlength="7" readonly="readonly" />-->
																<input type="text" name="adr" class="inputType5" maxlength="100"  /> <!-- maxlength="100" readonly="readonly" />-->
																<a href="javascript:" class="btn333" id="zipcode">우편번호 찾기</a>
															</div>
															<p class="mt10"><input type="text" name="adr_dtl" title="상세주소" class="inputType4" maxlength="100" placeholder="상세주소" /></p>
														</td>
													</tr>
												</c:if>
												
												<!-- 상담 가능 시간대 입력란 -->
												<c:if test="${info.calltimeYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">상담 가능 시간대</span></th>
														<td>
															<select name="calltime" class="inputType1" title="상담 가능 시간대">
																<option value="">선택해 주세요</option>
																<option value="10:00 ~ 11:00">10:00 ~ 11:00</option>
																<option value="11:00 ~ 12:00">11:00 ~ 12:00</option>
																<option value="12:00 ~ 13:00">12:00 ~ 13:00</option>
																<option value="13:00 ~ 14:00">13:00 ~ 14:00</option>
																<option value="14:00 ~ 15:00">14:00 ~ 15:00</option>
																<option value="15:00 ~ 16:00">15:00 ~ 16:00</option>
																<option value="16:00 ~ 17:00">16:00 ~ 17:00</option>
																<option value="17:00 ~ 18:00">17:00 ~ 18:00</option>
															</select>
														</td>
													</tr>
												</c:if>
												
												<!-- SKB 가입상태 선택란 -->
												<c:if test="${info.skbJoinYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">SKB 가입상태</span></th>
														<td>
															<select name="skbJoin" title="SKB 가입상태">
																<option value="">[SKB 가입상태]</option>
																<option value="가입완료">가입완료</option>
																<option value="가입보류">가입보류</option>
															</select>
														</td>
													</tr>
												</c:if>
												
												<!-- 롯데카드번호 입력란 -->
												<c:if test="${info.lotCardNumYn eq 'Y'}">
													<tr>	
														<th scope="row"><span class="essen" title="필수입력">롯데카드번호</span></th>
														<td>
															<input type="text" name="lotCardNum" title="롯데카드번호" class="inputType1" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- 코드(국문) 입력란 -->
												<c:if test="${info.cstmrCodeKrYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">코드</span></th>
														<td>
															<input type="text" name="cstmrCode1" title="코드" class="inputType1" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- 고객 고유번호 입력란 -->
												<c:if test="${info.cstmrUnqNumYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">고객 고유번호</span></th>
														<td>
															<input type="text" name="cstmrUnqNum" title="고객 고유번호" class="inputType1" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- 카드번호 입력란 -->
												<c:if test="${info.cardNumYn eq 'Y'}">
													<tr>
														<th scope="row"><span>카드번호</span></th>
														<td>
															<input type="text" name="cardNum" title="카드번호" class="inputType1 notRequired" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- NUMBER 입력란 -->
												<c:if test="${info.cstmrNumYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">NUMBER</span></th>
														<td>
															<input type="text" name="cstmrNum" title="NUMBER" class="inputType1" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- 코드(영문) 입력란 -->
												<c:if test="${info.cstmrCodeEnYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">CODE</span></th>
														<td>
															<input type="text" name="cstmrCode2" title="CODE" class="inputType1" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- 기타 입력란 -->
												<c:if test="${info.cstmrEtcYn eq 'Y'}">
													<tr>
														<th scope="row"><span>기타</span></th>
														<td>
															<textarea name="cstmrEtc" title="기타" class="inputType4 notRequired" style="height:60px;" maxlength="2000"></textarea>
														</td>
													</tr>
												</c:if>
												
												<!-- 한샘 통합 멤버십 입력란 -->
												<c:if test="${info.hanssMbspNumYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">한샘 통합 멤버십</span></th>
														<td>
															<input type="text" name="hanssMbspNum" title="한샘 통합 멤버십" class="inputType1" maxlength="9" />&nbsp;&nbsp;
															<span class="red"> * 상담을 위해서 한샘 통합 멤버십 고객 번호가 반드시 필요합니다. (9자리)</span>
														</td>
													</tr>
												</c:if>
												
												<!-- 멤버십 번호 입력란 -->
												<c:if test="${info.mbspNumYn eq 'Y'}">
													<tr>
														<th scope="row"><span class="essen" title="필수입력">멤버십 번호</span></th>
														<td>
															<input type="text" name="mbspNum" title="멤버십 번호" class="inputType1" maxlength="20" />
														</td>
													</tr>
												</c:if>
												
												<!-- 메모 입력란 -->
												<c:if test="${info.memoYn eq 'Y'}">
													<tr>	
														<th scope="row"><span style="padding-left:0;">메모</span><span style="display: block;font-size: 12px;color: #b12b1d;padding-top: 8px;padding-left:0;">※글자수 250자 제한</span></th>
														<td>
															<textarea name="memo" title="메모" class="inputType4 notRequired" style="height:60px;" maxlength="250"></textarea>
															<span class="max_counter">0/250</span>
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
							
								<!-- 개인 정보 활용 동의 표시란 -->
								<c:if test="${info.termsYn eq 'Y'}">
									<div class="termDiv mt40">
										<p class="tit">개인 정보 활용 동의</p>
										<button type="button" class="check checkBtn">
											<strong>동의합니다.</strong>
											<img src="/common/images/btn/check_bt.gif" alt="체크">
										</button>
										<input type="checkbox" name="agree" class="agree" style="display:none" />
			
										<div class="termBox">
											${info.terms}
										</div>
									</div>
								</c:if>

								<div class="mt30 taC">
									<a href="javascript:" class="btnRed" id="submit">신청</a>
									<input type="submit" style="display:none" />
								</div>
							</div>
						</form>
