<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

<p class="joinTxt taC"><img src="/common/images/txt/join_txt3.png" alt="회원가입 완료"></p>
<div class="join_desc">
		<p>통합회원이 되시면 하나의 아이디로 대명 아임레디 홈페이지와 <br>아임레디몰의 서비스를 이용하실 수 있습니다.
		</p>
	</div>


<!-- 신규 가입 완료 -->
<c:if test="${sessionScope.loginType eq null}">
	<div class="joinCom mt45 " >
		<p class="txt">대명 아임레디 통합회원으로<br>가입하신 것을 환영합니다.</p>
		<ul>
			<li>지금부터 통합 ID로 대명아임레디, 아임레디몰(회원몰)의 다양한 컨텐츠 및 혜택을 누려보세요!</li>
		</ul>
		<div class="btn_wrap taC mt35">	
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
</c:if>
<!-- 신규 가입 완료 -->


<!-- 기가입 회원일 경우(미통합) -->
<c:if test="${sessionScope.loginType eq 'NECESSARY_INTEGRATION_MEMBER'}">
	<div class="joinCom_duplicate" >
		<div class="joinCom  mt45">
			<img src="/common/images/icon/icon_completly.png" alt="" class="icon_mark">
			<p class="txt">이미 대명 아임레디 홈페이지/회원몰에 가입하신 회원입니다.<br>
				아래 페이지에서 로그인 후 통합 아이디 전환을 진행해주세요.
				</p>
			<div class="origin_info ${sessionScope.homepageId != null || sessionScope.mallId != null ? 'origin_info_col_1' : ''}">
				<ul>
					<c:if test="${sessionScope.homepageId != null}">
						<li>
							<p>대명 아임레디</p>
							<span>아이디<em>${sessionScope.homepageId}</em></span>
							<span>가입일<em>${egov:convertDate(sessionScope.homepageJoinDate, 'yyyyMMdd', 'yyyy-MM-dd', '')}</em></span>
						</li>
					</c:if>
					<c:if test="${sessionScope.mallId != null}">
						<li>
							<p>아임레디몰</p>
							<span>아이디<em>${sessionScope.mallId}</em></span>
							<span>가입일<em>${egov:convertDate(sessionScope.mallJoinDate, 'yyyyMMdd', 'yyyy-MM-dd', '')}</em></span>
						</li>
					</c:if>
				</ul>
			</div>
			<div class="btn_wrap taC mt35">
				<%-- <c:if test="${sessionScope.homepageId != null}">
					<a href="https://imreadymall.com/member/login.php?integrationId=${id}&url=%2F" class="btn_md btnRed btn_orange">회원몰 바로가기</a>
				</c:if>
				<c:if test="${sessionScope.mallId != null}">
					<a href="https://imreadymall.com/member/login.php?integrationId=${id}&url=%2F" class="btn_md btnRed btn_orange">회원몰 바로가기</a>
				</c:if> --%>
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
	</div>
</c:if>
<!-- 기가입 회원일 경우(미통합) -->


<!-- 기가입 회원일 경우(통합) -->
<c:if test="${sessionScope.loginType eq 'ALREADY_INTEGRATION_MEMBER'}">
	<div class="joinCom_duplicate">
		<div class="joinCom mt45">
			<img src="/common/images/icon/icon_completly.png" alt="" class="icon_mark">
			<p class="txt">회원님은 이미 대명 아임레디 통합회원으로 가입되어 있습니다.
			</p>
			<p class="desc">대명아임레디, 아임레디몰(회원몰)의 다양한 컨텐츠 및 혜택을 누려보세요!</p>
			<div class="origin_info origin_info_col_1">
				<ul>
					<li>
						<span><span>통합 아이디</span>	<em>forbiz1234</em></span>
						<span><span>통합 아이디 가입일</span><em>2017-10-16</em></span>
					</li>
				</ul>
			</div>
			<div class="btn_wrap taC mt35">	
				<a href="https://imreadymall.com/member/login.php?integrationId=${id}&url=%2F" class=" btn_md btnRed btn_orange">회원몰 바로가기</a>
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
	
	</div>
</c:if>
<!-- 기가입 회원일 경우(통합) -->

<c:if test="${sessionScope.loginType ne 'NECESSARY_INTEGRATION_MEMBER'}">
<div class="mt30 taR btn_wrap">
	<a href="/member/login/Login.do" class="btnRed btn_md">홈페이지 로그인</a>
</div>
</c:if>