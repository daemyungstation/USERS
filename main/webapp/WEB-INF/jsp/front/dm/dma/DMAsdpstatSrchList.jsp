<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<div class="boradType7 mt30" style="width:100%">
							<table class="type1" summary="">
								<caption></caption>
								<colgroup>
									<col width="100%">
								</colgroup>
								<tbody>
									<tr>
										<th>내용</th>
									</tr>
									<c:if test="${fn:length(rtnMap.list) eq 0}">
										<tr>
											<td colspan="3" style="text-align:center"><fmt:message key="common.nodata.msg" /></td>
										</tr>
									</c:if>
									<c:forEach var="list" items="${rtnMap.list}" varStatus="status">
										<c:set var="strdate"  value= ""/>
										<c:choose>
											<c:when test="${fn:substring(list.ret,0,2) == '00'}">
												<c:set var="strdate"  value= "(${fn:substring(list.ret,2,10)}) "/>
												<c:set var="strval"  value= "정상가입"/>
											</c:when> 
											<c:when test="${fn:substring(list.ret,0,2) == '02'}">
												<c:set var="strval"  value="(취소) 가입을 취소하였습니다."/>
											</c:when> 
											<c:otherwise>
												<c:set var="strval"  value="(미접수) 해당 고객에 대한 정보 값이 없습니다."/>
											</c:otherwise>
										</c:choose>
										<tr>
											<td>${strdate} &nbsp${strval}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						
						</div>
