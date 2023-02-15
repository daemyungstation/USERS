<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
<%@ page session="true" %>

<style>
#popup { background:none; }
.my-mus { display:flex; justify-content: center; }
.my-mus .my-menu { display:flex; justify-content: center; align-items: center; width:20%; margin:50px 0 0 50px; background:#f7f7f7; border:1px solid #e5e5e5;padding: 50px 0; cursor:pointer; }
.my-mus .my-menu:first-child { margin-left:0; }
.my-mus .my-menu .my-icon img { width:60px; }
.my-mus .my-menu .my-txt { width:100px; text-align:center; font-size: 20px; color: #333; font-weight:bold; }
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
					${msg}
				</b></p>
			</div>
			
			<div class="mt30" style="text-align:center;">
				<a href="/member/my/index.do" class="btnRed">돌아가기</a>
			</div>
		</div>
		<div style="height:100px">
	</div>
</div>

