<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
		

		<style>	
			html { -webkit-text-size-adjus: none; }
				
			#wrap {-webkit-overflow-scrolling: touch !important; overflow:auto;}				
				
			.popBody { width: 1000px !important; color:#333 !important;}
			#memCert, #damageCert {position:relative; overflow:hidden; margin-top:40px}
			#memCert h1, #damageCert h1 {margin-bottom: 15px; color:#222 !important; border: 1px solid #bbb; padding: 3px 0; text-align:center;}
			
			#prdctDesc, #refundList {overflow:hidden; font-size:12px;}
			#prdctDesc h2, #refundList h2 {font-size: 16px; text-align:center; background-color: #CAC8C3; padding: 5px; }
				
			#damageCert {margin-bottom: 15px;}
			#damageCert table td { height: 38px; }
						
			#refundList table th, #refundList table td {font-size:10px; text-align:center; padding:0 !important}						
			#refundList #lists td {vertical-align:top; }
			#refundList #lists td table td {padding: 0 !important;}
									
						
			table {width: 100%; border:1px solid #000; border-collapse : collapse; }
			table tr th {padding: 5px 0; border: 1px solid #777; text-align:center;}			
			table tr td { padding: 2px 0; padding-left: 10px; border: 1px solid #777; }
			.bg { color:#fff; background-color: #999;}
			.bg2 { color:#000; background-color: #F1EFE7;}
			.bg3 { background-color:#F7F7F7}
			
			.tit1 { margin-bottom:3px; padding: 3px 0 3px 15px; font-weight:bold;}
			.borderNon {border:none}
			.boderTopNon { border-top:none !important;}
			.boderBottomNon { border-bottom:none !important;}
			.boderLeftNon { border-left:none !important;}
			.boderRightNon { border-right:none !important;}
			.borderColor { border: 1px solid #777; }
			.theight1 {height:490px;}
			.theight2 {height:70px;}
			.theight3 {height:176px;}
			.theight4 {height:85px;}
							
			.txt1 { text-align:center; margin: 25px 0; line-height: 20px; }
			.txt2 { overflow:hidden; margin-bottom: 10px;}
			.txt3 {float:left; padding-left: 10px; line-height: 25px; border-left: 3px solid #8E8D8D}
			
			.space1 {display:inline-block; width:28px;}
			.space2 {display:inline-block; width:36px;}
			.space3 {display:inline-block; width:12px;}
			.space4 {display:inline-block; width:7px;}
			.space5 {display:inline-block; width:25px;}
			
			#stamp {position:absolute; width:200px; top: -18px; right:0;}
			#stamp2 {position:absolute; width:200px; bottom: 20px; right:0;}
			
			@media print {				
				#wrap {-webkit-overflow-scrolling: touch !important;}
				
				#popup { background:none;}
				.popHead {display:none;}
				.popBody {width:710px !important; margin:0 !important; padding-bottom:0 !important; border:none !important; font-size: 8px; line-height: 12px;}
										
				#close { display: none}
				.printBt {display: none}
				.page { page-break-before: always; padding-top: 8px; }
				
				#memCert, #damageCert {overflow:hidden; margin-top:0; }
				#memCert h1, #damageCert h1 {font-size:12px; margin-bottom: 5px; padding: 2px 0;}
				#damageCert h1 {margin-bottom: 3px;}
				
				#prdctDesc, #refundList {font-size:10px !important; letter-spacing: -1px; }
				#prdctDesc h2, #refundList h2 {font-size: 10px; padding: 2px; }				
				
				table tr th {padding: 2px 0; }
				
				.theight1 {height:380px;}
				.theight2 {height:50px;}
				.theight3 {height:160px;}
				.theight4 {height:90px;}

				.txt1 { margin: 5px 0; line-height: 14px; }
				.txt2 img {width: 110px }
				.txt3 {line-height: 15px; }
				
				#damageCert table td { height: 16px; }
				
				.space1 {display:inline-block; width:20px;}
				.space2 {display:inline-block; width:26px;}
				.space3 {display:inline-block; width:8px;}
				.space4 {display:inline-block; width:5px;}
				.space5 {display:inline-block; width:18px;}
				
				#stamp {position:absolute; width:150px; top: -18px; right:0;}
				#stamp2 {position:absolute; width:150px; bottom: 0px; right:0;}
			}
		</style>
	
		<c:set var="info" value="${rtnMap.joinCert}" />
		<c:set var="desc" value="${rtnMap.prdctDesc}" />

		<c:set var="joinDt" value="${egov:convertDate(info.joinDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}" />
		<c:set var="arrCell" value="${fn:split(info.cell, '-')}" />
		
		<c:forEach var="cell" items="${arrCell}" varStatus="status">		
			<c:if test="${status.count == 1}"><c:set var="cell1" value="${cell}" /></c:if>
			<c:if test="${status.count == 2}"><c:set var="cell2" value="${cell}" /></c:if>
			<c:if test="${status.count == 3}"><c:set var="cell3" value="${cell}" /></c:if>
		</c:forEach>
		
		<c:set var="resnstdInfoMap1" value="${rtnMap.resnstdInfoMap1}" />
		<c:set var="resnstdInfoMap2" value="${rtnMap.resnstdInfoMap2}" />
		<c:set var="resnstdInfoMap3" value="${rtnMap.resnstdInfoMap3}" />
		<c:set var="resnstdInfoMap4" value="${rtnMap.resnstdInfoMap4}" />
		<c:set var="resnstdInfoMap5" value="${rtnMap.resnstdInfoMap5}" />
		<c:set var="resnstdInfoMap6" value="${rtnMap.resnstdInfoMap6}" />
		<c:set var="resnstdInfoMap7" value="${rtnMap.resnstdInfoMap7}" />
		
		<c:set var="mpa" value="0" />
		
			<div id="wrap" >
				<div class="popHead">
					회원증서
					<a href="javascript:self.close();" id="close"><img src="/common/images/popup/popup_xbt.gif" alt=""></a>
				</div>

				<div class="popBody">
					<div class="privacyDiv">	
						<p class="printBt">
							<a href="javascript: printWindow();" class="whtBt">프린트</a>
						</p>
					</div>
								
					<div id="memCert">
						<h1>회&nbsp;원&nbsp;증&nbsp;서(계약서)</h1>

						<p class="bg taL tit1">□ 기본정보</p>
						<table style="margin-bottom:3px;">
							<colgroup>
								<col width="12%" />
								<col width="38%" />
								<col width="12%" />
								<col width="38%" />
							</colgroup>
							<tr>
								<th class="bg2">회 원 번 호</th>
								<td>${info.accntNo}</td>
								<th class="bg2">가 입 일 자</th>
								<td>${fn:replace(joinDt, "-","/")}</td>
								
							</tr>
							<tr>
								<th class="bg2">계&nbsp;&nbsp;&nbsp;약&nbsp;&nbsp;&nbsp;자</th>
								<td>${info.memNm}</td>
								<th class="bg2">연&nbsp;&nbsp;&nbsp;락&nbsp;&nbsp;&nbsp;처</th>
								<td>${cell1}-${cell2}-****</td>
							</tr>
							<tr>
								<th class="bg2">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
								<td colspan="3">${info.homeAddr} ${info.homeAddr2}</td>
							</tr>
						</table>
						
						<div style="overflow:hidden; margin-bottom:3px;">
							<div style="float:left; width:49.8%">
								<p class="bg taL tit1">□ 상품정보1</p>
								<table>
									<colgroup>
										<col width="12%" />
										<col width="38%" />
									</colgroup>
									<tr>
										<th class="bg2">상&nbsp;&nbsp;&nbsp;품&nbsp;&nbsp;&nbsp;명</th>
										<td>${info.prodNm}</td>
									</tr>
									<tr>
										<th class="bg2">상 품 금 액</th>
										<td>
											<fmt:formatNumber value="${info.prodAmt}" type="number"/>원
											<c:if test="${info.payType eq '002'}">
											
												<c:choose>
													<c:when test="${info.alltAmt3 eq null}">
													(실납입금액 : <fmt:formatNumber value="${info.prodAmt - ((info.endNo1 - info.stNo1 + 1) * info.alltAmt1)}" type="number"/>원)														
													</c:when>
													<c:otherwise>
													(실납입금액 : <fmt:formatNumber value="${info.prodAmt - (((info.endNo1 - info.stNo1 + 1) * info.alltAmt1) + ((info.endNo2 - info.stNo2 + 1) * info.alltAmt))}" type="number"/>원)
													</c:otherwise>
												</c:choose>											
											</c:if>
										</td>
									</tr>
									<tr>
										<th class="bg2">회차별납입액</th>
										<td>
											<fmt:formatNumber value="${info.monPayAmt}" type="number"/>
											<c:if test="${info.payType eq '002'}">
											
												<c:choose>
													<c:when test="${info.alltAmt3 eq null}">
													(스페셜 할인 : <fmt:formatNumber value="${info.alltAmt1}" type="number" />원 * ${info.endNo1 - info.stNo1 + 1}회)														
													</c:when>
													<c:otherwise>
													(스페셜 할인 : <fmt:formatNumber value="${info.alltAmt1}" type="number" />원 * ${info.endNo1 - info.stNo1 + 1}회, <fmt:formatNumber value="${info.alltAmt2}" type="number" />원 * ${info.endNo2 - info.stNo2 + 1}회)
													</c:otherwise>
												</c:choose>
											
											</c:if>
											
										</td>
									</tr>
									<tr>
										<th class="bg2">만 기 회 차</th>
										<td>${info.exprNo}회</td>
									</tr>
								</table>
							</div>
							
							<div style="float:right; width:49.8%">
								<p class="bg taL tit1">□ 상품정보2</p>
								<table>
									<colgroup>
										<col width="12%" />
										<col width="38%" />
									</colgroup>
									<tr>
										<th class="bg2">상&nbsp;&nbsp;&nbsp;품&nbsp;&nbsp;&nbsp;명</th>
										<td>${info.prodModel}</td>
									</tr>
									<tr>
										<th class="bg2">계약금액</th>
										<td>
											<c:if test="${info.payType eq '002'}">
											
												<c:choose>
													<c:when test="${info.alltAmt3 eq null}">
													할부원금 : <fmt:formatNumber value="${((info.endNo1 - info.stNo1 + 1) * (info.alltAmt1 + info.addAmt1))}" type="number"/>원(VAT포함)														
													</c:when>
													<c:otherwise>
													할부원금 : <fmt:formatNumber value="${(((info.endNo1 - info.stNo1 + 1) * (info.alltAmt1 + info.addAmt1)) + ((info.endNo2 - info.stNo2 + 1) * (info.alltAmt2 + info.addAmt2)))}" type="number"/>원(VAT포함)
													</c:otherwise>
												</c:choose>											
											</c:if>
										</td>
									</tr>
									<tr>
										<th class="bg2">월납입금</th>
										<td>
											<c:if test="${info.payType eq '002'}">											
												<c:choose>
													<c:when test="${info.alltAmt3 eq null}">
													월<fmt:formatNumber value="${info.alltAmt1 + info.addAmt1}" type="number" />원 * ${info.endNo1 - info.stNo1 + 1}회														
													</c:when>
													<c:otherwise>
													월<fmt:formatNumber value="${info.alltAmt1 + info.addAmt1}" type="number" />원 * ${info.endNo1 - info.stNo1 + 1}회, <fmt:formatNumber value="${info.alltAmt2 + info.addAmt2}" type="number" />원 * ${info.endNo2 - info.stNo2 + 1}회
													</c:otherwise>
												</c:choose>											
											</c:if>
										</td>
									</tr>
									<tr>
										<th class="bg2">계약유형</th>
										<td>
											<c:if test="${info.payType eq '002'}">
												<c:choose>
													<c:when test="${info.prodCd eq 'FV' || info.prodCd eq 'FX' || info.prodCd eq 'HA' || info.prodCd eq 'HC'}">
														구매 및 사용 계약
													</c:when>
													<c:when test="${info.prodCd eq 'GQ' || info.prodCd eq 'HX'}">
														DL포인트 구매 및 사용 계약
													</c:when>
													<c:when test="${info.prodCd eq 'KJ'}">
														일시불 구매계약
													</c:when>
													<c:when test="${info.prodCd eq 'LI'}">
														구매 및 선할인 계약
													</c:when>
													<c:when test="${info.prodCd eq 'LJ' || info.prodCd eq 'LK'}">
														구매 및 충전 계약
													</c:when>
													<c:when test="${info.prodCd eq 'NA' || info.prodCd eq 'NC'}">
														구매 및 사용 계약
													</c:when>
													<c:when test="${info.joinType eq '0001'}">
														<c:choose>
															<c:when test="${info.alltAmt3 eq null}">
															${info.endNo1 - info.stNo1 + 1}														
															</c:when>
															<c:otherwise>
															${(info.endNo1 - info.stNo1 + 1) + info.endNo2 - info.stNo2 + 1}
															</c:otherwise>
														</c:choose>
														개월 할부매매계약(무이자)
													</c:when>
													<c:when test="${info.joinType eq '0002' && info.joinGiftCardSort eq '0001'}">
														이용구매계약
													</c:when>
													<c:when test="${info.joinType eq '0002' && info.joinGiftCardSort eq '0002'}">
														할부이자율 : 무이자
													</c:when>
													<c:when test="${info.joinType eq '0002' && info.joinGiftCardSort eq '0003'}">
														구매 및 충전 계약
													</c:when>
												</c:choose>
											</c:if>
										</td>
									</tr>
								</table>
							</div>
						</div>
						
						<p class="bg taL tit1 clearB">□ 결제정보</p>
						<c:if test="${info.bankNm ne null}">
						<table>
							<colgroup>
								<col width="130px" />
								<col width="17%" />
								<col width="130px" />
								<col width="17%" />
								<col width="130px" />
								<col width="17%" />
							</colgroup>
							<tr>
								<th class="bg2">납입방법</th>
								<td>은행</td>
								<th class="bg2">회원명</th>
								<td>${info.memNm}</td>
								<th class="bg2">은행명</th>
								<td>${info.bankNm}</td>
							</tr>
							<tr>
								<th class="bg2">계좌번호</th>
								<td>${fn:substring(info.bankAccntNo, 0, 8)}******</td>
								<th class="bg2">결제일자</th>
								<td>${info.ichaeDt}일</td>
								<th>&nbsp;</th>
								<td>&nbsp;</td>
							</tr>
						</table>							
						</c:if>
						
						<c:if test="${info.cardCd ne null}">
						<table>
							<colgroup>
								<col width="130px" />
								<col width="17%" />
								<col width="130px" />
								<col width="17%" />
								<col width="130px" />
								<col width="17%" />
							</colgroup>
							<tr>
								<th class="bg2">납입방법</th>
								<td>카드</td>
								<th class="bg2">회원명</th>
								<td>${info.memNm}</td>
								<th class="bg2">카드사</th>
								<td>${info.cardNm}</td>
							</tr>
							<tr>
								<th class="bg2">카드번호</th>
								<td>${fn:substring(info.cardNo, 0, 8)}******</td>
								<th class="bg2">결제일자</th>
								<td>${info.payDt}일</td>
								<th>&nbsp;</th>
								<td>&nbsp;</td>
							</tr>
						</table>						
						</c:if>
					</div>

					<div class="txt1" >
						<p>우리회사는 계약자와 해당약관에 의하여 부금상품 계약을 체결하고 그 증거로 이 증서를 드립니다.</p>
						<p>본 회원은 (주)대명스테이션의 회원임을 증명합니다.</p>
						<p style="margin-top: 5px;">${egov:convertDate(info.joinDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy', '')}년&nbsp;&nbsp; 
													${egov:convertDate(info.joinDt, 'yyyy-MM-dd HH:mm:ss', 'MM', '')}월&nbsp;&nbsp; 
													${egov:convertDate(info.joinDt, 'yyyy-MM-dd HH:mm:ss', 'dd', '')}일</p>
					</div>

					<div style="position:relative;">
						<div class="txt2" style="">
							<p style="float:left; margin-right: 30px"><img src="/common/images/logo.gif" width="180" alt=""></p>
							<div class="txt3" style="">
								<p>컨택센터 : 1588-8511 &nbsp;&nbsp;&nbsp;&nbsp; 24시 장례접수 : 1588-2227&nbsp;www.daemyungimready.com</p>
								<p>우) 06035 서울특별시 강남구 강남대로624, 14층(신사동, 아이씨티타워)</p>
							</div>
						</div>
						<img src="/common/images/icon/stamp.png" id="stamp" style="" />
					</div>
					
					
					
					<div id="prdctDesc">
						<h2 style="margin-bottom:3px;">${info.prodNm} 상품 설명서</h2>
								
						<div style="overflow:hidden; margin-bottom:3px;">
						<!-- 상조 가입회원 상품 설명서 -->
						<c:if test="${info.mainContract eq '01' or info.mainContract eq NULL}">
							<div style="float:left;width:49.8%;">
								<table class="theight1" >
									<tr>
										<th colspan="3" class="bg3" style="height:15px;">의전서비스</th>
									</tr>
									<tr>
										<td rowspan="2">관</td>
										<td>매장</td>
										<td>${desc.coffin1 }</td>
									</tr>
									<tr>
										<td>화장/탈관</td>
										<td>${desc.coffin2 }</td>
									</tr>
				
									<tr>
										<td rowspan="2">수의</td>
										<td>${desc.shroudM1}</td>
										<td>${desc.shroudD1}</td>
									</tr>
									<tr>
										<td>${desc.shroudM2}</td>
										<td>${desc.shroudD2}</td>
									</tr>
				
									<tr>
										<td rowspan="2" colspan="2">입관/수시용품<br>(종교별 규격폼 제공)</td>
										<td>${desc.coffinGds1}</td>
									</tr>
									<tr>						
										<td>${desc.coffinGds2}</td>
									</tr>
				
									<tr>
										<td rowspan="2" colspan="2">빈소/기타용품<br>(필요량 일체제공 및 대여)</td>
										<td>${desc.mortuaryGds1}</td>
									</tr>
									<tr>						
										<td>${desc.mortuaryGds2}</td>
									</tr>
				
									<tr>
										<td colspan="2">차량</td>
										<td style="padding:0;">
											
											<table class="borderNon">
												<tr>
													<td class="boderTopNon boderLeftNon">이송차량</td>
													<td class="boderTopNon boderRightNon">${desc.car1}</td>
												</tr>
												<tr>
													<td class="boderLeftNon">리무진</td>
													<td class="boderRightNon">${desc.car2}</td>
												</tr>
												<tr>
													<td class="boderBottomNon boderLeftNon">유족버스</td>
													<td class="boderBottomNon boderRightNon">${desc.car3}</td>
												</tr>
											</table>
										</td>
									</tr>
				
									<tr>
										<td rowspan="3">제단<br>장식</td>
										<td>${desc.flowerM1}</td>
										<td>${desc.flowerD1}</td>
									</tr>
									<tr>
										<td>${desc.flowerM2}</td>
										<td>${desc.flowerD2}</td>
									</tr>
									<tr>
										<td>${desc.flowerM3}</td>
										<td>${desc.flowerD3}</td>
									</tr>
				
									<tr>
										<td colspan="2">의전용품</td>
										<td style="padding:0;">
											
											<table class="borderNon">
												<tr>
													<td class="boderTopNon boderLeftNon">현대식</td>
													<td class="boderTopNon boderRightNon">${desc.funeralClothes1}</td>
												</tr>
												<tr>
													<td rowspan="2" class="boderLeftNon boderBottomNon">전통식</td>
													<td class="boderRightNon">${desc.funeralClothes2}</td>
												</tr>
												<tr>
													<td class="boderBottomNon boderRightNon">${desc.funeralClothes3}</td>
												</tr>
											</table>
										</td>
									</tr>
				
									<tr>
										<td rowspan="3">인력</td>
										<td>${desc.helperM1}</td>
										<td>${desc.helperD1}</td>
									</tr>
									<tr>
										<td>${desc.helperM2}</td>
										<td>${desc.helperD2}</td>
									</tr>
									<tr>
										<td>${desc.helperM3}</td>
										<td>${desc.helperD3}</td>
									</tr>
				
									<tr>
										<td colspan="2">${desc.etc}</td>
										<td>${desc.etcVal}</td>
									</tr>
								</table>
							</div>
				 		</c:if>
                        <!-- 해외여행시 상품 설명서 -->
                        <c:if test="${info.mainContract eq '02'}">
                            <div style="float:left;width:49.8%;">
                                <table class="theight1">
                                    <tr>
                                        <th colspan="2" class="bg3" style="height:15px;">해외여행서비스</th>
                                    </tr>
                                    <tr>
                                        <td>기본조건</td>
                                        <td>
                                            인원 : 1-2명<br>
                                            기간 : 5일<br>
                                            여행지 : 동남아,아시아<br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>제공서비스</td>
                                        <td>
                                            항공 : 국제선 왕복 항공료 (지역별 항공사 상이)<br>
                                            숙박 : 호텔/리조트 3성급 이상 / 풀빌라+일반호텔 결합 (전 일정 숙박 포함)<br>
                                            식사 : 전 일정 식사 포함 (※패키지 관광일 시)<br>
                                            관광 : 관광 및 차량 포함 (※패키지 관광일 시)<br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>케어 서비스</td>
                                        <td>
                                            인솔자 : 여행전문 인솔자 1명 동행 (최소 출발 인원 35명 이상)<br>
                                            가이드 : 각 지역별 현지 전문 베테랑 가이드 배정<br>
                                            보험 : 여행자 보험 필수 제공 (상품별 보험사 상이)<br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>기타사항</td>
                                        <td>
                                            ▣ 불포함사항 : 유류할증료 및 TAX, 기사/가이드 경비, 객실 업그레이드 비용, 비행기 업그레이드 비용, 기타 공동경비<br>
                                            ▣ 특별사항 : 성수기 및 극성수기 기간에는 포함 내역이 변경될 수 있음<br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비자
                                            발급 필수 지역은 발급 비용이 별도 청구될 수 있음<br>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </c:if>
                        <!-- 크루즈시 상품 설명서 -->
                        <c:if test="${info.mainContract eq '03'}">
                            <div style="float:left;width:49.8%;">
                                <table class="theight1">
                                    <tr>
                                        <th colspan="2" class="bg3" style="height:15px;">크루즈서비스</th>
                                    </tr>
                                    <tr>
                                        <td>기본조건</td>
                                        <td>
                                            인원 : 1-2명<br>
                                            여행지 : 동남아,아시아<br>
                                            선박사 : 로얄캐리비언, 코스타, 프린세스, MSC, 홍콩 겐팅 등<br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>제공서비스</td>
                                        <td>
                                            크루즈 : 내측 캐빈 (2인1실)<br>
                                            항공 : 국제선 왕복 항공료 (크루즈 출항지가 해외일 경우)<br>
                                            숙박 : 전 일정 크루즈 숙박 포함<br>
                                            식사 : 전 일정 식사 포함<br>
                                            관광 : 출/도착지 및 기항지 관광 포함<br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>케어 서비스</td>
                                        <td>
                                            인솔자 : 크루즈 전문 인솔자 1명 동행 (최소 출발 인원 16명 이상)<br>
                                            가이드 : 각 지역별 현지 전문 베테랑 가이드 배정<br>
                                            보험 : 여행자 보험 필수 제공 (상품별 보험사 상이)<br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>기타사항</td>
                                        <td>
                                            ▣ 불포함사항 : 유류할증료 및 TAX, 승조원 경비, 객실 업그레이드 비용, 현지숙박비용, 독실료, 비행기 업그레이드 비용, 기타 공동경비<br>
                                            ▣ 특별사항 : 성수기 및 극성수기 기간에는 포함 내역이 변경될 수 있음<br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비자
                                            발급 필수 지역은 발급 비용이 별도 청구될 수 있음<br>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </c:if>
                        <!-- 골프 상품 설명서 -->
                        <c:if test="${info.mainContract eq '04'}">
                            <div style="float:left;width:49.8%;">
                                <table class="theight1">
                                    <tr>
                                        <th colspan="2" class="bg3" style="height:15px;">골프서비스</th>
                                    </tr>
                                    <tr>
                                        <td>기본조건</td>
                                        <td>
                                            사용 시 잔여 부금 완납 후 D골프클럽 모바일 카드 일괄 충전 제공
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>제공서비스</td>
                                        <td>
                                            골프장 : 비발디파크 CC, 소노페리체 CC, 델피노 CC, 비발디9 GC<br>
                                            골프연습장 : 소노펠리체 Par3, 비발디파크 골프연습장<br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>케어 서비스</td>
                                        <td>
                                            전화, 인터넷, 모바일 선착순 예약<br>
                                            (※ 4주전 해당일 오전 9시부터 예약 가능<br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>기타사항</td>
                                        <td>
                                            ▣ 사용 가능 내역 :<br>
                                            1) 카트피<br>
                                            2) 골프클럽 대여비용<br>
                                            3) 갤러리 피 및 일반 그린피<br>
                                            ▣ 사용 불가 내역 :<br>
                                            1) 캐디피<br>
                                            (※ 라운딩 종료 후 담당 캐디에게 직접 지급)<br>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </c:if>
							<div style="float:right; width:49.8%">
								<table class="theight1" >
									<tr>
										<th class="bg3" style="height:15px;">토탈라이프 서비스</th>
									</tr>
									<tr>
										<td style="vertical-align:top; line-height: 13px">
											${desc.termsSvc}											
										</td>
									</tr>
								</table>
							</div>												
						</div>		
				
						<div style="overflow:hidden; margin-bottom:5px;">
							<div style="float:left;width:49.8%;">
								<p style="margin-bottom:7px">[이용관련 참조사항]</p>
								<!-- 상조가입 회원일때만 노출 -->
								<c:if test="${info.mainContract eq '01' or info.mainContract eq NULL}">
									<p style="margin-bottom:5px;">▣ 장의상품 상세정보</p>
									<div class="borderColor theight2" >
										${desc.termsDtl}
									</div>
								</c:if>
								
								<p style="margin-bottom:5px;">▣ 소비자 유의사항</p>
								<!-- 상조시 소비자 유의사항 -->
								<c:if test="${info.mainContract eq '01' or info.mainContract eq NULL}">
									<div class="borderColor theight3">
										${desc.consmNt}
									</div>
								</c:if>
								<!-- 해외여행시 소비자 유의사항 -->
								<c:if test="${info.mainContract eq '02'}">
									<div class="borderColor theight3">
										● 계약체결시보다 회사가 이용운송, 숙박기관에 지급하여야 할 요금이 5%이상 증가하거나 여행요금에 적용된 외화환율이 2%이상 증가한 경우, 증가된 금액 범위 내에서 여행요금의 차액을 회원에게 청구할 수 있습니다.<br>
										● 회사가 정한 성수기 기간 또는 회원이 가입한 상품보다 많은 여행서비스를 이용하고자 할 경우에는 여행요금을 증액할 수 있습니다.<br>
										● 서비스 제공 사항 및 내용은 이용시기, 대내외 사정, 현지일정에 따라 변경이 될 수 있습니다.<br>
										● 가입한 상품은 하향금액 상품 및 하이브리드 서비스 이용이 불가합니다.<br>
										● 주 계약 외 서비스는 하이브리드 서비스(상조, 크루즈, 골프 등)로 변경하여 이용할 수 있습니다.<br>
										● 자세한 유의 사항은 약관을 확인하십시오.<br>
										● 고객님께서 선택하신 해외여행 서비스의 좀 더 자세한 내용은 대명아임레디 홈페이지(https://www.daemyungimready.com)에서 확인하실 수 있으며, 서비스 이용시 별도의 서면과 함께 다시 한 번 안내해드릴 예정입니다.<br>
									</div>
								</c:if>
								<!-- 크루즈시 소비자 유의사항 -->
								<c:if test="${info.mainContract eq '03'}">
									<div class="borderColor theight3">
										● 계약체결시보다 회사가 이용운송, 숙박기관에 지급하여야 할 요금이 5%이상 증가하거나 여행요금에 적용된 외화환율이 2%이상 증가한 경우, 증가된 금액 범위 내에서 여행요금의 차액을 회원에게 청구할 수 있습니다.<br>
										● 회사가 정한 성수기 기간 또는 회원이 가입한 상품보다 많은 크루즈 서비스를 이용하고자 할 경우에는 여행요금을 증액할 수 있습니다.<br>
										● 서비스 제공 사항 및 내용은 이용시기, 대내외 사정, 선사일정에 따라 변경이 될 수 있습니다.<br>
										● 가입한 상품은 하향금액 상품 및 하이브리드 서비스 이용이 불가합니다.<br>
										● 주 계약 외 서비스는 하이브리드 서비스(상조, 해외여행, 골프 등)로 변경하여 이용할 수 있습니다.<br>
										● 자세한 유의 사항은 약관을 확인하십시오.<br>
										● 고객님께서 선택하신 크루즈 여행 서비스의 좀 더 자세한 내용은 대명아임레디 홈페이지(https://www.daemyungimready.com)에서 확인하실 수 있으며, 서비스 이용시 별도의 서면과 함께 다시 한 번 안내해드릴 예정입니다.<br>
									</div>
								</c:if>
								<!-- 골프시 소비자 유의사항 -->
								<c:if test="${info.mainContract eq '04'}">
									<div class="borderColor theight3">
										● 서비스 제공 사항 및 내용은 이용시기, 대내외 사정에 따라 변경이 될 수 있습니다.<br>
										● 가입한 상품은 하향금액 상품 및 하이브리드 서비스 이용이 불가합니다.<br>
										● D골프클럽 카드는 모바일카드로만 운영 되며, 실물카드는 제공되지 않습니다.<br>
										● 충전된 모바일 카드는 충전된 시점부터 2년간 사용이 가능하며, 잔여금은 환불되지 않습니다.<br>
										● 사용처 및 이용방법(예약 등)은 대명골프클럽 홈페이지에서 확인하실 수 있습니다. <br>
										● 주 계약 외 서비스는 하이브리드 서비스(상조, 해외여행, 골프 등)로 변경하여 이용할 수 있습니다.<br>
										● 자세한 유의 사항은 약관을 확인하십시오.<br>
										● 고객님께서 선택하신 골프 서비스의 좀 더 자세한 내용은 대명아임레디 홈페이지(https://www.daemyungimready.com)에서 확인하실 수 있으며, 서비스 이용시 별도의 서면과 함께 다시 한 번 안내해드릴 예정입니다.<br>
									</div>
								</c:if>
							</div>
				
							<div style="float:right;width:49.8%;">
								<p style="margin-bottom:7px">[중요정보 고시사항]</p>
								
								<p style="margin-bottom:5px;">▣ 환급기준 및 환급시기</p>
								<div class="borderColor theight2">
									${desc.refundNt}
								</div>
				
								<p style="margin-bottom:5px;">▣ 총 고객환급의무액, 상조관련 자산 (2020년 12월말 기준)</p>
								<table>
									<tr>
										<th class="bg2">총 고객환급의무액</th>
										<td>${desc.refundAmt}</td>
									</tr>
									<tr>
										<th class="bg2">상조관련 자선</th>
										<td>${desc.asset}</td>
									</tr>
									<tr>
										<td colspan="2">* 공인회계사의 회계감사를 받았음(인덕회계법인)</td>
									</tr>									
								</table>
				
								<p style="margin-bottom:5px;">▣ 고객 불입금 관리방법</p>
								<div class="borderColor theight4" >
									${desc.consmAmtMng}
								</div>
				
							</div>
						</div>								
																
					</div>
					
					<p class="page">&nbsp;</p>
					
					<div id="damageCert">
						<h1>소비자 피해보상 증서</h1>
						
						<p class="taL tit1">□ 증서번호(회원번호) : ${info.accntNo}</p>
						
						<table>
							<colgroup>
								<col width="20%" />
								<col width="20%" />
								<col width="*" />
							</colgroup>
						
							<tr>
								<th rowspan="4" class="bg2">
									선<span class="space1">&nbsp;</span>불<span class="space1">&nbsp;</span>식<br>할 부 거 래 업 자
								</th>
								<th class="bg2">등 록 번 호</th>
								<td>서울 - 2010 - 제63호</td>
							</tr>
							<tr>
								<th class="bg2">상<span class="space2">&nbsp;</span>호</th>
								<td>(주)대명스테이션</td>
							</tr>
							<tr>
								<th class="bg2">소<span class="space3">&nbsp;</span>재<span class="space3">&nbsp;</span>지</th>
								<td>우) 06035 서울특별시 강남구 강남대로624, 14층(신사동, 아이씨티타워) (대표전화 1588-8511)</td>
							</tr>
							<tr>
								<th class="bg2">대<span class="space3">&nbsp;</span>표<span class="space3">&nbsp;</span>자</th>
								<td colspan="2">최성훈</td>
							</tr>
							<tr>
								<th class="bg2">지<span class="space4">&nbsp;</span>급<span class="space4">&nbsp;</span>의<span class="space4">&nbsp;</span>무<span class="space4">&nbsp;</span>자</th>
								<td colspan="2">상조보증공제조합</td>
							</tr>
							<tr>
								<th class="bg2">피보험자 또는 수혜자</th>
								<td colspan="2">${info.memNm}</td>
							</tr>
							<tr>
								<th class="bg2">소 비 자 피 해 보 상<br>보 험 계 약 의 종 류</th>
								<td colspan="2">공제계약</td>
							</tr>
							<tr>
								<th class="bg2">소 비 자 피 해 보 상<br>보험계약 등의 계약기간</th>
								<td colspan="2">${rtnMap.year}년 1월 1일부터 ${rtnMap.year}년 12월 31일까지(365일간)<br>※ 본계약은 상조보증공제조합과의 계약에 의해 매년 자동 갱신됩니다.</td>
							</tr>														
							<tr>
								<th class="bg2">소 비 자 피 해 보 상 금<br>지<span class="space5">&nbsp;</span>급<span class="space5">&nbsp;</span>사<span class="space5">&nbsp;</span>유</th>
								<td colspan="2">[할부거래에 관한 법률] 제 27조 제4항 각 호에 해당하는 사실이 발생한 경우</td>
							</tr>		
							<tr>
								<th class="bg2">소비자피해보상 금액</th>
								<td colspan="2">(선불식 할부거래업자가 소비자로부터 선불식할부계약과 관련되는 재화등의 대금으로서 미리 수령한 금액 - 선불식 할부거래업자가 소비자에게 공급한 재화 등의 가액) X 100분의 50</td>
							</tr>
						</table>
						
						<div class="txt1" >
							<p>[할부거래에 관한 법률] 제27조 제1항에 따라 위와 같이</p>
							<p>소비자피해보상보험계약 등을 체결하였음을 확인합니다.</p>
							<p style="margin-top: 5px;">${egov:convertDate(info.joinDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy', '')}년&nbsp;&nbsp; 
														${egov:convertDate(info.joinDt, 'yyyy-MM-dd HH:mm:ss', 'MM', '')}월&nbsp;&nbsp; 
														${egov:convertDate(info.joinDt, 'yyyy-MM-dd HH:mm:ss', 'dd', '')}일</p>
						</div>
						 
						<img src="/common/images/icon/stamp.png" id="stamp2" style="" />						
					</div>	
					
					<div id="refundList">
						<h2 style="margin-bottom:3px;">${info.prodNm} 해약환급금 및 환급율</h2>
						
						<table id="lists">
							<tr>
								<c:if test="${fn:length(resnstdInfoMap1) > 0}">
								<td>								
									<table class="borderNon">
										<colgroup>
											<col width="25px" />
											<col width="*" />
											<col width="33px" />
										</colgroup>
										<tr>								
											<th class="boderTopNon boderLeftNon bg3">회차</th>
											<td class="boderTopNon bg3">환급금</td>
											<td class="boderTopNon boderRightNon bg3">환급율</td>
										</tr>
										<c:forEach var="list" items="${resnstdInfoMap1}" varStatus="status">
											<c:set var="count" value="${status.count}" />
											<c:set var="last" value="${status.last}" />
										<tr>
											<th class="boderLeftNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if> bg3">${list.no}</th>
											<td class="<c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>"><fmt:formatNumber value="${list.resnAmt}" type="number" maxFractionDigits="0" /></td>
											<td class="boderRightNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>">
												${list.pct}
												<%-- <c:choose>
													<c:when test="${list.mpa gt 0}">
														<c:set var="mpa" value="${mpa + list.mpa}" />
														<c:choose>
															<c:when test="${mpa lt list.resnAmt}">
																100.0%
															</c:when>
															<c:otherwise>
																<fmt:formatNumber value="${egov:nvl(list.resnAmt, 0) / mpa * 100}" type="number" minFractionDigits="1" maxFractionDigits="1" />%
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														0.0 %
													</c:otherwise>
												</c:choose>
												--%>
											</td>
										</tr>	
										</c:forEach>																
									</table>
									</c:if>
								</td>
								
								<c:if test="${fn:length(resnstdInfoMap2) > 0}">
								<td>
									<table class="borderNon">
										<colgroup>
											<col width="25px" />
											<col width="*" />
											<col width="33px" />
										</colgroup>
										<tr>								
											<th class="boderTopNon boderLeftNon bg3">회차</th>
											<td class="boderTopNon bg3">환급금</td>
											<td class="boderTopNon boderRightNon bg3">환급율</td>
										</tr>
										<c:forEach var="list" items="${resnstdInfoMap2}" varStatus="status">
											<c:set var="count" value="${status.count}" />
											<c:set var="last" value="${status.last}" />
											
										<tr>
											<th class="boderLeftNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if> bg3">${list.no}</th>
											<td class="<c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>"><fmt:formatNumber value="${list.resnAmt}" type="number" maxFractionDigits="0" /></td>
											<td class="boderRightNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>">
												${list.pct}
												<%-- 
												<c:choose>
													<c:when test="${list.mpa gt 0}">
														<c:set var="mpa" value="${mpa + list.mpa}" />
														<c:choose>
															<c:when test="${mpa lt list.mpa}">
																100.0%
															</c:when>
															<c:otherwise>
																<fmt:formatNumber value="${egov:nvl(list.resnAmt, 0) / mpa * 100}" type="number" minFractionDigits="1" maxFractionDigits="1" />%
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														0.0 %
													</c:otherwise>
												</c:choose>
												--%>
											</td>
										</tr>	
										</c:forEach>																
																
									</table>
								</td>
								</c:if>
								
								<c:if test="${fn:length(resnstdInfoMap3) > 0}">
								<td>
									<table class="borderNon">
										<colgroup>
											<col width="25px" />
											<col width="*" />
											<col width="33px" />
										</colgroup>
										<tr>								
											<th class="boderTopNon boderLeftNon bg3">회차</th>
											<td class="boderTopNon bg3">환급금</td>
											<td class="boderTopNon boderRightNon bg3">환급율</td>
										</tr>
										<c:forEach var="list" items="${resnstdInfoMap3}" varStatus="status">
											<c:set var="count" value="${status.count}" />
											<c:set var="last" value="${status.last}" />
										<tr>
											<th class="boderLeftNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if> bg3">${list.no}</th>
											<td class="<c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>"><fmt:formatNumber value="${list.resnAmt}" type="number" maxFractionDigits="0" /></td>
											<td class="boderRightNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>">
												${list.pct}
												<%--
												<c:choose>
													<c:when test="${list.mpa gt 0}">
														<c:set var="mpa" value="${mpa + list.mpa}" />
														<c:choose>
															<c:when test="${mpa lt list.resnAmt}">
																100.0%
															</c:when>
															<c:otherwise>
																<fmt:formatNumber value="${egov:nvl(list.resnAmt, 0) / mpa * 100}" type="number" minFractionDigits="1" maxFractionDigits="1" />%
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														0.0 %
													</c:otherwise>
												</c:choose>
												--%>
											</td>
										</tr>	
										</c:forEach>																
																
									</table>
								</td>
								</c:if>
								<c:if test="${fn:length(resnstdInfoMap4) > 0}">
								<td>
									<table class="borderNon">
										<colgroup>
											<col width="25px" />
											<col width="*" />
											<col width="33px" />
										</colgroup>
										<tr>								
											<th class="boderTopNon boderLeftNon bg3">회차</th>
											<td class="boderTopNon bg3">환급금</td>
											<td class="boderTopNon boderRightNon bg3">환급율</td>
										</tr>
										<c:forEach var="list" items="${resnstdInfoMap4}" varStatus="status">
											<c:set var="count" value="${status.count}" />
											<c:set var="last" value="${status.last}" />
										<tr>
											<th class="boderLeftNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if> bg3">${list.no}</th>
											<td class="<c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>"><fmt:formatNumber value="${list.resnAmt}" type="number" maxFractionDigits="0" /></td>
											<td class="boderRightNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>">
												${list.pct}
												<%-- 
												<c:choose>
													<c:when test="${list.mpa gt 0}">
														<c:set var="mpa" value="${mpa + list.mpa}" />
														<c:choose>
															<c:when test="${mpa lt list.resnAmt}">
																100.0%
															</c:when>
															<c:otherwise>
																<fmt:formatNumber value="${egov:nvl(list.resnAmt, 0) / mpa * 100}" type="number" minFractionDigits="1" maxFractionDigits="1" />%
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														0.0 %
													</c:otherwise>
												</c:choose>
												--%>
											</td>
										</tr>	
										</c:forEach>																
																
									</table>
								</td>
								</c:if>	
								<c:if test="${fn:length(resnstdInfoMap5) > 0}">
								<td>
									<table class="borderNon">
										<colgroup>
											<col width="25px" />
											<col width="*" />
											<col width="33px" />
										</colgroup>
										<tr>								
											<th class="boderTopNon boderLeftNon bg3">회차</th>
											<td class="boderTopNon bg3">환급금</td>
											<td class="boderTopNon boderRightNon bg3">환급율</td>
										</tr>
										<c:forEach var="list" items="${resnstdInfoMap5}" varStatus="status">
											<c:set var="count" value="${status.count}" />
											<c:set var="last" value="${status.last}" />
										<tr>
											<th class="boderLeftNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if> bg3">${list.no}</th>
											<td class="<c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>"><fmt:formatNumber value="${list.resnAmt}" type="number" maxFractionDigits="0" /></td>
											<td class="boderRightNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>">
												${list.pct}
												<%-- 
												<c:choose>
													<c:when test="${list.mpa gt 0}">
														<c:set var="mpa" value="${mpa + list.mpa}" />
														<c:choose>
															<c:when test="${mpa lt list.resnAmt}">
																100.0%
															</c:when>
															<c:otherwise>
																<fmt:formatNumber value="${egov:nvl(list.resnAmt, 0) / mpa * 100}" type="number" minFractionDigits="1" maxFractionDigits="1" />%
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														0.0 %
													</c:otherwise>
												</c:choose>
												--%>
											</td>
										</tr>	
										</c:forEach>																
																
									</table>
								</td>
								</c:if>
								<c:if test="${fn:length(resnstdInfoMap6) > 0}">
								<td>
									<table class="borderNon">
										<colgroup>
											<col width="25px" />
											<col width="*" />
											<col width="33px" />
										</colgroup>
										<tr>								
											<th class="boderTopNon boderLeftNon bg3">회차</th>
											<td class="boderTopNon bg3">환급금</td>
											<td class="boderTopNon boderRightNon bg3">환급율</td>
										</tr>
										<c:forEach var="list" items="${resnstdInfoMap6}" varStatus="status">
											<c:set var="count" value="${status.count}" />
											<c:set var="last" value="${status.last}" />
										<tr>
											<th class="boderLeftNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if> bg3">${list.no}</th>
											<td class="<c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>"><fmt:formatNumber value="${list.resnAmt}" type="number" maxFractionDigits="0" /></td>
											<td class="boderRightNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>">
												${list.pct}
												<%-- 
												<c:choose>
													<c:when test="${list.mpa gt 0}">
														<c:set var="mpa" value="${mpa + list.mpa}" />
														<c:choose>
															<c:when test="${mpa lt list.resnAmt}">
																100.0%
															</c:when>
															<c:otherwise>
																<fmt:formatNumber value="${egov:nvl(list.resnAmt, 0) / mpa * 100}" type="number" minFractionDigits="1" maxFractionDigits="1" />%
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														0.0 %
													</c:otherwise>
												</c:choose>
												--%>
											</td>
										</tr>	
										</c:forEach>																
											 					
									</table>
								</td>
								</c:if>
								<c:if test="${fn:length(resnstdInfoMap7) > 0}" >
								<td>
									<table class="borderNon">
										<colgroup>
											<col width="25px" />
											<col width="*" />
											<col width="33px" />
										</colgroup>
										<tr>								
											<th class="boderTopNon boderLeftNon bg3">회차</th>
											<td class="boderTopNon bg3">환급금</td>
											<td class="boderTopNon boderRightNon bg3">환급율</td>
										</tr>
										<c:forEach var="list" items="${resnstdInfoMap7}" varStatus="status">
											<c:set var="count" value="${status.count}" />
											<c:set var="last" value="${status.last}" />
										<tr>
											<th class="boderLeftNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if> bg3">${list.no}</th>
											<td class="<c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>"><fmt:formatNumber value="${list.resnAmt}" type="number" maxFractionDigits="0" /></td>
											<td class="boderRightNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>">
												${list.pct}
												<%--
												<c:choose>
													<c:when test="${list.mpa gt 0}">
														<c:set var="mpa" value="${mpa + list.mpa}" />
														<c:choose>
															<c:when test="${mpa lt list.resnAmt}">
																100.0%
															</c:when>
															<c:otherwise>
																<fmt:formatNumber value="${egov:nvl(list.resnAmt, 0) / mpa * 100}" type="number" minFractionDigits="1" maxFractionDigits="1" />%
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														0.0 %
													</c:otherwise>
												</c:choose>
												--%>
											</td>
										</tr>	
										</c:forEach>																
									</table>
								</td>
								</c:if>	
								<c:if test="${fn:length(resnstdInfoMap8) > 0}" >
								<td>
									<table class="borderNon">
										<colgroup>
											<col width="25px" />
											<col width="*" />
											<col width="33px" />
										</colgroup>
										<tr>								
											<th class="boderTopNon boderLeftNon bg3">회차</th>
											<td class="boderTopNon bg3">환급금</td>
											<td class="boderTopNon boderRightNon bg3">환급율</td>
										</tr>
										<c:forEach var="list" items="${resnstdInfoMap8}" varStatus="status">
											<c:set var="count" value="${status.count}" />
											<c:set var="last" value="${status.last}" />
										<tr>
											<th class="boderLeftNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if> bg3">${list.no}</th>
											<td class="<c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>"><fmt:formatNumber value="${list.resnAmt}" type="number" maxFractionDigits="0" /></td>
											<td class="boderRightNon <c:if test="${count == 32 && last eq true}">boderBottomNon</c:if>">
												${list.pct}
												<%--
												<c:choose>
													<c:when test="${list.mpa gt 0}">
														<c:set var="mpa" value="${mpa + list.mpa}" />
														<c:choose>
															<c:when test="${mpa lt list.resnAmt}">
																100.0%
															</c:when>
															<c:otherwise>
																<fmt:formatNumber value="${egov:nvl(list.resnAmt, 0) / mpa * 100}" type="number" minFractionDigits="1" maxFractionDigits="1" />%
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														0.0 %
													</c:otherwise>
												</c:choose>
												--%>
											</td>
										</tr>	
										</c:forEach>																
									</table>
								</td>
								</c:if>									
							</tr>
						</table>
						
						<div style="margin:5px 0 10px 0;">
							<p>※ 상조 실 납입액 :
							 	<c:if test="${info.stNo1 ne null}">${info.stNo1}~${info.endNo1}회차 <fmt:formatNumber value="${info.monthPayAmt1}" type="number" maxFractionDigits="0" />원</c:if>
							 	<c:if test="${info.stNo2 ne null}"> / ${info.stNo2}~${info.endNo2}회차 <fmt:formatNumber value="${info.monthPayAmt2}" type="number" maxFractionDigits="0" />원</c:if>							 	
							 	<c:if test="${info.stNo3 ne null}"> / ${info.stNo3}~${info.endNo3}회차 <fmt:formatNumber value="${info.monthPayAmt3}" type="number" maxFractionDigits="0" />원</c:if>
							</p>
							<p>
								※ 아래의 산식은 공정거래위원회 ' 상조 해약환급금 산정기준'을 나타낸 것으로, 본 상품에 대한 만기해약환급금은 ${info.exprNo}회차 만기(납입) 후 익월 1일부터 신청이 가능하며, 해약 시 납입금 누계의 100%인 <fmt:formatNumber value="${info.dcProdAmt}" type="number" maxFractionDigits="0" />원을 지급합니다.
								<c:if test="${info.payType eq '002'}">
									<c:choose>
										<c:when test="${info.alltAmt3 eq null}">
										(만기 환급금 <fmt:formatNumber value="${info.prodAmt}" type="currency" /> = 실 상조납입금 <fmt:formatNumber value="${info.prodAmt - ((info.endNo1 - info.stNo1 + 1) * info.alltAmt1)}" type="currency"/> + 만기 축하금 <fmt:formatNumber value="${((info.endNo1 - info.stNo1 + 1) * info.alltAmt1)}" type="currency"/>)														
										</c:when>
										<c:otherwise>
										(만기 환급금 <fmt:formatNumber value="${info.prodAmt}" type="currency" />
										 = 실 상조납입금 <fmt:formatNumber value="${info.prodAmt - (((info.endNo1 - info.stNo1 + 1) * info.alltAmt1) + ((info.endNo2 - info.stNo2 + 1) * info.alltAmt))}" type="currency"/>
										  + 만기 축하금 <fmt:formatNumber value="${(((info.endNo1 - info.stNo1 + 1) * info.alltAmt1) + ((info.endNo2 - info.stNo2 + 1) * info.alltAmt2))}" type="currency"/>)
										</c:otherwise>
									</c:choose>											
								</c:if>								
							</p>
						</div>
						
						<div>
							<p style="font-weight:bold; margin-bottom:3px;">[해약환급금 산식]</p>
							<table>
								<tr>
									<th class="bg3">정기형</th>
									<td style="text-align:left; padding-left: 2px !important; line-height: 12px;">${desc.refundMath1}</td>
								</tr>
								<tr>
									<th class="bg3">부정기형</th>
									<td style="text-align:left; padding: 2px 0 2px 2px !important; line-height: 12px;">${desc.refundMath2}</td>
								</tr>		
								<tr>
									<th colspan="2"  class="bg3" style="padding: 3px 0 !important;">${desc.refundMath3}</th>
								</tr>						
							</table>
						</div>						
					</div>										
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
				