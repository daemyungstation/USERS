<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

<style>
#time_attack {position:relative; width:100%; height:auto; padding:5%; background:#131550; box-sizing:border-box;}
.quiz_event {position:relative; width:100%; height:auto; margin:0 auto; padding:1px 5% 5% 5%; background:#fff; border-radius:20px; box-sizing:border-box;}

.quiz_table {width:100%; margin-top:5%; display:table;}
.quiz_event .quiz_row {margin-bottom:20px; display:table-row;}
.quiz_event .quiz_cell {display:table-cell; vertical-align:top;}
.quiz_event .quiz_cell.quiz_question_mark {width:7%;}
.quiz_event .quiz_cell.quiz_question_text {padding-left:4%; font-size:28px; color:#131550; display:table-cell;}
.quiz_event .quiz_cell .question_icon {width:100%;}



.quiz_event .quiz_cell.quiz_input {position:relative; width:12.5%; padding:0;}
.quiz_event .quiz_cell.quiz_input:before {content:""; display:block; padding-top:100%;}
.quiz_event .quiz_cell .quiz {position:absolute; top:0; left:0; width:80%; height:80%; font-size:3vw; text-align:center;border:2px solid #0d3b70; border-radius:2px; box-sizing:border-box; display:inline-block;}

.quiz_event .quiz_answer { margin-top:5%; position: relative; width: 100%; text-align:center;  }
.quiz_event .quiz_answer .answer { border:2px solid #0d3b70; border-radius:2px; width:80%; height: 90px; padding:0px 1.6vw; font-size:3vw; letter-spacing: 2.1vw; text-align:left;box-sizing:border-box;}

.quiz_event .quiz_cell .text_hint {position:absolute; top:0; left:15%; width:50%; height:50%;}
.quiz_anwer {margin-bottom:10%; text-align:center;}
.quiz_anwer img {max-width:30%; min-width:200px; cursor:pointer;}
.hint1 {position:relative; width:90%; height:0; padding-bottom: 43.26%; margin:0 auto; border:2px solid #000;}
.hint1 .hint1_icon {position:absolute; top:-13%; left:-6%; width:15%;}
.hint1 .hint1_youtube { position: absolute; top: 0;	left: 0; width: 100%; height: 100%; }
.hint2 {position:relative; width:95%; margin:7% 0 7% 1%;}
.hint2 img { width: 100%; }

.event_top_w { display: block; }
.event_bt1_w { display: block; }
.event_bt1_w { display: block; }
.hint2_icon_w { display: block; }
.event_naver_w { display: block; }

.event_top_m { display: none; }
.event_bt1_m { display: none; }
.event_bt1_m { display: none; }
.hint2_icon_m { display: none; }
.event_naver_m { display: none; }

@media (max-width: 1700px) {
	.quiz_event .quiz_cell .quiz { font-size:4vw; }
	.quiz_event .quiz_answer .answer { height: 90px;padding: 0px 2vw; font-size:3.5vw; letter-spacing: 2.5vw; }
}

@media (max-width: 1200px) {
	.quiz_event .quiz_cell .quiz { font-size:4vw; }
	.quiz_event .quiz_answer .answer { height: 90px;padding: 0px 3.5vw; font-size:4.5vw; letter-spacing: 5.3vw; }
}
@media (max-width: 410px) {
	.quiz_event .quiz_answer .answer { height: 40px;padding: 0px 3.5vw; font-size:4.5vw; letter-spacing: 4.6vw;}
}
@media (max-width: 320px) {
	.quiz_event .quiz_answer .answer { height: 40px;padding: 0px 3.5vw; font-size:4.5vw; letter-spacing: 4.6vw;}
}
@media (max-width: 640px) {
	.quiz_event .quiz_cell.quiz_question_text {line-height:17px; font-size:15px;}
	.quiz_event .quiz_answer .answer { height: 40px; padding: 0px 3.5vw; font-size:4.5vw; letter-spacing: 4.6vw;}
	
	.hint2 {width:100%;}
	
	.event_top_w { display: none; }
	.event_bt1_w { display: none; }
	.event_bt1_w { display: none; }
	.hint2_icon_w { display: none; }
	.event_naver_w { display: none; }
	
	.event_top_m { display: block; }
	.event_bt1_m { display: block; }
	.event_bt1_m { display: block; }
	.hint2_icon_m { display: block; }	
	.event_naver_m { display: block; }
}

/* 팝업 공통 */
.greyBackLoading {position:fixed; top:0; left:0; width:100%; height:100%; overflow:auto; background:rgba(0,0,0,0.8); filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#70000000,endColorstr=#70000000); z-index:1001; display:none;}
.greyBackLoading .loading_gif {position:absolute; top:50%; left:50%;  margin:-64px 0 0 -64px;}

.greyBackModal {position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.5); z-index:1001; display:none;}
.modal {position:absolute; top:0; left:0; width:100%; z-index:1002; display:none; padding-left: 40px;}
.modal div, .modal input, .modal select {box-sizing:border-box;}
.modal .modal_container {position:relative; width:95%; max-width:600px; margin:0 auto 50px;}
.modal .modal_close {position:absolute; top:2%; right:3%; width:8%; cursor:pointer;}
.modal .modal_close img {width:100%;}
.modal .modal_contents {}
.modal .modal_info_btn_center {padding:0 0 7vw; text-align:center;}
.modal .modal_info_btn_center img {width:70%; cursor:pointer;}

.modal_info .modal_container {background:#fff;}
.modal_info_phone_area {position:relative; width:100%; height:9.3vw; margin:4vw 0; padding-left:20%; padding-right:5%; background:url('/common/images/promotion/modal_info_phone_bg.jpg') top center no-repeat; background-size:100% auto;}
.modal_info_phone_area select {position:relative; width:31%; height:100% !important; padding:1%; box-sizing:border-box; line-height:normal; text-align:center; text-align-last:center; color:#745a9e; font-size:3.7vw; border:1px solid #3c2267; background:url('/common/images/promotion/select_arrow.png') 90% 50% no-repeat #ebe0ee; background-size:10%; border-radius:10px;}
.modal_info_phone_area select option {padding:0 10px;}
.modal_info_phone_area input {position:relative; width:32%; height:100%; margin-left:0.6%; padding:0; text-align:center; color:#745a9e; font-size:3.7vw; border:1px solid #3c2267; background:#ebe0ee; border-radius:2px;}

.modal_info_name_area {position:relative; width:100%; height:9.3vw; margin:4vw 0; padding-left:20%; padding-right:5%; background:url('/common/images/promotion/modal_info_name_bg.jpg') top center no-repeat; background-size:100% auto;}
.modal_info_name_area input {position:relative; width:100%; height:100%; padding:0; padding-left:5%; text-align:left; color:#745a9e; font-size:3.7vw; vertical-align:top; border:1px solid #3c2267; background:#ebe0ee; border-radius:2px;}

.modal_info_agree_area {position:relative; width:100%; height:auto; margin:4vw 0; padding:0 10%;}
.modal_info_agree_area label {position:relative; width:auto; height:3.7vw; margin-right:10%; line-height:3.7vw; font-size:3.7vw; color:#3c2267; display:inline-block; cursor:pointer;}
.modal_info_agree_area input[type=radio] {width:3.7vw; height:3.7vw; margin-right:1.5vw;  background:#000; color:#000; border-radius:50%; }
/* .modal_info_agree_area input[type=radio]:checked {background:radial-gradient(circle, #182d6c 40%, #fff 40% 100%);} */
.modal_info_agree_area input[type=checkbox] {width:3.7vw; height:3.7vw; margin-right:1.5vw;  background:#000; color:#000;}
/* .modal_info_agree_area input[type=checkbox]:checked {background:radial-gradient(circle, #182d6c 40%, #fff 40% 100%);} */
.modal_info_agree_plus {position:absolute; top:-13vw; right:7%; width:6%; cursor:pointer;}
.modal_info_maketing_plus {position:absolute; top:-13vw; right:7%; width:6%; cursor:pointer;}

.modal_maketing {position:absolute; top:-300%; left:0; width:100%; display:none; z-index:1000;}
.modal_maketing .modal_agree_close {position:absolute; top:0; right:0; width:15%; height:40%; cursor:pointer;}
.modal_agree {position:absolute; top:-770%; left:0; width:100%; display:none; z-index:1000;}
.modal_agree .modal_agree_close {position:absolute; top:0; right:0; width:15%; height:20%; cursor:pointer;}

.modal_confirm {position:absolute; bottom:5%; left:0; width:100%; text-align:center;}
.modal_confirm img {cursor:pointer;}

@media (max-width: 980px) {
	.modal {padding-left: 0;}
}

@media screen and (min-width: 640px) {
	.modal .modal_info_btn_center {padding:0 0 60px;}

	.modal_info_phone_area {margin:20px 0 40px; height:60px;}
	.modal_info_phone_area select {font-size:24px;}
	.modal_info_phone_area input {font-size:24px;}

	.modal_info_name_area {margin:20px 0; height:60px;}
	.modal_info_name_area input {font-size:24px;}
	.modal_info_agree_area {margin:20px 0 40px;}
	.modal_info_agree_area label {height:24px; line-height:24px; font-size:24px;}
	.modal_info_agree_area input[type=radio] {width:24px; height:24px; margin-right:12px;}
	.modal_info_agree_area input[type=checkbox] {width:24px; height:24px; margin-right:12px;}

	.modal_info_agree_plus {top:-75px;}
	.modal_info_maketing_plus {top:-75px;}

	.modal_info_sns_area {margin:20px 0 40px;}
	.modal_info_sns_area img {width:80px; margin-right:10px;}
}
</style>


<c:choose>
	<c:when test="${strView eq 'prev' || strView eq 'next'}">
		<script>
		$(document).ready(function() {
			$("#subCon > h2:eq(0)").hide();
			$("#subCon > .path").hide();
			
			$('.modal_close').hide();
			$(".modal").css("top", 50);
			$('.greyBackModal').show();
			$('.modal_not_time').show();
			
			$('.modal_close').click(function() {
			});
		
			$('.modal_agree_close').click(function() {
			});
		
			$('input[name=quiz]').keyup(function(){
			});
		
			$('.modal_info_agree_plus').click(function() {
			});
		
			$('.modal_info_maketing_plus').click(function() {
			});
		});
		
		function show_modal_info() {
			alert("이벤트 시간이 아닙니다.");
		}
		
		function show_modal_complete() {
			alert("이벤트 시간이 아닙니다.");
		}
		
		function modal_complete_close() {
		}
		
		function modal_hint_close() {
		}
		</script>
	</c:when>
	
	<c:when test="${strView eq 'notNaver'}">
	<script>
		$(document).ready(function() {
			$("#subCon > h2:eq(0)").hide();
			$("#subCon > .path").hide();
		});
	</script>
	</c:when>

	<c:otherwise>
		<script>
		$(document).ready(function() {
			$("#subCon > h2:eq(0)").hide();
			$("#subCon > .path").hide();
			
			$(".onlynum").keyup(function(){
				$(this).val($(this).val().replace(/[^0-9]/gi,""));
		
				if ($(this).val().length > $(this).attr('maxLength')){
					$(this).val($(this).val().slice(0, $(this).attr('maxLength')));
				}
			});
		
			$(".maxlength").keyup(function(){
				if ($(this).val().length > $(this).attr('maxLength')){
					$(this).val($(this).val().slice(0, $(this).attr('maxLength')));
				}
			});
		
			$('.modal_close').click(function() {
				$('.greyBackModal').hide();
				$('.greyBackLoading').hide();
				$('.modal_info').hide();
				$('.modal_hint').hide();
				$('.modal_complete').hide();
			});
		
			$('.modal_agree_close').click(function() {
				$('.modal_agree').hide();
				$('.modal_maketing').hide();
			});
		
			$('input[name=quiz]').keyup(function(){
				$(this).val($(this).val().replace(/[0-9]/gi,""));
				$(this).val($(this).val().replace(/[a-z]/gi,""));
				$(this).val($(this).val().replace(/[A-Z]/gi,""));
				$(this).val($(this).val().replace(" ",""));
			});
		
			$('.modal_info_agree_plus').click(function() {
				$('.modal_agree').show();
			});
		
			$('.modal_info_maketing_plus').click(function() {
				$('.modal_maketing').show();
			});
		});
		
		function show_modal_info() {
			/* 
			var answer = "";
			var answer_check = false;
			$("input[name='quiz[]']").each(function() {
				if($(this).val().trim() == "") {
					answer_check = true;
				}
				answer+= $(this).val();
			});
			
			if(answer_check == true) {
				alert("정답을 입력해주세요.");
				return;		
			}
			*/
			 
			var answer = $("input[name='answer']").val();
			if($("input[name='answer']").val() == "") {
				alert("정답을 입력해주세요.");
				return;		
			}
			
			$(".modal").css("top", $(document).scrollTop() - 100);
			$('.greyBackModal').show();
			
			if (answer == "대명아임레디") {
				$('.modal_info').show();
			} else {
				$('.modal_hint').show();
			}
		}
		
		function show_modal_complete() {
			
			var f  = document.promotionForm;
			if(f.name.value == "") {
				alert("이름을 입력해주세요.");
				f.name.focus();
				return;
			}
			if(f.hphone1.value == "") {
				alert("전화번호를 입력해주세요.");
				f.hphone1.focus();
				return;
			}
			if(f.hphone2.value == "") {
				alert("전화번호를 입력해주세요.");
				f.hphone2.focus();
				return;
			}
			if(f.hphone3.value == "") {
				alert("전화번호를 입력해주세요.");
				f.hphone3.focus();
				return;
			}
			if(f.agree[0].checked == false && f.agree[1].checked == false) {
				alert("개인정보 수집 및 이용에 동의해주세요.");
				f.agree[0].focus();
				return;
			}
			if(f.agree[0].checked == false) {
				alert("개인정보 수집 및 이용에 동의해주세요.");
				f.agree[0].focus();
				return;
			}
			
			jQuery.post("./promotion_action.ajax", jQuery("#promotionForm").serialize(),
				function(r) 
				{
					if(r.status == "Y")
					{
						$('.modal_info').hide();
						$('.modal_close').hide();
						$(".modal").css("top", $(document).scrollTop() - 100);
						$('.modal_complete').show();
					}
					else
					{
						alert("새로고침 후 다시 한번 시도해주세요.");
					}
				}
			).fail(function () {
				alert("예기치 않은 오류입니다.");
			});
			
		}
		
		function modal_complete_close() {
			alert("참여해주셔서 감사합니다.");
			location.href="/pr-center/promotion/index.do";
		}
		
		function modal_hint_close() {
			$('.greyBackModal').hide();
			$('.modal_hint').hide();
		}
		</script>
	</c:otherwise>
 </c:choose>
 
 
 <c:choose>
	<c:when test="${strView ne 'notNaver'}">
		<div>
			<img src="/common/images/promotion/w_time_attack_event_top_bg.jpg" style="width:100%;" class="event_top_w"/>
			<img src="/common/images/promotion/m_time_attack_event_top_bg.jpg" style="width:100%;" class="event_top_m" />
			<div id="time_attack">
				<div class="quiz_event">
					<div class="quiz_table">
						<div class="quiz_row">
							<div class="quiz_cell quiz_question_mark">
								<img src="/common/images/promotion/question_icon.png" class="question_icon" />
							</div>
							<div class="quiz_cell quiz_question_text">
								여행, 골프, 크루즈, 상조 등 삶에 필요한 전반을 
								신개념 <b>고객 맞춤형 서비스</b>로 제공하는 <b>대명 그룹의 브랜드 이름은?</b>
							</div>
						</div>
					</div>
					<div class="quiz_answer">
						<input type="text" name="answer" class="answer maxlength" value="" maxlength="6" />
					</div>
					<div class="quiz_table">
						<!--
						<div class="quiz_row">
							<div class="quiz_cell quiz_input">&nbsp;</div>
							<div class="quiz_cell quiz_input">
								<input type="text" name="quiz[]" class="quiz maxlength" value="" maxlength="1" />
							</div>
							<div class="quiz_cell quiz_input">
								<input type="text" name="quiz[]" class="quiz maxlength" value="" maxlength="1" />
							</div>
							<div class="quiz_cell quiz_input">
								<input type="text" name="quiz[]" class="quiz maxlength" value="" maxlength="1" />
							</div>
							<div class="quiz_cell quiz_input">
								<input type="text" name="quiz[]" class="quiz maxlength" value="" maxlength="1" />
							</div>
							<div class="quiz_cell quiz_input">
								<input type="text" name="quiz[]" class="quiz maxlength" value="" maxlength="1" />
							</div>
							<div class="quiz_cell quiz_input">
								<input type="text" name="quiz[]" class="quiz maxlength" value="" maxlength="1" />
							</div>
							<div class="quiz_cell quiz_input">&nbsp;</div> 
						</div>
						-->
						<div class="quiz_row">
							<div class="quiz_cell quiz_input">&nbsp;</div>
							<div class="quiz_cell quiz_input">
								<img src="/common/images/promotion/text_hint_e.png" class="text_hint" />
							</div>
							<div class="quiz_cell quiz_input">
								<img src="/common/images/promotion/text_hint_a.png" class="text_hint" />
							</div>
							<div class="quiz_cell quiz_input">
								<img src="/common/images/promotion/text_hint_d.png" class="text_hint" />
							</div>
							<div class="quiz_cell quiz_input">
								<img src="/common/images/promotion/text_hint_d.png" class="text_hint" />
							</div>
							<div class="quiz_cell quiz_input">
								<img src="/common/images/promotion/text_hint_f.png" class="text_hint" />
							</div>
							<div class="quiz_cell quiz_input">
								<img src="/common/images/promotion/text_hint_e.png" class="text_hint" />
							</div>
							<div class="quiz_cell quiz_input">&nbsp;</div>
						</div>
					</div>
		
					<div class="quiz_anwer">
						<img src="/common/images/promotion/quiz_anwer_btn.png" onClick="show_modal_info();" />
					</div>
					<div class="hint1">
						<iframe class="hint1_youtube" width="560" height="315" src="https://www.youtube.com/embed/jlpzrDLTU70" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<img src="/common/images/promotion/hint1_icon.png" class="hint1_icon" />
					</div>
					<div class="hint2">
						<img src="/common/images/promotion/w_time_attack_hint2.jpg" class="hint2_icon_w" />
						<img src="/common/images/promotion/m_time_attack_hint2.jpg" class="hint2_icon_m" />
					</div>
				</div>
			</div>
			<img src="/common/images/promotion/w_time_attack_gift_bg.jpg" style="width:100%;" class="event_bt1_w"/>
			<img src="/common/images/promotion/w_time_attack_join_method_bg.jpg" style="width:100%;" class="event_bt1_w"/>
			<img src="/common/images/promotion/m_time_attack_gift_bg.jpg" style="width:100%;" class="event_bt1_m"/>
			<img src="/common/images/promotion/m_time_attack_join_method_bg.jpg" style="width:100%;" class="event_bt1_m"/>
		</div>
		
		<div class="greyBackLoading"><img src="/common/images/promotion/loading.gif" class="loading_gif" /></div>
		<div class="greyBackModal"></div>
		<div class="modal modal_info">
			<div class="modal_container">
				<div class="modal_close">
					<img src="/common/images/promotion/modal_close.png" />
				</div>
				<img src="/common/images/promotion/modal_info_top_bg.jpg" style="width:100%;" />
				<div class="modal_contents">
					<form name="promotionForm" id="promotionForm" method="post" action="">
					<input type="hidden" name="fromurl" value="${fromurl}"/>
						<div class="modal_info_name_area">
							<input type="text" name="name" value="" class="maxlength" maxlength="10" />
						</div>
						<div class="modal_info_phone_area">
							<select name="hphone1" class="">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							<input type="tel" name="hphone2" value="" class="onlynum maxlength" maxlength="4" />
							<input type="tel" name="hphone3" value="" class="onlynum maxlength" maxlength="4" />
						</div>
						<img src="/common/images/promotion/modal_info_agree_bg.jpg" style="width:100%;" />
						<div class="modal_info_agree_area">
							<div class="modal_agree">
								<div class="modal_agree_close"></div>
								<img src="/common/images/promotion/modal_agree_bg.png" style="width:100%;" />
							</div>
							<img src="/common/images/promotion/modal_info_agree_plus.png" class="modal_info_agree_plus" />
							<label for="agree_y" class="agree_y"><input type="radio" name="agree" id="agree_y" value="Y" />동의</label>
							<label for="agree_n" class="agree_n"><input type="radio" name="agree" id="agree_n" value="N" />비동의</label>
						</div>
						<img src="/common/images/promotion/modal_info_maketing_bg.jpg" style="width:100%;" />
						<div class="modal_info_agree_area">
							<div class="modal_maketing">
								<div class="modal_agree_close"></div>
								<img src="/common/images/promotion/modal_maketing_bg.png" style="width:100%;" />
							</div>
							<img src="/common/images/promotion/modal_info_agree_plus.png" class="modal_info_maketing_plus" />
							<label for="maketing_y" class="maketing_y"><input type="checkbox" name="maketing" id="maketing_y" value="Y" />동의</label>
						</div>
					</form>
					<div class="modal_info_btn_center">
						<img src="/common/images/promotion/modal_info_btn.jpg" class="modal_info_info_next_btn" onClick="show_modal_complete();" />
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal modal_complete">
			<div class="modal_container">
				<div class="modal_close">
					<img src="/common/images/promotion/modal_close.png" />
				</div>
				<div class="modal_contents">
					<img src="/common/images/promotion/modal_complete_bg.png" style="width:100%;" />
					<div class="modal_confirm">
						<img src="/common/images/promotion/modal_confirm_btn.png" style="width:70%;" onClick="modal_complete_close();" />
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal modal_hint">
			<div class="modal_container">
				<div class="modal_close">
					<img src="/common/images/promotion/modal_close.png" />
				</div>
				<div class="modal_contents">
					<img src="/common/images/promotion/modal_hint_bg.png" style="width:100%;" />
					<div class="modal_confirm">
						<img src="/common/images/promotion/modal_confirm_btn.png" style="width:70%;" onClick="modal_hint_close();" />
					</div>
				</div>
			</div>
		</div>
		
		<c:if test="${strView eq 'prev'}">
		<div class="modal modal_not_time">
			<div class="modal_container">
				<div class="modal_contents">
					<img src="/common/images/promotion/modal_prev_bg.png" style="width:100%;" />
					<div class="modal_confirm">
						<a href="/main/index.do"><img src="/common/images/promotion/modal_confirm_btn.png" style="width:70%;"/></a>
					</div>
				</div>
			</div>
		</div>
		</c:if>
		
		<c:if test="${strView eq 'next'}">
		<div class="modal modal_not_time">
			<div class="modal_container">
				<div class="modal_contents">
					<img src="/common/images/promotion/modal_next_bg.png" style="width:100%;" />
					<div class="modal_confirm">
						<a href="/main/index.do"><img src="/common/images/promotion/modal_confirm_btn.png" style="width:70%;"/></a>
					</div>
				</div>
			</div>
		</div>
		</c:if>
	</c:when>

	<c:otherwise>
		<a href="https://www.naver.com/" target="_blank"><img src="/common/images/promotion/w_time_attack_notnaver.png" style="width:100%;" class="event_naver_w"/></a>
		<a href="https://www.naver.com/" target="_blank"><img src="/common/images/promotion/m_time_attack_notnaver.jpg" style="width:100%;" class="event_naver_m" /></a>
	</c:otherwise>
 </c:choose>