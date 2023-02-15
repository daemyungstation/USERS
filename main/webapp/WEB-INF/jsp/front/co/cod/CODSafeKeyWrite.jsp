<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/WEB-INF/jsp/include/el.jspf"%>

			<div id="popup">
				<div class="popHead">본인확인 (SafeKEY 발급)</div>

				<div class="popBody">
					<div class="memCardpop">
						<div class="boardType2">
							<form id="frm" method="post">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="30%">
										<col width="70%">
									</colgroup>
									<tbody>
										<tr>	
											<th scope="row">이름</th>
											<td>
												<input type="text" id="username" name="username" value="" title="이름" class="inputType4" style="width:50%;" maxlength="15" />
											</td>
										</tr>
										<tr>	
											<th scope="row">생년월일</th>
											<td>
												<input type="text" id="birthdate" name="birthdate" value="" title="생년월일" class="inputType4 numberChk" style="width:50%;" maxlength="8" />
												&nbsp;ex) 19800102
											</td>
										</tr>
										<tr>	
											<th scope="row">성별</th>
											<td>
												<input type="radio" id="male" name="gender" value="1" title="성별" style="margin:0px; padding:0px;" />
												<label for="male">남</label>&nbsp;&nbsp;&nbsp;
												<input type="radio" id="female" name="gender" value="0" title="성별" style="margin:0px; padding:0px;" />
												<label for="female">여</label>
											</td>
										</tr>
										<!-- 
										<tr>	
											<th scope="row">휴대폰</th>
											<td>
												<input type="text" id="mobileno" name="mobileno" value="" title="휴대폰" class="inputType4 mobileChk" style="width:50%;" maxlength="13" />
												&nbsp;ex) 01011112222
											</td>
										</tr>
										-->
									</tbody>
								</table>
								
								<div class="taC mt20">
									<a href="javascript:" id="submitLink" class="btnRed wide">Safe-Key 발급받기</a>
									<input type="submit" value="전송" style="display:none;" />
								</div>
							</form>
							
							<form name="niceform" method="post">
								<input type="hidden" id="m" name="m" value="safekeyService" />			<!-- 필수 데이타로, 누락하시면 안됩니다. -->
								<input type="hidden" id="EncodeData" name="EncodeData" value="" />		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
								<input type="hidden" id="param_r1" name="param_r1" />
								<input type="hidden" id="param_r2" name="param_r2" />
								<input type="hidden" id="param_r3" name="param_r3" />
							</form>
						</div>
						<p class="dotTxt mt30">대명라이프웨이 계약에 필요한 고객의 신용 정보 조회 또는 신규계약자의 실명 인증, 각종 서비스 이행을 위해서 개인정보 처리 업무를 위탁하여 운영하고 있습니다.</p>
						<p class="dotTxt mt10">
							당사의 개인정보 위탁 처리 기관 및 위탁 업무는 아래와 같습니다.
							<br />&nbsp;가. 위탁기관 : NICE 평가정보주식회사
							<br />&nbsp;나. 위탁업무 : 본인인증, 이용약관 및 개인정보 수집·이용/제공·활용/조회 동의
						</p>
						<p class="dotTxt mt10">본인은 본 개인정보 처리 업무의 위탁에 동의합니다.</p>
					</div>
				</div>
			</div>
			
			<script type="text/javascript">
			//<![CDATA[
			           
				jQuery(document).ready(function(){
					//유효성 체크
					jQuery("#frm").validation({
						msg : {
							empty : {
								names : {
									gender : "성별을(를) 선택해주세요.",
								}
							}
						},
						async : {
							use : true,
							func : getEncodeData
						},
						customfunc : function(obj, id) {
				        	if("birthdate" == id)
				        	{
				        		if(jQuery(obj).val().length != 8)
				        		{
				        			alert("생년월일 입력값이 올바르지 않습니다.");
				        			jQuery(obj).focus();
				        			return false;
				        		}
				        	}
				        }
					});
					
					jQuery("#submitLink").on("click", function(e){
						//기본이벤트 제거
						e.preventDefault();

						jQuery("input[type='submit']").trigger("click");
					});
				});
				
				function getEncodeData()
				{
					jQuery.post("./check.ajax", jQuery("#frm").serialize(),
						function(r) 
						{
							var encodeData = r.sEncData;
							
							if(encodeData)
							{
								var niceform = document.niceform;
								
								niceform.EncodeData.value = encodeData;
								niceform.action = "https://nice.checkplus.co.kr/CheckPlusSafekeyModel/checkplus.cb";
								niceform.submit();
							}
							eles
							{
								alert(r.sMessage);
							}
						}
					).fail(function () {
						alert("예기치 않은 오류입니다.");
					});
				}
			           
			//]]>
			</script>
