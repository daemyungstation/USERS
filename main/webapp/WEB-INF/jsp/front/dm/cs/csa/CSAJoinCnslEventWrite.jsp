<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

						<div class="termDiv event171001">
							<p class="tit">개인정보 활용 동의</p>
							<button id="171001_check1" class="check" type="button">
								<strong>동의합니다.</strong>
								<img alt="체크" src="/common/images/btn/check_bt.gif" />
							</button>
							<div class="termBox ">
								<p class="type1">[대명라이프웨이 상품 가입을 위한 개인정보 수집, 이용 및 위탁동의서]<br><br>주식회사 대명스테이션은 대명라이프웨이 상품과 관련하여 아래와 같이 개인정보를 수집, 이용 및 위탁하고자 합니다.</p>
								<br>
								<p class="type1">■ 개인정보 수집, 이용 내역</p>
								<p> 
									- 수집/이용자 : 주식회사 대명스테이션<br> 
									- 수집/이용 개인정보 항목 : 성명, 연락처(휴대전화번호), 배송지 주소<br> 
									- 수집/이용 목적 : 대명라이프웨이 스마트라이프 상품 소개, 계약상담 및 계약체결<br>
									- 보유시간 : 수집/이용 동의일로 부터 30일 또는 수집/이용 목적 달성 시까지<br><br> 
									* 고객님은 위의 개인정보 수집,이용에 대한 동의를 거부할 수 있습니다. 그러나 동의를 거부할 경우 상품 가입 등 서비스 제공에 제한을 받을 수 있습니다.
								</p>
							</div>
						</div>
						<div class="termDiv event171001">
							<p class="tit">개인 정보의 제3자 제공 동의</p>
							<button id="171001_check2" class="check" type="button">
								<strong>동의합니다.</strong>
								<img alt="체크" src="/common/images/btn/check_bt.gif">
							</button>

							<div class="termBox ">
								<p class="type1">■ 개인 정보의 제3자 제공 동의</p>
								<p> 
									- 제공받는자 : 주식회사 대명레저산업<br> 
									- 제공하는 개인정보 항목 : 성명, 연락처(휴대전화번호), 배송지 주소<br> 
									- 제공받는 자의 개인정보 이용 목적 : 프로모션 운영에 따른 고객 개인 정보 제공<br>
									- 보유시간 : 처리 종료 시
								</p>
							</div>
						</div>
						<div class="termDiv event171001">
							<p class="tit">개인 정보의 처리위탁 동의</p>
							<button id="171001_check3" class="check" type="button">
								<strong>동의합니다.</strong>
								<img alt="체크" src="/common/images/btn/check_bt.gif">
							</button>
							<div class="termBox ">
								<p> 
									- 위탁을 받을자(수탁업체) : 주식회사 태서식품<br> 
									- 위탁하는 업무의 내용 : 익을:숙 포기김치의 제작 및 배송<br> 
									- 연락처 : 033)533-9622<br>
									- 제공하는 개인정보 항목 : 성명, 연락처(휴대전화번호), 주소
								</p>
							</div>
						</div>
						<form id="frm" method="post" action="./insertEventCnsl.do">
							<input type="hidden" name="csrfPreventionSalt" value="${csrfPreventionSalt}" class="notRequired" />
							<input type="hidden" id="agreeYn" name="agreeYn" value="N" class="notRequired" />
							<input type="hidden" id="inqryCd" name="inqryCd" value="04" class="notRequired" />
							<input type="hidden" id="telAbleStrtTime" name="telAbleStrtTime" value="00" class="notRequired" />
							<input type="hidden" id="telAbleEndTime" name="telAbleEndTime" value="00" class="notRequired" />
							
							<div class="boardType2 mt15">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="20%" />
										<col width="80%" />
									</colgroup>
									<tbody>
										<c:if test="${empty sessionScope.userLgnMap}">
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">이름</span></th>
											<td>
												<input type="text" name="name" value="" title="이름" class="inputType1" style="" maxlength="25" />
											</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">연락처</span></th>
											<td>
												<input type="text" name="ctel" value="" title="연락처" class="inputType1 numberChk" style="" maxlength="12" />&nbsp;&nbsp;&nbsp;
												<span class="red">번호만 기입해주세요.</span>
											</td>
										</tr>
										<!-- 이메일 주석 처리
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">이메일</span></th>
											<td>
												<input type="text" name="email" value="" title="이메일" class="inputType1 emailChk" style="" maxlength="50" />
											</td>
										</tr>
										-->
										</c:if>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">배송지 주소</span></th>
											<td>
												<input type="text" name="address" value="" title="주소" class="inputType1" style="" maxlength="100" />
											</td>
										</tr>

										<tr>	
											<th scope="row"><span class="essen" title="필수입력">제목</span></th>
											<td>
												<input type="text" name="titl" value="" title="제목" class="inputType4" style="" maxlength="250" />
											</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">내용</span></th>
											<td>
												<textarea name="cntn" title="내용"></textarea>
											</td>
										</tr>
										<c:if test="${empty sessionScope.userLgnMap}">
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">보안문자</span></th>
											<td>
												<img id="captchaImg" name="captchaImg" src="/captcha" alt="보안문자 이미지" width="65px" height="32px" />
												<input type="text" name="captchaText" value="" title="보안문자" class="inputType5" style="" maxlength="5" />
											</td>
										</tr>
										</c:if>
									</tbody>
								</table>
								<!--<p class="red leftAdd">※ 대명라이프웨이 컨택센터(1588-8511)에서 접수 후 3영업일 이내 연락 드립니다.</p>-->
								<p class="red leftAdd">※ 스마트라이프 가입 조건(1회차 출금 고객에 한함)</p>
							</div>

							<p class="mt20 taR">
								<a href="javascript:" id="submitLink" class="btnRed">등록</a>
								<a href="javascript:" id="btnCancel" class="btnRed2">취소</a>
								<input type="submit" value="전송" style="display:none;" />
							</p>
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
						           
							jQuery(document).ready(function(){
								//동의 클릭
								jQuery(".termDiv .check").on("click", function(){
									if(jQuery(this).find("img").attr("src").indexOf("_on.gif") > -1)
									{
										jQuery(this).find("img").attr("src", jQuery(this).find("img").attr("src").replace("_on.gif", ".gif"));
										jQuery("input[name='agreeYn']").val("N");
									}
									else
									{
										jQuery(this).find("img").attr("src", jQuery(this).find("img").attr("src").replace(".gif", "_on.gif"));
										jQuery("input[name='agreeYn']").val("Y");
									}
								});
								
								jQuery(".termDiv .check").each(function(){
									if(jQuery("input[name='agreeYn']").val() == "Y")
									{
										jQuery(this).find("img").attr("src", jQuery(this).find("img").attr("src").replace(".gif", "_on.gif"));
									}
								});

								$(".termDiv .check").click(function(){
									$(this).toggleClass("on");
								});
								
								//등록
								jQuery("#frm").validation({
									msg : {
							            confirm : "등록하시겠습니까?"
							        },
							        customfunc : function(obj, id) {
							        	//동의여부
							        	/*if("agreeYn" == id)
							        	{
							        		if("Y" != jQuery(obj).val())
							        		{
							        			alert("개인정보 수집 및 활용 동의에 동의하셔야 합니다.");
							        			jQuery(".termDiv .check").focus();
							        			return false;
							        		}
							        	}*/
										if(!$(".termDiv #171001_check1").hasClass("on")) {
											alert("개인정보 활용 동의에 동의하셔야 합니다.");
											jQuery(".termDiv #171001_check1").focus();
											return false;
										}else if(!$(".termDiv #171001_check2").hasClass("on")) {
											alert("개인 정보의 제3자 제공 동의에 동의하셔야 합니다.");
											jQuery(".termDiv #171001_check2").focus();
											return false;
										}else if(!$(".termDiv #171001_check3").hasClass("on")) {
											alert("개인 정보의 처리위탁 동의에 동의하셔야 합니다.");
											jQuery(".termDiv #171001_check3").focus();
											return false;
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