<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

						<div class="warnBox">
							담당자가 조회가 안되실 경우, <span class="red">컨택센터 (1588-8511)</span>로 전화주시기 바랍니다.
						</div>

						<div class="listSrch mt30">
							<input type="text" id="q" name="q" value="" placeholder="담당자 이름을 입력해 주세요" maxlength="15" />
							<a href="javascript:" id="btnSearch" class="btn333">검색</a>
						</div>
						
						<script type="text/javascript">
						//<![CDATA[
							
							jQuery(document).ready(function(){
								jQuery("#q").on("keypress", function(e){
									var keyCode = e.keyCode;
									
									if(keyCode == "13")
									{
										jQuery("#btnSearch").trigger("click");
									}
								});
								
								jQuery("#btnSearch").on("click", function(){
									var srchObj = jQuery("#q");
									
									if(!jQuery(srchObj).val())
									{
										alert("담당자 이름을 입력해 주세요.");
										jQuery(srchObj).focus();
										return;
									}
									
									jQuery.post("./search.ajax",
										{
											"f" : 101,
											"q" : jQuery(srchObj).val()
										},
										function(text) 
										{
											jQuery(".listSrch").next().remove();
											jQuery(".listSrch").after(text);
										},
										"text"
									).fail(function () {
										alert("예기치 않은 오류입니다.");
									});
								});
							});
							
							function getPageList()
						   	{
								jQuery.post("./search.ajax",
									{
										"pageIndex" : arguments[0],
										"f" : 101,
										"q" : jQuery("#q").val()
									},
									function(text) 
									{
										jQuery(".listSrch").next().remove();
										jQuery(".listSrch").after(text);
									},
									"text"
								).fail(function () {
									alert("예기치 않은 오류입니다.");
								});
						   	}

							//]]>
						</script>