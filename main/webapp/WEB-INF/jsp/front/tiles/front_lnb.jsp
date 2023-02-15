<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf"%>
					
					<c:set var="lnbCnt" value="${fn:length(lnbMenuList)}" />
					
					<c:if test="${lnbCnt > 0}">
						<div id="lnb">
							<p class="tit">
								<c:choose>
									<c:when test="${fn:contains(fn:replace(lnbMenuList[0].menuNm, '@@', ''), '라이프웨이 서비스')}">
										${fn:replace(fn:replace(lnbMenuList[0].menuNm, '@@', ''), ' ', '<br />')}
									</c:when>
									<c:otherwise>
										${fn:replace(lnbMenuList[0].menuNm, '@@', '')}
									</c:otherwise>
								</c:choose>
							</p>
							<div>
								<c:forEach var="lnb" items="${lnbMenuList}" begin="1" varStatus="status">
									<fmt:formatNumber var="curntDpth" value="${lnb.dpth}" type="number" groupingUsed="false" />
								  	
								  	<c:choose>
								  		<c:when test="${status.count lt lnbCnt}">
								  			<fmt:formatNumber var="nxtDpth" value="${lnbMenuList[status.count + 1].dpth}" type="number" groupingUsed="false" /> 
								  		</c:when>
								  		<c:otherwise>
								  			<fmt:formatNumber var="nxtDpth" value="0" type="number" groupingUsed="false" /> 
								  		</c:otherwise>
								  	</c:choose>

								  	<a href="${egov:nvl(lnb.userLink, 'javascript:')}" target="${egov:decode(lnb.userWndYn, 'Y', '_blank', '_self')}" class="${egov:decode(curntDpth, 3, 'twoD', '')}">
								  		${fn:replace(fn:replace(lnb.menuNm, '@@', ''), '&lt;br&gt;', '<br />')}
								  		<c:if test="${lnb.kwrd eq 'NEW'}">
								  			<span class="newIcon"><img src="/common/images/icon/lnb_new_icon.gif" alt="NEW" /></span>
								  		</c:if>
										<c:if test="${lnb.kwrd eq 'RENEWAL'}">
											<span class="newIcon"><img src="/common/images/icon/lnb_renewal_icon.gif" alt="RENEWAL" /></span>
										</c:if>
								  	</a>

									<c:if test="${curntDpth lt nxtDpth}">
										<div class="${egov:decode(curntDpth, 3, 'thrD', 'fouD')}">
									</c:if>
									
									<c:choose>
										<c:when test="${status.count + 1 eq lnbCnt}">
											<c:forEach begin="1" end="${curntDpth - 3}" step="1" varStatus="close">
												</div>
											</c:forEach> 
										</c:when>
										<c:when test="${curntDpth gt nxtDpth}">
											<c:forEach begin="1" end="${curntDpth - nxtDpth}" step="1" varStatus="close">
								       			</div>
											</c:forEach> 
										</c:when>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</c:if>