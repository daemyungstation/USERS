<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
							
						<div class="listSrch">
							<strong>가입상품</strong>
							<select class="type2" id="accntNo" title="상품선택">
								<option value="">가입하신 상품을 선택해 주세요</option>
								<c:forEach var="list" items="${joinPrdctList}" varStatus="status">
									<option value="${list.accntNo}">${list.prodNm}</option>
								</c:forEach>
							</select>
							<a href="javascript:" id="btnSearch" class="srchBt"><span>검색</span></a>
						</div>
						
						<div id="chngSrvcDiv">
						
						</div>
						
						<script type="text/javascript">
						//<![CDATA[
							
							jQuery(document).ready(function(){
								//검색
								jQuery("#btnSearch").on("click", function(e){
									var srchObj = jQuery("#accntNo");
									
									if(!jQuery(srchObj).val())
									{
										alert("가입상품을 선택해 주세요.");
										jQuery(srchObj).focus();
										return;
									}
									
									jQuery.post("./search.ajax",
										{
											"accntNo" : jQuery(srchObj).val()
										},
										function(text) 
										{
											jQuery("#chngSrvcDiv").html("");
											jQuery("#chngSrvcDiv").html(text);
										},
										"text"
									).fail(function () {
										alert("예기치 않은 오류입니다.");
									});
								});
							});
							
						//]]>
						</script>