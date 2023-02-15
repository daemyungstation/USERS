<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

						<div class="chngSrvHead">
							<img src="/common/images/icon/membersvr3_img1.jpg" alt="" />
							<div class="txt">
								<img src="/common/images/icon/membersrv_icon3.png" alt="" />
								<p>가입 후 회원 정상 유지기간 내 맘껏 누리는 대명라이프웨이 멤버십</p>
								<p class="type1">대명투어몰의 합리적인 비용과 서비스로 <br />다양한 여행을 즐기세요. </p>
							</div>
							<div class="txt3">
								<p class="type1">※행사(장례/전환) 시 가입일로부터 5년간 제공</p>
							</div>
						</div>
						<p class="mt15" style="color:#333; line-height:24px">대명투어몰은 고객들이 합리적인 비용으로도 쉽게 여행준비를 할 수 있도록 다양한 서비스를 제공하고 있습니다. 온라인 투어몰인 ‘대명투어몰’은 운영, 개별 자유 여행부터 항공권 예약, 국내외 숙박, 허니문 패키지 여행 등 다양한 여행 상품과 특화된 상품을 개발해 고객에게 큰 호응을 얻고 있습니다.</p>
						<p class="titTxt mt60">대명투어몰(여행) 혜택</p>
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
											<th>일반 여행 상품 우대</th>
											<th>허니문 / 고품격 여행 상품 우대</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>우대범위</th>
											<td>최대 5% 할인<br />연 10회 (본인 포함 4인)<br />※ 중복 우대 혜택 불가 (쿠폰, 전환서비스)</td>
											<td>최대 10% 할인<br />연 10회 (본인 포함 4인)<br />※ 중복 우대 혜택 불가 (쿠폰, 전환서비스)</td>
										</tr>
										<tr>
											<th>이용안내</th>
											<td colspan="2">
												대명투어몰 고객 감동센터(02-721-7777)를 통한 사전 예약 후 이용 가능합니다.<br />
												상담 진행 시, 대명라이프웨이 회원임을 밝혀주세요.
											</td>
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
										"srvcId" : 238
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