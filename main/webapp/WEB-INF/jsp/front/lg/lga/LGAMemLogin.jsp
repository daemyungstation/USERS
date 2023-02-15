<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
<%@ page session="true" %>

<div data-controller="LoginController">
	<%--<form name="frm" method="post">--%>
		<input type="hidden" name="vwUrl" value="${vwUrl}" class="notRequired" />
		<input type="hidden" name="idx" value="${idx}" class="notRequired" />
		<input type="hidden" name="retryCount" value="${sessionScope.retryCount}" class="notRequired" />

	<div class="loginDiv">
		<div class="inputArea">
			<div class="areaDiv" colspan="2">
				<div class="pBox">
					<div class="inputDiv">
						<input type="text" id="id" name="id" value="" title="아이디" class="lginInput idChk" style="" placeholder="아이디">
						<input type="password" id="pwd" name="pwd" value="" title="비밀번호" class="lginInput mt5" style="" placeholder="비밀번호">

						<c:if test="${sessionScope.retryCount > 4}">
						<div class="login_fail_security">
							<p class="txt_security">비밀번호와 자동입력 방지문자를 입력해주세요.<br /><strong>비밀번호를 5회 이상 잘못 입력</strong>하면, 정보보호를 위해 자동입력방지 문자를 함께 입력하셔야 합니다.</p>
							<img id="captchaImg" class="img_security" name="captchaImg" src="/captcha" alt="보안문자 이미지" width="65px" height="37px" />
							<input type="text" name="captchaText" value="" title="보안문자" placeholder="보안문자" class="lginInput2" maxlength="5" />
						</div>
						</c:if>
					</div>
					<a href="#" id="integrationSubmit" class="btnRed loginBt">로그인</a>
					<input type="submit" style="text-indent:-100px; padding:0; border:0; " />
				</div>

				<div class="srchArea">
					<p class="txt">아이디, 비밀번호를 잊으셨나요?</p>
					<div class="bt">
						<a href="/member/findid/index.do" class="whtBt">아이디 찾기</a>
						<a href="/member/findpass/index.do" class="whtBt">비밀번호 찾기</a>
					</div>
				</div>
				<div>
					<!--<c:if test="${sessionScope.retryCount > 6} }">
					</c:if>-->
				</div>
			</div>
		</div>

		<div class="joinArea">
			<div class="areaDiv">
				<p class="txt"><strong>아직 대명 아임레디 통합회원이 아니신가요?</strong><br>통합회원이 되시면 한 아이디로 대명아임레디, <br>아임레디몰(회원몰)에서 다양한 서비스 이용이 가능합니다.</p>
				<a href="/member/join/agree.do" class="whtBt">회원가입</a>
			</div>
		</div>
	</div>
	<%--</form>--%>
</div>

<script type="text/javascript">
	window.onload = function() {

		$('#pwd').keyup(function(e) {
			if (e.keyCode == 13) {
				setLogin();
			}
		});

		document.getElementById('integrationSubmit').addEventListener('click', setLogin);
	}

	function setLogin() {
		if (document.getElementsByName('id')[0].value == '') {
			alert("아이디를 입력해주세요.");
			return false;
		} else if (document.getElementsByName('pwd')[0].value == '') {
			alert("비밀번호를 입력해주세요.");
			return false;
		}

		var captchaText = '';
		if (document.getElementsByName('captchaText').length > 0 && document.getElementsByName('captchaText')[0] != undefined) {
			captchaText = document.getElementsByName('captchaText')[0].value;
		} 
		
		$.ajax({
			//url : "./setLogin.do",
			url : "./setLogin_sso.do", // SSO 로그인
			type : "POST",
			data : {
				"id" : document.getElementsByName('id')[0].value,
				"pwd" : document.getElementsByName('pwd')[0].value,
				"vwUrl" : document.getElementsByName('vwUrl')[0].value,
				"idx" : document.getElementsByName('idx')[0].value,
				"retryCount" : document.getElementsByName('retryCount')[0].value
				, "captchaText" : captchaText
			},
			success : function(result){
				//console.log(result);
				if (result.success) {
					var token = result.token;
					var servicekey = result.serviceKey;
					SSO.sendSSOToken(servicekey, token, function(serviceKey) {
						location.replace(result.url);
					});
				} else {
					if (result.msg != '') {
						alert(result.msg);
					}
					location.replace(result.url);
				}
			}
		});
	}
</script>