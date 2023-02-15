<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/WEB-INF/jsp/include/el.jspf"%>
						
						<c:set var="boardInfo" value="${rtnMap.boardInfo}" />
						
						<form id="frm" method="post" enctype="multipart/form-data" action="${egov:decode(boardInfo, null, './insert.do', './update.do')}">
							<input type="hidden" name="idx" value="" class="notRequired"/>
							
							<div class="boardType2 mt15">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="20%" />
										<col width="80%" />
									</colgroup>
									<tbody>
										<c:if test="${mstInfo.categoryYn eq 'Y'}">
										<tr>
											<th scope="row"><span class="essen" title="필수입력">구분</span></th>
											<td>
												<select name="categoryId" title="구분">
													<option value="">선택</option>
													<c:forEach var="ctgrList" items="${ctgrList}">
														<option value="${ctgrList.menuSeq}">${ctgrList.menuNm}</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										</c:if>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">제목</span></th>
											<td>
												<input type="text" name="title" value="${boardInfo.title}" title="제목" class="inputType4" maxlength="250" />
											</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">내용</span></th>
											<td>
												<textarea name="contents" title="내용">${boardInfo.contents}</textarea>
											</td>
										</tr>
										<c:if test="${mstInfo.openYn eq 'Y'}">
										<tr>	
											<th scope="row"><span>공개여부</span></th>
											<td>
												<c:set var="openYn" value="${egov:nvl(boardInfo.openYn, 'Y')}" />
												<span class="list">
													<input type="radio" class="checkbox" title="공개여부" value="Y" id="open1" name="openYn" <c:if test="${openYn eq 'Y'}">checked</c:if> />
													<label for="open1">공개</label>
												</span>
												<span class="list">
													<input type="radio" class="checkbox" title="공개여부" value="N" id="open2" name="openYn" <c:if test="${openYn eq 'N'}">checked</c:if> />
													<label for="open2">비공개</label>
												</span>
											</td>
										</tr>
										</c:if>
										<tr>	
											<th scope="row"><span>첨부파일</span></th>
											<td>
												<div class="addFile">
													<input type="text" id="atchFile" value="" title="첨부파일 확인" class="inputType1 notRequired" readonly />
													<input type="file" name="atchFile" id="atchFile1" value="" title="첨부파일 찾아보기" class="file notRequired"/>
													<a href="javascript:" class="btn333">찾아보기</a>&nbsp;&nbsp;&nbsp;
													<span class="red">${egov:nvl(mstInfo.fileSize, 0)}MB 이하로 등록해주시기 바랍니다</span>
												</div>
											</td>
										</tr>
										<c:if test="${fn:length(rtnMap.atchFileList) > 0}">
										<tr>	
											<th scope="row"><span>원본 첨부파일</span></th>
											<td>
												<c:forEach var="filelist" items="${rtnMap.atchFileList}" varStatus="status">
							      					<input type="checkbox" name="delFileSeq" value="${filelist.fileSeq}" class="notRequired" style="margin-right:3px; <c:if test="${status.first}">margin-left:5px</c:if>" />
							      					<a href="/cmm/fms/FileDown.do?fileId=${filelist.atchFileId}&fileSn=${filelist.fileSeq}" style="<c:if test="${!status.last}">margin-right:15px</c:if>">${filelist.realFileNm}</a>
												</c:forEach>
												<input type="hidden" name="atchFileId" value="${boardInfo.atchFileId}" />
											</td>
										</tr>
										</c:if>
									</tbody>
								</table>
								
								<c:if test="${mstInfo.communityId eq '5'}">
									<p class="red leftAdd leftAdd2">※ 해당 게시글은 등록 이후 관리자의 승인 과정을 거쳐 게시판에 공개됨을 알려드립니다.<br/>목적에 맞지 않거나 관련 없는 특정 주장, 정보 등을 포함하는 경우 게재되지 않을 수 있습니다.</p>
								</c:if>
							</div>
	
							<p class="mt20 taR">
								<a href="javascript:" id="submitLink" class="btnRed">
									<c:choose>
										<c:when test="${empty boardInfo}">
											등록
										</c:when>
										<c:otherwise>
											수정
										</c:otherwise>
									</c:choose>
								</a>
								<a href="javascript:" id="btnCancel" class="btnRed2">취소</a>
								<input type="submit" value="전송" style="display:none;" />
							</p>
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
						           
							jQuery(document).ready(function(){
								
								//파일찾기
								jQuery("input:file[name='atchFile']").live("change", function(){
									var fileName = jQuery(this).val();

									var files = document.getElementById('atchFile1').files[0];
									if(files.size >  5 * (1024 * 1024)){
										alert("이미지파일을 최대 5MB까지 첨부가능합니다.")
										return;	
									}
								    
									
 									if(fileName);
									{
										var exts = "<fmt:message key='File.UploadMimeType' />";

										fileExt = fileName.substr(fileName.lastIndexOf(".") + 1);
										
 										var len = fileName.lastIndexOf("\\");
										var last = fileName.lastIndexOf(".");
										var fileNames = fileName.substring(last, len+1);
										
										if(checkSpecial(fileNames) < 0){
											alert("특수문자는 사용 하실 수 없습니다.");

											$("#atchFile").val('');
											return;
										}
										else
										{
											jQuery(this).prev().val(jQuery(this).val());
										}

										if($.inArray(fileExt.toLowerCase(), ['bmp', 'dib', 'jpg', 'jpeg', 'jpe', 'gif', 'png', 'tif', 'tiff']) == -1)
										{
											alert("지원하지 않는 파일확장자입니다.");
											$("#atchFile").val('');
											return;
										}
										else
										{
											jQuery(this).prev().val(jQuery(this).val());
										}
									}
								});
								
								//등록
								jQuery("#frm").validation();
								
								jQuery("#submitLink").on("click", function(e){
									//기본이벤트 제거
									e.preventDefault();
									
									<c:choose>
										<c:when test="${empty boardInfo}">
											Feel.Validation.confirm = "등록하시겠습니까?"; 
										</c:when>
										<c:otherwise>
											Feel.Validation.confirm = "수정하시겠습니까?";  
										</c:otherwise>
									</c:choose>
									
									jQuery("input[name='idx']").val("${boardInfo.idx}");
								    
								    jQuery("input[type='submit']").trigger("click");
								});
								
								//취소
								jQuery("#btnCancel").on("click", function(){
									<c:choose>
										<c:when test="${empty boardInfo}">
											if(confirm("취소할 경우 작성한 글은 모두 삭제됩니다.\n취소하시겠습니까?"))
											{
												window.location.reload();
											}
										</c:when>
										<c:otherwise>
											var f = document.frm;	
											
											f.action = "./view.do";
											f.idx.value = "${boardInfo.idx}";
											f.submit();
										</c:otherwise>
									</c:choose>
								});
							});
						
							function checkSpecial(str){
								var special_pattern = /[~!@\#$%^&*\()\-=+']/gi;
								if(special_pattern.test(str))
								{
									return -1;
								} else {
									return 0;
								}
							}
						//]]>
						</script>