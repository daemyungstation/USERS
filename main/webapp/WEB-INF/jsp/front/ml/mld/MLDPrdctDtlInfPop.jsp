<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
							
						<div id="popup">
							<div class="popHead">
								추가정보 선택
								<a href="javascript:self.close();"><img src="/common/images/popup/popup_xbt.gif" alt="" /></a>
							</div>
			
							<div class="popBody type2">
								<p class="tit">${rtnMap.dtlInfo.prdctTitl}</p>
								<div class="addInfoDiv mt30">
									<div class="imgDiv">
										<div class="imgRoll">
											<c:forEach var="list" items="${rtnMap.fileList}" varStatus="status">
												<p><img src="/cmm/fms/getImage.do?fileId=${list.atchFileId}&fileSn=${list.fileSeq}" width="500px" height="333px" alt="" /></p>
											</c:forEach>
										</div>
										<div class="thumnail">
											<div class="thumArea">
												<c:forEach var="list" items="${rtnMap.fileList}" varStatus="status">
													<a href="javascript:">
														<img src="/cmm/fms/getImage.do?fileId=${list.atchFileId}&fileSn=${list.fileSeq}" width="98px" height="66px" alt="" />
														<img src="/common/images/popup/pop_addinfo_liston.png" class="on" alt="" />
													</a>
												</c:forEach>
											</div>
			
											<div class="direcbt">
												<a href="javascript:" class="left"><img src="/common/images/popup/pop_addinfo_left.gif" alt="" /></a>
												<a href="javascript:" class="right"><img src="/common/images/popup/pop_addinfo_right.gif" alt="" /></a>
											</div>
										</div>
									</div>
			
									<div class="txtDiv">
										<ul>
											<c:forEach var="list" items="${rtnMap.dtlInfoPtc}" varStatus="status">
												<c:if test="${list.titl ne '※'}">
													<li><strong>${list.titl} :</strong> ${list.cntn}</li>
												</c:if>
											</c:forEach>
											<li><strong>${rtnMap.dtlInfo.schd}</strong></li>
										</ul>
			
										<div class="txtArea">
											<c:forEach var="list" items="${rtnMap.dtlInfoPtc}" varStatus="status">
												<c:if test="${list.titl eq '※'}">
													<p class="txt">
														<span class="num">${list.titl}</span>
														<span class="sentense">${list.cntn}</span>
													</p>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
			
								${rtnMap.dtlInfo.prdctCntn}
			
								<div class="mt50 taC">
									<a href="javascript:" id="btnChoice" class="btnRed">선택하기</a>
									<a href="javascript:self.close();" class="btnRed2">닫기</a>
								</div>
							</div>
						</div>
						
						<script type="text/javascript">
						//<![CDATA[
							
						    jQuery(document).ready(function(){
						    	var isMoving = false;
						    	var length = jQuery(".thumArea a").length;
						    	
								jQuery(".thumArea a").each(function(index){
									jQuery(this).css({"left": index * 107, "width" : 98, "height" : 66});
									jQuery(this).addClass("thumb" + index);
									jQuery(".imgRoll p").eq(index).addClass("big" + index);
									jQuery(".thumArea a:first .on").show();

									jQuery(this).click(function(){
										jQuery(".thumArea a .on").stop(true, true).fadeOut(400);
										jQuery(this).find(".on").stop(true, true).fadeIn(400);
										jQuery(".imgRoll p").stop(true, true).fadeOut(400);
										jQuery(".imgRoll p").eq(parseInt(jQuery(this).attr("class").substr(-1, 1))).stop(true, true).fadeIn(400);
									});
								});

								jQuery(".thumnail .direcbt a").each(function(index){
									jQuery(this).click(function(){
										if(!isMoving)
										{
											isMoving = true;
											
											if(length > 4)
											{
												if(!index) 
												{
													jQuery(".thumArea a:last").insertBefore(jQuery(".thumArea a:first"));
													jQuery(".thumArea a:first").css("left", -107);
													jQuery(".thumArea a").each(function(indexK){
														jQuery(this).stop(true, true).animate({left:parseInt(jQuery(this).css("left").split("p")[0])+(107)}, 'fast', function(){isMoving = false;});
													});
												} 
												else
												{
													jQuery(".thumArea a:first").insertAfter(jQuery(".thumArea a:last"));
													jQuery(".thumArea a").each(function(indexK){
														jQuery(this).stop(true, true).animate({left:parseInt(jQuery(this).css("left").split("p")[0])-(107)}, 'fast', function(){
															jQuery(".thumArea a:last").css("left", (length-1)*107);
															isMoving = false;
														});
													});
												}
											}
										}
									});
								});
								
								jQuery("#btnChoice").on("click", function(){
									jQuery("input[name='prdctDtlSeq']", opener.document).each(function(){
										if("${rtnMap.dtlInfo.prdctDtlSeq}" == jQuery(this).val())
										{
											jQuery(".addInfoView li .bts .selectBt", opener.document).removeClass("on");
											
											jQuery(this).prev().addClass("on");
											
											jQuery(this).prop("checked", true);
											
											jQuery(".boxTxt span", opener.document).text("${rtnMap.dtlInfo.prdctTitl}");
												
											return false;
										}
									});
									
									self.close();
								});
						    });
							
						//]]>
						</script>