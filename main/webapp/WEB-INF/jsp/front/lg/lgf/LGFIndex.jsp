<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
<%@ page session="true" %>

<style>
#popup { background:none; }
.my-mus { display:flex; justify-content: center; }
.my-mus .my-menu { display:flex; justify-content: center; align-items: center; width:20%; margin:50px 0 0 50px; background:#f7f7f7; border:1px solid #e5e5e5;padding: 50px 0; cursor:pointer; }
.my-mus .my-menu:first-child { margin-left:0; }
.my-mus .my-menu .my-icon img { width:60px; }
.my-mus .my-menu .my-txt { width:100px; text-align:center; font-size: 20px; color: #333; font-weight:bold; }

@media (max-width: 800px){
	.my-mus { flex-wrap: wrap; margin-top:10px; }
	.my-mus .my-menu { width: 48%; margin: 2% 0 0 2%;}
	.my-mus .my-menu:nth-child(3) { margin-left:0; }
}
</style>
<div id="header">
	<div class="headDiv">
		<h1><a href="/main/index.do"><img src="/common/images/logo.gif" alt="" /></a></h1>
	</div>
</div> <!--// header -->

<div id="cBody">
	<div class="subBody">
		<div>
			<div class="join_desc">
				<p><b>
					대명아임레디를 <br>
					찾아주셔서 감사합니다.<br><br>
					
					어떤 메뉴를 찾으시나요? 
				</b></p>
			</div>
			
			<div class="my-mus">
				<div class="my-menu my-payment">
					<div class="my-icon">
						<img src="/common/images/my/my-icon-payment.png">
					</div>
					<div class="my-txt">
						가입내역<br>확인
					</div>
				</div>
				<div class="my-menu my-info">
					<div class="my-icon">
						<img src="/common/images/my/my-icon-info.png">
					</div>
					<div class="my-txt">
						개인정보<br>변경
					</div>
				</div>
				<div class="my-menu my-method">
					<div class="my-icon">
						<img src="/common/images/my/my-icon-paymethod.png">
					</div>
					<div class="my-txt">
						결제정보<br>변경
					</div>
				</div>
				<!--
				<div class="my-menu my-terminate">
					<div class="my-icon">
					</div>
					<div class="my-txt">
					</div>
				</div>
				-->
			</div>
			
			<div class="termDiv mt60">
				<p class="tit">개인정보 제공 동의 (필수)</p>
				<button type="button" class="check checkBtn">								
					<strong>동의합니다.</strong>
					<img src="/common/images/btn/check_bt.gif" alt="체크">
				</button>
				<input type="checkbox" class="agree" style="display:none" name="my_agree">
				<div class="termBox">
					<p class="tit">1. 수집하는 개인정보의 항목 및 목적</p>
					<p class="txt">▷ 회원가입 시 수집항목</p>	
					<p class="txt2 mt5">- 필수항목 : 성명, 생년월일, 성별, 아이디, 비밀번호, 휴대폰번호, 주소, E- mail</p>								
					<p class="txt">▷ 서비스 이용 또는 업무처리과정에서 자동으로 생성되는 수집항목</p>	
					<p class="txt2 mt5">-  필수항목 : IP Address, 쿠키, 방문 일시, 접속 이용 기록, 불량 이용 기록</p>
					<p class="tit mt25">2. 개인정보의 보유ㆍ이용 기간</p>
					<p class="txt">▷ 회원탈퇴 후 즉시파기 또는 관련 법령에 따른 보존기간동안 분리보관</p>
					<p class="tit mt25">3. 동의를 거부하실 수 있으나, 동의 거부 시 회원가입이 불가합니다. </p>									
				</div>
				<p>※ 서비스 사용을 위해서는 휴대폰 인증이 필요합니다.</p>
			</div>
		
			<div class="mt30" style="text-align:center;">
				<a href="" class="btnRed" id="my-auth">휴대폰 인증</a>
			</div>
		</div>
		<div style="height:100px">
	</div>
</div>
<form name="form1" action="/auth/phoneAuth.do" method="post">
	<input type="hidden" name="rqst_caus_cd" value="00" />
	<input type="hidden" name="rMsg" value="/member/my/checkAuth.do" />
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

<script>
$(document).ready(function() {
	$('.checkBtn').click(function(){
		if(!$("input[name='my_agree']").prop("checked")) {
			$(this).find("img").attr("src", "/common/images/btn/check_bt_on.gif");
			$("input[name='my_agree']").prop("checked", true);
		}else {
			$(this).find("img").attr("src", "/common/images/btn/check_bt.gif");
			$("input[name='my_agree']").prop("checked", false);
		}
	});
	
	$('#my-auth').click(function(){
		if(!$("input[name='my_agree']").prop("checked")) {
			alert('개인정보 제공에 동의해주세요');
			return false;
		}
		window.open('', 'auth_popup', 'width=520, height=640');
		document.form1.target = "auth_popup";
		document.form1.submit();
		
		return false;
	});
});
</script>
