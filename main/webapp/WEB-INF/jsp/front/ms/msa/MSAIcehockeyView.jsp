<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
					
						<div class="chngSrvHead">
							<img src="/common/images/icon/membersvr9_img1.jpg" alt="" />
							<div class="txt">
								<img src="/common/images/icon/membersrv_icon9.png" alt="" />
								<p>가입 후 회원 정상 유지기간 내 맘껏 누리는 대명라이프웨이 멤버십</p>
								<p class="type1">화끈하고 박진감 넘치는 아이스하키 경기!<br />대명킬러웨일즈가 여러분과 함께 합니다.</p>
							</div>
						</div>
						<div class="txt3">
							</br>
							<p class="type1" style="color:#333; line-height:24px">※행사(장례/전환) 시 가입일로부터 5년간 제공</p>
							<p class="type1" style="color:#333; line-height:24px">※멤버십서비스는 당사 및 제휴사의 사정에 따라 축소 및 확대, 변경될 수 있습니다.</p>
							<p class="type1" style="color:#333; line-height:24px">※멤버십서비스 이용 시 홈페이지 ＇멤버십서비스’ 상세페이지를 통해 이용가능 멤버십 서비스를 확인 후 이용하시길 바랍니다.</p>
						</div>
						<p class="mt15" style="color:#333; line-height:24px">대명킬러웨일즈는 2016년 5월에 창단한 아이스하키단으로, 팀명 ‘킬러웨일즈’는 남극해의 차가운 물 속을 누비는 바다 최고의 포식자 범고래를 뜻합니다.<br />젊은 패기와 범고래와 같은 조직력을 앞세워 박진감 넘치는 경기를 선보이며, 아이스하키 안팎으로 문화를 만들어가고 있습니다.</p>
						<p class="titTxt mt60">대명 아이스하키 우대 혜택</p>
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
											<th>구분</th>
											<th>대명킬러웨일즈 홈경기 관람 우대</th>
											<th>어린이 아이스하키 교실 우대</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>우대범위</th>
											<td>홈경기 본인 포함 동반 1인 무료(총 2인)<br />동반 2인부터 50% 할인<br />미취학 아동, 경로(65세 이상), 장애인 무료</td>
											<td>어린이 아이스하키 교실 참가 우대 혜택<br />장비 대여 우대 혜택</td>
										</tr>
										<tr>
											<th>이용안내</th>
											<td>
												- 무료 입장 시, 회원 본인 멤버십카드, 신분증 지참 필수<br />
												(미지참 시, 우대 혜택이 적용되지 않습니다.)<br />
												- 현장 티켓 발권만 가능하며, 사전 예약은 불가합니다.<br />
												- 홈경기 장소 : 인천 선학국제빙상경기장<br />
												(인천시 연수구 경원대로 526)<br />
												- 경기 일정 및 기타 안내 : <a href="http://daemyungkillerwhales.com/home/" target="_blank" class="udLine">대명킬러웨일즈 홈페이지 참고</a>
											</td>
											<td>
												- 대명라이프웨이 회원 자녀에 한해 참가 가능합니다.<br />
												- 대명라이프웨이 홈페이지를 통해 신청 후, 이용 가능합니다.<br />
												(※ 신청 기간 별도 공지 예정)<br />
												- 참가 연령은 7세부터 10세까지 입니다.<br />
												- 수업 비용은 라이프웨이 회원 부담입니다.<br />
												- 아이스하키 교실 참가 회원 자녀에 한해, 장비 대여 우대 혜택이 제공됩니다.<br />
												- 보다 자세한 사항은 추후 모집 시 상세 안내 드립니다.
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
										"srvcId" : 276
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