<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
				<style>			
					.privacyDiv dd {margin-bottom:0 !important; line-height:normal !important;}
					.privacyDiv .txt {line-height:24px !important;}
					
					@media print {				
						#popup { background:none;}
						.popHead {display:none;}
						.popBody {width:100% !important; margin:0 !important; padding-bottom:0 !important; border:none !important; }
						.tit {display:none;}
						.gubun {padding: 10px 15px; border: 1px solid #ccc; width:90% !important;}
						.privacyDiv .txt {width:100% !important;}
							
						#close { display: none}
						.printBt {display: none}
						.page { page-break-before: always; padding-top: 20px; }
						
						.type2 {font-size: 12px !important;}
						.type3 {font-size: 11px !important;}
						.type4, .txt {font-size: 10px !important;}
						
						.privacyDiv dt { padding-top : 8px; margin-bottom: 3px}
						.privacyDiv .txt {line-height: 15px !important;}
					}
				</style>
	
				<div class="popHead">
					약관
					<a href="javascript:self.close();" id="close"><img src="/common/images/popup/popup_xbt.gif" alt=""></a>
				</div>

				<div class="popBody">
					<div class="privacyDiv">
						<p class="printBt">
							<a href="javascript: print();" class="whtBt">프린트</a>
						</p>
						
						<dl class="tit">
							<dt class="type1">회원약관</dt>
						</dl>

						<c:forEach var="info" items="${rtnMap}" varStatus="status">
							<c:set var="stat" value="${status.last}" />
							
						
							<dl class="gubun">
								<dt class="type2">${info.title}</dt>
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
				
				<object id=factory style="display:none" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" 
					codebase="/common/smsx.cab#Version=7,7,0,20" >
				</object>
				
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