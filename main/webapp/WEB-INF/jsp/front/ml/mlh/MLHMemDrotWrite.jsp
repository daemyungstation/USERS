<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<!-- form id="frm" method="post" action="./update.do" -->
						<form id="frm" method="post" action="./update_sso.do">
							<input type="hidden" name="csrfPreventionSalt" value="${csrfPreventionSalt}" class="notRequired" />
							
							<p class="titTxt mt60">회원탈퇴 안내사항</p>
	
							<div class="dotBox3 mt15">
								<p class="tit">회원탈퇴 신청에 앞서 아래의 사항을 반드시 확인하시기 바랍니다.</p>
								<dl>
									<dd>회원 탈퇴 후, 탈퇴 아이디는 본인 및 타인 모두 재사용이 불가합니다.</dd>
									<dd>이는 가입과 탈퇴의 반복을 막고, 선량한 이용자들에게 피해를 끼치는 행위를 방지하기 위한 조치이오니 양해 바랍니다.</dd>
									<dt>[회원 탈퇴 후 삭제 내역 ]</dt>
									<dd>회원 가입 시 입력한 모든 회원정보는 삭제됩니다.</dd>
									<dt>[회원 탈퇴 후 유지 내역 ]</dt>
									<dd>웹회원 탈퇴를 하더라도 상품회원과 무관합니다.</dd>
									<dd>웹회원 탈퇴 시 칭찬합시다 / 이벤트 댓글은 자동 삭제 되지 않습니다.  <span class="red">※게시물의 삭제를 원하는 경우 반드시 삭제한 후, 탈퇴 신청을 하시기 바랍니다.</span></dd><!-- 2016-03-30 수정 -->
									<dd>탈퇴전 사용했던 아이디는 저장이 되며 재사용은 할 수 없습니다.</dd>
								</dl>
							</div>
							<p class="mt15 taC">
								<input type="checkbox" id="check1" name="drotGuide" value="Y" title="회원탈퇴 안내사항" class="checkbox" />
								<label for="check1">위 내용을 확인하였습니다.</label>
							</p>
	
							<p class="titTxt mt60">회원탈퇴 정보확인</p>
							<div class="boardType2 mt15">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="20%" />
										<col width="80%" />
									</colgroup>
									<tbody>
										<tr>	
											<th scope="row"><span>아이디</span></th>
											<td>${sessionScope.userLgnMap.integrationId}</td>
										</tr>
										<tr>	
											<th scope="row"><span>이름</span></th>
											<td>${sessionScope.userLgnMap.name}</td>
										</tr>
										<tr>	
											<th scope="row"><span>이메일</span></th>
											<td>${sessionScope.userLgnMap.email}</td>
										</tr>
									</tbody>
								</table>
							</div>
	
							<p class="titTxt mt55">탈퇴하시는 이유가 무엇인가요?</p>
							<div class="boardType2 mt15">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="100%" />
									</colgroup>
									<tbody>
										<tr>	
											<th scope="row" class="taC">회원님께서 탈퇴하는 이유를 알려주시면 의견을 반영하여 보다 나은 서비스를 제공하기 위해 노력하겠습니다.</th>
										</tr>
	
										<tr>	
											<td>
												<dl class="selectPack">
													<dd>
														<input type="radio" id="withdraw1" name="drotRsn" value="개인정보 유출 우려" title="탈퇴하시는 이유" class="checkbox" />
														<label for="withdraw1">개인정보 유출 우려</label>
													</dd>
												</dl>
	
												<dl class="selectPack">
													<dd>
														<input type="radio" id="withdraw2" name="drotRsn" value="더 이상 이용하지 않음" title="탈퇴하시는 이유" class="checkbox" />
														<label for="withdraw2">더 이상 이용하지 않음</label>
													</dd>
												</dl>
	
												<dl class="selectPack">
													<dd>
														<input type="radio" id="withdraw3" name="drotRsn" value="사이트 이용에 불편함" title="탈퇴하시는 이유" class="checkbox" />
														<label for="withdraw3">사이트 이용에 불편함</label>
													</dd>
												</dl>
	
												<dl class="selectPack end">
													<dd>
														<input type="radio" id="withdraw4" name="drotRsn" value="특별한 이유는 없음" title="탈퇴하시는 이유" class="checkbox" />
														<label for="withdraw4">특별한 이유는 없음</label>
													</dd>
												</dl>
											</td>
										</tr>
	
										<tr>	
											<td class="">
												<input type="radio" id="withdraw5" name="drotRsn" value="기타" title="탈퇴하시는 이유" class="checkbox" />
												<label for="withdraw5" style="margin-right:3%">기타</label>
												<input type="text" id="drotRsnEtc" name="drotRsnEtc" value="" title="기타" class="notRequired" style="width:90%;" maxlength="250" readonly="readonly" />
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<div class="taR mt30">
								<a href="javascript:" id="submitLink" class="btnRed">회원탈퇴</a>
								<a href="javascript:" id="btnCancel" class="btnRed2">취소</a>
								<input type="submit" value="전송" style="display:none;" />
							</div>
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
							
							jQuery(document).ready(function(){
								//유효성 체크
								jQuery("#frm").validation({
									msg : {
										empty : {
							                names : {
							                	drotGuide : "회원탈퇴 안내사항을 확인해주세요.",
							                	drotRsn : "탈퇴하시는 이유를 선택해주세요."
							                }
							            },
							            confirm : "탈퇴하시겠습니까?"
							        }, 
							        customfunc : function(obj, id) {
										if("withdraw5" == id)
										{
											if(jQuery(obj).is(":checked"))
											{
												if(!jQuery("#drotRsnEtc").val())
												{
													alert("기타을(를) 입력해주세요.");
													jQuery("#drotRsnEtc").focus();
													return false;
												}
											}
										}
							        },
							        loadingbar : {
										use : true
									}
								});
								
								jQuery("#submitLink").on("click", function(e){
									//기본이벤트 제거
									e.preventDefault();

									jQuery("input[type='submit']").trigger("click");
								});
								
								//탈퇴이유 이벤트
								jQuery("input[name='drotRsn']").on("change", function(){
									if("기타" == jQuery(this).val())
									{
										jQuery("#drotRsnEtc").prop("readonly", false);
									}
									else
									{
										jQuery("#drotRsnEtc").prop("readonly", true);
									}
								});
								
								//취소
								jQuery("#btnCancel").on("click", function(){
									if(confirm("취소할 경우 작성한 글은 모두 삭제됩니다.\n취소하시겠습니까?"))
									{
										window.location.reload();
									}
								});
							});
							
						//]]>
						</script>