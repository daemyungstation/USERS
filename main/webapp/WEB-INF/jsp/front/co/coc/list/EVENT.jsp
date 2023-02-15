<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/WEB-INF/jsp/include/el.jspf"%>
						
						<jsp:useBean id="now" class="java.util.Date" />
						
						<fmt:formatDate var="nowDt" value="${now}" pattern="yyyyMMdd" />
						
						<form name="frm" action="${pageLink}">
							<input type="hidden" name="pageIndex" value="${rtnMap.pageIndex}" />
							<input type="hidden" name="idx" value="" />
							
							<c:choose>
								<c:when test="${fn:length(rtnMap.noticeList) eq 0 and fn:length(rtnMap.list) eq 0}">
									<div class="noCpro mt30">
										목록이 없습니다.
									</div>
								</c:when>
								<c:otherwise>
									<div class="lifeList mt40">
										<c:forEach var="noticeList" items="${rtnMap.noticeList}" varStatus="status">
											<a href="javascript:selectBoardDtl('${noticeList.idx}')">
												<span class="img">
													<c:if test="${not empty noticeList.thumnailFileId}">
														<img src="/cmm/fms/getImage.do?fileId=${noticeList.thumnailFileId}&fileSn=0" width="290px" />
													</c:if>
												</span>
												<c:choose>
													<c:when test="${noticeList.odtmYn eq 'Y'}">
														<span class="type2">진행중</span>
													</c:when>
													<c:when test="${nowDt lt egov:convertDate(noticeList.startDt, 'yyyy-MM-dd HH:mm:ss', 'yyyyMMdd', '')}">
														<span class="type1">진행예정</span>
													</c:when>
													<c:when test="${nowDt le egov:convertDate(noticeList.endDt, 'yyyy-MM-dd HH:mm:ss', 'yyyyMMdd', '')}">
														<span  class="type2">진행중</span>	
													</c:when>
													<c:otherwise>
														<span  class="type3">진행완료</span>	
													</c:otherwise>
												</c:choose>
												<strong class="tit">[공지]${egov:tldCutString(noticeList.title, '...', mstInfo.listTitleCnt)} <c:if test="${noticeList.commentCnt > 0}"><span class="red">[${noticeList.commentCnt}]</span></c:if></strong>
												<span class="txt">
													<c:if test="${noticeList.administratorWriteYn ne 'Y'}">
														<span>${noticeList.regname}</span>
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
														<img src="/cmm/fms/getImage.do?fileId=${list.thumnailFileId}&fileSn=0" width="290px" />
													</c:if>
												</span>
												<c:choose>
													<c:when test="${list.odtmYn eq 'Y'}">
														<span class="type2">진행중</span>
													</c:when>
													<c:when test="${nowDt lt egov:convertDate(list.startDt, 'yyyy-MM-dd HH:mm:ss', 'yyyyMMdd', '')}">
														<span class="type1">진행예정</span>
													</c:when>
													<c:when test="${nowDt le egov:convertDate(list.endDt, 'yyyy-MM-dd HH:mm:ss', 'yyyyMMdd', '')}">
														<span class="type2">진행중</span>	
													</c:when>
													<c:otherwise>
														<span class="type3">진행완료</span>	
													</c:otherwise>
												</c:choose>
												<strong class="tit">${egov:tldCutString(list.title, '...', mstInfo.listTitleCnt)} <c:if test="${list.commentCnt > 0}"><span class="red">[${list.commentCnt}]</span></c:if></strong>
												<span class="txt">
													<c:if test="${list.administratorWriteYn ne 'Y'}">
														<span>${list.regname}</span>
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
										jQuery(".lifeList a").css('margin', '0 40px 25px 0');
										jQuery(".lifeList a").each(function(q){
											jQuery(".lifeList a").eq(3 * q + 2).css('margin', '0 0 25px 0');
										});
									}
									else if(jQuery(window).width() <= 1182 && jQuery(window).width() >= 663)
									{
										jQuery(".lifeList a").each(function(q){
											jQuery(".lifeList a").eq(q).css('margin', '0 5% 30px');
										});
									}
									else if(jQuery(window).width() <= 662)
									{
										jQuery(".lifeList a").each(function(q){
											jQuery(".lifeList a").eq(q).css('margin', '0 auto 25px');
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