<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

    				<div data-controller="FindController">
						<form name="frm" method="post" action="./complete.do">
						
						<div class="srchPw">
							<p>새로운 비밀번호를 설정해 주세요.</p>
							<input type="password" id="" name="pwd" value="" title="비밀번호" class="passChk" style="" placeholder="비밀번호">
							<input type="password" id="" value="" title="비밀번호확인" class="passEqual" style="" placeholder="비밀번호 확인">
							<a href="" class="btnRed" id="submit">완료</a>
							<input type="submit" style="display:none" />

							<dl>
								<dt>보안에 취약한 비밀번호는 사용하지 마세요!</dt>
								<dd>비밀번호는 8자리 ~20 자리 영문 대/소문자 , 숫자 , 특수문자를 조합하여 사용할 수 있어요 .</dd>
								<dd>쉬운 비밀번호나 자주 쓰는 사이트의 비밀번호는 도용되기 쉽기에 주기적으로 변경해 주세요 .</dd>
							</dl>
						</div>
						</form>

					</div>