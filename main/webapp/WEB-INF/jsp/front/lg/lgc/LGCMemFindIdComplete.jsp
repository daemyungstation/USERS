<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

						<div class="srchId">
							<div class="idDiv">
								<p class="txt1">본인인증을 통해 고객님의 정보와 일치하는 아이디 정보입니다.</p>
								<p class="txt2">${id}</p>
								<div class="bts">
									<a href="/member/findpass/index.do" class="whtBt">비밀번호 찾기</a>
									<a href="/member/login/Login.do" class="btnRed">로그인 하기</a>
								</div>
							</div>
						</div>
