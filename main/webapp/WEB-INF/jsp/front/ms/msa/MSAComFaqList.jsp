<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

						
						<p class="titTxt mt60">FAQ</p>
						
						<c:choose>
							<c:when test="${fn:length(rtnMap.noticeList) eq 0 and fn:length(rtnMap.list) eq 0}">
								<div class="noCpro mt30">
									목록이 없습니다.
								</div>
							</c:when>
							<c:otherwise>
						
								<div class="faqDiv mt20">
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
							<a href="javascript:getPageList();" class="btn333">검색</a>
							<a href="javascript:getPageList('all');" class="btnGry">전체보기</a>
						</div>

						<div class="warnBox mt20">
							※ 자주 묻는 질문을 통해 원하는 정보를 찾지 못하셨나요? 
							<a class="fr btnRed wide" href="/customer-center/personal-counseling/index.do">1:1 상담하기</a>
						</div>
						
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

						//]]>
						</script>