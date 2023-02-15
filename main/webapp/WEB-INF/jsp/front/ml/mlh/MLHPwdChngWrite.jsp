<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<!-- form id="frm" method="post" action="./update.do" -->
						<form id="frm" method="post" action="./update_sso.do">
							<input type="hidden" name="csrfPreventionSalt" value="${csrfPreventionSalt}" class="notRequired" />
						
							<div class="boardType2">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="20%" />
										<col width="80%" />
									</colgroup>
									<tbody>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">기존 비밀번호</span></th>
											<td>
												<input type="password" name="exisPwd" value="" title="기존 비밀번호" class="inputType1" maxlength="20" />&nbsp;&nbsp;&nbsp;
												<p class="red mt5">영문 대/소문자, 숫자, 특수문자중 두가지 혼합시 10자 이상, 세가지 혼합시 8자 이상으로 사용 가능합니다.</p>
											</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">새 비밀번호</span></th>
											<td>
												<input type="password" name="newPwd" value="" title="새 비밀번호" class="inputType1 passChk" maxlength="20" />&nbsp;&nbsp;&nbsp;
												<p class="red mt5">생년월일, 전화번호 등 개인정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게알아낼 수 있으니 사용을 자제해 주세요.</p>
											</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">새 비밀번호 확인</span></th>
											<td>
												<input type="password" name="newPwdConfirm" value="" title="새 비밀번호 확인" class="inputType1 passEqual" maxlength="20" />&nbsp;&nbsp;&nbsp;
												<p class="red mt5">이전에 사용했던 비밀번호나 타 사이트와는 다른 비밀번호를 사용하고, 비밀번호는 주기적으로 변경해주세요.</p>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
		
							<p class="mt30 taC">
								<a href="javascript:" id="submitLink" class="btnRed wide">비밀번호 변경</a>
								<input type="submit" value="전송" style="display:none;" />
							</p>
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
							jQuery(document).ready(function(){
								//유효성 체크
/*
								jQuery("#frm").validation({
									msg : {
							            confirm : "변경하시겠습니까?"
							        }
								});
*/								
								jQuery("#submitLink").on("click", function(e){
									//기본이벤트 제거
									e.preventDefault();

									jQuery("input[type='submit']").trigger("click");
								});
							});
							
						//]]>
						</script>