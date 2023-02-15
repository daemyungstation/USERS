<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
					<div data-controller="CommonController RenameController">
					
						<!-- <input type="hidden" name="csrfPreventionSalt" value="${csrfPreventionSalt}" class="notRequired" /> -->
					
						<div class="popHead">
							개명신청 안내<br /><span>본인인증을 통해 개명된 이름으로 변경이 가능합니다.</span>
							<a href="javascript:self.close();"><img src="/common/images/popup/popup_xbt.gif" alt="" /></a>
						</div>
		
						<div class="popBody">
							<div class="memCardpop">
								<div class="txt2">
									개명 후 본인인증 되지 않는 경우, 아래 2군데 사이트를 각각 방문하여 온라인 실명등록을 하셔야 본인인증이 가능합니다.
									<div class="bt">
										<a href="https://www.namecheck.co.kr/front/personal/register_howtoonline.jsp" target="_blank">네임체크 실명등록 &gt;</a>
										<a href="http://www.siren24.com/mysiren/customer/sir_g0201_01.jsp" target="_blank">싸이렌24 실명등록 &gt;</a>
									</div>
								</div>
								<dl class="type2 mt40">
									<dt>
										원하시는 인증방법을 선택해 주세요
										<div class="accredBt">
											<a href="" class="whtBt3" id="mobileAuth">휴대폰 인증</a>
											<a href="" class="whtBt3" id="ipinAuth">아이핀 인증</a>
										</div>
									</dt>
									<dd class="taL mt40">
										<p class="red">※ 이름변경외 개명에 따른 제출 구비서류는 다음과 같습니다.</p>
										<p class="mt5"><strong>[개명신청 구비서류]</strong> 주민등록초본, 변경된 신분증 사본</p>
										<p class="mt5">컨택센터 : 1588-8511 (운영시간 09시~18시)</p>
									</dd>
								</dl>
							</div>
						</div>
						
						<form name="form1" action="/auth/phoneAuth.do" method="post">
							<input type="hidden" name="rqst_caus_cd" value="00" />
							<!--  input type="hidden" name="rMsg" value="/my-lifeway/member/personal-data-change/check.do" / -->
							<input type="hidden" name="rMsg" value="/my-lifeway/member/personal-data-change/check_sso.do" />
						</form>

						<form name="form2" action="/auth/ipinAuth.do" method="post">
							<!-- input type="hidden" name="rMsg" value="/my-lifeway/member/personal-data-change/check.do" / -->
							<input type="hidden" name="rMsg" value="/my-lifeway/member/personal-data-change/check_sso.do" />
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