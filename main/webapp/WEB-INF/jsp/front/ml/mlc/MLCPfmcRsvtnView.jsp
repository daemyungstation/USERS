<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<c:set var="rsvtnInfo" value="${rtnMap.rsvtnInfo}" />
						
						<form id="frm" method="post" action="./cancel.do">
							<input type="hidden" name="rsvtnSeq" value="" />
							
							<ul class="performRe">
								<li>
									<p class="img">
										<span class="type2">무료공연</span>
										<c:if test="${not empty rsvtnInfo.atchFileId}">
											<img src="/cmm/fms/getImage.do?fileId=${rsvtnInfo.atchFileId}&fileSn=0" alt="" width="250px;" height="360px;" />
										</c:if>
									</p>
	
									<div class="txt">
										<p class="tit">${rsvtnInfo.pfmcNm}</p>
										<p class="dot"><strong>장소</strong> : ${rsvtnInfo.plce}</p>
										<p class="dot"><strong>출연</strong> : ${rsvtnInfo.cast}</p>
										<p class="dot"><strong>관람등급</strong> : ${rsvtnInfo.vwngGrd}</p>
										<p class="dot"><strong>제작</strong> : ${rsvtnInfo.prdcCo}</p>
										<p class="dot"><strong>공연기간</strong> : 
											${egov:convertDate(rsvtnInfo.pfmcStrtDt, 'yyyyMMdd', 'yyyy년 MM월 dd일(EE)', '')} ~ ${egov:convertDate(rsvtnInfo.pfmcEndDt, 'yyyyMMdd', 'yyyy년 MM월 dd일(EE)', '')}
										</p>
										<p class="dot"><strong>공연시간</strong> : ${rsvtnInfo.pfmcTime}</p>
										<p class="dot"><strong>티켓정가</strong> : ${rsvtnInfo.tcktPrc}</p>
										<p class="dot"><strong>회원혜택</strong> : ${rsvtnInfo.dscntPct}</p>
										<p class="dot"><strong>예매방법</strong> : ${rsvtnInfo.rsvtnMns}</p>
										<p class="dot"><strong>주의사항</strong> : ${rsvtnInfo.prctn}</p>
									</div>
								</li>
							</ul>
	
							<div class="boardType2 mt15">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="20%" />
										<col width="80%" />
									</colgroup>
									<tbody>
										<tr>	
											<th scope="row">회원번호</th>
											<td>${rsvtnInfo.accntNo}</td>
										</tr>
										<tr>	
											<th scope="row">공연명</th>
											<td>${rsvtnInfo.pfmcNm}</td>
										</tr>
										<tr>	
											<th scope="row">관람인원</th>
											<td>
												${rsvtnInfo.seatCnt}명 (본인포함)
											</td>
										</tr>
										<tr>	
											<th scope="row">관람좌석</th>
											<td>
												${rsvtnInfo.seatGb}석
											</td>
										</tr>
										<tr>	
											<th scope="row">예약일시</th>
											<td>
												1순위 : ${egov:convertDate(rsvtnInfo.fstRsvtnDtm, 'yyyy-MM-dd HH:mm:ss', 'yyyy년 MM월 dd일(EE) HH시 mm분', '')}  /  2순위 : ${egov:convertDate(rsvtnInfo.secnRsvtnDtm, 'yyyy-MM-dd HH:mm:ss', 'yyyy년 MM월 dd일(EE) HH시 mm분', '')}
											</td>
										</tr>
										<tr>	
											<th scope="row">최종예약일시</th>
											<td>
												${egov:nvl(egov:convertDate(rsvtnInfo.lastRsvtnDtm, 'yyyy-MM-dd HH:mm:ss', 'yyyy년 MM월 dd일(EE) HH시 mm분', ''), '-')}
											</td>
										</tr>
										<tr>	
											<th scope="row">요청사항</th>
											<td>
												<jsp:scriptlet>
													pageContext.setAttribute("crlf", "\r\n");
													pageContext.setAttribute("lf", "\n");
													pageContext.setAttribute("cr", "\r");
												</jsp:scriptlet>
												${fn:replace(fn:replace(rsvtnInfo.reqn, ' ', '&nbsp;'), crlf, '<br />')}
											</td>
										</tr>
										<tr>	
											<th scope="row">예약현황</th>
											<td>
												${rsvtnInfo.rsvtnPrcsStts}
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<jsp:useBean id="now" class="java.util.Date" />
							
							<fmt:formatDate var="nowDt" value="${now}" pattern="yyyyMMdd" />
							
							<c:set var="lastRsvtnDt" value="${egov:convertDate(rsvtnInfo.lastRsvtnDtm, 'yyyy-MM-dd HH:mm:ss', 'yyyyMMdd', '')}" />
	
							<div class="mt30 taR">
								<c:if test="${(rsvtnInfo.prcsCd gt 0 and rsvtnInfo.prcsCd lt 4) and (empty lastRsvtnDt or nowDt lt lastRsvtnDt)}">
									<a  href="javascript:" id="submitLink" class="btnRed wide">예약 취소하기</a>
									<input type="submit" value="전송" style="display:none;" />
								</c:if>
								<a class="btnRed2" href="./list.do">목록</a>
							</div>
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
							
						   	<c:if test="${(rsvtnInfo.prcsCd gt 0 and rsvtnInfo.prcsCd lt 4) and (empty lastRsvtnDt or nowDt lt lastRsvtnDt)}">
								jQuery(document).ready(function(){
								
									jQuery("#frm").validation({
										msg : {
								            confirm : "본 공연에 대한 예약을 취소하시겠습니까?"
								        },
								        loadingbar : {
											use : true
										}
									});
									
									jQuery("#submitLink").on("click", function(e){
										<c:choose>
											<c:when test="${not empty lastRsvtnDt and nowDt ge egov:addDay(lastRsvtnDt, -3)}">
												alert("예약일 3일전에는 취소가 불가합니다.\n컨텍센터 1588-8511로 문의 바랍니다.");
												return;
											</c:when>
											<c:otherwise>
												//기본이벤트 제거
												e.preventDefault();
												
												jQuery("input[name='rsvtnSeq']").val("${rsvtnInfo.rsvtnSeq}");
											    
											    jQuery("input[type='submit']").trigger("click");
											</c:otherwise>
										</c:choose>
									});
								});
							</c:if>
							
						//]]>
						</script>