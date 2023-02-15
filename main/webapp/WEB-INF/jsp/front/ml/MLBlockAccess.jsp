<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
							
						<div  class="lifeWayDiv">
							<p class="top">
								<strong>${sessionScope.userLgnMap.name}</strong>님은 웹회원이며 ,<br />[ 나의 아임레디 ]에서 이용 가능한 메뉴는 아래와 같습니다 .
							</p>
							<p class="mid">
								<strong>[ 1:1 상담내역 ]</strong>
								<strong>[ 개인정보 변경 ]</strong>
								<strong>[ 비밀번호 변경 ]</strong>
							</p>
							<p class="bot">이외 메뉴는 대명아임레디 상품가입 회원들에게만 제공되는 정보입니다 .</p>
						</div>

						<div class="lifeWayDiv2">
							<p class="type1">대명아임레디 상품회원인데<br />상품정보 및 가입정보 등이 확인되지 않는다고요 ?<br />컨택센터로 문의전화 부탁드립니다.</p>
							<p class="type2">1588-8511</p>
							<ul class="dotBox2 mt30">
								<li>상품정보는 상품 가입 후 최초 납입(1회차)이 완료된 내역만 보여집니다. </li>
							</ul>
							<dl class="dotBox mt20">
								<dt>아래 사항일 경우 정보를 확인할 수 없는 경우도 있습니다.</dt>
								<dd>상품 가입 후 휴대전화가 변경된 경우 </dd>
								<dd>상품 가입 시 본인 명의가 아닐 경우(가입자명, 휴대전화) / 생년월일을 다르게  입력한경우 / 본인인증이 안된 경우 </dd>
								<dd>정보 확인이 되지 않은 경우 우측에 있는 [확인요청]을 클릭하시면 확인 후 컨택센터에서 전화드립니다.</dd>
							</dl>
							<p class="mt20 taC">
								<a href="javascript:" id="btnChkReqn" class="btnRed">확인요청</a>
							</p>
						</div>
						
						<script type="text/javascript">
						//<![CDATA[

							jQuery("#btnChkReqn").on("click", function(){
								if(confirm("접수하시겠습니까?"))
								{
									jQuery.post("/my-lifeway/check-requestion/insert.ajax",
										{
											"reqnGb" : "01"
										},
										function(r)
										{
											var status = r.status;
											
											if(status == "Y")
											{
												alert("확인요청이 접수되었습니다.");
											}
											else if(status == "N")
											{
												alert("확인요청이 이미 접수되었습니다.");
											}
										}
									).fail(function(){
										alert("예기치 않은 오류입니다.");
										return;
									});
								}
							});
							
						//]]>
						
						</script>