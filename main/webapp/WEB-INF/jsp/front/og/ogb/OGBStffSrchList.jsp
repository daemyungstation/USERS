<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<div class="boradType7 mt30" style="width:100%">
							<table class="type1" summary="">
								<caption></caption>
								<colgroup>
									<col width="33%">
									<col width="34%">
									<col width="33%">
								</colgroup>
								<tbody>
									<tr>
										<th>부서</th>
										<th>이름</th>
										<th>직위</th>
									</tr>
									<c:if test="${fn:length(rtnMap.list) eq 0}">
										<tr>
											<td colspan="3" style="text-align:center"><fmt:message key="common.nodata.msg" /></td>
										</tr>
									</c:if>
									<c:forEach var="list" items="${rtnMap.list}" varStatus="status">
										<tr>
											<td>${list.deptNm}</td>
											<td>${list.maskEmpleNm}</td>
											<td>${list.posnNm}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							<div class="paging mt30">
								<ui:pagination paginationInfo="${rtnMap.paginationInfo}" type="image" jsFunction="getPageList" />
							</div>
						</div>
