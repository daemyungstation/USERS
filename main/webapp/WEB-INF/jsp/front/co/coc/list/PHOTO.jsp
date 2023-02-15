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
									<div class="boradType6">
										<c:forEach var="noticeList" items="${rtnMap.noticeList}" varStatus="status">
											<a href="javascript:selectBoardDtl('${noticeList.idx}')">
												<span class="img">
													<c:if test="${not empty noticeList.thumnailFileId}">
														<img src="/cmm/fms/getImage.do?fileId=${noticeList.thumnailFileId}&fileSn=0" width="268px" />													
													</c:if>
												</span>
												<span class="txt1">
													[공지] ${egov:tldCutString(noticeList.title, '...', mstInfo.listTitleCnt)}
												</span>
												<span class="info">
													<c:if test="${noticeList.administratorWriteYn ne 'Y'}">
														${noticeList.regname}
														<span class="bar">|</span>
													</c:if>
													<span>${egov:convertDate(noticeList.regdate, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')}</span>
													<span class="bar">|</span>
													<span>${noticeList.readCnt}</span>
												</span>
											</a>
										</c:forEach>
										<c:forEach var="list" items="${rtnMap.list}" varStatus="status">
											<a href="javascript:selectBoardDtl('${list.idx}')">
												<span class="img">
													<c:if test="${not empty list.thumnailFileId}">
														<img src="/cmm/fms/getImage.do?fileId=${list.thumnailFileId}&fileSn=0" width="268px" />
													</c:if>
												</span>
												<span class="txt1">
													${egov:tldCutString(list.title, '...', mstInfo.listTitleCnt)}
												</span>
												<span class="info">
													<c:if test="${list.administratorWriteYn ne 'Y'}">
														${list.regname}
														<span class="bar">|</span>
													</c:if>
													<span>${egov:convertDate(list.regdate, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')}</span>
													<span class="bar">|</span>
													<span>${list.readCnt}</span>
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
						           
						    jQuery(document).ready(function(){
								jQuery(window).resize(function(){
									if(jQuery(window).width() >= 1183)
									{
										jQuery(".boradType6 a").css('margin', '0 46px 30px 0');
										jQuery(".boradType6 a").each(function(q){
											jQuery(".boradType6 a").eq(3 * q + 2).css('margin', '0 0 30px 0');
										});
									}
									else if(jQuery(window).width() <= 1182 && jQuery(window).width() >= 663)
									{
										jQuery(".boradType6 a").each(function(q){
											jQuery(".boradType6 a").eq(q).css('margin', '0 5% 30px');
										});
									}
									else if(jQuery(window).width() <= 662)
									{
										jQuery(".boradType6 a").each(function(q){
											jQuery(".boradType6 a").eq(q).css('margin', '0 auto 20px');
										});
									}
								});
								
								jQuery(window).resize();	
							});

						           
						    //리스트 가져오기
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
							
							//상세 가져오기
							function selectBoardDtl(idx)
							{
								var f = document.frm;
								
								f.action = "./view.do";
								f.idx.value = idx;
								f.submit();
							}
							
						//]]>
						</script>