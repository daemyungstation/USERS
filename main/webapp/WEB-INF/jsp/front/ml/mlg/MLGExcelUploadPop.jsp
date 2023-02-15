<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<form id="frm" method="post" enctype="multipart/form-data">
							<div id="popup">
								<div class="popHead">
									첨부파일 업로드
									<a href="javascript:self.close();"><img src="/common/images/popup/popup_xbt.gif" alt="" /></a>
								</div>
				
								<div class="popBody">
									<div class="memCardpop">
										<div class="txt2">
											<strong class="redTxt">부고알리미에 사용할 휴대전화번호가 입력된 파일을 첨부해주시기 바랍니다.</strong><br />
											<span style="color:#777">(해당 페이지에서 다운로드 받은 양식만 등록 가능합니다.)</span>
										</div>
				
										<div class="popFile">
											<strong>첨부파일</strong>
											<input type="text" value="" title="첨부파일" class="textInput" />
											<input type="file" id="atchFile" name="atchFile" value="" title="첨부파일" class="fileInput"/>
											<a class="btn333" href="javscript:">찾아보기</a>
										</div>
										
										<div class="taC mt30">
											<a href="javascript:" id="submitLink" class="btnRed wide">등록</a>
										</div>
									</div>
								</div>
							</div>
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
							
							//파일찾기
							jQuery("input:file[name='atchFile']").live("change", function(){
								
								var fileName = jQuery(this).val();
								
								if(fileName)
								{
									var exts = "xls";
									
									var fileExt = fileName.substr(fileName.lastIndexOf(".") + 1);

									if(exts.indexOf(fileExt.toLowerCase()) < 0)
									{
										alert("지원하지 않는 파일확장자입니다.");
										
										jQuery(this).after("<input type='file' name='atchFile' value='' title='첨부파일' class='fileInput' />");
										jQuery(this).remove();
									}
									else
									{
										jQuery(this).prev().val(jQuery(this).val());
									}
								}
							});
							
							jQuery("#submitLink").on("click", function(){
								
								if(!jQuery("input[name='atchFile']").val())
								{
									alert("첨부파일을(를) 입력해주세요.");
									return;
								}
								
								if(confirm("등록하시겠습니까?"))
								{
									var data = new FormData();
									
						            jQuery.each(jQuery("#atchFile")[0].files, function(i, file) {          
						                data.append("atchFile" + i, file);
						            });
						             
						            jQuery.ajax({
						                url : "./form-insert.ajax",
						                type : "post",
						                data : data,
						                async : false,
						                cache : false,
						                contentType : false,
						                processData : false,
						                success : function(r) 
						                {
						                	var hpList = r.hpList;
						                	
						                	var htmlSrc  = "";
					                			htmlSrc += "<p class='phoneNum'>";
												htmlSrc += "	&hp&";
												htmlSrc += "	<input type='hidden' name='hp' value='&hpVal&' />";
												htmlSrc += "	<a href='javascript:'><img src='/common/images/btn/phone_xbt.gif' alt='닫기' /></a>";
												htmlSrc += "</p>";
						                	
											var sendAbleCnt = jQuery("#sendAbleCnt", opener.document).text();
											var appendCnt = 0;
												
											jQuery("#numList", opener.document).children().remove();
												
						                	for(var i = 0; i < hpList.length; i++)
						                	{
						                		if(jQuery("#numList .phoneNum", opener.document).children("input[value='" + hpList[i].replace(/-/gi, "") + "']").length < 1)
						                		{
						                			var trgtObj = htmlSrc.replace("&hp&", hpList[i]);
						                		    	trgtObj = trgtObj.replace("&hpVal&", hpList[i].replace(/-/gi, ""));

													jQuery("#numList", opener.document).append(trgtObj);
													
													appendCnt++;
													
													if(sendAbleCnt <= appendCnt)
													{
														alert("발송 가능건수를 초과하였습니다. 초과된 전화번호는 입력되지 않습니다.");
														break;
													}
						                		}
						                	}
						                	
						                	self.close();
						                },
						                error : function() 
						                {
						                	alert("잠시후 다시 시도 바랍니다.");
						                }
						            });
								}
							});
						           
						//]]>
						</script>