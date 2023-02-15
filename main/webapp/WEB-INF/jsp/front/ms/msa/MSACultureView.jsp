<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

						<div class="chngSrvHead">
							<img src="/common/images/icon/membersvr2_img1.jpg" alt="" />
							<div class="txt">
								<img src="/common/images/icon/membersrv_icon2.png" alt="" />
								<p>가입 후 회원 정상 유지기간 내 맘껏 누리는 대명아임레디 멤버십</p>
								<p class="type1">대학로 중심에 위치한 대명문화공장의 공연장 ‘DCF’에서 <br />더욱 풍성한 문화 혜택을 누리세요.</p>
							</div>
							<div class="txt3">
								<p class="type1">※행사(장례/전환) 시 가입일로부터 5년간 제공</p>
							</div>
						</div>
						<p class="mt15" style="color:#333; line-height:24px">DCF 대명문화공장은 대명그룹이 대한민국 공연 문화 발전을 위해 2014 년 3월 대학로에 오픈한 복합 엔터테인먼트 공간입니다. 406석 규모의 DCF 1관 비발디파크홀과 301석 규모의 DCF 2관 아임레디홀, 수현재씨어터 전용관으로 운영될 257석 규모의 3관, 세 개의 전문 공연장으로 운영되며 대중에게 최적화된 시설과 우수한 공연의 품질을 제공하기 위하여 각 분야에서 풍부한 경험을 갖춘 무대 전문인들을 배치하여 운영하고 있습니다.</p>
						<p class="titTxt mt60">대명 문화공장 혜택</p>
						<div class="memMap2 mt15">
							<div class="txt">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="16%" />
										<col width="42%" />
										<col width="42%" />
									</colgroup>
									<thead>
										<tr>
											<th></th>
											<th>DCF 1관 (비발디파크홀) 공연 우대</th>
											<th>DCF 2관 (아임레디홀) 공연 우대</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>우대범위</th>
											<td>최대 50% 할인 (공연별상이)<br />연 10회 (본인 포함 2인)</td>
											<td>본인 무료 관람<br />동반인 최대 40% 할인 (공연별 상이)<br />월 1회 (회원 본인 한정)</td>
										</tr>
										<tr>
											<th>이용안내</th>
											<td><strong>예약 방법</strong> : DCF 1관 공연기획사를 통해 최소 공연 3일 전에 사전 예약 후 현장에서 티켓 수령합니다.<br /><strong>멤버십 카드지참</strong> : 현장에서 공연표 수령 시, 회원 본인만 모바일 멤버십 카드 제시 후 이용 가능합니다.<br />(미지참시, 우대 혜택 이용이 불가합니다.)</td>
											<td><strong>예약 방법</strong> : 대명아임레디 컨택센터(☎1588-8511)를 통한 사전예약(공연일 7일 이전 예약 필수) 후 현장에서 티켓 수령합니다.<br />※ 예약 상세 안내  <a href="/my-lifeway/performance/request/index.do">[바로가기]</a><br /><strong>멤버십 카드지참</strong> : 현장에서 공연표 수령 시, 회원 본인만 멤버십카드 제시 후 이용 가능합니다. (미지참시, 우대 혜택 이용이 불가합니다.) </td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<c:choose>
							<c:when test="${fn:length(rtnMap.list) eq 0}">
								<div class="noCpro mt30">
									다음 공연 준비중입니다.
								</div>
							</c:when>
							<c:otherwise>
								<div class="memberRoll mt20">
									<a href="javascript:" class="left"><img src="/common/images/btn/rollleftbt.png" alt="" /></a>
									<a href="javascript:" class="right"><img src="/common/images/btn/rollrightbt.png" alt="" /></a>
									<c:forEach var="list" items="${rtnMap.list}" varStatus="status">
										<div class="rollUnit" style="left:${status.index * 100}%">
											<ul class="performRe">
												<li>
													<p class="img">
														<c:if test="${not empty list.atchFileId}">
															<img src="/cmm/fms/getImage.do?fileId=${list.atchFileId}&fileSn=0" width="248px" alt="" />
														</c:if>
													</p>
													<div class="txt">
														<p class="tit">
															${list.pfmcNm}
															<c:choose>
																<c:when test="${list.pfmcGb eq 'dscnt'}">
																	(할인공연)
																</c:when>
																<c:when test="${list.pfmcGb eq 'free'}">
																	(무료공연)
																</c:when>
															</c:choose>
														</p>
														<p class="dot"><strong>장소</strong> : ${list.plce}</p>
														<p class="dot"><strong>출연</strong> : ${list.cast}</p>
														<p class="dot"><strong>관람등급</strong> : ${list.vwngGrd}</p>
														<p class="dot"><strong>제작</strong> : ${list.prdcCo}</p>
														<p class="dot"><strong>공연기간</strong> : ${egov:convertDate(list.pfmcStrtDt, 'yyyyMMdd', 'yyyy년 MM월 dd일(EE)', '')} ~ ${egov:convertDate(list.pfmcEndDt, 'yyyyMMdd', 'yyyy년 MM월 dd일(EE)', '')}</p>
														<p class="dot"><strong>공연시간</strong> : ${list.pfmcTime}</p>
														<p class="dot"><strong>티켓정가</strong> : ${list.tcktPrc}</p>
														<p class="dot"><strong>회원혜택</strong> : ${list.dscntPct}</p>
													</div>
												</li>
											</ul>
										</div>
									</c:forEach>
									<div class="rollIcon">
										<c:forEach var="list" items="${rtnMap.list}" varStatus="status">
											<c:choose>
												<c:when test="${status.first}">
													<a href="javascript:"><img src="/common/images/btn/roll_icon_on.gif" alt="" /></a>
												</c:when>
												<c:otherwise>
													<a href="javascript:"><img src="/common/images/btn/roll_icon.gif" alt="" /></a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
							</c:otherwise>
						</c:choose>

						<div class="warnBox mt20">
							대명아임레디 상품회원은 누구나 공연예약을 할 수 있습니다. 로그인 후 <strong class="red">[나의 아임레디 > 공연예약]</strong>에서 확인가능합니다.  
						</div>
						<p class="titTxt mt60">DCF 위치 안내</p>
						<p class="mt10"><img alt="" src="/common/images/icon/membersvr2_img2.gif" width="100%" /></p>
						<dl class="numTxt mt20">
							<dt>110-809 서울특별시 종로구 대학로 12길 21</dt>
							<dd>
								<p class="num">※</p>
								<p class="txt">공연장 건물의 주차장은 기계식 주차장으로 주차 시설이 협소하여 차량의 주차 출차에 시간이걸립니다. 가급적 대중교통을 이용하시고, 주차로 인한 입장 지연 시, 공연장은 일절 책임지지 않습니다.</p>
							</dd>
							<dd>
								<p class="num">※</p>
								<p class="txt">혜화역 1번 출구 혹은 가까운 버스정류장에서 하차 시 도보로 10분</p>
							</dd>
						</dl>

						<div id="faqDiv">
						
						</div>
						
						<script type="text/javascript">
						//<![CDATA[
						           
							jQuery(document).ready(function(){
								//공연롤링
								var curPerform = 0;
								var maxPerform = jQuery(".memberRoll .rollUnit").size()-1;
								var isRoll = false; 
								jQuery(".memberRoll .left").click(function(){
									if(isRoll == false){
										isRoll = true;
										jQuery(".memberRoll .rollUnit").eq(curPerform).stop().animate({left:'100%'}, 250);
										jQuery(".memberRoll .rollIcon a").eq(curPerform).find("img").attr("src", jQuery(".memberRoll .rollIcon a").eq(curPerform).find("img").attr("src").replace("_on.gif", ".gif"));
										curPerform--; 
										if(curPerform < 0) curPerform = maxPerform;
										jQuery(".memberRoll .rollIcon a").eq(curPerform).find("img").attr("src", jQuery(".memberRoll .rollIcon a").eq(curPerform).find("img").attr("src").replace(".gif", "_on.gif"));
										jQuery(".memberRoll .rollUnit").eq(curPerform).stop().animate({left:'-100%'}, 0);
										jQuery(".memberRoll .rollUnit").eq(curPerform).stop().animate({left:0}, 250, function(){
											isRoll = false;
										});
									}
								});

								jQuery(".memberRoll .right").click(function(){
									if(isRoll == false){
										isRoll = true;
										jQuery(".memberRoll .rollUnit").eq(curPerform).stop().animate({left:'-100%'}, 250);
										jQuery(".memberRoll .rollIcon a").eq(curPerform).find("img").attr("src", jQuery(".memberRoll .rollIcon a").eq(curPerform).find("img").attr("src").replace("_on.gif", ".gif"));
										curPerform++; 
										if(curPerform > maxPerform) curPerform = 0;
										jQuery(".memberRoll .rollIcon a").eq(curPerform).find("img").attr("src", jQuery(".memberRoll .rollIcon a").eq(curPerform).find("img").attr("src").replace(".gif", "_on.gif"));
										jQuery(".memberRoll .rollUnit").eq(curPerform).stop().animate({left:'100%'}, 0);
										jQuery(".memberRoll .rollUnit").eq(curPerform).stop().animate({left:0}, 250, function(){
											isRoll = false;
										});
									}
								});

								jQuery(window).resize(function(){
									if(jQuery(window).width() <= 800){
										jQuery(".memberRoll").height(jQuery(".memberRoll .rollUnit .performRe li").height()+50);
									}else{
										jQuery(".memberRoll").height(420);
									}
								});
								
								jQuery(window).resize();
								
								getPageList();
							});
							
							//리스트 가져오기
							function getPageList()
							{	
								var pageIndex = "";
								
								if(arguments.length > 0)
								{
									if(arguments[0] == "all")
									{
										pageIndex = 1;
										jQuery("select[name='f']").val("");
										jQuery("input[name='q']").val("");
									}
									else
									{
										pageIndex = arguments[0];
									}
								}
								else
								{
									pageIndex = 1;
								}

								jQuery.post("/membership-service/faq-list.ajax",
									{
										"pageIndex" : pageIndex,
										"f" : jQuery("select[name='f']").val(),
										"q" : jQuery("input[name='q']").val(),
										"srvcId" : 237
									},
									function(text) 
									{
										jQuery("#faqDiv").html("");
										jQuery("#faqDiv").html(text);
									},
									"text"
								).fail(function () {
									alert("예기치 않은 오류입니다.");
								});
							}

						//]]>
						</script>