<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

					<div data-controller="LoginController">
						<form name="frm" method="post" action="./setIdCheck.do">
						<p class="charTit">아임레디몰 아이디 확인하기</p>	
						<div class="loginDiv">
							<div class="joinArea">
								<div class="areaDiv">
									<p class="dotTxt2">이임레디몰 아이디 : 회원고유번호<br>
									<p class="dotTxt2">이임레디몰 패스워드 : 회원고유번호 뒷 4자리<br>																
								</div>
							</div>
						
							<div class="inputArea">
								<div class="areaDiv">
									<div class="pBox">
										<div class="inputDiv">
											<input type="text" id="" name="name" value="" title="이름" class="lginInput" style="" placeholder="성함을 입력해 주세요">
											</br>
											<input type="text" id="" name="cell" value="" title="핸드폰번호" class="lginInput" style="" placeholder="핸드폰 번호를 입력해 주세요(-제외)">											
										</div>
										<a href="" id="submit" class="btnRed loginBt">아이디확인</a>
										<input id="btnChkReqn"  type="submit" style="text-indent:-100px; padding:0; border:0; " />
									</div>
								</div>
							</div>

							<div class="inputArea">
							<div class="txtArea">
								<p class="dotTxt2">회원명과 휴대폰번호를 이용해 일반회원번호(아이디)가 
												      </br>확인되지 않는 경우에는 아임레디몰로 문의해 주시기 바랍니다.</p>
								<p class="dotTxt2">아임레디몰 고객센터 : 1544-0602</p>																
							</div>

						</div>
						</form>
					</div>					
			</script>