<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf"%>
	
		<div class="privacyDiv">
	
		<c:forEach var="list" items="${rtnMap.list}" varStatus="status">
		<dl class="level1" style="margin-bottom:5px">
			<dt class="type3">${list.cntn}</dt>
			<dd class="level level2">
				<c:if test="${list.level2List ne null}">
					<c:forEach var="list2" items="${list.level2List}" varStatus="status">
					<dl style="margin: 1px 0; ">
						<c:choose>
							<c:when test="${list2.level3List ne null}">
							<dt class="type4"  style="white-space:pre-line">${list2.cntn }</dt>	
							</c:when>
							<c:otherwise>
							<dt>${list2.cntn }</dt>
							</c:otherwise>
						</c:choose>	
	
						<dd class="level level3">
							<c:if test="${list2.level3List ne null}">
								<c:forEach var="list3" items="${list2.level3List}" varStatus="status">
								
								<div style="margin: 1px 0; " >
									<p style="white-space:pre-line">${list3.cntn }</p>
								</div>
															
								</c:forEach>
							</c:if>
						</dd>			
					</dl>						
					</c:forEach>			
				</c:if>
			</dd>	
		</dl>
		</c:forEach>			
		
		</div>
	