<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
							
						<c:choose>
							<c:when test="${fn:length(rtnMap.list) eq 0}">
								<div class="noCpro mt30">
									목록이 없습니다.
								</div>
							</c:when>
							<c:otherwise>
								<ul class="performRe">
									<c:forEach var="list" items="${rtnMap.list}" varStatus="status">
										<li>
											<p class="img">
												<c:choose>
													<c:when test="${list.pfmcGb eq 'dscnt'}">
														<span class="type1">할인공연</span>
													</c:when>
													<c:when test="${list.pfmcGb eq 'free'}">
														<span class="type2">무료공연</span>
													</c:when>
												</c:choose>
												<c:if test="${not empty list.atchFileId}">
													<img src="/cmm/fms/getImage.do?fileId=${list.atchFileId}&fileSn=0" alt="" width="250px" />
												</c:if>
											</p>
											<div class="txt">
												<p class="tit">${list.pfmcNm}</p>
												<p class="dot"><strong>장소</strong> : ${list.plce}</p>
												<p class="dot"><strong>출연</strong> : ${list.cast}</p>
												<p class="dot"><strong>관람등급</strong> : ${list.vwngGrd}</p>
												<p class="dot"><strong>제작</strong> : ${list.prdcCo}</p>
												<p class="dot"><strong>공연기간</strong> : ${egov:convertDate(list.pfmcStrtDt, 'yyyyMMdd', 'yyyy년 MM월 dd일(EE)', '')} ~ ${egov:convertDate(list.pfmcEndDt, 'yyyyMMdd', 'yyyy년 MM월 dd일(EE)', '')}</p>
												<p class="dot"><strong>공연시간</strong> : ${list.pfmcTime}</p>
												<p class="dot"><strong>티켓정가</strong> : ${list.tcktPrc}</p>
												<p class="dot"><strong>회원혜택</strong> : ${list.dscntPct}</p>
												<p class="dot"><strong>예매방법</strong> : ${list.rsvtnMns}</p>
												<p class="dot"><strong>주의사항</strong> : ${list.prctn}</p>
											
												<c:if test="${list.pfmcGb eq 'free'}">
													<c:choose>
														<c:when test="${list.rsvtnCnt eq 0}">
															<p class="check">본 공연은 예약이 마감되었습니다.</p>
														</c:when>
														<c:otherwise>
															<div class="selectDiv">
																<select name="accntNo" title="회원번호">
																	<option value="">회원번호를 선택해 주세요</option>
																	<c:forEach var="memList" items="${rtnMap.memList}" varStatus="status"> 
																		<option value="${memList.accntNo}">${memList.accntNo}</option>
																	</c:forEach>
																</select>
																<a href="javascript:" class="btn333" onclick="getPfmcRsvtn(this, '${list.pfmcSeq}');">예약접수</a>
															</div>
														</c:otherwise>
													</c:choose> 
												</c:if>	
											</div>
										</li>
									</c:forEach>
								</ul>
							</c:otherwise>						
						</c:choose>	
						
						<dl class="dotBox">
							<dt>[무료 공연 예약 전 필수 안내 사항]</dt>
							<dd>일주일 이전 예약만 가능하며, 조기 매진될 수 있습니다.</dd>
							<dd>다구좌 회원의 경우, 동일일시에 복수좌석 예매는 불가합니다. (동일날짜 별도 회차는 가능)</dd>
							<dd>법인회원에게는 제공되지 않습니다.</dd>
							<dd>공연시간 (공연 시간 15 분 전까지 입장 완료)을 엄수하셔야 하며, 지각 등 개인사정에 따른 교환 /환불은 불가합니다.</dd>
							<dd>좌석은 지정석이며, 예매 순서에 따라 배정됩니다 .</dd>
							<dd>예약일시 3일전까지 취소가 가능합니다. 2일전 취소는 불가하며 혜택을 사용한 것으로 간주합니다.</dd>
						</dl>
						
						<form name="frm" method="post" action="">
							<input type="hidden" name="pfmcSeq" value="" />
							<input type="hidden" name="accntNo" value="" />
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
						           
						    //공연 예약하기
							function getPfmcRsvtn(obj, pfmcSeq)
							{
								var accntNo = jQuery(obj).prev().val();
								
								if(!accntNo)
								{
									alert("* 회원번호를 선택해 주세요.");
									jQuery(obj).prev().focus();
									return;
								}
								
								var f = document.frm;
								
								f.action = "./write.do";
								f.pfmcSeq.value = pfmcSeq;
								f.accntNo.value = accntNo;
								f.submit();
							}
						    
						//]]>
						</script>