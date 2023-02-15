<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<form name="frm" method="post" action="">
							<input type="hidden" name="pageIndex" value="${rtnMap.pageIndex}" />
							<input type="hidden" name="custVoiceSeq" value="" />
							
							<c:choose>
								<c:when test="${fn:length(rtnMap.list) eq 0}">
									<div class="noCpro mt30">
										목록이 없습니다.
									</div>
								</c:when>
								<c:otherwise>
									<ul class="boradType4 boradType12 type2 ">
										<c:if test="${fn:length(rtnMap.list) eq 0}">
											<li style="text-align: center">
												<fmt:message key="common.nodata.msg" />
											</li>
										</c:if>
										<c:forEach var="list" items="${rtnMap.list}" varStatus="status">
											<li>
												<p class="num">
													${list.totCnt - (rtnMap.pageIndex - 1) * rtnMap.paginationInfo.pageSize - status.count + 1}
												</p>
												<p class="type">
													${list.inqryNm}
												</p>
												<p class="type">
													${list.inqryDtlNm}
												</p>
												<div class="info">
													<p class="txt1">
														<a href="javascript:selectCustVoiceDtl('${list.custVoiceSeq}');">${egov:tldCutString(list.titl, '...', '35')}</a>
													</p>
													<p class="txt2">
														<span>${egov:convertDate(list.regDtm, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')}</span>
														<span class="bar">|</span>
														<span class="${egov:decode(list.prcsCd, '03', 'red', '')}">${list.prcsNm}</span>
													</p>
												</div>
											</li>
										</c:forEach>
									</ul>
								</c:otherwise>
							</c:choose>
	
							<div class="paging mt30">
								<ui:pagination paginationInfo="${rtnMap.paginationInfo}" type="image" jsFunction="getPageList" />
							</div>
							
							<div class="listSrch mt30">
								<select name="f" title="검색선택">
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
									f.pageIndex.value = 1;
								}
								
								f.action = "./list.do";
								f.submit();
							}
							
							//상세 가져오기
							function selectCustVoiceDtl(custVoiceSeq)
							{
								var f = document.frm;
								
								f.action = "./view.do";
								f.custVoiceSeq.value = custVoiceSeq;
								f.submit();
							}
							
						//]]>
						</script>