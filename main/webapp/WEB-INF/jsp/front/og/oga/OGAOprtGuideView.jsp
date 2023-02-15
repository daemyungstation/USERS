<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

						<c:set var="oprtGuideInfo" value="${rtnMap.oprtGuideInfo}"/>
						
						<div class="privacyDiv">
							<div class="taR">
								<form name="frm" method="post" action="">
									<select name="oprtGuideSeq" title="외주용역 안내 선택" style="width:188px;">
										<c:choose>
											<c:when test="${fn:length(rtnMap.rvsnDtList) eq 0}">
												<option value="">이전 이용약관</option>
											</c:when>
											<c:otherwise>
												<c:forEach var="list" items="${rtnMap.rvsnDtList}" varStatus="status">
													<option value="${list.oprtGuideSeq}" <c:if test="${rtnMap.oprtGuideSeq eq list.oprtGuideSeq}">selected</c:if>>${egov:convertDate(list.ptupDt, 'yyyyMMdd', '개정일 : yyyy년 MM월 dd일', '')}</option>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</select>
									<a href="javascript:selectOprtGuide();" class="btn333">보기</a>
								</form>
							</div>
							
							<c:choose>
								<c:when test="${empty oprtGuideInfo}">
									<fmt:message key="common.nodata.msg" />
								</c:when>
								<c:otherwise>
									${oprtGuideInfo.cntn}
								</c:otherwise>
							</c:choose>
						</div>
						
						<script type="text/javascript">
						//<![CDATA[
							
							function selectOprtGuide()
						    {
						    	var f = document.frm;
						    	
						    	f.action = "./index.do";
						    	f.submit();
						    }
							jQuery(document).ready(function(){
								var curPri = 0;
								
								jQuery(document).ready(function(){
									jQuery(".privacyDiv .priAnchor a").each(function(q){
										jQuery(this).click(function(){
											curPri = q;
											jQuery("html, body").stop().animate({scrollTop: jQuery(".privacyDiv dt").eq(curPri).offset().top}, 'slow');
										});
									});
								});
							});

							//]]>
						</script>