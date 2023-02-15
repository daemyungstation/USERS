<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

					<div data-controller="LoginController">
						<form name="frm" method="post" action="./setTest2.do">
							<input type="hidden" name="vwUrl" value="${vwUrl}" class="notRequired" />
							<input type="hidden" name="idx" value="${idx}" class="notRequired" />
							
						<div class="loginDiv">
							<div class="inputArea">
								<div class="areaDiv">
									<div class="pBox">
										<div class="inputDiv">
											<c:set var="test"  value="${rtnMap.test}"/>
											<input type="hidden" id="" name="gubun" value= "" >
											<input type="text" id="" name="name" value= "${test}" style="width:50px"> 님의 선택!!
										</div>
										
										<a href="" id="btnChkReqn" class="btnRedTest loginBtTest">test</a>
										<a href="" id="submit2" class="btnRedTest2 loginBtTest">&nbsp;</a>
										
										<input type="submit" style="text-indent:-100px; padding:0; border:0; " />

										<!-- 
										<a href="" id="submit" class="btnRed loginBt">로그인</a>
										<input type="submit" style="text-indent:-100px; padding:0; border:0; " />
										 -->
									</div>
									<!--
									<div class="srchArea">
										<p class="txt">아이디, 비밀번호를 잊으셨나요?</p>
										<div class="bt">
											<a href="/member/findid/index.do" class="whtBt">아이디 찾기</a>
											<a href="/member/findpass/index.do" class="whtBt">비밀번호 찾기</a>
										</div>
									</div>
									 -->
								</div>
							</div>

							<div class="joinArea">
								<div class="areaDiv">
									<p class="txt"><strong><font color='red'>진행자의 설명에 따라주시기 바랍니다.</font></strong></p>
									<!-- <a href="/member/join/agree.do" class="whtBt">회원가입</a> -->
								</div>
							</div>
						</div>
						</form>
					</div>
					
						<script type="text/javascript">
						//<![CDATA[
						           
						    jQuery(document).ready(function(){
								jQuery("#btnChkReqn").on("click", function(){
									if(confirm("접수하시겠습니까?"))
									{
										jQuery.post("./insert.ajax",
											{
												"name" : "임동진"
											},
											function(r)
											{
												var status = r.status;
												alert(status);
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
							});
							
						//]]>
						</script>