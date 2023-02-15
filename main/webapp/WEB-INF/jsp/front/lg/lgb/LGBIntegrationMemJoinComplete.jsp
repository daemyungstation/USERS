<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

<div  class="wrap_integration_join">
  <h2>대명 아임레디 통합 회원가입</h2>
	<div class="join_desc">
		<p>보다 원활한 서비스 제공을 위해 대명 아임레디 홈페이지와 아임레디몰의 ID가 통합됩니다.<br>
		기존 아이디를 통합 아이디로 전환하시고, 하나의 아이디로 대명 아임레디 서비스를 편리하게 이용하세요.
		</p>
	</div>
	<p class="joinTxt taC">
		<img src="/common/images/txt/integration_join_txt4.png" alt="약관동의 및 본인인증 ">
		<img src="/common/images/txt/integration_join_txt4_m.png" alt="약관동의 및 본인인증 " class="img_sm">
	</p>
	<div class="joinCom_duplicate">
		<div class="joinCom mt45">
			<img src="/common/images/icon/icon_completly.png" alt="" class="icon_mark">
			<p class="txt">대명 아임레디 통합 아이디 전환이 완료되었습니다.
			</p>
			<p class="desc">대명아임레디, 아임레디몰(회원몰)의 다양한 컨텐츠 및 혜택을 누려보세요!</p>
			<div class="origin_info origin_info_col_1">
				<ul>
					<li>
						<span><span>통합 아이디</span>	<em>${id}</em></span>
						<span><span>통합 아이디 가입일</span><em>${regDate}</em></span>
					</li>
				</ul>
			</div>
			<div class="btn_wrap">	
				<a href="https://imreadymall.com/member/login.php?integrationId=${id}&url=%2F" class="btn_md btnRed btn_orange">회원몰 바로가기</a>
			</div>
		</div>
		<div class="conNumDiv">
			<div class="conNums">
				<p class="contact1">
					컨택센터<br><span>1588-8511</span> (09시~18시)
				</p>
				<p class="contact2">
					긴급의전센터<br><span>1588-2227</span>
				</p>
			</div>
		</div>
		<div class="btn_wrap taR">	
			<a href="/member/login/Login.do" class=" btn_md btnRed">홈페이지 로그인</a>
		</div>
	</div>


</div>
