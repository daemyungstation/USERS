<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

				<style>
					h2 {  padding-top:40px; padding-bottom: 10px; font-size: 27px; text-align:center; color:#000; font-weight:normal; border-bottom: 1px solid #ddd;}
					#desc { margin-top: 10px; margin-bottom: 25px; font-size: 20px; font-weight:bold; text-align:center; color:#000; }
					#info { margin: 10px 0 20px 0; }
					.title {font-size: 18px; margin-bottom: 10px;}
					#info .content {padding-left: 20px; white-space: pre-wrap; line-height : 24px;}
					
					.red { color: red !important; }
					.contraceWidth {width:90% !important; }
					.type3 {font-size: 14px !important;}
					.privacyDiv dt {padding-top:0; margin-bottom: 1px !important;}
					.privacyDiv dd {margin-bottom: 3px !important;}
					.privacyDiv dd.txt {width:auto !important; font-size: 14px !important; margin-bottom: 1px !important; }
					
					@media print {
						#popup { background:none;}
						.popHead {display:none;}
						
						h2 {font-size: 20px; padding-top:10px !important; }
						#desc {font-size: 13px;}
						.title {font-size: 13px;}
						#info .content {font-size: 10px; line-height:15px;}
						.contraceWidth {width:578px !important;}
						
						#close { display: none}
						.printBt {display: none}
						.page { page-break-before: always; }
						.popBody {width:100%}
						
						.type3 {font-size: 11px !important;}
						.privacyDiv dt {padding-top:0;}
						.privacyDiv dd {margin-bottom: 3px !important;}
						.privacyDiv dd.txt {width:auto !important; font-size: 11px !important; margin-bottom: 1px !important; line-height: 15px !important;}
					}
				</style>
				
				<div class="popHead">
					계약안내
					<a href="javascript:self.close();" id="close"><img src="/common/images/popup/popup_xbt.gif" alt=""></a>
				</div>

				<div class="popBody contraceWidth" >
					<div class="privacyDiv">
						<p class="printBt">
							<a href="javascript: print();" class="whtBt">프린트</a>
						</p>

						<c:forEach var="info" items="${rtnMap}" varStatus="status">
							<c:set var="stat" value="${status.last}" />
							
							<h2>${info.title}</h2>						
							
							<div id="desc">${info.trsDesc}</div>
							<div id="info">
								<p class="title">1. 안내사항</p>
								<div class="content">${info.trsInfo}</div>
							</div>
						
							<p class="title">2. 구매 및 이용계약</p>
							
							<dl>
								<dd>
									<c:forEach var="level1_list" items="${info.list}" varStatus="status">
									<dl>
										<dt class="type3">${level1_list.cntn}</dt>
										<dd>
											<c:if test="${fn:length(level1_list.level2List) > 0}">
											<c:forEach var="level2_list" items="${level1_list.level2List}" varStatus="status">
											<dl>
												<c:choose>
													<c:when test="${fn:length(level2_list.level3List) > 0}">
													<dt class="type4" style="white-space:pre-wrap;">${level2_list.cntn }</dt>	
													</c:when>
													<c:otherwise>
													<dd class="txt" style="white-space:pre-wrap;">${level2_list.cntn }</dd>
													</c:otherwise>
												</c:choose>
												
												<dd>
													<c:if test="${fn:length(level2_list.level3List) > 0}">
													<c:forEach var="level3_list" items="${level2_list.level3List}" varStatus="status">
													<div class="txt" style="white-space:pre-wrap;">${level3_list.cntn }</div>
													</c:forEach>
													</c:if>
												</dd>													
											</dl>
											</c:forEach>
											</c:if>
										</dd>
									</dl>
									</c:forEach>
								</dd>
							</dl>
							
							<c:if test="${stat eq false}">
							<p class="page">&nbsp;</p>
							</c:if>		
						</c:forEach>						
					</div>
				</div>

				<script>
					function printWindow(){
						var version = $.browser.version;
						
						if (version == 7.0 || version == 8.0 || version == 9.0 || version == 10.0 || version == 11.0){
							with ( factory.printing ) 
							{ 
								header = ''; 
								footer = ''; 
								portrait = true; // true 세로출력 , false 가로출력
								leftMargin = 0;
								rightMargin = 0; 
								topMargin = 0;
								bottomMargin = 0; 
								Print(true, window) // 첫번째 인자 : 대화상자표시여부 , 두번째인자 : 출력될 프레임
							}	
						}else{
							print();
						}
						
					}
				</script>			