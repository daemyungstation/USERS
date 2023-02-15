<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<span class="red">
							<font style="display:inline-block;">※ 가입상태가 '정상' 인 상품만 해약신청이 가능합니다. 행사/해약처리 완료된 상품 내역은 표시되지 않습니다.</font>
						</span>
						
						<div class="scrollX">
							<div class="boradType7 mt10">
								<table summary="" class="type1">
									<caption></caption>
									<colgroup>
										<col width="150px">
										<col width="180px">
										<col width="150px">
										<col width="100px">
										<col width="120px">
										<col width="120px">
										<col width="130px">
									</colgroup>
									<tbody>
										<tr>
											<th>회원번호</th>
											<th>상품명</th>
											<th>가입일자</th>
											<th>납입회차</th>
											<th>가입상태</th>
											<th>계약담당자</th>
											<th>해약환급금 표</th>
										</tr>
										<c:if test="${fn:length(joinPrdctList) eq 0}">
											<tr>
												<td colspan="7" style="text-align:center"><fmt:message key="common.nodata.msg" /></td>
											</tr>
										</c:if>
										<c:forEach var="list" items="${joinPrdctList}" varStatus="status">
											<tr>
												<td>${list.accntNo}</td>
												<td>${list.prodNm}</td>
												<td>${egov:convertDate(list.joinDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</td>
												<td>${list.trueCnt}회차</td>
												<td>${egov:decode(list.accStat, '', '정상', list.accStat)}</td>
												<td>${list.empleNm}</td>
												<td><a href="javascript:selectCnclRefndList('${list.accntNo}', '${list.trueCnt}');" class="whtBt3">상세보기</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<p class="widthScbg"></p>
						</div>

						<div class="lifeWayDiv3 noBorT mt60">
							<p class="top">
								해약신청은 컨택센터 문의를 통해서만 가능합니다.<br>중도 해약시에는 <span class="red">상조서비스 회원 약관</span>에 따라 책정된 <span class="red">환급금</span>을 돌려드리고 있습니다.
							</p>
							<p class="mid">해약신청 전에, 손해 없이 이용하실 수 있도록 다음 3가지 사항을 필독해주시기 바랍니다.</p>
							<ul class="bot">
								<li>상조서비스 외에도 다양한 전환서비스로 대체하여 이용이 가능합니다. <a href="/my-lifeway/chage-service/request/index.do" class="red">( 전환서비스 안내 바로가기 )</a></li>
								<li>대명아임레디의 만기 환급금은 납입 금액의 100%입니다. <a href="/my-lifeway/join-product-information/refund/index.do" class="red">( 환급금 조회 바로가기 )</a></li>
								<li>양도양수 과정을 통해 상품을 타인에게 양도하실 수 있습니다. <a href="/my-lifeway/service-guide/transfer-acquistion/index.do" class="red">( 양도양수 안내 바로가기 )</a></li>
							</ul>
						</div>

						<p class="titTxt mt60">해약환급금 조회 및 서류접수 안내</p>

						<ul class="dotBox2 mt15">
							<li>해약환급금 표에서 회차별 해약환급금 확인이 가능합니다. 자세한 환급금 정책은 [환급금 조회]를 확인 바랍니다.</li>
							<li>중도 해약에 대한 환급기준은 상조서비스 약관 규정에 의해 환급됩니다. (결합상품의 경우, 중도해약 시에는 지원혜택이 제공되지 않습니다.)</li>
							<li>환급금은 신청완료일로부터 3영업일 이내에 수령하실 수 있습니다. </li>
						</ul>

						<p class="titTxt mt60">필요 서류접수</p>

						<ul class="dotBox2 mt15">
							<li class="txt"><strong>[ 가입자와 예금주가 동일한 경우 ]</strong></li>
							<li>회원본인 : 해약신청서 <a href="/cmm/fms/FileDown.do?fileId=FILE_000000000000003&fileSn=0" class="red" style="text-decoration:underline">( 내려받기 )</a>, 회원신분증사본, 회원서명날인, 회원계좌사본 </li>
							<li>대리인 : 해약신청서 <a href="/cmm/fms/FileDown.do?fileId=FILE_000000000000003&fileSn=0" class="red" style="text-decoration:underline">( 내려받기 )</a>, 회원신분증사본, 회원서명날인, 대리인신분증사본, 대리인서명날인, 가족관계증명서, 대리환급확인서 <a href="/cmm/fms/FileDown.do?fileId=FILE_000000000000411&fileSn=0" class="red" style="text-decoration:underline">( 내려받기 )</a>, 대리환급동의서 <a href="	/cmm/fms/FileDown.do?fileId=FILE_000000000000007&fileSn=0" class="red" style="text-decoration:underline">( 내려받기 )</a>, 사망진단서(회원사망시) </li>
							<li class="txt mt40"><strong>[ 가입자와 예금주가 상이한 경우 ]</strong></li>
							<li>회원본인 : 해약신청서 <a href="/cmm/fms/FileDown.do?fileId=FILE_000000000000003&fileSn=0" class="red" style="text-decoration:underline">( 내려받기 )</a>, 회원신분증사본, 회원서명날인, 회원계좌사본 예금주의 동의서, 예금주의 인감증명서</li>
							<li>대리인 : 해약신청서 <a href="/cmm/fms/FileDown.do?fileId=FILE_000000000000003&fileSn=0" class="red" style="text-decoration:underline">( 내려받기 )</a>, 회원신분증사본, 회원서명날인, 대리인신분증사본, 대리인서명날인, 가족관계증명서, 대리환급확인서 <a href="/cmm/fms/FileDown.do?fileId=FILE_000000000000411&fileSn=0" class="red" style="text-decoration:underline">( 내려받기 )</a>,대리환급동의서 <a href="	/cmm/fms/FileDown.do?fileId=FILE_000000000000007&fileSn=0" class="red" style="text-decoration:underline">( 내려받기 )</a>, 사망진단서(회원사망시), 예금주의 동의서, 예금주의 인감증명서</li>
						</ul>

						<div class="warnBox mt40">
							※ 해약문의는 컨택센터 (1588-8511) 로 문의해 주시기 바랍니다.  (운영시간 09시~18시)
						</div>
						
						<form name="frm" method="post" action="./list.do">
							<input type="hidden" name="accntNo" value=""  />
							<input type="hidden" name="trueCnt" value=""  />
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
						    
							function selectCnclRefndList(accntNo, trueCnt)
							{
								var f = document.frm;
								
								f.action = "./list.do";
								f.accntNo.value = accntNo;
								f.trueCnt.value = trueCnt;
								f.submit();
							}
							
						//]]>
						</script>