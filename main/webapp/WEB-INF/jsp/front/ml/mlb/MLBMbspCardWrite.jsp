<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<c:set var="mbspInfo" value="${rtnMap.mbspInfo}" />
						
						<c:set var="ocbInfo" value="${rtnMap.ocbInfo}" />
						
						<c:set var="agreementForThirdParty" value="${rtnMap.agreementForThirdParty}" />
						
						<c:choose>
							<c:when test="${empty mbspInfo.resortNo}">
								<div class="noCpro mt30">
									본 상품은 멤버십 카드 서비스에 해당되지 않습니다. <br />관련 문의는 컨택센터(1588-8511)로 문의해주시기 바랍니다.
								</div>
							</c:when>
							<c:otherwise>
								<p class="memCardTxt"><strong>${mbspInfo.memNm}(${mbspInfo.accntNo})님</strong>의 멤버십카드 정보 (최종발급일자: ${egov:convertDate(mbspInfo.joinDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy년 MM월 dd일', '')})</p>
								<div class="memCardImg mt35">
									<div class="cardImg3">
										<p class="name">${mbspInfo.memNm}</p>
										<p class="number">${mbspInfo.accntNo}</p>
									</div>
									<div class="cardImg4">
										<p class="barName">리조트 우대번호</p>
										<p id="mbspCard" class="barCode" style="margin:auto"></p>
										<p class="number">${mbspInfo.resortNo}</p>
									</div>
									<c:if test="${not empty ocbInfo}">
										<div class="cardImg4">
											<p class="barName">OK 캐쉬백</p>
											<p id="ocbCard" class="barCode" style="margin:auto"></p>
											<p class="number">${ocbInfo.ocbCd}</p>
										</div>
									</c:if>
									<p class="noti">※ <span class="bold">카드</span>와 함께 <span class="bold">신분증 지참은 필수</span>이며, 미지참 시 우대 혜택이 적용되지 않습니다.</p>
								</div>
								<div class="cardAddBtn">
									<!-- 2017-06-30 버튼 추가 -->
									<c:choose>
										<c:when test="${rtnMap.agreementForThirdParty eq 'Y'}">
											<a href="https://www.sonohotelsresorts.com/mv.dp/dmparse.dm?menuCd=5560000" class="btnGry btnResort mobNone btnResortY" target="_blank">소노호텔&리조트 예약하기</a>
										</c:when>
										<c:otherwise>
											<a href="/my-lifeway/member/resortagree/index.do" class="btnGry btnResort mobNone" onclick="alert('대명리조트 예약을 위해서는 개인정보 제 3자 제공에 동의하셔야 합니다.\n나의 라이프웨이 리조트 객실 예약을 위한 (주)대명레저산업 개인정보 제공동의페이지로 이동합니다.');">대명리조트 예약하기</a>
										</c:otherwise>
									</c:choose>
									<!-- 2017-06-30 버튼 추가 -->
									<a href="javascript:" class="btnGry cardBtn2">즐겨찾기 추가</a>
									<a href="javascript:" class="btnGry cardBtn2">JPG 이미지 다운로드</a>
								</div>
								<div class="memCard mt60">
									<c:if test="${not empty ocbInfo}">
										<dl class="type1">
											<dt>OK 캐쉬백 안내</dt>
											<dd>
												OK 캐쉬백 카드번호를 <a href="http://www.okcashbag.com" target="_blank" class="bold red"><strong>[OK 캐쉬백 사이트]</strong></a>에서 등록해야 사용이 가능합니다. (PC만 가능)&nbsp;&nbsp;&nbsp;
												<a href="javascript:" id="btnGuidePop" title="새창열림" class="situ1">OK캐쉬백 등록방법</a>
											</dd>
											<dd>
												OK 캐쉬백 사이트에서 카드등록 후 
												<a href="https://www.onestore.co.kr/userpoc/apps/view?pid=0000140580" target="_blank"><span>[OK 캐쉬백 즐거움이 포인트다]</span></a> 
												<strong>애플리케이션</strong>을 이용하시면 더욱 편리합니다.
											</dd>
											<dd><strong>OK 캐쉬백 카드 재발급 후에는 이미지를 재다운로드</strong> 받으셔야 저장된 이미지로 사용이 가능합니다.</dd>
										</dl>
									</c:if>
									<dl class="type1 <c:if test="${not empty ocbInfo}">mt30</c:if>">
										<dt>안내사항</dt>
										<dd>
											회원님의 멤버십카드 내에 기재된 회원번호와 리조트 우대번호 (바코드)확인이 가능합니다.
											&nbsp;&nbsp;&nbsp;
											<a class="situ1" href="/membership-service/contentsid/227/index.do" target="_blank">혜택 상세보기</a>
										</dd>
										<dd>상단의 멤버십카드와 리조트 우대번호 (바코드)로 이용이 가능한 서비스 항목을 안내드립니다.</dd>
										<dd>본 모바일 카드는 2016년 5월자로 리뉴얼된 카드 이미지를 담고 있습니다. 실제 사용에는 리뉴얼 전 카드와 병행 사용이 가능합니다.</dd>
										<dd>카드와 함께 신분증 지참은 필수이며, 미지참 시, 우대 혜택이 적용되지 않습니다.</dd>
									</dl>
									<dl class="type2">
										<dt>리조트 우대번호(바코드)</dt>
										<dd>- 전국 소노호텔&리조트 객실 체크인 시</dd>
										<dd>- 오션월드 및 소노호텔&리조트 워터파크, 비발디파크 스키 등 부대시설 할인 적용 시
										<dd>* 객실 예약의 경우, 개인정보 제3자 제공에 미동의 시 서비스 이용에 제한이 있을 수 있습니다.&nbsp;&nbsp;&nbsp;<a href="/my-lifeway/member/personal-data-change/index.do" class="situ1">개인정보 변경</a></dd>
									</dl>
								</div>
								<div class="warnBox mt40">멤버십 카드는 2017년 3월 1일부로 실물 카드를 발행하지 않습니다. 모바일 카드를 활용하여 주십시오.</div>
							</c:otherwise>
						</c:choose>
<%-- 						
						<!--script type="text/javascript" src="/common/js/html2canvas.js"></script-->
--%>						
						<script type="text/javascript" src="/common/js/canvas.js"></script>
						<script type="text/javascript">
						//<![CDATA[
						           
							jQuery(document).ready(function(){
								setBarCode("${mbspInfo.resortNo}", "code128", jQuery("#mbspCard"));
								
								setBarCode("${ocbInfo.ocbCd}", "code128", jQuery("#ocbCard"));
								
								jQuery("#btnGuidePop").on("click", function(){
									setPopup("/membership-service/okcashbag/guide.do", "ocbGudiePop", 685, 800);
								});
								
								jQuery(".cardBtn1").on("click", function(e){
									var bookmarkUrl = window.location.href;
									var bookmarkTit = document.title
									var triggerDeft = false;
									
									if(window.sidebar && window.sidebar.addPanel)
									{
										// Firefox version < 23
										window.sidebar.addPanel(bookmarkTit, bookmarkUrl, "");
									}
									else if((window.sidebar && (navigator.userAgent.toLowerCase().indexOf("firefox") > -1)) || (window.opera && window.print))
									{
										// Firefox version >= 23 and Opera Hotlist
										jQuery(this).attr({
											href : bookmarkUrl
											, title : bookmarkTit
											, rel : "sidebar"
										}).off(e);
										
										triggerDeft = true;
									}
									else if (window.external && ("AddFavorite" in window.external)) 
									{
										// IE Favorite
							            window.external.AddFavorite(bookmarkUrl, bookmarkTit);
									}
									else 
									{
										// WebKit - Safari/Chrome
										alert((navigator.userAgent.toLowerCase().indexOf("mac") != -1 ? "Cmd" : "Ctrl") + "+D 키를 눌러 즐겨찾기에 등록하실 수 있습니다.");
									}
									
									return triggerDeft;
								});
								
								jQuery(".cardBtn2").on("click", function(){
									html2canvas(jQuery(".memCardImg"), {
										letterRendering : true,
										background : "#fff",
										useCORS : true,
									    onrendered: function(canvas) {
									    	if (typeof FlashCanvas != "undefined") {
									            FlashCanvas.initElement(canvas);
									        }
									    	
											jQuery.post("./canvas.ajax",
												{
													"data" : canvas.toDataURL("image/png")
												},
												function(r) 
												{
													var filename = r.filename;
													
													if(filename)
													{
														location.href = "/cmm/" + filename +"/download.do?csrfPreventionSalt="+r.csrfPreventionSalt;
													}
												}
											).fail(function () {
												alert("예기치 않은 오류입니다.");
											});
									    },
									});
								});

								// pc , mobile 리조트 예약 버튼 링크 변경 
								var filter = "win16|win32|win64|mac|macintel"; 
								
								if ( navigator.platform ) { 
									if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
										//mobile
										jQuery(".btnResortY").attr("href", "http://m.daemyungresort.com/#/MCA0022_login/MOP0058_reserve_room_cyber");
									} else { 
										//pc
										jQuery(".btnResortY").attr("href", "https://www.sonohotelsresorts.com/mv.dp/dmparse.dm?menuCd=5560000");
									}
								}

							});

						//]]>
						</script>