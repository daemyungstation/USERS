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
				<a href="/member/my/payment.do" class="my-menu my-payment">
					<div class="my-icon">
						<img src="/common/images/my/my-icon-payment.png">
					</div>
					<div class="my-txt">
						가입내역<br>확인
					</div>
				</a>
				<a href="/member/my/info.do" class="my-menu my-info">
					<div class="my-icon">
						<img src="/common/images/my/my-icon-info.png">
					</div>
					<div class="my-txt">
						개인정보<br>변경
					</div>
				</a>
				<a href="/member/my/method.do" class="my-menu my-method">
					<div class="my-icon">
						<img src="/common/images/my/my-icon-paymethod.png">
					</div>
					<div class="my-txt">
						결제정보<br>변경
					</div>
				</a>
				<!--
				<a class="my-menu">
					<div class="my-icon">
					</div>
					<div class="my-txt">
						<br>
					</div>
				</a>
				-->
			</div>
			
		</div>
		<div style="height:100px">
	</div>
</div>

