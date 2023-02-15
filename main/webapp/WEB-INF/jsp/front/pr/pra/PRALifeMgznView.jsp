<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<c:set var="mgznInfo" value="${rtnMap.mgznInfo}"/>
						
						<div class="">
							<form name="frm" method="post" action="">
								<select name="mgznPbtnYr" title="년도선택" style="width:118px;">
									<c:choose>
										<c:when test="${fn:length(rtnMap.yrList) eq 0}">
											<option value="">선택</option>
										</c:when>
										<c:otherwise>
											<c:forEach var="list" items="${rtnMap.yrList}" varStatus="status">
												<option value="${list.mgznPbtnYr}" <c:if test="${rtnMap.mgznPbtnYr eq list.mgznPbtnYr}">selected</c:if>>${list.mgznPbtnYr}년</option>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</select>
								<a href="javascript:selectLifeMgzn();" class="btn333">보기</a>
							</form>
						</div>
						
						<ul class="megaList mt40">
							<c:set var="mgznCnt" value="0" />
							<c:if test="${not empty mgznInfo.sprTitl}">
								<li>
									<span class="img">
										<c:if test="${not empty mgznInfo.sprCvrFileId}">
											<img src="/cmm/fms/getImage.do?fileId=${mgznInfo.sprCvrFileId}&fileSn=0" alt="" width="248px;" height="294px;" />
										</c:if>
									</span>
									<span class="txt">
										<span class="tit">${mgznInfo.sprTitl}</span>
										<span class="copy">${mgznInfo.sprSubTitl}</span>
										<c:if test="${not empty mgznInfo.sprEbkUrl}">
											<a href="${mgznInfo.sprEbkUrl}" target="_blank" class="">e-Book</a>
										</c:if>
										<c:if test="${not empty mgznInfo.sprPdfFileId}">
											<a href="/cmm/fms/FileDown.do?fileId=${mgznInfo.sprPdfFileId}&fileSn=0" class="mt5">PDF 다운로드</a>
										</c:if>
									</span>
								</li>
								<c:set var="mgznCnt" value="${mgznCnt + 1}" />
							</c:if>
							<c:if test="${not empty mgznInfo.smmrTitl}">
								<li>
									<span class="img">
										<c:if test="${not empty mgznInfo.smmrCvrFileId}">
											<img src="/cmm/fms/getImage.do?fileId=${mgznInfo.smmrCvrFileId}&fileSn=0" alt="" width="248px;" height="294px;" />
										</c:if>
									</span>
									<span class="txt">
										<span class="tit">${mgznInfo.smmrTitl}</span>
										<span class="copy">${mgznInfo.smmrSubTitl}</span>
										<c:if test="${not empty mgznInfo.smmrEbkUrl}">
											<a href="${mgznInfo.smmrEbkUrl}" target="_blank" class="">e-Book</a>
										</c:if>
										<c:if test="${not empty mgznInfo.smmrPdfFileId}">
											<a href="/cmm/fms/FileDown.do?fileId=${mgznInfo.smmrPdfFileId}&fileSn=0" class="mt5">PDF 다운로드</a>
										</c:if>
									</span>
								</li>
								<c:set var="mgznCnt" value="${mgznCnt + 1}" />
							</c:if>
							<c:if test="${not empty mgznInfo.atmnTitl}">
								<li>
									<span class="img">
										<c:if test="${not empty mgznInfo.atmnCvrFileId}">
											<img src="/cmm/fms/getImage.do?fileId=${mgznInfo.atmnCvrFileId}&fileSn=0" alt="" width="248px;" height="294px;" />
										</c:if>
									</span>
									<span class="txt">
										<span class="tit">${mgznInfo.atmnTitl}</span>
										<span class="copy">${mgznInfo.atmnSubTitl}</span>
										<c:if test="${not empty mgznInfo.atmnEbkUrl}">
											<a href="${mgznInfo.atmnEbkUrl}" target="_blank" class="">e-Book</a>
										</c:if>
										<c:if test="${not empty mgznInfo.atmnPdfFileId}">
											<a href="/cmm/fms/FileDown.do?fileId=${mgznInfo.atmnPdfFileId}&fileSn=0" class="mt5">PDF 다운로드</a>
										</c:if>
									</span>
								</li>
								<c:set var="mgznCnt" value="${mgznCnt + 1}" />
							</c:if>
							<c:if test="${not empty mgznInfo.wntrTitl}">
								<li>
									<span class="img">
										<c:if test="${not empty mgznInfo.wntrCvrFileId}">
											<img src="/cmm/fms/getImage.do?fileId=${mgznInfo.wntrCvrFileId}&fileSn=0" alt="" width="248px;" height="294px;" />
										</c:if>
									</span>
									<span class="txt">
										<span class="tit">${mgznInfo.wntrTitl}</span>
										<span class="copy">${mgznInfo.wntrSubTitl}</span>
										<c:if test="${not empty mgznInfo.wntrEbkUrl}">
											<a href="${mgznInfo.wntrEbkUrl}" target="_blank" class="">e-Book</a>
										</c:if>
										<c:if test="${not empty mgznInfo.wntrPdfFileId}">
											<a href="/cmm/fms/FileDown.do?fileId=${mgznInfo.wntrPdfFileId}&fileSn=0" class="mt5">PDF 다운로드</a>
										</c:if>
									</span>
								</li>
								<c:set var="mgznCnt" value="${mgznCnt + 1}" />
							</c:if>
							<c:if test="${mgznCnt lt 1}">
								<div class="noCpro mt30">
									목록이 없습니다.
								</div>
							</c:if>
						</ul>
						
						<script type="text/javascript">
						//<![CDATA[
						           
						    function selectLifeMgzn()
						    {
						    	var f = document.frm;
						    	
						    	f.action = "./index.do";
						    	f.submit();
						    }
						    
						//]]>
						</script>