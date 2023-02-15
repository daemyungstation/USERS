<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
							
						<c:set var="memInfo" value="${rtnMap.memInfo}" />
						
						<c:set var="userInfo" value="${rtnMap.userInfo}" />
						
						<c:set var="prdctInfo" value="${rtnMap.prdctInfo}" />
							
						<p class="titTxt">회원정보</p>
						
						<div class="boardType2 mt15">
							<table summary="">
								<caption></caption>
								<colgroup>
									<col width="20%" />
									<col width="80%" />
								</colgroup>
								<tbody>
									<tr>	
										<th scope="row">회원이름</th>
										<td>${memInfo.memNm}</td>
									</tr>
									<tr>	
										<th scope="row">상품명</th>
										<td>${memInfo.prodNm}</td>
									</tr>
									<tr>	
										<th scope="row">회원번호</th>
										<td>${memInfo.accntNo}</td>
									</tr>
									<tr>	
										<th scope="row">가입일자</th>
										<td>${egov:convertDate(memInfo.joinDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</td>
									</tr>
									<tr>	
										<th scope="row">생년월일</th>
										<td>${egov:convertDate(memInfo.brthMonDay, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</td>
									</tr>
									<tr>	
										<th scope="row">연락처</th>
										<td>${memInfo.cell}</td>
									</tr>
									<tr>	
										<th scope="row">이메일</th>
										<td>${userInfo.memEmail}</td>
									</tr>
								</tbody>
							</table>
						</div>

						<p class="titTxt mt60">사용자 정보 </p>
						<div class="boardType2 mt15">
							<table summary="">
								<caption></caption>
								<colgroup>
									<col width="20%" />
									<col width="80%" />
								</colgroup>
								<tbody>
									<tr>	
										<th scope="row">사용자 이름</th>
										<td>${userInfo.userNm}</td>
									</tr>
									<tr>	
										<th scope="row">회원과의 관계</th>
										<td>${userInfo.userRelNm}</td>
									</tr>
									<tr>	
										<th scope="row">연락처</th>
										<td>${userInfo.userCtel}</td>
									</tr>
									<tr>	
										<th scope="row">서비스 사용<br />요청일</th>
										<td>${egov:convertDate(userInfo.prdctUseReqnDt, 'yyyyMMdd', 'yyyy-MM-dd', '')}</td>
									</tr>
									<tr>	
										<th scope="row">이메일</th>
										<td>${userInfo.userEmail}</td>
									</tr>
									<tr>	
										<th scope="row">요청사항</th>
										<td>
											<jsp:scriptlet>
												pageContext.setAttribute("crlf", "\r\n");
												pageContext.setAttribute("lf", "\n");
												pageContext.setAttribute("cr", "\r");
											</jsp:scriptlet>
											${fn:replace(fn:replace(userInfo.reqnCntn, ' ', '&nbsp;'), crlf, '<br />')}
										</td>
									</tr>
								</tbody>
							</table>
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
											<strong><fmt:formatNumber value="${memInfo.prodAmt - (memInfo.trueAmt + memInfo.relatAmt + memInfo.addAmt) - userInfo.itmdtPay}" type="number" maxFractionDigits="0" />원</strong> 
											/ 
											<fmt:formatNumber value="${memInfo.exprNo - memInfo.trueCnt}" type="number" maxFractionDigits="0" />회
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<ul class="dotBox2 mt15">
							<li class="tit2">대명 라이프웨이 전환 서비스는 상조 서비스 미사용 고객에 한하여 제공되는 서비스입니다.<br />제공되는 서비스 중 하나를 선택하여 이용하실 수 있습니다.</li>
							<li class="tit mt30">꼭 확인해 주세요! </li>
							<li>전환서비스는 상조계약을 종료하고 선택하신 전환서비스를 이용할 수 있는 서비스이며, 잔여금을 일시로 완납 후 이용이 가능합니다.</li>
							<li>아래의 페이지에서 확인하신 내용 외에는 별도의 상품 변경은 어려우시며, 만약 제공서비스 외에 추가서비스를 원하실 경우, 신청접수 이후 제공업체 담당자와 상담 시 진행해 주시면 됩니다.</li>
						</ul>
						
						<div class="csConDiv">
							${prdctInfo.prdctCntn}
						</div>
						
						<c:if test="${not empty prdctInfo.prdctDtlNm}">
							<div class="boxTxt mt35">
								<strong>추가정보 선택</strong> : ${prdctInfo.prdctDtlNm}&nbsp;&nbsp;
								<c:choose>
									<c:when test="${not empty userInfo.link}">
										<a href="javascript:setPopup('${userInfo.link}', 'prdctDtlInfo', 910, 700);" class="whtBt">상세보기</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:selectPrdctDtlInfo('${userInfo.prdctDtlSeq}')" class="whtBt">상세보기</a>
									</c:otherwise>
								</c:choose>
							</div>
							
							<form name="popFrm" method="post" action="">
								<input type="hidden" name="prdctDtlSeq" value="" />
							</form>	
						</c:if>

						<div class="mt20 taR">
							<a href="./list.do" class="prvBt"><img src="/common/images/btn/prvpage_bt.gif" title="이전" alt="" /></a>
						</div>
						
							
						<script type="text/javascript">
						//<![CDATA[
						           
							jQuery(document).ready(function(){
								jQuery(".csConDiv").show();
								
								jQuery(".csConDiv .subSelDiv .selUnit").hide();
								jQuery(".csConDiv .subSelDiv .selUnit").eq(0).show();
								
								jQuery(".csConDiv .subSelDiv .subSel").each(function(k){
									jQuery(this).css("left", 90 * k);
								});
								
								jQuery(".csConDiv .subSelDiv .subSel").on("click", function(){
									jQuery(this).parent(".subSelDiv").find(".subSel").not(this).removeClass("on");
									
									jQuery(this).addClass("on");
									
									jQuery(this).parent(".subSelDiv").find(".selUnit").hide();
									
									jQuery(this).next().show();
								});
							});
							
							function selectPrdctDtlInfo(prdctDtlSeq)
						   	{
						    	var popupNm = "prdctDtlInfo";
						    	
						    	setPopup("", popupNm, 995, 700);
						    	
						    	var f = document.popFrm;
						    	
						    	f.action = "/change-service/dtl-info.do";
						    	f.target = popupNm;
						    	f.prdctDtlSeq.value = prdctDtlSeq;
						    	f.submit();
						   	}

							//]]>
						</script>