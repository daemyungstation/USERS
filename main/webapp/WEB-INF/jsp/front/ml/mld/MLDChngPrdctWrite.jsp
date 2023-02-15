<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<c:set var="prdctInfo" value="${rtnMap.prdctInfo}" />
						
						<c:set var="chngSys" value="${rtnMap.chngSys}" />
						
						<form id="frm" method="post" action="./check.do">
							<input type="hidden" name="accntNo" value="" />
							<input type="hidden" name="grpSeq" value="" />
							
							<c:choose>
								<c:when test="${fn:length(prdctInfo) eq 0}"></c:when>
								<c:otherwise>
							
								<div class="scrollX mt60">
									<div class="boradType7">
										<table summary="">
											<caption></caption>
											<colgroup>
												<col width="158px" />
												<col width="158px" />
												<col width="158px" />
												<col width="158px" />
												<col width="158px" />
												<col width="158px" />
											</colgroup>
											<thead>
												<tr>
													<th>회원명</th>
													<th>회원번호</th>
													<th>상품금액</th>
													<th>납입 회차</th>
													<th>납입 금액</th>
													<th>상조가입일</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>${prdctInfo.memNm}</td>
													<td>${prdctInfo.accntNo}</td>
													<td><fmt:formatNumber value="${prdctInfo.prodAmt}" type="number" maxFractionDigits="0" />원</td>
													<td>${prdctInfo.trueCnt}</td>
													<td><fmt:formatNumber value="${prdctInfo.trueAmt + prdctInfo.relatAmt + prdctInfo.addAmt}" type="number" maxFractionDigits="0" /></td>
													<td>${egov:convertDate(prdctInfo.joinDt, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</td>
												</tr>
											</tbody>
										</table>
									</div>
									<p class="widthScbg"></p>
								</div>
								</c:otherwise>
							</c:choose>
							
							<c:choose>
								<c:when test="${fn:length(chngSys) eq 0}">
									<div class="noCpro mt30">
										전환 가능한 상품이 없습니다.
									</div>
								</c:when>
								<c:otherwise>
									<ul class="dotBox2 mt15">
										<li class="tit2">대명아임레디 하이브리드 서비스는 상조 서비스 미사용 고객에 한하여 제공되는 서비스입니다.<br />제공되는 서비스 중 하나를 선택하여 이용하실 수 있습니다.</li>
										<li class="tit mt30">꼭 확인해 주세요! </li>
										<li>하이브리드 서비스는 주계약과 상관없이 원하는 시점에 언제든지 바꿔서 사용 가능합니다. 단, 상품에 대한 잔여금은 일시로 완납 후 이용 가능합니다.</li>
										<li>아래의 페이지에서 확인하신 내용 외에는 별도의 상품 변경은 어려우시며, 만약 제공서비스 외에 추가서비스를 원하실 경우, 신청접수 이후 제공업체 담당자와 상담 시 진행해 주시면 됩니다.</li>
										<li>제공서비스 업체 및 서비스 내용이 변경될 수 있으며, 제휴사정에 따라 제공이 어려울 수 있습니다.</li>
									</ul>
								
									<p class="titTxt mt60">전환하려는 하이브리드 서비스를 선택해 주세요</p>
									
									<div class="changeSer mt30">
										<div class="btPack">
											<c:forEach var="list" items="${chngSys}" varStatus="status">
												<input type="radio" name="prdctSeq" value="${list.prdctSeq}" title="전환 가능 서비스" style="display:none;" />
												<button type="button" class="selectSer">
													<span>
														<img src="/common/images/icon/open_icon.gif" class="off" alt="" />
														<img src="/common/images/icon/open_icon_on.gif" class="on" alt="" />
													</span>
													<strong>${list.prdctGb}</strong>
												</button>
												<input type="hidden" name="dtlCnt" value="${list.dtlCnt}" />
											</c:forEach>
										</div>
										
										<c:forEach var="list" items="${chngSys}" varStatus="status">
											<div class="csConDiv">
												${list.prdctCntn}
											</div>
										</c:forEach>
									</div>
									
									<div class="boxTxt mt20" style="display: none">
										<strong>추가정보 선택(필수) : </strong><span>-</span>&nbsp;&nbsp;
										<a href="javascript:" class="addInfoBt"><img src="/common/images/btn/addinfo_viewbt.gif" alt="자세히 보기" /></a>
									</div>
									
									<p class="taR mt25">
										<a href="javascript:" id="submitLink" class="btnRed wide">하이브리드 서비스 신청하기</a>
										<input type="submit" value="전송" style="display:none;" />
									</p>
								</c:otherwise>
							</c:choose>
						</form>
						
						<form name="popFrm" method="post" action="./dtl-info.do">
							<input type="hidden" name="prdctDtlSeq" value="" />
						</form>	
						
						<script type="text/javascript">
						//<![CDATA[
						           
							jQuery(document).ready(function(){
								var curAddInfo = false;
								
								jQuery(".addInfoBt").click(function(){
									if(curAddInfo == false)
									{
										jQuery(".addInfoBt").find("img").attr("src", jQuery(".addInfoBt").find("img").attr("src").replace(".gif", "_on.gif"));
										jQuery(".addInfoView").stop().slideDown(350);
										curAddInfo = true;
									}
									else if(curAddInfo == true)
									{
										jQuery(".addInfoBt").find("img").attr("src", jQuery(".addInfoBt").find("img").attr("src").replace("_on.gif", ".gif"));
										jQuery(".addInfoView").stop().slideUp(350);
										curAddInfo = false;
									}
								});
								
								jQuery(".changeSer .selectSer").on("click", function(e){
									var index = jQuery(".changeSer .selectSer").index(jQuery(this));
									
									jQuery(".changeSer .selectSer").not(this).removeClass("on");
									
									jQuery(this).toggleClass("on");
									
									jQuery(".changeSer .csConDiv").not(":eq("+index+")").hide();
									
									jQuery(".changeSer .csConDiv").eq(index).toggle();
									
									jQuery(".changeSer .csConDiv").eq(index).find(".subSelDiv .subSel").eq(0).trigger("click");
									
									var bfrChkVal = jQuery("input[name='prdctSeq']:checked").val();

									jQuery(this).prev().prop("checked", !jQuery(this).prev().is(":checked"));
									
									curAddInfo = true;
									
									jQuery(".addInfoBt").trigger("click");
									
									jQuery(".boxTxt").hide();
									
									if(parseInt(jQuery(this).next().val()) > 0)
									{
										if(jQuery(this).prev().is(":checked"))
										{
											jQuery(".boxTxt").show();
											
											if(typeof bfrChkVal == "undefined")
											{
												if(jQuery(".boxTxt").next(".addInfoView").length < 1 || bfrChkVal != jQuery(this).prev().val())
												{
													jQuery.post("./dtl-list.ajax",
														{
															"prdctSeq" : jQuery(this).prev().val()
														},
														function(text)
														{
															jQuery(".addInfoView").remove();
															jQuery(".boxTxt").after(text);
														},
														"text"
													).fail(function(){
														alert("예기치 않은 오류입니다.");
														return;
													});
												}
											}
											else if(bfrChkVal != jQuery(this).prev().val())
											{
												jQuery.post("./dtl-list.ajax",
													{
														"prdctSeq" : jQuery(this).prev().val()
													},
													function(text)
													{
														jQuery(".addInfoView").remove();
														jQuery(".boxTxt").after(text);
													},
													"text"
												).fail(function(){
													alert("예기치 않은 오류입니다.");
													return;
												});
											}
										}
									}
									else
									{
										jQuery(".addInfoView").remove();
									}
								});
								
								jQuery(".csConDiv .subSelDiv").each(function(q){
									jQuery(this).find(".selUnit").hide();
									jQuery(this).find(".selUnit").eq(0).show();
									
									jQuery(this).find(".subSel").each(function(k){
										jQuery(this).css("left", 90 * k);
									});
								});
								
								jQuery(".subSelDiv .subSel").on("click", function(){
									jQuery(this).parent(".subSelDiv").find(".subSel").not(this).removeClass("on");
									
									jQuery(this).addClass("on");
									
									jQuery(this).parent(".subSelDiv").find(".selUnit").hide();
									
									jQuery(this).next().show();
								});
								
								//유효성 체크
								jQuery("#frm").validation();
								
								jQuery("#submitLink").on("click", function(e){
									//기본이벤트 제거
									e.preventDefault();
									
									Feel.Validation.confirm = "전환서비스 ["+ jQuery("input[name='prdctSeq']:checked").next().children("strong").text() +"] 을(를) 선택하셨습니다. 신청하시겠습니까?"; 
									
									jQuery("input[name='accntNo']").val("${prdctInfo.accntNo}");
									
									jQuery("input[name='grpSeq']").val("${chngSys[0].grpSeq}");

									jQuery("input[type='submit']").trigger("click");
								});
								
								jQuery(window).resize(function(){
									if(jQuery(window).width() >= 1183){
										jQuery(".addInfoView li").css('margin', '0 40px 0 0');
										jQuery(".addInfoView li").each(function(q){
											jQuery(".addInfoView li").eq(3*q+2).css('margin', '0 0 0 0');
										});
									}else if(jQuery(window).width() <= 1182 && jQuery(window).width() >= 784){
										jQuery(".addInfoView li").css('margin', '0 3% 30px');
										jQuery(".addInfoView li").each(function(q){
											jQuery(".addInfoView li").eq(3*q+2).css('margin', '0 3% 30px');
										});
									}else if(jQuery(window).width() <= 783 && jQuery(window).width() >= 663){
										jQuery(".addInfoView li").css('margin', '0 0 30px');
										jQuery(".addInfoView li").each(function(q){
											jQuery(".addInfoView li").eq(3*q+2).css('margin', '0 0 30px');
										});
									}else if(jQuery(window).width() <= 662){
										jQuery(".addInfoView li").css('margin', '0 0 30px');
										jQuery(".addInfoView li").each(function(q){
											jQuery(".addInfoView li").eq(3*q+2).css('margin', '0 0 30px');
										});
									}
								});
								
								jQuery(window).resize();	
							});
							
							//리스트 가져오기
							function getPageList()
							{	
								jQuery.post("./dtl-list.ajax",
									{
										"pageIndex" : arguments[0],
										"prdctSeq" : jQuery("input[name='prdctSeq']:checked").val()
									},
									function(text) 
									{
										jQuery(".addInfoView").remove();
										jQuery(".boxTxt").children("span").text("-");
										jQuery(".boxTxt").after(text);
										jQuery(".addInfoView").show();
									},
									"text"
								).fail(function () {
									alert("예기치 않은 오류입니다.");
								});
							}

						//]]>
						</script>