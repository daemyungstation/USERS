<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/WEB-INF/jsp/include/el.jspf"%>

						<div class="replDiv mt40">
							<input type="hidden" name="pageIndex" value="${rtnMap.pageIndex}" />
							
							<div class="input">
								<textarea name="comment" onclick="insertBoardComment('textarea')"></textarea>
								<a href="javascript:insertBoardComment('button');">댓글등록</a>
							</div>
							
							<c:if test="${fn:length(rtnMap.list) gt 0}">
								<c:forEach var="list" items="${rtnMap.list}" varStatus="status">
									<div class="view mt10">
										<div style="margin-left:${list.reDepth * 10}px;">
											<p class="priInfo">
												<strong>**${fn:substring(list.regid, 2, -1)}</strong>
												${egov:convertDate(list.regdate, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd HH:mm', '')}	
											</p>
											<p class="txt">
												<c:if test="${list.reDepth eq 0}">
													<c:set var="reDepthId" value="${list.regid}"/>
												</c:if>
												<c:choose>
													<c:when test="${empty rtnMap.replyYn or rtnMap.replyYn eq 'N'}">
														<c:choose>
															<c:when test="${sessionScope.userLgnMap.id eq list.regid or sessionScope.userLgnMap.id eq reDepthId}">
																<span id="contents">${list.contents}</span>
															</c:when>
															<c:otherwise>
																<span id="contents">비밀 댓글입니다.</span>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<span id="contents">${list.contents}</span>
													</c:otherwise>
												</c:choose>
											</p>
											<div class="input cntnType" style="max-width:550px; display:none;">
												<textarea style="max-width:465px;"></textarea>
												<a href="javascript:" onclick="updateBoardComment('${list.cidx}', this);">적용</a>
											</div>
											<div class="input replyType" style="max-width:550px; display:none;">
												<textarea style="max-width:465px;"></textarea>
												<a href="javascript:" onclick="insertBoardCommentReply('${list.cidx}', '${list.groupId}', '${list.reDepth}', this);">적용</a>
											</div>
										</div>
										<c:if test="${not empty sessionScope.userLgnMap}">
											<div class="bts">
												<c:if test="${sessionScope.userLgnMap.id eq list.regid}">
													<a href="javascript:" onclick="setUpdateForm(this);" class="type1">수정</a>
												</c:if>
												
												<a href="javascript:" onclick="setReplyForm(this, '${list.reDepth}');" class="type1">답글</a>
												
												<c:if test="${sessionScope.userLgnMap.id eq list.regid}">
													<a href="javascript:" onclick="deleteBoardComment('${list.cidx}');" class="type2">삭제</a>
												</c:if>
											</div>
										</c:if>
									</div>
								</c:forEach>
								
								<div class="paging mt30">
									<ui:pagination paginationInfo="${rtnMap.paginationInfo}" type="image" jsFunction="getCommentList" />
								</div>
							</c:if>
						</div>