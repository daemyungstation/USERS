<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
				<style>		
					.popBody { width: 1000px !important; color:#333 !important;}

					table {width: 100%; border:1px solid #777; border-collapse : collapse; }
					table tr th {padding: 5px 0; border: 1px solid #777; text-align:center;}			
					table tr td {padding-left: 5px; padding-right: 5px; border: 1px solid #777; }
					
					.borderNon {border:none}
					.boderTopNon { border-top:none !important;}
					.boderBottomNon { border-bottom:none !important;}
					.boderLeftNon { border-left:none !important;}
					.boderRightNon { border-right:none !important;}
					
					.bg { color:#fff; background-color: #999;}
					.bg2 { color:#fff; background-color: #122862;}
					.bg3 { background-color:#F7F7F7}
					
					.tit1 { margin-bottom: 5px; font-weight:bold;}
					.txt2 { overflow:hidden; margin-bottom: 10px;}
					.txt3 {float:left; padding-left: 10px; line-height: 25px; border-left: 3px solid #8E8D8D}

					.table3 tr td { padding-top: 3px; padding-bottom:3px; }
					.table5 tr td { padding-top: 10px; padding-bottom:10px; }
					.table6 tr td { padding-top: 3px; padding-bottom:3px; text-align:center;}
					
					#memCert h1  {margin-bottom: 15px; color:#222 !important; border: 1px solid #bbb; padding: 3px 0; text-align:center;}
					#memCert {position:relative; overflow:hidden; margin-top:40px}
					.bold { font-weight: bold }
					@media print {				
						#popup { background:none;}
						.popHead {display:none;}
						.popBody {width:700px !important; margin:0 !important; padding-bottom:0 !important; border:none !important; font-size: 8px; line-height: 12px;}
												
						#close { display: none}
						.printBt {display: none}
					}
				</style>
			
				<c:set var="info" value="${rtnMap.info}" />
				<c:set var="deptInfo" value="${rtnMap.deptInfo}" />
				<c:set var="productDtl" value="${rtnMap.productDtl}" />

				<div class="popHead">
					납입증명서
					<a href="javascript:self.close();" id="close"><img src="/common/images/popup/popup_xbt.gif" alt=""></a>
				</div>

				<div class="popBody">
					<div class="privacyDiv">	
						<p class="printBt">
							<a href="javascript: printWindow();" class="whtBt">프린트</a>
						</p>
					</div>

					<div id="memCert">
						<h1>납&nbsp;&nbsp;입&nbsp;&nbsp;증&nbsp;&nbsp;명&nbsp;&nbsp;서</h1>
						<table class="table3">
							<colgroup>
								<col width="10%" />
								<col width="40%" />
								<col width="10%" />
								<col width="40%" />
							</colgroup>
							<tr>
								<th colspan="2" class="bg2">회원정보</th>
								<th colspan="2" class="bg2">가입내역</th>
							</tr>
							<tr>
								<td class="bold">회원번호</td>
								<td>${info.accntNo}</td>
								<td class="bold">상품명</td>
								<td>${info.prodNm}</td>
							</tr>
							<tr>
								<td class="bold">회원명</td>								
									<c:set var="name"       value="${info.memNm}" />
									<c:set var="totalLength" value="${fn:length(name) }" />
									<c:set var="first"      value="${fn:substring(name, 0, 1) }" />
									<c:set var="last"      value="${fn:substring(name, 2, totalLength) }" />								
								<td><c:out value="${first}*${last}"/></td>
								<td class="bold">가입일자</td>
								<td>${egov:convertDate(info.joinDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy/MM/dd', '')}</td>
							</tr>
							<tr>
								<td class="bold">생년월일</td>
								<td>${egov:convertDate(info.brthMonDay, 'yyyy-MM-dd HH:mm:ss', 'yyyy/MM/dd', '')}</td>
								<td class="bold">담당자</td>
								<td>${info.empleNm}(${deptInfo.depthFullname})</td>
							</tr>
							<tr>
								<td class="bold">연락처</td>
								<td>
									<c:choose>
										<c:when test="${info.cell ne ''}">
										${fn:substring(info.cell, 0, 8)} - ****
										</c:when>
										<c:otherwise>-</c:otherwise>
									</c:choose>								
								</td>
								<td class="bold">상태</td>
								<td>${info.accStat} (${info.payStat})</td>
							</tr>
							<tr>
								<td class="bold">주소</td>
								<td colspan="3">
									<c:choose>
										<c:when test="${info.homeZip ne ''}">
										(${info.homeZip}) ${info.homeAddr} ${info.homeAddr2}
										</c:when>
										<c:otherwise>-</c:otherwise>
									</c:choose>									
								</td>
							</tr>																								
						</table>
					</div>		
					
					<div style="margin-top:10px">
						<table class="table3">
							<colgroup>
								<col width="10%" />
								<col width="20%" />
								<col width="10%" />
								<col width="20%" />
								<col width="10%" />
								<col width="20%" />
								<col width="10%" />
							</colgroup>						
							<tr>
								<th colspan="7" class="bg2">상품 기본정보</th>
							</tr>
							<tr>
								<td colspan="2" class="bold">(월) 납입액</td>
								<td colspan="5"><fmt:formatNumber value="${info.monPayAmt}" type="number" />원 [${info.exprNo}회납]</td>
							</tr>
							<tr>
								<td colspan="2" class="bold">상조부금(원)</td>
								<td colspan="2" class="bold">할부원금(원)</td>
								<td colspan="2" class="bold">추가부담금(원)</td>
								<td class="bold">특별할인(회차)</td>
							</tr>
							<tr>
								<td style="text-align:right">${info.exprNo}회</td>
								<td style="text-align:right"><fmt:formatNumber value="${info.prodAmt}" type="number" /></td>
								<td style="text-align:right">${info.endNo1}회</td>
								<td style="text-align:right"><fmt:formatNumber value="${info.endNo1 * info.alltAmt1}" type="number" /></td>
								<td style="text-align:right">
									<c:choose>
										<c:when test="${info.addAmt1 ne 0}">
										${info.endNo1}회
										</c:when>
										<c:otherwise>
										0회
										</c:otherwise>
									</c:choose>								
								</td>
								<td style="text-align:right"><fmt:formatNumber value="${info.addAmt1}" type="number" /></td>
								<td style="text-align:right">${info.prodDcCnt}</td>
							</tr>
							
							<tr>
								<td colspan="7" class="bold">납입현황</td>
							</tr>
							<tr>
								<td colspan="2" class="bold">상조부금(원)</td>
								<td colspan="2" class="bold">할부원금(원)</td>
								<td colspan="2" class="bold">추가부담금(원)</td>
								<td class="bold">특별할인(회차)</td>
							</tr>
							<tr>
								<td style="text-align:right">${info.trueCnt}회</td>
								<td style="text-align:right"><fmt:formatNumber value="${info.trueAmt}" type="number" /></td>
								<td style="text-align:right">${info.relatCnt}회</td>
								<td style="text-align:right"><fmt:formatNumber value="${info.relatAmt}" type="number" /></td>
								<td style="text-align:right">${info.addCnt}회</td>
								<td style="text-align:right"><fmt:formatNumber value="${info.addAmt}" type="number" /></td>
								<td style="text-align:right">${info.prodDcCnt}</td>
							</tr>	
							<tr>
								<td colspan="7" class="bold">잔여현황</td>
							</tr>
							<tr>
								<td colspan="2" class="bold">상조부금(원)</td>
								<td colspan="2" class="bold">할부원금(원)</td>
								<td colspan="2" class="bold">추가부담금(원)</td>
								<td class="bold">특별할인(회차)</td>
							</tr>
							<tr>
								<td style="text-align:right">${info.exprNo - info.trueCnt}회</td>
								<td style="text-align:right"><fmt:formatNumber value="${info.prodAmt - info.trueAmt}" type="number" /></td>
								<td style="text-align:right">${info.endNo1 - info.relatCnt}회</td>
								<td style="text-align:right"><fmt:formatNumber value="${info.endNo1 * info.alltAmt1 - info.relatAmt}" type="number" /></td>
								<td style="text-align:right">
									<c:choose>
										<c:when test="${info.addAmt1 ne 0}">
										${info.endNo1 - info.addCnt}회
										</c:when>
										<c:otherwise>
										0회
										</c:otherwise>
									</c:choose>								
								</td>
								<td style="text-align:right"><fmt:formatNumber value="${info.endNo1 * info.addAmt1 - info.addAmt}" type="number" /></td>
								<td style="text-align:right">${info.prodDcCnt}</td>
							</tr>														
						</table>
					</div>
					
					
					
					<div style="margin-top: 10px; margin-bottom: 15px">
						<table class="table6" >
							<colgroup>
								<col width="10%" />
								<col width="15%" />
								<col width="10%" />
								<col width="15%" />
								<col width="15%" />
								<col width="15%" />
							</colgroup>
							<tr>
								<th colspan="6">
									<c:forEach var="payday" items="${list}" end="0">
										납입내역(${egov:convertDate(payday.minPayDay, 'yyyy-MM-dd HH:mm:ss', 'yyyy/MM/dd', '')} ~ ${egov:convertDate(payday.maxPayDay, 'yyyy-MM-dd HH:mm:ss', 'yyyy/MM/dd', '')})  
									</c:forEach>
								</th>
							</tr>
							<tr>
								<th class="bg2">납입회차</th>
								<th class="bg2">납입일자</th>
								<th class="bg2">납입방법</th>
								<th class="bg2">상조납입금액(원)</th>
								<th class="bg2">결합납입금액(원)</th>
								<th class="bg2">추가부담금(원)</th>
								<!--<th colspan=2 class="bg2">특별할인(회차)</th>-->
							</tr>
							<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.no}</td>
								<td>${egov:convertDate(list.payDay, 'yyyy-MM-dd HH:mm:ss', 'yyyy/MM/dd', '')}</td>
								<td>${list.payMthd }</td>
								<td><fmt:formatNumber value="${list.trueAmt}" type="number" /></td>
								<td><fmt:formatNumber value="${list.relatAmt}" type="number" /></td>
								<td><fmt:formatNumber value="${list.addAmt}" type="number" /></td>
								<!--<td colspan=2>${list.prodDcCnt}</td>-->
							</tr>
							</c:forEach>	
							
							<c:if test="${fn:length(list) eq 0}">
							<tr>
								<td colspan="8">납입 내역이 없습니다.</td>
							</tr>
							</c:if>
						</table>
					</div>
				</div>
				
				
				<object id=factory style="display:none" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" 
					codebase="/common/smsx.cab#Version=7,7,0,20" >
				</object>
				
				<script>
					function printWindow(){
						var version = $.browser.version;
						
						if (version == 7.0 || version == 8.0 || version == 9.0 || version == 10.0 || version == 11.0){
							with ( factory.printing ) 
							{ 
								header = ''; 
								footer = ''; 
								portrait = true; // true 세로출력 , false 가로출력
								leftMargin = 0;
								rightMargin = 0; 
								topMargin = 0;
								bottomMargin = 0; 
								Print(true, window) // 첫번째 인자 : 대화상자표시여부 , 두번째인자 : 출력될 프레임
							}	
						}else{
							print();
						}
					}
				</script>
							