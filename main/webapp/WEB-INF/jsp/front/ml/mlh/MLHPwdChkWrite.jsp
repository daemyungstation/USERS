<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<!-- form id="frm" method="post" action="./write.do" -->
						<form id="frm" method="post" action="./write_sso.do">
							<input type="hidden" name="csrfPreventionSalt" value="${csrfPreventionSalt}" class="notRequired" />
							
							<div class="changePri">
								<p class="txt1">비밀번호 확인</p>
								<p class="">회원 정보를 안전하게 보호하기 위해 비밀번호를 확인하고 있습니다.</p>
								<div class="inputDiv">
									<input type="password" name="pwd" value="" title="비밀번호" class="" style="" placeholder="비밀번호 입력" maxlength="20" />
									<a href="javascript:" id="submitLink" class="btnRed wide">확인</a>
									<input type="submit" value="전송" style="display:none;" />
								</div>
							</div>
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
							
							jQuery(document).ready(function(){
								//유효성 체크
								jQuery("#frm").validation();
								
								jQuery("#submitLink").on("click", function(e){
									//기본이벤트 제거
									e.preventDefault();

									jQuery("input[type='submit']").trigger("click");
								});
							});
							
						//]]>
						</script>