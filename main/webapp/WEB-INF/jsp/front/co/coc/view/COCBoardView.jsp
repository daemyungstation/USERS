<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/WEB-INF/jsp/include/el.jspf"%>
						
						<c:set var="boardInfo" value="${rtnMap.boardInfo}" />
						
						<form name="frm" method="post" action="">
							<input type="hidden" name="idx" value="" />
							
							<div class="prView">
								<div class="head">
									<p class="tit">${boardInfo.title}</p>
									<div class="txt">
										<c:choose>
											<c:when test="${mstInfo.periodYn eq 'Y'}">
												<span>
													<c:choose>
														<c:when test="${boardInfo.odtmYn eq 'Y'}">
															상시
														</c:when>
														<c:otherwise>
															${egov:convertDate(boardInfo.startDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')} 
															~ 
															${egov:convertDate(boardInfo.endDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')}
														</c:otherwise>
													</c:choose>
												</span>
											</c:when>
											<c:otherwise>
													<span>${boardInfo.regname}</span>
													<span class="bar">|</span>
												<span>${egov:convertDate(boardInfo.regdate,'yyyy-MM-dd HH:mm:ss','yyyy.MM.dd','')}</span>
												<span class="bar">|</span>
												<span>${boardInfo.readCnt}</span>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
	
								<div class="view">
									<c:if test="${mstInfo.communityType eq 'MOVIE'}">
										<style type="text/css"> 
											.embed-container { 
												position: relative; 
												padding-bottom: 56.25%; 
												height: 0; 
												overflow: hidden; 
												max-width:100%;
												margin-bottom:20px; 
											}
											.embed-container embed, 
											.embed-container object, 
											.embed-container embed { 
												position: absolute; 
												top: 0; 
												left: 0; 
												width: 100%; 
												height: 100%; 
											}
										</style>
										<div class="embed-container">
											<c:set var="videoUrl" value="${fn:replace(boardInfo.movieUrl, 'https://youtu.be/', '')}" /> 
											<object data="https://www.youtube.com/embed/${videoUrl}?re=0&fs=0" border="0"></object>
										</div>
										<div class="mvScript mt25">
											${boardInfo.movieContents} 
										</div>
									</c:if>
									<c:if test="${fn:length(rtnMap.contentsFileList) gt 0}">
										<c:forEach var="filelist" items="${rtnMap.contentsFileList}" varStatus="status">
											<img src="/cmm/fms/getImage.do?fileId=${filelist.atchFileId}&fileSn=${filelist.fileSeq}" style="max-width:910px;" alt="${filelist.fileCn}" />
										</c:forEach>
									</c:if>
									${boardInfo.contents}
								</div>
								
								<c:if test="${fn:length(rtnMap.atchFileList) gt 0}">
									<div class="addFile">
										<c:forEach var="filelist" items="${rtnMap.atchFileList}" varStatus="status">
											<a href="/cmm/fms/FileDown.do?fileId=${filelist.atchFileId}&fileSn=${filelist.fileSeq}">${filelist.realFileNm}</a>
										</c:forEach>
									</div>
								</c:if>
								
								<div class="snsDiv">
									<a class="blog" href="javascript:" title="네이버블로그로 가져가기"><img src="/common/images/btn/sns_bt4.gif" alt="네이버블로그"></a>
									<a class="kakao" href="javascript:" title="카카오톡으로 가져가기" style="display:none" data-idx='${boardInfo.thumnailFileId}'><img src="/common/images/btn/sns_bt5.gif" alt="카카오톡"></a>	
									<a class="sns_facebook" href="javascript:" title="페이스북"><img src="/common/images/btn/sns_bt1.gif" alt="페이스북"></a>
									<a class="sns_twitter" href="javascript:" title="트위터"><img src="/common/images/btn/sns_bt2.gif" alt="트위터"></a>
									<a class="sns_google" href="javascript:" title="구글플러스"><img src="/common/images/btn/sns_bt3.gif" alt="구글플러스"></a>
								</div>
								
								<c:if test="${sessionScope.userLgnMap.id eq boardInfo.regid}">
									<div class="leftBt">
										<a href="javascript:updateBoard('${boardInfo.idx}')" class="btnRed">수정</a>
										<a href="javascript:deleteBoard('${boardInfo.idx}')" class="whtBt2">삭제</a>
									</div>
								</c:if>
							</div>
	
							<p class="mt20 taR"><a href="./list.do" class="whtBt2">목록</a></p>
							
							<c:if test="${mstInfo.commentYn eq 'Y'}">
								<div id="replDiv">
							
								</div>
							</c:if>
							
							<div class="boardType3 mt40">
								<div class="prvDiv">
									<p class="tit"><span>이전글</span></p>
									<c:choose>
										<c:when test="${not empty boardInfo.prevIdx}">
											<p class="txt">
												<a href="./view.do?idx=${boardInfo.prevIdx}">${egov:tldCutString(boardInfo.prevTitle, '...', mstInfo.listTitleCnt)}</a>
											</p>
											<p class="date">
												${egov:convertDate(boardInfo.prevRegdate, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')}
											</p>
										</c:when>
										<c:otherwise>
											<p class="txt"><a href="javascript:">이전글이 없습니다.</a></p>
											<p class="date"></p>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="nxtDiv">
									<p class="tit"><span>다음글</span></p>
									<c:choose>
										<c:when test="${not empty boardInfo.nextIdx}">
											<p class="txt">
												<a href="./view.do?idx=${boardInfo.nextIdx}">${egov:tldCutString(boardInfo.nextTitle, '...', mstInfo.listTitleCnt)}</a>
											</p>
											<p class="date">
												${egov:convertDate(boardInfo.nextRegdate, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')}
											</p>
										</c:when>
										<c:otherwise>
											<p class="txt"><a href="javascript:">다음글이 없습니다.</a></p>
											<p class="date"></p>
										</c:otherwise>
									</c:choose>
								</div>
							</div>	
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
						        
						    <c:if test="${sessionScope.userLgnMap.id eq boardInfo.regid}">
								function deleteBoard(idx)
								{
									if(confirm("삭제 하시겠습니까?"))
									{		
										var f = document.frm;
										
										f.action = "./delete.do";
										f.idx.value = "${boardInfo.idx}";
										f.submit();
									}
								}
								
								function updateBoard(idx)
								{
									var f = document.frm;
									
									f.action = "./write.do";
									f.idx.value = "${boardInfo.idx}";
									f.submit();
								}
							</c:if>
						           
							<c:if test="${mstInfo.commentYn eq 'Y'}">
								jQuery(document).ready(function(){
									getCommentList();
								});
								
								//댓글 리스트 가져오기			
								function getCommentList(commentpage)
								{
									jQuery.ajax({
										url : "./commentlist.ajax",
										data : {
											"pageIndex" : arguments.length > 0 ? arguments[0] : 1,
											"idx" : "${boardInfo.idx}",
											"replyYn" : "${boardInfo.replyYn}"
										},
										success : function(r){
											jQuery("#replDiv").html(r);
										},
										error : function(){
											alert("잠시후 다시 시도 바랍니다.");
										},
										cache: false,
										async : false
									});
									/*
									jQuery.get("./commentlist.ajax",
										{
											"pageIndex" : arguments.length > 0 ? arguments[0] : 1,
											"idx" : "${boardInfo.idx}"
										},
										function(r)
										{
											//jQuery("#replDiv").html("");
											jQuery("#replDiv").html(r);
										},
										"text"
									).fail(function(){
										alert("잠시후 다시 시도 바랍니다.");
									});
									*/
								}
								
								//댓글 등록
								function insertBoardComment(type)
								{
									<c:choose>
										<c:when test="${empty sessionScope.userLgnMap}">
											alert("로그인 이후에 작성이 가능합니다.");
											location.href = "/member/login/Login.do?vwUrl=" + location.pathname + location.search;
											return;
										</c:when>
										<c:otherwise>
											if(type == 'button'){
												var comment = jQuery("textarea[name='comment']").val();
												
												if(!comment )
												{
													alert("* 내용을 입력해주세요.");
													jQuery("textarea[name='comment']").focus();
													return;
												}
												
												if(confirm("댓글을 등록하시겠습니까?"))
												{
													jQuery.post("./insertComment.ajax",
														{
															"idx" : "${boardInfo.idx}",
															"contents" : comment
														},
														function(r)
														{			
															var status = r.status;
															
															if(status == "Y")
															{
																getCommentList();
															}
														}
													).fail(function(){
														alert("잠시후 다시 시도 바랍니다.");
													});
												}
											}
											
										</c:otherwise>
									</c:choose>
								}
								
								<c:if test="${not empty sessionScope.userLgnMap}">
									//댓글 수정폼 set
									function setUpdateForm(obj)
									{
										if(jQuery(obj).next().text() == "취소")
										{
											setReplyForm(jQuery(obj).next());
										}
	
										var objTxt = jQuery(obj).text();
										
										if(objTxt == "수정")
										{
											jQuery(obj).text("취소");
											
											jQuery(obj).parent().prev().find("p.txt").hide();
											jQuery(obj).parent().prev().find(".cntnType").show();
										}
										else
										{
											jQuery(obj).text("수정");
											
											jQuery(obj).parent().prev().find("p.txt").show();
											jQuery(obj).parent().prev().find(".cntnType").hide();
										}
										
										jQuery(obj).parent().prev().find(".cntnType textarea").val(jQuery(obj).parent().prev().find(".txt").children("#contents").text());
									}
									
									//댓글 수정
									function updateBoardComment(cidx, obj)
									{
										var comment = jQuery(obj).prev("textarea").val();
	
										if(!comment)
										{
											alert("* 내용을 입력해주세요.");
											jQuery(obj).prev("textarea").focus();
											return;
										}
	
										if(confirm("댓글을 수정하시겠습니까?"))
										{
											jQuery.post("./updateComment.ajax",
												{
													"idx" : "${boardInfo.idx}",
													"cidx" : cidx,
													"contents" : comment
												},
												function(r)
												{
													var status = r.status;
													
													if(status == "Y")
													{
														getCommentList(jQuery("input[name='pageIndex']").val());
													}
												}
											).fail(function(){
												alert("잠시후 다시 시도 바랍니다.");
											});
										}
									}
									
									//답급 입력폼 set
									function setReplyForm(obj, reDepth)
									{
										if(jQuery(obj).prev().text() == "취소")
										{
											setUpdateForm(jQuery(obj).prev());
										}
										
										var objTxt = jQuery(obj).text();
										
										if(objTxt == "답글")
										{
											jQuery(obj).text("취소");
								
											jQuery(obj).parent().prev().find(".replyType").show();
										}
										else
										{
											jQuery(obj).text("답글");
											
											jQuery(obj).parent().prev().find(".replyType").hide();
										}
										
										jQuery(obj).parent().prev().find(".replyType textarea").val("");
									}
									
									//답글 입력
									function insertBoardCommentReply(cidx, groupId, reDepth, obj)
									{
										var comment = jQuery(obj).prev("textarea").val();
										
										if(!comment)
										{
											alert("* 내용을 입력해주세요.");
											jQuery(obj).prev("textarea").focus();
											return;
										}
										
										if(confirm("답글을 등록하시겠습니까?"))
										{
											jQuery.post("./insertComment.ajax",
												{
													"idx" : "${boardInfo.idx}",
													"groupId" : groupId,
													"reDepth" : parseInt(reDepth) + 1,
													"contents" : comment
												},
												function(r)
												{
													var status = r.status;
													
													if(status == "Y")
													{
														getCommentList(jQuery("input[name='pageIndex']").val());
													}
												}
											).fail(function(){
												alert("잠시후 다시 시도 바랍니다.");
											});
										}
									}
									
									//댓글 삭제
									function deleteBoardComment(cidx)
									{
										if(confirm("댓글을 삭제하시겠습니까?"))
										{				
											jQuery.post("./deleteComment.ajax",
												{
													"idx" : "${boardInfo.idx}",
													"cidx" : cidx
												},
												function(r)
												{
													var status = r.status;
													
													if(status == "Y")
													{
														getCommentList(jQuery("input[name='pageIndex']").val());
													}
												}
											).fail(function(){
												alert("잠시후 다시 시도 바랍니다.");				
											});
										}
									}
								</c:if>
							</c:if>
							
						//]]>	
						</script>