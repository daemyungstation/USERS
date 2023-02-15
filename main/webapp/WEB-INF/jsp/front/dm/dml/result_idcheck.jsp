<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

					<div data-controller="LoginController">
						<form name="frm">
						<p class="charTit">아임레디몰 아이디 확인하기</p>	
						<div class="loginDiv">
							<div class="joinArea">
								<div class="areaDiv">
									<p class="dotTxt2">이임레디몰 아이디 : 회원고유번호<br>
									<p class="dotTxt2">이임레디몰 패스워드 : 회원고유번호 뒷 4자리<br>																
								</div>
							</div>
							<div class="areaDiv">
							<div class="pBox">
								<!-- 
								<c:forEach var="list" items="${rtnMap.list}">
									<c:set var="mem_no" value="${list.memNo}" />
								</c:forEach>
								 -->
								<c:if test="${!empty rtnMap.memno}">
									<p class="dotTxt2">회원님의 아이디는  <font color=red><strong>${rtnMap.memno}</strong></font>입니다.</p>
										<br/>	
									<center><a href="http://www.lifewayshopping.com" id="submit1" class="btnRed loginBt" target="_blank">회원몰 로그인</a></center>	
								</c:if>
								
								<c:if test="${empty rtnMap.memno}">
									<p class="dotTxt2">회원님의 아이디가 존재 하지 않습니다.<br/>
													  (고객만족센터 확인 요청 바랍니다.)</p>
										<br/>	
									<center><a href="./idcheck.do" id="submit2" class="btnRed loginBt">처음으로</a></center>	
								</c:if>								
								
																
							</div>
							</div>
		
							<div class="inputArea">
							<div class="txtArea">
								<p class="dotTxt2">회원명과 휴대폰번호를 이용해 일반회원번호(아이디)가 
												      </br>확인되지 않는 경우에는 아임레디몰로 문의해 주시기 바랍니다.</p>
								<p class="dotTxt2">아임레디몰 고객센터 : 1544-0602</p>																
							</div>

						</div>
						</form>
					</div>					
			</script>