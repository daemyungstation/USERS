<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/WEB-INF/jsp/include/el.jspf"%>
						
						<form name="frm" action="${pageLink}">
							<input type="hidden" name="pageIndex" value="${rtnMap.pageIndex}" />
							<input type="hidden" name="idx" value="" />
							
							<c:choose>
								<c:when test="${fn:length(rtnMap.noticeList) eq 0 && fn:length(rtnMap.list) eq 0 }">
									<div class="noCpro mt30">
										목록이 없습니다.
									</div>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${mstInfo.communityId eq '3'}">
											<div style="margin-bottom:10px;">
												<strong>※ 언론에 보도된 대명아임레디 정보입니다. 클릭 시 뉴스페이지로 이동합니다.</strong>
											</div>
										</c:when>
										<c:when test="${mstInfo.communityId eq '3'}">
											<div style="margin-bottom:10px;">
												<strong>※ 대명아임레디 공식 페이스북에서 운영하는 정보입니다. 클릭 시 해당 페이지로 이동됩니다.</strong>
											</div>
										</c:when>
									</c:choose>
									<div class="boradType5">
										<c:forEach var="noticeList" items="${rtnMap.noticeList}" varStatus="status">
											<a href="${egov:nvl(noticeList.linkUrl, 'javascript:')}" target="_blank" title="새창열림" style="cursor:default;">
												<span class="img">
													<c:if test="${not empty noticeList.thumnailFileId}">
														<img src="/cmm/fms/getImage.do?fileId=${noticeList.thumnailFileId}&fileSn=0" width="220px" />
													</c:if>
												</span>
												<span class="info">
													<span class="txt1">[공지] ${egov:tldCutString(noticeList.title, '...', mstInfo.listTitleCnt)}</span>
													<span class="txt2" style="cursor:pointer;">
														${egov:tldCutString(egov:removeHTMLTag(noticeList.contents), '...', 195)}
													</span>
													<span class="txt3">
														${egov:convertDate(noticeList.regdate, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')}
													</span>
												</span>
											</a>
										</c:forEach>
										<c:forEach var="list" items="${rtnMap.list}" varStatus="status">
											<a href="${egov:nvl(list.linkUrl, 'javascript:')}" target="_blank" title="새창열림" style="cursor:default">
												<span class="img">
													<c:if test="${not empty list.thumnailFileId}">
														<img src="/cmm/fms/getImage.do?fileId=${list.thumnailFileId}&fileSn=0" width="220px" />
													</c:if>
												</span>
												<span class="info">
													<span class="txt1">${egov:tldCutString(list.title, '...', mstInfo.listTitleCnt)}</span>
													<span class="txt2" style="cursor:pointer;">
														${egov:tldCutString(egov:removeHTMLTag(list.contents), '...', 195)}
													</span>
													<span class="txt3">
														<c:choose>
															<c:when test="${mstInfo.communityId eq '3'}">
																${egov:convertDate(list.sortDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')}
															</c:when>
															<c:otherwise>
																${egov:convertDate(list.regdate, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')}
															</c:otherwise>
														</c:choose>
													</span>
												</span>
											</a>
										</c:forEach>
									</div>
								</c:otherwise>
							</c:choose>
							
							<c:if test="${mstInfo.writeUserAuthority gt -1}">
								<p class="taR mt30">
									<a href="./write.do" class="btnRed">등록</a>
								</p>
							</c:if>
	
							<div class="paging mt30">
								<ui:pagination paginationInfo="${rtnMap.paginationInfo}" type="image" jsFunction="getPageList" />
							</div>
							
							<div class="listSrch mt30">
								<select name="f" title="검색선택">
									<option value="">전체</option>
									<option value="1" <c:if test="${rtnMap.f eq '1'}">selected</c:if>>제목</option>
									<option value="2" <c:if test="${rtnMap.f eq '2'}">selected</c:if>>내용</option>
								</select>
								<input type="text" name="q" value="${rtnMap.q}" title="검색어" maxlength="15" />
								<a href="javascript:getPageList();" class="srchBt"><span>검색</span></a>
								<a href="./list.do" class="btnGry">전체보기</a>
							</div>
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
						           
							function getPageList()
							{
								var f = document.frm;
						
								if(arguments.length > 0)
								{
									f.pageIndex.value = arguments[0];
								}
								else
								{
									f.pageIndex.value= 1;
								}
								
								f.action = "./list.do";
								f.submit();
							}
							
						//]]>
						</script>