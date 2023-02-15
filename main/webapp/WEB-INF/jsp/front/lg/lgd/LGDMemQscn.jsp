<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

					<div data-controller="CommonController FindController">
						<div class="idpwDiv">
							<p class="txt1">휴면계정 안내</p>
							<ul>
								<li>1년이상 로그인을 하지 않아 휴면계정으로 전환되었습니다.</li>
								<li>개인정보 보호를 위해 본인인증을 하시면 일반계정으로 전환됩니다.</li>
							</ul>
							<div class="srchBox">
								<div class="accredit1">
									<p class="txt3">휴대폰 인증</p>
									<p class="txt4">본인명의의 휴대폰으로 인증절차를 거쳐 개인정보 유출을 방지하는<br>개인정보보호 수단입니다.</p>
									<!-- <a href="/auth/getPhoneAuthInf.do?rtnUrl=/member/qscn/checkAuth.do" class="whtBt">휴대폰 인증</a> -->
									<a href="" class="whtBt" id="mobileAuth">휴대폰 인증</a>
								</div>
								<div class="accredit2">
									<p class="txt3">아이핀 인증</p>
									<p class="txt4">아이핀(i-PIN)은 ‘인터넷상 개인 식별번호’로 명의도용이 쉬운 주민등록번호를<br>대신하여 본인임을 확인 받을 수 있는 신원확인 수단입니다.</p>
									<a href="" class="whtBt" id="ipinAuth">아이핀 인증</a>
								</div>
							</div>
						</div>
						
						<form name="form1" action="/auth/phoneAuth.do" method="post">
							<input type="hidden" name="rqst_caus_cd" value="99" />
							<input type="hidden" name="rMsg" value="/member/qscn/checkAuth.do" />
						</form>
						<form name="form2" action="/auth/ipinAuth.do" method="post">
							<input type="hidden" name="rMsg" value="/member/qscn/checkAuth.do" />
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