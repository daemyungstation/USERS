<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<form id="frm" method="post" action="./insert.do">
							<input type="hidden" name="csrfPreventionSalt" value="${csrfPreventionSalt}" class="notRequired" />
							
							<div class="boardType2 mt15">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="20%" />
										<col width="30%" />
										<col width="20%" />
										<col width="30%" />
									</colgroup>
									<tbody>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">성명</span></th>
											<td>
												<input type="text" name="name" value="${loginMap.info.name}" title="성명" class="inputType4" style="" maxlength="250"/>
											</td>
											<th scope="row"><span class="essen" title="필수입력">연락처</span></th>
											<td>
												<input type="text" name="htel" value="${loginMap.info.hp}" title="연락처" class="inputType4 mobileChk" maxlength="13" />
											</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">메일주소</span></th>
											<td colspan="3">
												<input type="text" name="email" value="${loginMap.info.email}" title="메일주소" class="inputType4" style="" maxlength="250" />
											</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">문의 구분</span></th>
											<td colspan="3">
												<select name="inqryCd" title="문의 구분" class="inputType1">
													<option value="">문의 구분을 선택해 주세요</option>
													<c:forEach var="list" items="${rtnMap.custVoiceGb}" varStatus="status">
														<option value="${list.cd}">${list.cdNm}</option>
													</c:forEach>
												</select>
												<select name="inqryDtlCd" title="문의 상세구분" class="inputType1">
													<option value="">문의 상세구분을 선택해 주세요</option>
												</select>
											</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">제목</span></th>
											<td colspan="3">
												<input type="text" name="titl" value="" title="제목" class="inputType4" style="" maxlength="250" />
											</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">내용</span></th>
											<td colspan="3">
												<textarea name="cntn" title="내용"></textarea>
											</td>
										</tr>
									</tbody>
								</table>
	
								<p class="red leftAdd">※ 고객의 소리에 접수된 내용은 3영업일 이내에 메일 혹은 전화로 회신 드립니다.</p>
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
								//상세구분
								jQuery("select[name='inqryCd']").on("change", function(){
									jQuery("select[name='inqryDtlCd'] option").not(":first").remove();
									
									var inqryCd = jQuery(this).val();
									
									if(inqryCd)
									{
										jQuery.post("./voice-type.ajax",
											{
												"highrDtlCd" : inqryCd,
											},
											function(r)
											{
												var cdlist = r.rtnList;
												var htmlSrc = "";
												
												for(var i = 0; i < cdlist.length; i++)
												{
													htmlSrc += "<option value='" + cdlist[i].cd + "'>" + cdlist[i].cdNm + "</option>\n";
												}
												
												jQuery("select[name='inqryDtlCd']").append(htmlSrc);
											}
										).fail(function(){
											alert("잠시후 다시 시도 바랍니다.");
										});
									}
								});
								
								//등록
								jQuery("#frm").validation({
									msg : {
							            confirm : "등록하시겠습니까?"
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