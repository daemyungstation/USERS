<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
						
						<c:set var="obtrInfo" value="${rtnMap.obtrInfo}" />
						
						<form id="frm" method="post" action="./send.do">
							<div class="obitStep">
								<p>step1 - [양식받기]를 통해 전화번호부 양식 다운로드 받기 (엑셀파일), step2 - 연락처 최대 100건 입력 (개인 컴퓨터에 저장), step3 - 발송 시점에 [양식등록] 후 부고알리미(SMS) 발송</p>
							</div>
								
							<p class="warnBox2 mt40">개인정보 보호를 위해 이름/연락처는 양식을 통해 개인 컴퓨터에 저장하신 후, 발송시 [양식등록] 업로드를 통해 발송 가능합니다.<br />연락처 양식은 [양식받기]를 통해서 받은 엑셀파일을 통해서만 정상 발송할 수 있습니다.<br />직접 등록하신 전화번호는 즉시 발송용으로 자동저장이 되지 않으니, 저장 기능은 양식을 통해서 이용해주시기 바랍니다. </p>
	
							<div class="obitNoti mt20">
								<div class="left">
									<p class="tit">예시선택</p>
									<div class="bt">
										<a href="javascript:" id="btnObtrNotiType1" class="whtBt3">부고문자</a>
										<a href="javascript:" id="btnObtrNotiType2" class="whtBt3 r">조문답례</a>
									</div>
	
									<div class="inputDiv">
										<textarea id="smsCntn" name="smsCntn" title="내용" maxlength="200">${obtrInfo.smsCntn}</textarea>
	
										<strong class="counter"><span class="red">0</span> / 200Byte</strong>
									</div>
									<div class="bt2">
										<a href="javascript:" id="btnObtrNotiReset" class="whtBt3">다시 쓰기</a>
										<a href="javascript:" id="btnObtrNotiSave" class="whtBt3">저장하기</a>
									</div>
								</div>
	
								<div class="right">
									<p class="tit">전화번호 입력</p>
									<div class="numInput">
										<input type="text" id="tmpHp" name="tmpHp" value="" title="전화번호" class="mobileChk notRequired" placeholder="숫자만 입력해 주세요" maxlength="13" />
										<a href="javascript:" id="btnHpInsert" class="whtBt3">입력</a>
									</div>
	
									<div id="numList" class="numList">

									</div>
									<div class="bt2">
										<a href="javascript:" id="btnHpRemoveAll" class="whtBt3">전체삭제</a>
										<a href="/cmm/download.do?subpath=template/obtrNotiTmpl.xls" class="whtBt3">양식받기</a>
										<a href="javascript:" id="btnExcelUpload" class="whtBt3" title="새창열림">양식등록</a><!-- 부고알리미팝업 -->
	
										<strong class="counter">발송 가능건수 : 
											<span id="sendAbleCnt" class="red"><fmt:formatNumber value="${100 - egov:nvl(obtrInfo.smsSendCnt, 0)}" type="number" groupingUsed="false" /></span>건
										</strong>
									</div>
								</div>
							</div>
	
							<p class="taC mt30">
								<a href="javascript:" id="submitLink" class="btnRed">발송하기</a>
								<input type="submit" value="전송" style="display:none;" />
							</p>
						</form>
						
						<script type="text/javascript">
						//<![CDATA[
							
							jQuery(document).ready(function(){
								
								<c:if test="${not empty obtrInfo.smsCntn}">
									jQuery("#smsCntn").next(".counter").children(".red").text(getTextByte(jQuery("#smsCntn").val()));
								</c:if>
								
								//부고문자 양식
								jQuery("#btnObtrNotiType1").on("click", function(){
									jQuery("#smsCntn").val("ㅇㅇㅇ의 (부친)상 \n** 고인 : ㅇㅇㅇ\n** 장소 : 서울(시, 구)__________장례식장 ㅇㅇ호실\n** 발인 : ㅇㅇ일 오전 ㅇㅇ시\n** 장지 : __________");
									jQuery("#smsCntn").next(".counter").children(".red").text(getTextByte(jQuery("#smsCntn").val()));
									jQuery("#smsCntn").focus();
								});
								
								//조문답례 양식
								jQuery("#btnObtrNotiType2").on("click", function(){
									jQuery("#smsCntn").val("삼가 인사드립니다. 금번 저희 (아버)님 장례에 바쁘신 중에도 찾아주시어, 저희 가족은 큰 슬픔을 이겨낼 수 있는 따뜻한 위로가 되었습니다.\n진심으로 감사드리며, 늘 건겅하시기를 기원합니다. 상주 홍길동 배상");
									jQuery("#smsCntn").next(".counter").children(".red").text(getTextByte(jQuery("#smsCntn").val()));
									jQuery("#smsCntn").focus();
								});
								
								//다시쓰기
								jQuery("#btnObtrNotiReset").on("click", function(){
									jQuery("#smsCntn").val("");
									jQuery("#smsCntn").next(".counter").children(".red").text(getTextByte(jQuery("#smsCntn").val()));
									jQuery("#smsCntn").focus();
								});
								
								//저장하기
								jQuery("#btnObtrNotiSave").on("click", function(){
									var trgtObj = jQuery("#smsCntn");
									
									if(!jQuery(trgtObj).val())
									{
										alert("내용을 입력해주세요.");
										jQuery(trgtObj).focus();
										return;
									}
									
									if(confirm("저장하시겠습니까?"))
									{
										jQuery.post("./cntn-update.ajax", 
											{
												"accntNo" : "${rtnMap.accntNo}",
												"smsCntn" : jQuery(trgtObj).val()
											},
											function(r)
											{
												var status = r.status;
												
												if(status == "Y")
												{
													alert("저장되었습니다");
												}
											}
										).fail(function(){
											alert("잠시후 다시 시도 바랍니다.");
										});
									}
								});
								
								//글자수 체크
								jQuery("#smsCntn").on("keydown", function(){
									jQuery(this).next(".counter").children(".red").text(getTextByte(jQuery(this).val()));
								});
								
								jQuery("#smsCntn").on("keyup", function(){
									jQuery(this).next(".counter").children(".red").text(getTextByte(jQuery(this).val()));
								});
								
								jQuery("#smsCntn").on("blur", function(){
									var textByte = getTextByte(jQuery(this).val());
									
									if(textByte > 200)
									{
										alert("내용이 200Byte를 초과하였습니다. 초과된 내용은 삭제됩니다.");
										jQuery(this).val(jQuery(this).val().substr(0, getMaxByteIndex(jQuery(this).val(), 200)));
										jQuery(this).next(".counter").children(".red").text(getTextByte(jQuery(this).val()));
									}
								});
								
								//전화번호 등록
								jQuery("#btnHpInsert").on("click", function(){
									var trgtObj = jQuery(this).prev();
									
									if(!jQuery(trgtObj).val())
									{
										alert("전화번호를 입력해 주세요.");
										jQuery(trgtObj).focus();
										return;
									}
									
									var pttn = /^([0]{1}[0-9]{2})-([1-9]{1}[0-9]{2,3})-([0-9]{4})$/;
									
									if(pttn.test(jQuery(trgtObj).val()) == false)
									{
										alert("전화번호 입력값이 올바르지 않습니다.");
										jQuery(trgtObj).focus();
										return;
									}
									
									if(jQuery("#numList .phoneNum").children("input[value='" + jQuery(trgtObj).val().replace(/-/gi, "") + "']").length > 0)
									{
										alert("이미 입력된 전화번호입니다.");
										jQuery(trgtObj).focus();
										return;
									}
									
									if(parseInt("${100 - egov:nvl(obtrInfo.smsSendCnt, 0)}") <= jQuery("input[name='hp']").length)
									{
										alert("발송 가능건수를 확인해 주세요.");
										return;
									}
										
									var htmlSrc  = "";
			                			htmlSrc += "<p class='phoneNum'>";
										htmlSrc += "	" + jQuery(trgtObj).val();
										htmlSrc += "	<input type='hidden' name='hp' value='" + jQuery(trgtObj).val().replace(/-/gi, "") + "' />";
										htmlSrc += "	<a href='javascript:'><img src='/common/images/btn/phone_xbt.gif' alt='닫기' /></a>";
										htmlSrc += "</p>";
									
									jQuery("#numList").append(htmlSrc);
								});
								
								//선택삭제
								jQuery("#numList .phoneNum a").live("click", function(){
									jQuery(this).parent().remove();
								});
								
								//전체삭제
								jQuery("#btnHpRemoveAll").on("click", function(){
									jQuery("#numList").children().remove();
								});
								
								//양식등록
								jQuery("#btnExcelUpload").on("click", function(){
									setPopup("./form-upload.do", "excelUploadPop", 700, 460);
								});
								
								//등록
								jQuery("#frm").validation({
									msg : {
							            confirm : "발송하시겠습니까?"
							        },
							        loadingbar : {
										use : true
									}
								});
								
								//발송
								jQuery("#submitLink").on("click", function(e){
									//기본이벤트 제거
									e.preventDefault();
									
									if(jQuery("input[name='hp']").length < 1)
									{
										alert("전화번호를 입력해 주세요.");
										jQuery("#tmpHp").focus();
										return;
									}
									else if(parseInt("${100 - egov:nvl(obtrInfo.smsSendCnt, 0)}") < jQuery("input[name='hp']").length)
									{
										alert(jQuery("input[name='hp']").length);
										alert("발송 가능건수를 확인해 주세요.");
										return;
									}

									jQuery("input[type='submit']").trigger("click");
								});
							});
						           
						//]]>
						</script>