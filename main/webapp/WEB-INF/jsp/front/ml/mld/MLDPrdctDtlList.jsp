<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
					
						<div class="addInfoView">
							<ul>
								<c:forEach var="list" items="${rtnMap.list}" varStatus="status">
									<li>
										<p class="img">
											<c:choose>
												<c:when test="${not empty list.thnlFileId}">
													<img src="/cmm/fms/getImage.do?fileId=${list.thnlFileId}&fileSn=0" alt="" width="290px" height="150px" />
												</c:when>
												<c:otherwise>
													<img src="/common/images/icon/schedule_img1.gif" alt="이미지 준비중입니다" />
												</c:otherwise>
											</c:choose>
										</p>
										<div class="bts">
											<c:choose>
												<c:when test="${not empty list.link}">
													<a href="javascript:setPopup('${list.link}', 'prdctDtlInfo', 910, 700);" class="viewBt">상세보기</a>
												</c:when>
												<c:otherwise>
													<a href="javascript:" id="btnDetail${status.count}" class="viewBt">상세보기</a>
												</c:otherwise>
											</c:choose>
											<a href="javascript:" class="selectBt">
												선택
												<img src="/common/images/icon/selectbt_icon.gif" alt="" />
											</a>
											<input type="radio" name="prdctDtlSeq" value="${list.prdctDtlSeq}" title="추가정보" style="display: none">
										</div>
										<p class="tit">${egov:tldCutString(egov:nvl(list.schd, '&nbsp;'), '...', 24)}</p>
										<p class="txt">${list.prdctTitl}</p>
									</li>
								</c:forEach>
							</ul>

							<div class="paging">
								<ui:pagination paginationInfo="${rtnMap.paginationInfo}" type="image" jsFunction="getPageList" />
							</div>
						</div>
						
						<script type="text/javascript">
						//<![CDATA[
							
						    jQuery(document).ready(function(){
						    	jQuery(".addInfoView li .bts .selectBt").on("click", function(){
									jQuery(".addInfoView li .bts .selectBt").not(this).removeClass("on");
									
									jQuery(this).toggleClass("on");
									
									jQuery(this).next().prop("checked", !jQuery(this).next().is(":checked"));
									
									if(jQuery(this).next().is(":checked"))
									{
										jQuery(".boxTxt").children("span").text(jQuery(this).closest(".bts").siblings(".txt").text());
									}
									else
									{
										jQuery(".boxTxt").children("span").text("-");
									}
								});
						    	
						    	jQuery("a[id^='btnDetail']").on("click", function(){
						    		var popupNm = "prdctDtlInfo";
						    		
						    		setPopup("", popupNm, 995, 700);
						    		
						    		var f = document.popFrm;
						    		
						    		f.target = popupNm;
						    		f.prdctDtlSeq.value = jQuery(this).siblings("input[name='prdctDtlSeq']").val();
							    	f.submit();
						    	});
						    	
						    	jQuery(window).resize(function(){
									if(jQuery(window).width() >= 1183)
									{
										jQuery(".addInfoView li").css('margin', '0 40px 0 0');
										jQuery(".addInfoView li").each(function(q){
											jQuery(".addInfoView li").eq(3*q+2).css('margin', '0 0 0 0');
										});
									}
									else if(jQuery(window).width() <= 1182 && jQuery(window).width() >= 784)
									{
										jQuery(".addInfoView li").css('margin', '0 3% 30px');
										jQuery(".addInfoView li").each(function(q){
											jQuery(".addInfoView li").eq(3*q+2).css('margin', '0 3% 30px');
										});
									}
									else if(jQuery(window).width() <= 783 && jQuery(window).width() >= 663)
									{
										jQuery(".addInfoView li").css('margin', '0 3% 30px');
										jQuery(".addInfoView li").each(function(q){
											jQuery(".addInfoView li").eq(3*q+2).css('margin', '0 3% 30px');
										});
									}
									else if(jQuery(window).width() <= 662)
									{
										jQuery(".addInfoView li").css('margin', '0 0 30px');
										jQuery(".addInfoView li").each(function(q){
											jQuery(".addInfoView li").eq(3*q+2).css('margin', '0 0 30px');
										});
									}
								});
						    	
						    	jQuery(window).resize();	
						    });
						    
						    function selectPrdctDtlInfo(prdctDtlSeq)
						   	{
						    	var popupNm = "prdctDtlInfo";
						    	
						    	setPopup("", popupNm, 995, 700);
						    	
						    	var f = document.popFrm;
						    	
						    	f.action = "./dtl-info.do";
						    	f.target = popupNm;
						    	f.prdctDtlSeq.value = prdctDtlSeq;
						    	f.submit();
						   	}
							
						//]]>
						</script>