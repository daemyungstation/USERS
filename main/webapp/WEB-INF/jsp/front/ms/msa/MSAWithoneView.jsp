<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
					
						<div class="chngSrvHead">
							<img src="/common/images/icon/membersvr5_img1.jpg" alt="" />
							<div class="txt">
								<img src="/common/images/icon/membersrv_icon4.png" alt="" />
								<p>가입 후 회원 정상 유지기간 내 맘껏 누리는 대명라이프웨이 멤버십</p>
								<p class="type1">대명위드원의 20여 년의 결혼 정보 노하우로<br />최고의 서비스를 경험하세요.</p>
							</div>
							<div class="txt3">
								<p class="type1">※행사(장례/전환) 시 가입일로부터 5년간 제공</p>
							</div>
						</div>
						<p class="mt15" style="color:#333; line-height:24px">국내 결혼정보회사 중 유일하게 대기업 계열사인 대명위드원은 결혼 정보 1세대 기업으로 20여 년의 노하우를 보유하고 있습니다. 그룹의 체계화된 시스템을 토대로 1만 3500여개 기업, 기관 등의 폭 넓은 네트워크를 통해 회원을 확보, 특허 매칭 시스템을 토대로 원하는 이상형, 최적의 배우자와의 만남을 주선합니다.</p>
						<p class="titTxt mt60">대명위드원(결혼정보) 혜택</p>
						<div class="memMap2 mt15">
							<div class="txt">
								<table summary="">
									<caption></caption>
									<colgroup>
										<col width="16%" />
										<col width="84%" />
									</colgroup>
									<tbody>
										<tr>
											<th>우대범위</th>
											<td>결혼 정보 프로그램 (노블레스, 로얄, 프리미엄)<br />최대 20% 할인<br />횟수 제한 없음 (본인 및 직계가족)<br />※ 전환 서비스 중복 불가</td>
										</tr>
										<tr>
											<th>이용안내</th>
											<td>대명위드원 문의처(1588-3883)를 통한 사전 예약 후 이용이 가능합니다.<br />상담 진행 시, 대명라이프웨이 회원임을 밝혀주세요.</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div id="faqDiv">
						
						</div>
						
						<script type="text/javascript">
						//<![CDATA[
						           
							jQuery(document).ready(function(){
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
										"srvcId" : 240
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