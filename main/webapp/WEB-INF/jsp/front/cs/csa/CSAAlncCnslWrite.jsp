<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<div class="termDiv">
							<p class="tit">개인정보 수집 및 활용 동의</p>
							<button class="check" type="button">
								<strong>동의합니다.</strong>
								<img alt="체크" src="/common/images/btn/check_bt.gif" />
							</button>
							
							<div class="termBox">
								<p class="tit">[대명스테이션 제휴문의를 위한 개인정보 수집, 이용동의서]<br /><br />주식회사 대명스테이션은 제휴문의와 관련하여 아래와 같이 개인정보를 수집, 이용하고자 합니다.</p>
								<br />
								<p class="tit">■ 개인정보 수집, 이용 내역</p>
								<p class="">
<%-- 
									- 수집/이용자 : 주식회사 대명스테이션<br /> 
									- 수집/이용 개인정보 항목 : 성명, 연락처(휴대전화번호), 이메일<br /> 
									- 수집/이용 목적 : 제휴문의 내용 상담<br />
									- 보유시간 : 수집/이용 동의일로 부터 30일 또는 수집/이용 목적 달성 시까지<br /><br /> 
									* 고객님은 위의 개인정보 수집,이용에 대한 동의를 거부할 수 있습니다. 그러나 동의를 거부할 경우 제휴문의에 제한을 받을 수 있습니다.
--%> 
									- 수집/이용 개인정보 항목 : 성명, 연락처(휴대전화번호), 이메일<br /> 
									- 수집/이용 목적 : 제휴문의 내용 상담<br />
									- 보유시간 : 소비자 불만 또는 분쟁처리에 관한 기록 보존을 위해 3년간 보유<br /><br /> 
									* 고객님은 위의 개인정보 수집,이용에 대한 동의를 거부할 수 있습니다. 그러나 동의를 거부할 경우 제휴문의에 제한을 받을 수 있습니다.									
								</p>
							</div>
						</div>

						<form id="frm" method="post" enctype="multipart/form-data" action="./insert.do">
							<input type="hidden" name="csrfPreventionSalt" value="${csrfPreventionSalt}" class="notRequired" />
							<input type="hidden" id="agreeYn" name="agreeYn" value="N" class="notRequired" />
							
							<div class="boardType2 mt15">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="20%" />
										<col width="80%" />
									</colgroup>
									<tbody>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">문의 구분</span></th>
											<td>
												<select name="inqryCd" title="문의 구분" class="inputType1">
													<option value="">문의 구분을 선택해 주세요</option>
													<c:forEach var="list" items="${rtnMap.alncInqryGb}" varStatus="status">
														<option value="${list.cd}">${list.cdNm}</option>
													</c:forEach>
												</select>
											</td>
										</tr>
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
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">이메일</span></th>
											<td>
												<input type="text" name="email" value="" title="이메일" class="inputType1 emailChk" style="" maxlength="50" />
											</td>
										</tr>
										</c:if>
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
										<tr>	
											<th scope="row"><span>첨부파일</span></th>
											<td>
												<div class="addFile">
													<input type="text" value="" title="첨부파일 확인" class="inputType1 notRequired" style="" />
													<input type="file" name="atchFile" value="" title="첨부파일 찾아보기" class="file notRequired" style="" />
													<a href="javascript:" class="btn333">찾아보기</a>&nbsp;&nbsp;&nbsp;
													<span class="red">10MB 이하로 등록해주시기 바랍니다</span>
												</div>
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
								<p class="red leftAdd">
									※ 제휴문의는 담당부서 검토 후 논의가 필요한 경우에만 담당자가 연락 드립니다.<br />
									<span style="margin-left:15px">최소 1~2주 소요될 수 있습니다.</span>
								</p>
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
								
								//파일찾기
								jQuery("input:file[name='atchFile']").live("change", function(){
									
									var fileName = jQuery(this).val();
									
									if(fileName)
									{
										var exts = "<fmt:message key='File.UploadMimeType' />";
										
										var fileExt = fileName.substr(fileName.lastIndexOf(".") + 1);

										if(exts.indexOf(fileExt.toLowerCase()) < 0)
										{
											alert("지원하지 않는 파일확장자입니다.");
											
											jQuery(this).after("<input type='file' name='atchFile' value='' title='첨부파일 찾아보기' class='file' style='' />");
											jQuery(this).remove();
										}
										else
										{
											jQuery(this).prev().val(jQuery(this).val());
										}
									}
								});
								
								//등록
								jQuery("#frm").validation({
									msg : {
							            confirm : "등록하시겠습니까?"
							        }, 
							        customfunc : function(obj, id) {
							        	if("agreeYn" == id)
							        	{
							        		if("Y" != jQuery(obj).val())
							        		{
							        			<%--alert("개인정보 취급방침에 동의하셔야 합니다.");--%>
							        			alert("개인정보 수집이용 동의를 하셔야 합니다.");
							        			jQuery(".termDiv .check").focus();
							        			return false;
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