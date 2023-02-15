<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<jsp:useBean id="now" class="java.util.Date" />
						
						<c:set var="memInfo" value="${rtnMap.memInfo}" />
						
						<form id="frm" method="post" action="./agree.do">
							<p class="joinTxt taC"><img src="/common/images/txt/change_service_txt1.gif" alt="회원 및 사용자 정보 확인 " /></p>
	
							<p class="titTxt mt40">회원정보</p>
	
							<div class="boardType2 mt15">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="20%" />
										<col width="80%" />
									</colgroup>
									<tbody id="memTbody">
										<tr>	
											<th scope="row"><span>회원이름</span></th>
											<td>${memInfo.memNm}</td>
										</tr>
										<tr>	
											<th scope="row"><span>상품명</span></th>
											<td>${memInfo.prodNm}</td>
										</tr>
										<tr>	
											<th scope="row"><span>회원번호</span></th>
											<td>${memInfo.accntNo}</td>
										</tr>
										<tr>	
											<th scope="row"><span>가입일자</span></th>
											<td>${egov:convertDate(memInfo.joinDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</td>
										</tr>
										<tr>	
											<th scope="row"><span>생년월일</span></th>
											<td>${egov:convertDate(memInfo.brthMonDay, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</td>
										</tr>
										<tr>	
											<th scope="row"><span>연락처</span></th>
											<td>${memInfo.cell}</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">이메일</span></th>
											<td>
												<input type="text" name="memEmail" value="${memInfo.email}" title="이메일" class="inputType1 emailChk" maxlength="40" />
											</td>
										</tr>
									</tbody>
								</table>
								<p class="red mt10" style="font-size:13px;">※ 전환서비스 신청 완료 시, 입력된 메일로 안내문이 발송됩니다. (정확하게 입력해주시기 바랍니다.)</p>
							</div>
	
							<p class="titTxt mt55">
								사용자 정보&nbsp;&nbsp;&nbsp;
								<span class="addTxt">
									<input type="checkbox" id="userInfo" name="userInfo" class="checkbox notRequired" />
									<label for="userInfo">회원정보와 동일함</label>
								</span>
							</p>
							<div class="boardType2 mt15">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="20%" />
										<col width="80%" />
									</colgroup>
									<tbody id="userTbody">
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">사용자 이름</span></th>
											<td><input type="text" name="userNm" value="" title="사용자 이름" class="inputType1" maxlength="25" /></td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">회원과의 관계</span></th>
											<td>
												<select name="userRelCd" class="inputType1" title="회원과의 관계 선택">
													<option value="">선택하세요</option>
													<c:forEach var="list" items="${rtnMap.cdDtlList.memRelGb}" varStatus="status">
														<option value="${list.cd}">${list.cdNm}</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>	
											<th scope="row"><span>연락처</span></th>
											<td>
												<input type="text" name="userCtel" value="" title="연락처" class="inputType1 mobileChk notRequired" maxlength="13" />
											</td>
										</tr>
										<tr>	
											<th scope="row"><span class="essen" title="필수입력">서비스 사용<br />요청일</span></th>
											<td>
												<fmt:formatDate var="curntYr" value="${now}" pattern="yyyy" />
												<select id="prdctUseReqnYr" name="prdctUseReqnYr" class="inputType3 " title="서비스 사용 요청년">
													<option value="${curntYr}">${curntYr}</option>
													<option value="${curntYr+1}">${curntYr+1}</option>
												</select>
												년&nbsp;&nbsp;
												<select id="prdctUseReqnMm" name="prdctUseReqnMm" class="inputType3" title="서비스 사용 요청월">
													<c:forEach var="i" begin="1" end="12" step="1">
														<c:choose>
															<c:when test="${i <10}">
																<option value="0${i}">0${i}</option>
															</c:when>
															<c:otherwise>
																<option value="${i}">${i}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
												월&nbsp;&nbsp;
												<select id="prdctUseReqnDay" name="prdctUseReqnDay" class="inputType3" title="서비스 사용 요청일">
													<c:forEach var="i" begin="1" end="31" step="1">
														<c:choose>
															<c:when test="${i <10}">
																<option value="0${i}">0${i}</option>
															</c:when>
															<c:otherwise>
																<option value="${i}">${i}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
												일&nbsp;&nbsp;&nbsp;
												Ex) 예식일, 여행 출발일, 배송요청일, 충전일 등
											</td>
										</tr>
										<tr>	
											<th scope="row"><span>이메일</span></th>
											<td>
												<input type="text" name="userEmail" value="" title="이메일" class="inputType1 emailChk notRequired" maxlength="40" />
											</td>
										</tr>
										<tr>	
											<th scope="row"><span>요청사항</span></th>
											<td>
												<textarea name="reqnCntn" title="요청사항" class="inputType4 notRequired" style="height:90px" placeholder="연락가능한 시간, 이용(출발)지역 등 요청사항을 적어주세요."></textarea>
											</td>
										</tr>
									</tbody>
								</table>
								<p class="red mt10" style="font-size:13px;">※ 사용자 정보는 원할한 서비스 제공을 위하여 수집되며, 입력하신 정보로 상담전화를 드립니다.</p>
								<p class="red mt10" style="font-size:13px;">※ 선택입력이 가능하며, 미입력 시 회원 연락처로 상담문의가 진행됩니다.</p>
								<p class="red mt10" style="font-size:13px;">※ 제공서비스 업체 및 서비스 내용이 변경될 수 있으며, 제휴사정에 따라 제공이 어려울 수 있습니다.</p>
							</div>
	
							<p class="titTxt mt55">상품정보 </p>
							<div class="boardType2 mt15">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="20%" />
										<col width="80%" />
									</colgroup>
									<tbody>
										<tr>	
											<th scope="row">상품금액 (계약금액)</th>
											<td><fmt:formatNumber value="${memInfo.prodAmt}" type="number" maxFractionDigits="0" />원</td>
										</tr>
										<tr>	
											<th scope="row">납입한 금액 / 회차</th>
											<td>
												<fmt:formatNumber value="${memInfo.trueAmt + memInfo.relatAmt + memInfo.addAmt}" type="number" maxFractionDigits="0" />원 
												/ 
												${memInfo.trueCnt}회
											</td>
										</tr>
										<tr>	
											<th scope="row">잔여 금액 / 회차</th>
											<td>
												<strong><fmt:formatNumber value="${memInfo.prodAmt - (memInfo.trueAmt + memInfo.relatAmt + memInfo.addAmt)}" type="number" maxFractionDigits="0" />원</strong> 
												/ 
												<fmt:formatNumber value="${memInfo.exprNo - memInfo.trueCnt}" type="number" maxFractionDigits="0" />회
											</td>
										</tr>
									</tbody>
								</table>
								<p class="red mt10" style="font-size:13px;">※ 전환서비스는 잔여금액 완납 시 이용이 가능합니다.</p>
							</div>
	
							<div class="mt30 taC">
								<a href="javaascript:" id="submitLink" class="btnRed wide">본인 및 사용자 회원정보에 관한 내용을 확인하였습니다.&nbsp; &rarr;</a>
								<input type="submit" value="전송" style="display:none;" />
							</div>
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
						           
							jQuery(document).ready(function(){
								//유효성 체크
								jQuery("#frm").validation({
									customfunc : function(obj, id) {
							        	if("prdctUseReqnDay" == id)
							        	{
							        		var curntDt = "<fmt:formatDate value='${now}' pattern='yyyyMMdd' />";
							        		var prdctUseReqnDt = jQuery("#prdctUseReqnYr").val() + jQuery("#prdctUseReqnMm").val() + jQuery("#prdctUseReqnDay").val();
							        		
							        		if(curntDt > prdctUseReqnDt)
							        		{
							        			alert("상품 사용 요청일이 현재일보다 작을 수 없습니다.");
							        			jQuery(obj).focus();
							        			return false;
							        		}
							        	}
							        }
								});
								
								jQuery("#submitLink").on("click", function(e){
									//기본이벤트 제거
									e.preventDefault();

									jQuery("input[type='submit']").trigger("click");
								});
								
								jQuery("#userInfo").on("click", function(e){
									if(jQuery(this).is(":checked"))
									{
										jQuery("input[name='userNm']").val("${memInfo.memNm}");
										jQuery("select[name='userRelCd']").val("01");
										jQuery("input[name='userCtel']").val("${memInfo.cell}");
										jQuery("input[name='userEmail']").val("${memInfo.email}");
									}
									else
									{
										jQuery("input[name='userNm']").val("");
										jQuery("select[name='userRelCd']").val("");
										jQuery("input[name='userCtel']").val("");
										jQuery("input[name='userEmail']").val("");
									}
								});
							});
						           
						//]]>
						</script>