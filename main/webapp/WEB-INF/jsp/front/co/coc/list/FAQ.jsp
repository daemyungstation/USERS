<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/WEB-INF/jsp/include/el.jspf"%>
						
						<form name="frm" action="${pageLink}" onsubmit="return false">
							<input type="hidden" name="pageIndex" value="${rtnMap.pageIndex}" />
							<input type="hidden" name="categoryId" value="${rtnMap.categoryId}" />
							
							<div class="tab2">
								<a href="./list.do" class="<c:if test="${empty rtnMap.categoryId}">on</c:if>" style="padding:0 17px 23px">전체</a>
								<c:forEach var="ctgrList" items="${ctgrList}" varStatus="status">
									<a href="./list.do?categoryId=${ctgrList.menuSeq}" class="<c:if test="${rtnMap.categoryId eq ctgrList.menuSeq}">on</c:if>" style="padding:0 17px 23px">${ctgrList.menuNm}</a>
								</c:forEach>
							</div>
							
							<c:choose>
								<c:when test="${fn:length(rtnMap.noticeList) eq 0 and fn:length(rtnMap.list) eq 0}">
									<div class="noCpro mt30">
										목록이 없습니다.
									</div>
								</c:when>
								<c:otherwise>
									<div class="faqDiv mt55">
										<!-- 
										<div class="taRbt">
											<a href="javascript:" class="on">조회수 높은 순</a>
											<span class="bar">|</span>
											<a href="javascript:" class="">최신 등록 순</a>
										</div>
			 							-->
										<ul>
											<c:forEach var="noticeList" items="${rtnMap.noticeList}" varStatus="status">								
												<li>
													<button>
														${egov:tldCutString(noticeList.title, '...', mstInfo.listTitleCnt)}			
														<span>
															<img src="/common/images/icon/faq_qicon.gif" class="off" alt="">
															<img src="/common/images/icon/faq_aicon.gif" class="an" alt="">
														</span>
													</button>
													<div class="answer">
														${noticeList.contents}
													</div>
												</li>			
											</c:forEach>
											<c:forEach var="list" items="${rtnMap.list}" varStatus="status">								
												<li>
													<button>
														${egov:tldCutString(list.title, '...', mstInfo.listTitleCnt)}			
														<span>
															<img src="/common/images/icon/faq_qicon.gif" class="off" alt="">
															<img src="/common/images/icon/faq_aicon.gif" class="an" alt="">
														</span>
													</button>
													<div class="answer">
														${list.contents}
													</div>
												</li>			
											</c:forEach>
										</ul>
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
	
							<div class="warnBox mt20">
								※ 자주 묻는 질문을 통해 원하는 정보를 찾지 못하셨나요? 
								<a class="fr btnRed wide" href="/customer-center/personal-counseling/index.do">1:1 상담하기</a>
							</div>
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
						           
							jQuery(document).ready(function(){
								//faq
								var curAcco = 0;
								jQuery(".faqDiv .answer").eq(curAcco).slideDown(0);
								jQuery(".faqDiv li").eq(curAcco).addClass("on");
								jQuery(".faqDiv li").each(function(q){
									jQuery(this).find("button").click(function(){
										if(curAcco != q)
										{
											jQuery(".faqDiv .answer").eq(curAcco).slideUp(250);
											jQuery(".faqDiv li").eq(curAcco).removeClass("on");
											curAcco = q;
											jQuery(".faqDiv .answer").eq(curAcco).slideDown(250);
											jQuery(".faqDiv li").eq(curAcco).addClass("on");
										}
										else if(curAcco == q)
										{
											jQuery(".faqDiv .answer").eq(curAcco).slideUp(250);
											jQuery(".faqDiv li").eq(curAcco).removeClass("on");
											curAcco = -1;
										}
									});
								});
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
							
						//]]>
						</script>