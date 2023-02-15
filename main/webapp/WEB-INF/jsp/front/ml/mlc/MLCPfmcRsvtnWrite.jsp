<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

						<c:set var="pfmcInfo" value="${rtnMap.pfmcInfo}" />

						<ul class="performRe">
							<li>
								<p class="img">
									<span class="type2">무료공연</span>
									<c:if test="${not empty pfmcInfo.atchFileId}">
										<img src="/cmm/fms/getImage.do?fileId=${pfmcInfo.atchFileId}&fileSn=0" alt="" width="250px" height="360px" />
									</c:if>
								</p>

								<div class="txt">
									<p class="tit">${pfmcInfo.pfmcNm}</p>
									<p class="dot"><strong>장소</strong> : ${pfmcInfo.plce}</p>
									<p class="dot"><strong>출연</strong> : ${pfmcInfo.cast}</p>
									<p class="dot"><strong>관람등급</strong> : ${pfmcInfo.vwngGrd}</p>
									<p class="dot"><strong>제작</strong> : ${pfmcInfo.prdcCo}</p>
									<p class="dot"><strong>공연기간</strong> : 
										${egov:convertDate(pfmcInfo.pfmcStrtDt, 'yyyyMMdd', 'yyyy년 MM월 dd일(EE)', '')} ~ ${egov:convertDate(pfmcInfo.pfmcEndDt, 'yyyyMMdd', 'yyyy년 MM월 dd일(EE)', '')}
									</p>
									<p class="dot"><strong>공연시간</strong> : ${pfmcInfo.pfmcTime}</p>
									<p class="dot"><strong>티켓정가</strong> : ${pfmcInfo.tcktPrc}</p>
									<p class="dot"><strong>회원혜택</strong> : ${pfmcInfo.dscntPct}</p>
									<p class="dot"><strong>예매방법</strong> : ${pfmcInfo.rsvtnMns}</p>
									<p class="dot"><strong>주의사항</strong> : ${pfmcInfo.prctn}</p>
								</div>
							</li>
						</ul>
						
						<form id="frm" method="post" action="./insert.do">
							<input type="hidden" name="csrfPreventionSalt" value="${csrfPreventionSalt}" class="notRequired" />
							
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
											<td>${rtnMap.accntNo}</td>
										</tr>
										<tr>	
											<th scope="row">공연명</th>
											<td>${pfmcInfo.pfmcNm}</td>
										</tr>
										<tr>	
											<th scope="row">관람인원</th>
											<td>
												<select name="seatCnt" class="inputType3 numberChk" title="관람인원">
													<option value="">선택</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
												</select>
												명 (본인포함 최대 4명)
											</td>
										</tr>
										<tr>	
											<th scope="row">관람좌석</th>
											<td>
												<select name="seatGb" class="inputType3" title="관람좌석">
													<option value="">선택</option>
													<c:if test="${pfmcInfo.seatRUseYn eq 'Y'}">
														<option value="R">R석</option>
													</c:if>
													<c:if test="${pfmcInfo.seatSUseYn eq 'Y'}">
														<option value="S">S석</option>
													</c:if>
													<c:if test="${pfmcInfo.seatAUseYn eq 'Y'}">
														<option value="A">A석</option>
													</c:if>
												</select>
											</td>
										</tr>
										<tr>	
											<th scope="row">예약일시</th>
											<td>
												<strong>1순위</strong>
												<select name="fstRsvtnDtmSeq" class="inputType1" title="예약일시 1순위">
													<option value="">선택</option>
													<c:forEach var="list" items="${rtnMap.rsvtnDtm}" varStatus="status">
														<option value="${list.rsvtnDtmSeq}">${egov:convertDate(list.rsvtnDtm, 'yyyy-MM-dd HH:mm:ss', 'yyyy년 MM월 dd일(EE) HH시 mm분', '')}</option>
													</c:forEach>
												</select>&nbsp;&nbsp;&nbsp;
												<span class="displayC">
													<strong>2순위</strong>
													<select name="secnRsvtnDtmSeq" class="inputType1" title="예약일시 2순위">
														<option value="">선택</option>
														<c:forEach var="list" items="${rtnMap.rsvtnDtm}" varStatus="status">
															<option value="${list.rsvtnDtmSeq}">${egov:convertDate(list.rsvtnDtm, 'yyyy-MM-dd HH:mm:ss', 'yyyy년 MM월 dd일(EE) HH시 mm분', '')}</option>
														</c:forEach>
													</select>
												</span>
											</td>
										</tr>
										<tr>	
											<th scope="row">요청사항</th>
											<td>
												<textarea class="inputType4 notRequired" name="reqn" style="height:90px;" title="요청사항"></textarea>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

							<dl class="dotBox mt20">
								<dd>일주일 이전 예약만 가능하며, 조기 매진될 수 있습니다.</dd>
								<dd>다구좌 회원의 경우, 동일일시에 복수좌석 예매는 불가합니다. (동일날짜 별도 회차는 가능)</dd>
								<dd>법인회원에게는 제공되지 않습니다.</dd>
								<dd>공연시간 (공연 시간 15 분 전까지 입장 완료)을 엄수하셔야 하며, 지각 등 개인사정에 따른 교환 / 환불은 불가합니다.</dd>
								<dd>좌석은 지정석이며, 예매 순서에 따라 배정됩니다.</dd>
								<dd>예약일시 3일전까지 취소가 가능합니다. 2일전 취소는 불가하며 혜택을 사용한 것으로 간주합니다.</dd>
							</dl>
	
							<div class="warnBox mt10">
								예약변경은 취소 후 다시 신청해주세요. 예약 취소는 예약일시 3일전까지 <a href="/my-lifeway/performance/particular/list.do" class="red"><strong>[예약정보 확인]</strong></a>에서 취소가 가능합니다.  
							</div>
	
							<div class="mt30 taR">
								<a href="javascript:" id="submitLink" class="btnRed">예약접수</a>
								<a href="javascript:" id="btnCancel" class="btnRed2">취소</a>
								<input type="submit" value="전송" style="display:none;" />
							</div>
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
						           
							jQuery(document).ready(function(){
								
								jQuery("#frm").validation({
									msg : {
							            confirm : "접수하시겠습니까?"
							        },
							        loadingbar : {
										use : true
									}
								});
								
								jQuery("#submitLink").on("click", function(e){
									//기본이벤트 제거
									e.preventDefault();
								    
								    jQuery("input[type='submit']").trigger("click");
								});
								
								//취소
								jQuery("#btnCancel").on("click", function(){
									if(confirm("취소할 경우 작성한 글은 모두 삭제됩니다.\n취소하시겠습니까?"))
									{
										window.location.reload();
									}
								});
							});
							
						//]]>
						</script>