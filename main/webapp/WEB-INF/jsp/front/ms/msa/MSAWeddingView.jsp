<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

						<div class="chngSrvHead">
							<img src="/common/images/icon/membersvr4_img1.jpg" alt="" />
							<div class="txt">
								<img src="/common/images/icon/membersrv_icon4.png" alt="" />
								<p>가입 후 회원 정상 유지기간 내 맘껏 누리는 대명라이프웨이 멤버십</p>
								<p class="type1">대명본웨딩의 10여 년의 웨딩컨설팅 노하우로 <br />최고의 서비스를 경험하세요.</p>
							</div>
							<div class="txt3">
								<p class="type1">※행사(장례/전환) 시 가입일로부터 5년간 제공</p>
							</div>
						</div>
						<p class="mt15" style="color:#333; line-height:24px">대명본웨딩은10여년간 구축된 노하우를 바탕으로 100개 이상의 협력업체들과 함께 업계 최고의 웨딩 컨설팅 서비스를 제공하고 있습니다. 웨딩플래너를 포함한 약 100여명의 스태프가 상견례, 예식장 섭외, 신부스타일에 맞는 웨딩 제안과 맞춤서비스, 예물, 침구, 허니문등 웨딩에 필요한 모든 준비를 함께 합니다.</p>
						<p class="titTxt mt60">대명본웨딩(웨딩) 혜택</p>
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
											<td>스튜디오 / 드레스 / 메이크업 패키지<br />최대 5% 할인<br />횟수 제한 없음 (본인 및 직계가족)<br />※ 전환서비스 중복 불가 </td>
										</tr>
										<tr>
											<th>이용안내</th>
											<td>대명본웨딩 문의처(02-2017-7510)를 통한 사전 예약 후 이용 가능합니다.<br />상담 진행 시, 대명라이프웨이 회원임을 밝혀주세요. </td>
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
										"srvcId" : 239
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