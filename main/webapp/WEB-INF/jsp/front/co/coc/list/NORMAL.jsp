<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/WEB-INF/jsp/include/el.jspf"%>
					
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
								
									<c:if test="${rtnMap.communityId eq '5'}">
									<div class="chngSrvHead">
										<img src="/common/images/icon/totalService_img1.jpg" alt="">
										<div class="txt2 txt">
											<img src="/common/images/icon/totalService_icon1.png" alt="">
											<p><b>대명아임레디의 <span class="pp">‘토탈 라이프케어 서비스’</span>, 이용해보셨나요?</b><br />
											대명아임레디와 관련된 <b>여러분의 경험</b>을 들려주세요.</p>
											<p class="type1"><span class="rd"><b>상조서비스, 멤버십서비스, 하이브리드 서비스, 직원 칭찬</b></span> 등 어떤 내용이라도 좋습니다.<br />
											<!-- 우수한 의견은 계절별로 발행하는 <span class="rd">‘회원 대상 매거진 (Lifeway)’에 게재하고 소정의 선물</span>을 드립니다.</p> -->
										</div>
									</div>
									</c:if>
									
									<ul class="boradType4 <c:if test="${rtnMap.communityId ne '5'}">board4</c:if> <c:if test="${rtnMap.communityId eq '5'}">mt50</c:if>">
										<c:forEach var="noticeList" items="${rtnMap.noticeList}" varStatus="status">
											<li>
												<p class="num">공지</p>
												<div class="info">
												<c:if test="${rtnMap.communityId eq '5'}">
													<c:choose>
														<c:when test="${not empty noticeList.categoryId}">
															<p class="txt">${noticeList.categoryNm}</p>
														</c:when>
														<c:otherwise>
															<p class="txt">&nbsp;</p>
														</c:otherwise>
													</c:choose>
												</c:if>
													<p class="txt1"><!-- 2016-03-30 수정 -->
														<a href="javascript:selectBoardDtl('${noticeList.idx}')">${egov:tldCutString(noticeList.title, '...', mstInfo.listTitleCnt)}</a>
														<c:if test="${noticeList.openYn eq 'N'}">
															<img src="/common/images/icon/blind_icon.png" alt="비밀글" />
														</c:if>
													</p>
													<p class="txt2">
														<c:if test="${noticeList.administratorWriteYn ne 'Y'}">
															${noticeList.regname}
															<span class="bar">|</span>
														</c:if>
														<span>${egov:convertDate(noticeList.regdate, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')}</span>
														<span class="bar">|</span>
														<span class="count">${noticeList.readCnt}</span>
													</p>
												</div>
											</li>
										</c:forEach>
										<c:forEach var="list" items="${rtnMap.list}" varStatus="status">
											<li>
												<p class="num">${list.totCnt - (rtnMap.pageIndex - 1) * rtnMap.paginationInfo.pageSize - status.count + 1}</p>
												<div class="info">
													<c:if test="${rtnMap.communityId eq '5'}">
														<c:choose>
															<c:when test="${not empty list.categoryId}">
																<p class="txt">${list.categoryNm}</p>
															</c:when>
															<c:otherwise>
																<p class="txt">&nbsp;</p>
															</c:otherwise>
														</c:choose>
													</c:if>
													<p class="txt1"><!-- 2016-03-30 수정 -->
														<a href="javascript:selectBoardDtl('${list.idx}')">${egov:tldCutString(list.title, '...', mstInfo.listTitleCnt)}</a>
														<c:if test="${list.openYn eq 'N'}">
															<img src="/common/images/icon/blind_icon.png" alt="비밀글" />
														</c:if>
													</p>
													<p class="txt2">
														<%-- <c:if test="${list.administratorWriteYn ne 'Y'}">
															${list.regname}
															<span class="bar">|</span>
														</c:if> --%>
														<span>${list.regname}</span>
														<span class="bar">|</span>
														<span>${egov:convertDate(list.regdate, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')}</span>
														<span class="bar">|</span>
														<span class="count">${list.readCnt}</span>
													</p>
												</div>
											</li>
										</c:forEach>
									</ul>
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