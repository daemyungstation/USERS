<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
							
						<c:set var="nProdCnt" value="0" />
						
						<c:set var="cProdCnt" value="0" />
							
						<div class="scrollX">
							<div class="boradType7">
								<table summary="" class="type1">
									<caption></caption>
									<colgroup>
										<col width="150px">
										<col width="145px">
										<col width="225px">
										<col width="160px">
										<col width="140px">
										<col width="130px">
										<col width="100px">
									</colgroup>
									<tbody>
										<tr>
											<th>회원번호</th>
											<th>상품구분</th>
											<th>상품명</th>
											<th>가입일자</th>
											<th>납입회차</th>
											<th>가입상태</th>
											<th>계약담당자</th>
										</tr>
										<c:if test="${fn:length(joinPrdctList) eq 0}">
											<tr>
												<td colspan="7" style="text-align:center"><fmt:message key="common.nodata.msg" /></td>
											</tr>
										</c:if>
										<c:forEach var="list" items="${joinPrdctList}" varStatus="status">
											<tr>
												<td>${list.accntNo}</td>
												<td>
													<c:choose>
														<c:when test="${list.prodCl eq '01'}">
															상조
															<c:set var="nProdCnt" value="${nProdCnt + 1}" />
														</c:when>
														<c:when test="${list.prodCl eq '03'}">
															상조결합
															<c:set var="cProdCnt" value="${cProdCnt + 1}" />
														</c:when>
													</c:choose>
												</td>
												<td>${list.prodNm}</td>
												<td>${egov:convertDate(list.joinDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</td>
												<td>${list.trueCnt}회차</td>
												<td>${list.accStat}</td>
												<td>${list.empleNm}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<p class="widthScbg"></p>
						</div>
						
						<c:if test="${nProdCnt gt 0}">
							<p class="titTxt mt60">기본상품 양도양수 안내</p>

							<ul class="dotBox2 mt15">
								<li>회원은 상조서비스를 받을 수 있는 회원으로서의 지위를 회사의 동의를 얻어 타인에게 양도할 수 있습니다.</li>
								<li>회원의 지위가 양도된 경우 새로운 회원이 된 양수인은 회원으로서의 권리와 의무를 승계합니다.</li>
								<li>회사는 회원 지위의 양도∙명의 변경에 대하여 수수료를 부과하지 않습니다.</li>
								<li class="txt mt20"><strong>[ 구비서류 안내 ]</strong></li>
								<li>양도인 서류 : 회원신분증사본, 인감증명서</li>
								<li>양수인 서류 : 회원신분증사본, 양도양수신청서 <a href="/cmm/fms/FileDown.do?fileId=FILE_000000000000000&fileSn=0" class="red" style="text-decoration:underline">( 내려받기 )</a>, CMS 출금이체 통장사본</li>
							</ul>
						</c:if>

						<c:if test="${cProdCnt gt 0}">
							<p class="titTxt mt60">결합상품 양도양수 안내</p>
	
							<ul class="dotBox2 mt15">
								<li>회원은 <span class="red">결합상품</span>의 구매만을 위하여 본 계약을 체결할 수 없음에 동의하였기 때문에, 36회차 이내에 상조서비스를 제외한 본 계약만을 타인에게 양도할 수 없습니다.</li>
								<li>결합상품은 납입회차가 36회차 이내에는 양도·양수를 할 수 없습니다.</li>
								<li class="txt mt20 red">※ 예외 : 회원 본인사망 등 회사가 인정한 부득이한 경우에 한하여 36회차(완납 전)중에라도 상조서비스 계약과 함께 본 계약을 양도할 수 있습니다. <br />이 경우 양수인은 신용정보 심사상 적격자이어야 합니다.</li>
								<li class="txt mt20"><strong>[ 구비서류 안내 ]</strong></li>
								<li>양도인 서류 : 양도인신분증사본, 양도인서명날인</li>
								<li>양수인 서류 : 양수인신분증사본, 양수인서명날인, 양수인계좌사본, 양도양수신청서 <a href="/cmm/fms/FileDown.do?fileId=FILE_000000000000001&fileSn=0" class="red" style="text-decoration:underline">( 내려받기 )</a></li>
							</ul>
						</c:if>

						<div class="warnBox mt40">
							※ 양수양도 신청은 컨택센터 (1588-8511) 로 문의해 주시기 바랍니다. (운영시간 09시~18시)
						</div>
						
						<script type="text/javascript">
						//<![CDATA[
						           
						//]]>
						</script>