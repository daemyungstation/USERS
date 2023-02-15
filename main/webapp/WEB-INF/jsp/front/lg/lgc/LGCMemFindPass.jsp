<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
 
					<div data-controller="CommonController FindController">
						<div class="idpwDiv">
							<p class="txt1">비밀번호를 모르시나요?</p>
							<p class="txt2">비밀번호 찾기 방법을 선택해 주세요. </p>
							<div class="srchBox">
								<div class="accredit1">
									<p class="txt3">휴대폰 인증</p>
									<p class="txt4">본인명의의 휴대폰으로 인증절차를 거쳐 개인정보 유출을 방지하는<br>개인정보보호 수단입니다.</p>
									<!-- <a href="/auth/getPhoneAuthInf.do?rtnUrl=/member/findpass/change.do" class="whtBt">휴대폰 인증</a> -->
									<a href="" class="whtBt" id="mobileAuth">휴대폰 인증</a>
								</div>
								<div class="accredit2">
									<p class="txt3">아이핀 인증</p>
									<p class="txt4">아이핀(i-PIN)은 ‘인터넷상 개인 식별번호’로 명의도용이 쉬운 주민등록번호를<br>대신하여 본인임을 확인 받을 수 있는 신원확인 수단입니다.</p>
									<a href="" class="whtBt" id="ipinAuth">아이핀 인증</a>
								</div>
							</div>

							<p class="goPw">
								아이디를 찾으시나요?
								<a href="/member/findid/index.do">아이디 찾기</a>
							</p>
						</div>
						
						<form name="form1" action="/auth/phoneAuth.do" method="post">
							<input type="hidden" name="rqst_caus_cd" value="03" />
							<!-- input type="hidden" name="rMsg" value="/member/findpass/change.do" / -->
							<input type="hidden" name="rMsg" value="/member/findpass/change_sso.do" />
						</form>
						<form name="form2" action="/auth/ipinAuth.do" method="post">
							<!-- input type="hidden" name="rMsg" value="/member/findpass/change.do" / -->
							<input type="hidden" name="rMsg" value="/member/findpass/change_sso.do" />
						</form>
						
											 
						<!-- 본인확인 처리결과 정보 -->
						<form name="kcbResultForm" method="post" action="/auth/getPhoneAuthInf.do">
							<input type="hidden" name="result_cd" 		value="" 	/>
							<input type="hidden" name="result_msg" 	value="" 	/>
							<input type="hidden" name="di" 				value="" 	/>
							<input type="hidden" name="ci" 				value="" 	/>
							<input type="hidden" name="name" 			value="" 	/>
							<input type="hidden" name="birthday" 		value="" 	/>
							<input type="hidden" name="sex" 				value="" 	/>
							<input type="hidden" name="tel_com_cd" 	value="" 	/>
							<input type="hidden" name="tel_no" 			value="" 	/>
							<input type="hidden" name="return_msg" 	value="" 	/>
						</form>	
						<!-- 본인확인(아이핀) 처리결과 정보 -->	
						<form name="kcbOutForm" method="post">
							<input type="hidden" name="dupinfo" />
							<input type="hidden" name="realname" />
							<input type="hidden" name="sex" />
							<input type="hidden" name="birthdate" />
							<input type="hidden" name="coinfo1" />
							<input type="hidden" name="coinfo2" />
							<input type="hidden" name="return_msg" />
						</form>
					</div>