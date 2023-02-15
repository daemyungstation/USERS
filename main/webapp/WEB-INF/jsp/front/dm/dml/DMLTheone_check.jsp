<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

						<div class="warnBox">
							스페셜라이프II 상품 가입 조회 화면
						</div>

						<div class="listSrch mt30">
							<input type="text" id="name_1" name="name_1" value="" placeholder="이름을 입력해 주세요" maxlength="15" />
							<input type="text" id="phone_1" name="phone_1" value="" placeholder="휴대폰 뒤 4자리를 입력해 주세요" maxlength="4" />
							<a href="javascript:" id="btnSearch" class="btn333">검색</a>
						</div>
						
						<div class="priTxt mt10">
							<!-- <p class="subTxt">■ 수당 지급 기준</p>
							<p class="mt10">&nbsp;&nbsp;● 수당 지급 기준 : (등록월 ~ 등록월+1개월 까지 첫회 부금 출금 완료(가입 완료) → 등록월 + 2개월 말 수당 지급</p>
							<p>&nbsp;&nbsp;ex) 1월 대명 콜센터에 가입 등록건이 2월 말까지 부금 출금 시 3월 말에 지급</p>
    						<p class="mt10">&nbsp;&nbsp;● 아래 사항에 해당되면 수당 지급이 되지 않습니다. 정확히 확인 후 본사 담당자에게 문의하여 주세요!</p>
							<p>&nbsp;&nbsp;- 장기할부는 됐으나, 대명 콜센터에 미 신청 건</p>
							<p>&nbsp;&nbsp;- 대명 콜센터에 신청은 되었으나, 상조부금 출금 완료 되지 않은 건 (첫회차 부금 미출금시 가입 미완료)</p>
							<p>&nbsp;&nbsp;- 장기할부, 대명 가입 완료가 모두 되었으나 등록월로부터 가입월이 2개월 이상 경과된 건</p>
							<p class="mt10">&nbsp;&nbsp;●  건당 수당 지급액</p>
							<p>&nbsp;&nbsp;스마트라이프 297 : 3만원  /  스마트라이프 429 : 5만원   스마트라이프 Gold : 8만원</p> -->
							<p class="table_title">[범례]</p>
							<table class="join_check_table">
								<colgroup>
									<col width="40%">
									<col width="60%">
								</colgroup>
								<thead>
									<tr>
										<td>상태값</td>
										<td>설명</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>정상가입</td>
										<td>해당고객 정상가입 완료상태(출금기준)</td>
									</tr>
									<tr>
										<td>가입을 취소하였습니다.</td>
										<td>정상가입 상태에서 청약철회 또는 해약한 상태</td>
									</tr>
									<tr>
										<td>해당 고객에 대한 정보 값이 없습니다.</td>
										<td>해당 이름으로 가입된 이력이 없는 상태</td>
									</tr>
								</tbody>	
							</table>	
						</div>
						
						<script type="text/javascript">
				
							jQuery(document).ready(function(){
								
								//jQuery("#q").on("keypress", function(e){
								//	var keyCode = e.keyCode;
								//	
								//	if(keyCode == "13")
								//	{
								//		jQuery("#btnSearch").trigger("click");
								//	}
								//});
								
								jQuery("#btnSearch").on("click", function(){
									var srchName = jQuery("#name_1");
									var srchPhone = jQuery("#phone_1");
									
									if(!jQuery(srchName).val())
									{
										alert("회원 이름을 입력해 주세요.");
										jQuery(srchName).focus();
										return;
									}
									
									if(jQuery(srchPhone).val().length < 4)
									{
										alert("핸드폰 뒤4자리를 입력해 주세요.");
										jQuery(srchPhone).focus();
										return;
									}
									
									jQuery.post("/dmlsourcing/theoneSearch.ajax",
										{
											"f" : 1,
											"name_1" : jQuery(srchName).val(),
											"phone_1" : jQuery(srchPhone).val(),
										},
										function(text) 
										{
											jQuery(".priTxt").next().remove();
											jQuery(".priTxt").after(text);
										},
										"text"
									).fail(function () {
										alert("예기치 않은 오류입니다.");
									});
								});
							});
							
						</script>