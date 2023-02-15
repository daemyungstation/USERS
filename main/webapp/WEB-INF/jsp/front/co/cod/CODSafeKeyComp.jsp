<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/WEB-INF/jsp/include/el.jspf"%>

			<div id="popup">
				<div class="popHead">인증처리</div>

				<div class="popBody">
					<div class="memCardpop">
						<div class="txt2 mt10">
							<p class="safeTit">
								<c:choose>
									<c:when test="${not empty sSafekey}">
										Safe-Key가 정상적으로 발급 처리되었습니다.<br/>복사하셔서 사용하시기 바랍니다.
									</c:when>
									<c:otherwise>
										${sMessage}
									</c:otherwise>
								</c:choose>
							</p>
						</div>
						
						<p class="tit mt30 taC">${sSafekey}</p>
					</div>
				</div>
			</div>
