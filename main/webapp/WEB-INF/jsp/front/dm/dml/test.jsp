<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

					<div data-controller="LoginController">
						<form name="frm" method="post" action="./setTest.do">
							<input type="hidden" name="vwUrl" value="${vwUrl}" class="notRequired" />
							<input type="hidden" name="idx" value="${idx}" class="notRequired" />
							
						<div class="loginDiv">
							<div class="inputArea">
								<div class="areaDiv">
									<div class="pBox">
										<div class="inputDiv">
											<input type="text" id="" name="id" value="" title="이름" class="lginInput" style="" placeholder="성함을 입력해 주세요">
											<!-- 										
											<input type="text" id="" name="id" value="" title="이름" class="lginInput idChk" style="" placeholder="성함을 입력해 주세요">
											<input type="password" id="" name="pwd" value="" title="비밀번호" class="lginInput mt5" style="" placeholder="비밀번호">
											 -->
										</div>
										<a href="" id="submit" class="btnRed loginBt">로그인</a>
										<input type="submit" style="text-indent:-100px; padding:0; border:0; " />
									</div>
									<!--
									<div class="srchArea">
										<p class="txt">아이디, 비밀번호를 잊으셨나요?</p>
										<div class="bt">
											<a href="/member/findid/index.do" class="whtBt">아이디 찾기</a>
											<a href="/member/findpass/index.do" class="whtBt">비밀번호 찾기</a>
										</div>
									</div>
									  -->
								</div>
							</div>

							<div class="joinArea">
								<div class="areaDiv">
									<p class="txt">성함을 입력 한 후 로그인 버튼을 눌러주세요<br>
									<strong><font color='red'>로그인 후 진행자의 설명에 따라주시기 바랍니다.</font></strong></p>
									<!-- <a href="/member/join/agree.do" class="whtBt">회원가입</a> -->
								</div>
							</div>
						</div>
						</form>
					</div>