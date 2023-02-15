<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
					
						<div class="chngSrvHead">
							<img src="/common/images/icon/membersvr7_img1.jpg" alt="" />
							<div class="txt">
								<img src="/common/images/icon/membersrv_icon4.png" alt="" />
								<p>가입 후 회원 정상 유지기간 내 맘껏 누리는 대명아임레디 멤버십</p>
								<p class="type1">단 한번뿐인 소중한 순간<br />소노펠리체 컨벤션(서울 삼성동) 만의 고품격 웨딩으로 특별함을 더해드리겠습니다.</p>
							</div>
							<div class="txt3">
								<p class="type1">※행사(장례/전환) 시 가입일로부터 5년간 제공</p>
							</div>
						</div>
						<p class="mt15" style="color:#333; line-height:24px">소노펠리체(SONO FELICE)는 SONO "꿈, 이상향"과 FELICE "행복,즐거움"이란 단어의 합성어로 <strong>꿈처럼 행복한 삶을 누리는 이상향</strong>이란 뜻을 가진 이태리어입니다. 세상에 없던 명예로운 라이프스타일 가장 설레고 행복한 순간의 프리미엄 노블레스 웨딩 소노펠리체 컨벤션에서 경험할 수 있습니다.</p>
						<p class="titTxt mt60">대명컨벤션(소노펠리체 컨벤션) 혜택</p>
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
											<td>소노펠리체 컨벤션 웨딩 이용 고객 <br /><strong>식대 5% 할인</strong><br />횟수 제한 없음 (본인 및 직계가족)</td>
										</tr>
										<tr>
											<th>이용안내</th>
											<td><strong>소노펠리체 컨벤션 예약실(02-2222-7401)</strong>을 통해 사전 예약 후 이용 가능합니다.<br />상담 진행 시, 대명아임레디 회원임을 밝혀주세요.</td>
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