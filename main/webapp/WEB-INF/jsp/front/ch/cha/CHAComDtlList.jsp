<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<c:if test="${fn:length(dtlMap.list) gt 0}">
							<jsp:useBean id="now" class="java.util.Date" />
						
							<fmt:formatDate var="nowDt" value="${now}" pattern="yyyyMMdd" />
						
							<p class="titTxt">상세 일정</p>
							<ul class="newScheInfo mt20">
								<li>
									<span>상품준비중</span>접수기간이 아닙니다.
								</li>
								<li>
									<span>예약중</span>접수/상담 가능합니다.
								</li>
								<li>
									<span>예약마감</span>모집이 완료되었습니다.
								</li>
							</ul>
							
							<form name="popFrm" method="post" target="prdctDtlInfo">
								<div class="scheduleList mt30">
									<c:forEach var="list" items="${dtlMap.list}" varStatus="status">
										<div class="scheduleDiv">
											<c:choose>
												<c:when test="${not empty list.thnlFileId}">
													<img src="/cmm/fms/getImage.do?fileId=${list.thnlFileId}&fileSn=0" alt="" width="290px" height="150px" />
												</c:when>
												<c:otherwise>
													<img src="/common/images/icon/schedule_img1.gif" alt="이미지 준비중입니다" />
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${not empty list.link}">
													<a href="javascript:setPopup('${list.link}', 'prdctDtlInfo', 1250, 700);" class="scView"><img src="/common/images/btn/schedule_view_btn.gif" alt="상세보기" /></a>
												</c:when>
												<c:otherwise>
													<a href="javascript:" id="btnDetail${status.count}" class="scView"><img src="/common/images/btn/schedule_view_btn.gif" alt="상세보기" /></a>
												</c:otherwise>
											</c:choose>
											<input type="radio" name="prdctDtlSeq" value="${list.prdctDtlSeq}" style="display: none;" />
											<c:choose>
												<c:when test="${nowDt lt list.rqstStrtDt}">
													<p class="mt10 bar1">상품준비중</p>
												</c:when>
												<c:when test="${nowDt gt list.rqstEndDt}">
													<p class="mt10 bar3">예약마감</p>
												</c:when>
												<c:when test="${list.prcsCd eq '01'}">
													<p class="mt10 bar1">상품준비중</p>
												</c:when>
												<c:when test="${list.prcsCd eq '02'}">
													<p class="mt10 bar2">예약중</p>
												</c:when>
												<c:when test="${list.prcsCd eq '03'}">
													<p class="mt10 bar3">예약마감</p>
												</c:when>
												<c:otherwise>
													<p class="mt10 bar2">예약중</p>
												</c:otherwise>
											</c:choose>
											<p class="scTit mt10">${egov:tldCutString(egov:nvl(list.schd, '&nbsp;'), '...', 24)}</p>
											<p class="scTxt mt10">${list.prdctTitl}</p>
										</div>
									</c:forEach>
								</div>
							</form>
							
							<div class="paging scPaging">
								<ui:pagination paginationInfo="${dtlMap.paginationInfo}" type="image" jsFunction="getDtlPageList" />
							</div>
							
							<script type="text/javascript">
							//<![CDATA[
							           
								jQuery(document).ready(function(){
									//details view
									jQuery("a[id^='btnDetail']").on("click", function(){
										var f = document.popFrm;
										
							    		setPopup("", "prdctDtlInfo", 1250, 700);
							    		
							    		jQuery(this).siblings("input[name='prdctDtlSeq']").trigger("click");
							    		
							    		f.action = "/change-service/dtl-info.do"
								    	f.submit();
							    	});
								});
	
							//]]>
							</script>
						</c:if>