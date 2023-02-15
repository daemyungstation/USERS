<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<c:set var="prsnCnslInfo" value="${rtnMap.prsnCnslInfo}"/>
							
						<div class="prView">
							<div class="head">
								<p class="tit">[${prsnCnslInfo.inqryNm}] ${prsnCnslInfo.titl}</p>
								<div class="txt">
									<span>${egov:convertDate(prsnCnslInfo.regDtm, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')}</span>
									<span class="bar">|</span>
									<span>${egov:convertDate(prsnCnslInfo.regDtm, 'yyyy-MM-dd HH:mm:ss', 'HH:mm', '')}</span>
								</div>
							</div>

							<div class="view">
								<jsp:scriptlet>
									pageContext.setAttribute("crlf", "\r\n");
									pageContext.setAttribute("lf", "\n");
									pageContext.setAttribute("cr", "\r");
								</jsp:scriptlet>
								${fn:replace(fn:replace(prsnCnslInfo.cntn, ' ', '&nbsp;'), crlf, '<br />')}
								
								<c:if test="${not empty prsnCnslInfo.answ}">
									<div class="counAnswer">
										<div class="answerH">
											<p class="tit">${prsnCnslInfo.name}님께서 문의하신 내용에 대한 답변입니다.</p>
											<div class="txt">
												<span>담당자 : ${rtnMap.prsnCnslLog.modNm}</span>
												<span class="bar">|</span>
												<span>${egov:convertDate(rtnMap.prsnCnslLog.modDtm, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')}</span>
												<span class="bar">|</span>
												<span>${egov:convertDate(rtnMap.prsnCnslLog.modDtm, 'yyyy-MM-dd HH:mm:ss', 'HH:mm', '')}</span>
											</div>
										</div>
	
										<div class="answerT">
											${fn:replace(fn:replace(prsnCnslInfo.answ, ' ', '&nbsp;'), crlf, '<br />')}
										</div>
									</div>
								</c:if>
							</div>
						</div>
						
						<form name="frm" method="post" action="">
							<input type="hidden" name="pageIndex" value="${rtnMap.pageIndex}" />
							<input type="hidden" name="f" value="${rtnMap.f}" />
							<input type="hidden" name="q" value="${rtnMap.q}" />
						</form>

						<p class="mt20 taR"><a href="javascript:getPageList();" class="whtBt2">목록</a></p>
						
						<script type="text/javascript">
						//<![CDATA[
							
						    //리스트 가져오기
							function getPageList()
							{	
								var f = document.frm;
								
								f.action = "./list.do";
								f.submit();
							}
						           
						//]]>
						</script>