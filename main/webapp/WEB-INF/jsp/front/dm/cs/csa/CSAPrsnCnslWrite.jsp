<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<form id="frm" method="post" action="./insert.do">
							<input type="hidden" name="csrfPreventionSalt" value="${csrfPreventionSalt}" class="notRequired" />
							
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
													<c:forEach var="list" items="${rtnMap.prsnInqryGb}" varStatus="status">
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
									</tbody>
								</table>
	
								<p class="red leftAdd">1:1 상담하기로 등록된 내용은 담당자가 확인 후 영업일기준 3일내로 답변드리겠습니다.</p>
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
										jQuery.post("./inqry-type.ajax",
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