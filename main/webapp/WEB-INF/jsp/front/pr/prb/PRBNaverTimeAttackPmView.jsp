<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

<style>
.quiz_container { width:100%; background-color:#2d0e78; }
.quiz_container .quiz_inner { width:90%; margin:0px auto 0 auto; padding:60px 0 0 0; box-sizing:border-box; }
.quiz_container .quiz_inner .quiz_question { width:100%; background-color:#131550; border-radius:20px 20px 0 0; }
.quiz_container .quiz_inner .quiz_question .quiz_question_table { width:70% !important; margin:0 auto; }
.quiz_container .quiz_inner .quiz_question .quiz_question_table .quiz_question_mark { width:10%; padding:30px 0;}
.quiz_container .quiz_inner .quiz_question .quiz_question_table .quiz_question_txt { width:90%; text-align:left; font-size:28px; color:#fff; padding:30px 0 30px 20px; word-break:keep-all;}
.quiz_container .quiz_inner .quiz_question .quiz_question_table .quiz_question_txt span {  font-family: 'NanumSquareB', dotum ,sans-serif; }
.quiz_container .quiz_inner .quiz_item { background-color:#e6e6e6; padding-top:40px; }
.quiz_container .quiz_inner .quiz_item .quiz_item_table { width:70% !important; margin:00px auto 0 auto; }
.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_td { width:calc(50% - 5px); position:relative; }
.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_vline { width:10px; }
.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_hline { height:10px; }
.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_td .quiz_item_table_input { width:70% !important; position:absolute; top:50%; left:50%; transform:translate(-50%, -50%); }
.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_checkbox { width:13%; position:relative; cursor:pointer; }
.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_checkbox .quiz_checkbox_on { position:absolute; top:50%; left:50%; transform:translate(-50%, -50%); display:none; }
.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_txt { width:auto; text-align:left; font-size:23px; color:#ffffff; padding:7px 0 7px 20px; font-weight: bold;  word-break:keep-all; cursor:pointer; }
.quiz_container .quiz_inner .quiz_btn { background-color:#e6e6e6; padding:30px 0; text-align:center;}
.quiz_container .quiz_inner .quiz_btn img { width:25%; cursor:pointer; }
.quiz_container .quiz_inner .quiz_hint_container { background-color:#e6e6e6; padding:30px 0; }
.quiz_container .quiz_inner .quiz_hint_container .quiz_hint_inner { width:95%; padding:30px 0; margin:0 auto; background-color:#fff; border-radius:20px; text-align:center; }
.quiz_container .quiz_inner .quiz_hint_container .quiz_hint_inner .quiz_hint_img { width:95%; margin:0 auto; }
.quiz_container .quiz_inner .quiz_hint_container .quiz_hint_inner .quiz_hint_btn { width:55%; margin:0 auto; padding:30px 0; }

.pc { display: block; }
.mo { display: none; }
	
@media (max-width: 990px) {
	.quiz_container .quiz_inner .quiz_question .quiz_question_table .quiz_question_txt { font-size:26px; }
	.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_txt { font-size:22px; }
}
@media (max-width: 900px) {
	.quiz_container .quiz_inner .quiz_question .quiz_question_table .quiz_question_txt { font-size:25px; }
	.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_txt { font-size:21px; }
}
@media (max-width: 780px) {
	.pc { display: none; }
	.mo { display: block; }
	.quiz_container .quiz_inner .quiz_question .quiz_question_table { width: 90% !important; }
	.quiz_container .quiz_inner .quiz_item .quiz_item_table { width: 80% !important; }
	.quiz_container .quiz_inner .quiz_item { padding-top:20px; }
	.quiz_container .quiz_inner .quiz_btn { padding:20px 0; }
	.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_txt { padding: 15px 0 15px 10px; }
	.quiz_container .quiz_inner .quiz_question .quiz_question_table .quiz_question_txt { font-size:27px; }
	.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_txt { font-size:25px; }
	.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_txt { padding:15px 0 15px 10px;}
	.quiz_container .quiz_inner .quiz_btn img { width: 40%; }
	.quiz_container .quiz_inner .quiz_hint_container .quiz_hint_inner .quiz_hint_btn { width: 85%; }
	.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_td .quiz_item_table_input { width:85% !important; }
}

@media (max-width: 640px) {
	.quiz_container .quiz_inner .quiz_question .quiz_question_table .quiz_question_txt { font-size:18px; }
	.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_txt { font-size:18px; }
	.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_checkbox { width: 20%; }
	.quiz_container .quiz_inner .quiz_btn img { width: 60%; }
}

@media (max-width: 500px) {
	.quiz_container .quiz_inner .quiz_question .quiz_question_table .quiz_question_txt { font-size:18px; }
	.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_txt { font-size:18px; }
	.quiz_container .quiz_inner .quiz_item .quiz_item_table .quiz_item_checkbox { width: 20%; }
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
.modal_info_phone_area select {position:relative; width:31%; height:100% !important; padding:1%; box-sizing:border-box; line-height:normal; text-align:center; text-align-last:center; color:#745a9e; font-size:3.7vw; background:#e8ecff; background-size:10%; border-radius:5px;}
.modal_info_phone_area select option {padding:0 10px;}
.modal_info_phone_area input {position:relative; width:32%; height:100%; margin-left:0.6%; padding:0; text-align:center; color:#745a9e; font-size:3.7vw; background:#e8ecff; border-radius:5px;}

.modal_info_name_area {position:relative; width:100%; height:9.3vw; margin:4vw 0; padding-left:20%; padding-right:5%; background:url('/common/images/promotion/modal_info_name_bg.jpg') top center no-repeat; background-size:100% auto;}
.modal_info_name_area input {position:relative; width:100%; height:100%; padding:0; padding-left:5%; text-align:left; color:#745a9e; font-size:3.7vw; vertical-align:top; background:#e8ecff; border-radius:5px;}

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
		
		function answer(num){
		}
		
		function nextgo1(){
			jQuery.post("./click.ajax", { NTEVTPV_DIVISION: "99991"},
				function(r) 
				{
					document.location.href = 'http://imdirect.co.kr/index?sub=ZERO&track=track17';
				}
			).fail(function () {
				document.location.href = 'http://imdirect.co.kr/index?sub=ZERO&track=track17';
			});
		}
		
		function nextgo2(){
			jQuery.post("./click.ajax", { NTEVTPV_DIVISION: "99992"},
				function(r) 
				{
					document.location.href = 'http://member.imreadymall.com/event/goods_event.php?event_ix=617&event_type=P';
				}
			).fail(function () {
				document.location.href = 'http://member.imreadymall.com/event/goods_event.php?event_ix=617&event_type=P';
			});
		}
		function nextgo2_mo(){
			jQuery.post("./click.ajax", { NTEVTPV_DIVISION: "99992"},
				function(r) 
				{
					document.location.href = 'http://member.imreadymall.com/event/goods_promotion.php?kind=P&event_ix=618';
				}
			).fail(function () {
				document.location.href = 'http://member.imreadymall.com/event/goods_promotion.php?kind=P&event_ix=618';
			});
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
			});
		
			$('.modal_agree_close').click(function() {
				$('.modal_agree').hide();
				$('.modal_maketing').hide();
			});
		
			$('.modal_info_agree_plus').click(function() {
				$('.modal_agree').show();
			});
		
			$('.modal_info_maketing_plus').click(function() {
				$('.modal_maketing').show();
			});
			
			$("input[name='agree_all']").click(function(){
				if($(this).prop("checked") == true){
					document.promotionForm.agree[0].checked = true;
					document.promotionForm.maketing.checked = true;
				}else {
					document.promotionForm.agree[0].checked = false;
					document.promotionForm.agree[1].checked = false;
					document.promotionForm.maketing.checked = false;
				}
			});
		});
		
		function answer(num){
			var obj = $("input[name='answer"+num+"']");
			if(obj.val() == "N") {
				obj.val("Y");
				$(".quiz_checkbox_on.num"+num).show();	
			}else {
				obj.val("N");
				$(".quiz_checkbox_on.num"+num).hide();
			}
		}
		
		function show_modal_info() {
			var f = document.promotionForm;
			$(".modal").css("top", $(document).scrollTop() - 50);
			$('.greyBackModal').show();
			if(f.answer1.value == "Y" && f.answer2.value == "Y" && f.answer3.value == "Y" && f.answer4.value == "Y"){
				$('.modal_info').show();
			}else {
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
						$(".modal").css("top", $(document).scrollTop() - 50);
						$('.modal_complete').show();
					}
					else
					{
						alert("새로고침 후 다시 한번 시도해주세요.");
					}
				}
			).fail(function () {
				alert("데이터 저장에 실패하였습니다. 다시 한번 시도해주세요.");
			});
			
		}
		
		function modal_complete_close() {
			location.href="/main/index.do";
		}
		
		function modal_hint_close() {
			$('.greyBackModal').hide();
			$('.modal_hint').hide();
		}
		
		function nextgo1(){
			jQuery.post("./click.ajax", { NTEVTPV_DIVISION: "99991"},
				function(r) 
				{
					document.location.href = 'http://imdirect.co.kr/index?sub=ZERO&track=track17';
				}
			).fail(function () {
				document.location.href = 'http://imdirect.co.kr/index?sub=ZERO&track=track17';
			});
		}
		
		function nextgo2(){
			jQuery.post("./click.ajax", { NTEVTPV_DIVISION: "99992"},
				function(r) 
				{
					document.location.href = 'http://member.imreadymall.com/event/goods_event.php?event_ix=617&event_type=P';
				}
			).fail(function () {
				document.location.href = 'http://member.imreadymall.com/event/goods_event.php?event_ix=617&event_type=P';
			});
		}
		function nextgo2_mo(){
			jQuery.post("./click.ajax", { NTEVTPV_DIVISION: "99992"},
				function(r) 
				{
					document.location.href = 'http://member.imreadymall.com/event/goods_promotion.php?kind=P&event_ix=618';
				}
			).fail(function () {
				document.location.href = 'http://member.imreadymall.com/event/goods_promotion.php?kind=P&event_ix=618';
			});
		}
		</script>
	</c:otherwise>
 </c:choose>

<!-- 정상 -->
<c:choose>
	<c:when test="${strView ne 'notNaver'}">
		<div class="pc">
			<div><img src="/common/images/promotion/pm_pc_01.jpg" style="width:100%;"/></div>
			<div class="quiz_container">
				<div class="quiz_inner">
					<div class="quiz_question">
						<table class="quiz_question_table">
							<tr>
								<td class="quiz_question_mark">
									<img src="/common/images/promotion/pc_question.png" style="width:100%;"/>
								</td>
								<td class="quiz_question_txt">
									다음 중 대명아임레디 가입혜택을 누리는 고객들이 <span>주계약으로 맺을 수 있는 상품</span>을 모두 골라주세요!
								</td>
							</tr>
						</table>
					</div>
					<div class="quiz_item">
						<table class="quiz_item_table">
							<tr>
								<td class="quiz_item_td" onclick="javascript:answer('1');">
									<img src="/common/images/promotion/pm_pc_02.jpg" style="width:100%;">
									
									<table class="quiz_item_table_input">
										<tr>
											<td class="quiz_item_checkbox">
												<img src="/common/images/promotion/pm_pc_checkbox.png" style="width:100%;"/>
												<img src="/common/images/promotion/pm_pc_checkbox_on.png" style="width:60%;" class="quiz_checkbox_on num1"/>
											</td>
											<td class="quiz_item_txt">
												크루즈 서비스
											</td>
										</tr>
									</table>
								</td>
								<td class="quiz_item_vline"></td>
								<td class="quiz_item_td" onclick="javascript:answer('2');">
									<img src="/common/images/promotion/pm_pc_03.jpg" style="width:100%;">
									
									<table class="quiz_item_table_input">
										<tr>
											<td class="quiz_item_checkbox">
												<img src="/common/images/promotion/pm_pc_checkbox.png" style="width:100%;"/>
												<img src="/common/images/promotion/pm_pc_checkbox_on.png" style="width:60%;" class="quiz_checkbox_on num2"/>
											</td>
											<td class="quiz_item_txt">
												여행 서비스
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="quiz_item_hline"></td>
							</tr>
							<tr>
								<td class="quiz_item_td" onclick="javascript:answer('3');">
									<img src="/common/images/promotion/pm_pc_04.jpg" style="width:100%;">
									
									<table class="quiz_item_table_input">
										<tr>
											<td class="quiz_item_checkbox">
												<img src="/common/images/promotion/pm_pc_checkbox.png" style="width:100%;"/>
												<img src="/common/images/promotion/pm_pc_checkbox_on.png" style="width:60%;" class="quiz_checkbox_on num3"/>
											</td>
											<td class="quiz_item_txt">
												골프 서비스
											</td>
										</tr>
									</table>
								</td>
								<td class="quiz_item_vline"></td>
								<td class="quiz_item_td" onclick="javascript:answer('4');">
									<img src="/common/images/promotion/pm_pc_05.jpg" style="width:100%;">
									
									<table class="quiz_item_table_input">
										<tr>
											<td class="quiz_item_checkbox">
												<img src="/common/images/promotion/pm_pc_checkbox.png" style="width:100%;"/>
												<img src="/common/images/promotion/pm_pc_checkbox_on.png" style="width:60%;" class="quiz_checkbox_on num4"/>
											</td>
											<td class="quiz_item_txt">
												상조 서비스
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<div class="quiz_btn">
						<img src="/common/images/promotion/pm_pc_btn_checkbox.png" onClick="show_modal_info();"/>
					</div>
					<div class="quiz_hint_container">
						<div class="quiz_hint_inner">
							<img src="/common/images/promotion/pm_pc_06.jpg" class="quiz_hint_img"/>
						</div>
					</div>
				</div>
			</div>
			
			<div><img src="/common/images/promotion/pm_pc_07.jpg" style="width:100%;"/></div>
			<div><img src="/common/images/promotion/pm_pc_08.jpg" style="width:100%;"/></div>
			<div><img src="/common/images/promotion/pm_pc_09.jpg" style="width:100%;"/></div>
			<div><a href="http://member.imreadymall.com/event/goods_event.php?event_ix=617&event_type=P" target="_blank"><img src="/common/images/promotion/pm_pc_10.jpg" style="width:100%;"/></a></div>
		</div>
		
		<div class="mo">
			<div><img src="/common/images/promotion/pm_mo_01.jpg" style="width:100%;"/></div>
			<div class="quiz_container">
				<div class="quiz_inner">
					<div class="quiz_question">
						<table class="quiz_question_table">
							<tr>
								<td class="quiz_question_mark">
									<img src="/common/images/promotion/mo_question.png" style="width:100%;"/>
								</td>
								<td class="quiz_question_txt">
									다음 중 대명아임레디 가입혜택을 누리는 고객들이 <span>주계약으로 맺을 수 있는 상품</span>을 모두 골라주세요!
								</td>
							</tr>
						</table>
					</div>
					<div class="quiz_item">
						<table class="quiz_item_table">
							<tr>
								<td class="quiz_item_td" onclick="javascript:answer('1');">
									<img src="/common/images/promotion/pm_mo_02.jpg" style="width:100%;">
									
									<table class="quiz_item_table_input">
										<tr>
											<td class="quiz_item_checkbox">
												<img src="/common/images/promotion/pm_mo_checkbox.png" style="width:100%;"/>
												<img src="/common/images/promotion/pm_mo_checkbox_on.png" style="width:60%;" class="quiz_checkbox_on num1"/>
											</td>
											<td class="quiz_item_txt">
												크루즈 서비스
											</td>
										</tr>
									</table>
								</td>
								<td class="quiz_item_vline"></td>
								<td class="quiz_item_td" onclick="javascript:answer('2');">
									<img src="/common/images/promotion/pm_mo_03.jpg" style="width:100%;">
									
									<table class="quiz_item_table_input">
										<tr>
											<td class="quiz_item_checkbox">
												<img src="/common/images/promotion/pm_mo_checkbox.png" style="width:100%;"/>
												<img src="/common/images/promotion/pm_mo_checkbox_on.png" style="width:60%;" class="quiz_checkbox_on num2"/>
											</td>
											<td class="quiz_item_txt">
												여행 서비스
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="quiz_item_hline"></td>
							</tr>
							<tr>
								<td class="quiz_item_td" onclick="javascript:answer('3');">
									<img src="/common/images/promotion/pm_mo_04.jpg" style="width:100%;">
									
									<table class="quiz_item_table_input">
										<tr>
											<td class="quiz_item_checkbox">
												<img src="/common/images/promotion/pm_mo_checkbox.png" style="width:100%;"/>
												<img src="/common/images/promotion/pm_mo_checkbox_on.png" style="width:60%;" class="quiz_checkbox_on num3"/>
											</td>
											<td class="quiz_item_txt">
												골프 서비스
											</td>
										</tr>
									</table>
								</td>
								<td class="quiz_item_vline"></td>
								<td class="quiz_item_td" onclick="javascript:answer('4');">
									<img src="/common/images/promotion/pm_mo_05.jpg" style="width:100%;">
									
									<table class="quiz_item_table_input">
										<tr>
											<td class="quiz_item_checkbox">
												<img src="/common/images/promotion/pm_mo_checkbox.png" style="width:100%;"/>
												<img src="/common/images/promotion/pm_mo_checkbox_on.png" style="width:60%;" class="quiz_checkbox_on num4"/>
											</td>
											<td class="quiz_item_txt">
												상조 서비스
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<div class="quiz_btn">
						<img src="/common/images/promotion/pm_mo_btn_checkbox.png" onClick="show_modal_info();"/>
					</div>
					<div class="quiz_hint_container">
						<div class="quiz_hint_inner">
							<img src="/common/images/promotion/pm_mo_06.jpg" class="quiz_hint_img"/>
						</div>
					</div>
				</div>
			</div>
			
			<div><img src="/common/images/promotion/pm_mo_07.jpg" style="width:100%;"/></div>
			<div><img src="/common/images/promotion/pm_mo_08.jpg" style="width:100%;"/></div>
			<div><img src="/common/images/promotion/pm_mo_09.jpg" style="width:100%;"/></div>
			<div class="pc"><a href="http://member.imreadymall.com/event/goods_event.php?event_ix=617&event_type=P" target="_blank"><img src="/common/images/promotion/pm_mo_10.jpg" style="width:100%;"/></a></div>
			<div class="mo"><a href="http://m.member.imreadymall.com/event/goods_promotion.php?kind=P&event_ix=618" target="_blank"><img src="/common/images/promotion/pm_mo_10.jpg" style="width:100%;"/></a></div>
		</div>
		
		<div class="greyBackLoading"><img src="/common/images/promotion/loading.gif" class="loading_gif" /></div>
		<div class="greyBackModal"></div>
		
		<div class="modal modal_info">
			<div class="modal_container">
				<div class="modal_close">
					<img src="/common/images/promotion/pop_close.png" />
				</div>
				<img src="/common/images/promotion/pm_pop_top.png" style="width:100%;" />
				<div class="modal_contents">
					<form name="promotionForm" id="promotionForm" method="post" action="">
					<input type="hidden" name="fromurl" value="${fromurl}"/>
					<input type="hidden" name="answer1" value="N">
					<input type="hidden" name="answer2" value="N">
					<input type="hidden" name="answer3" value="N">
					<input type="hidden" name="answer4" value="N">
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
						<img src="/common/images/promotion/pop_line.png" style="width:100%;" />
						<div class="modal_info_agree_area">
							<label for="agree_all_y" class="agree_all_y"><input type="checkbox" name="agree_all" id="agree_all_y" />전체동의</label>
						</div>
					</form>
					<div class="modal_info_btn_center">
						<img src="/common/images/promotion/pop_btn.png" class="modal_info_info_next_btn" onClick="show_modal_complete();" />
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal modal_complete">
			<div class="modal_container">
				<div class="modal_contents">
					<div><img src="/common/images/promotion/pm_pop_end_1.png" style="width:100%; cursor:pointer;" onClick="javascript:nextgo1();"/></div>
					<div><img src="/common/images/promotion/pop_complete.png" style="width:100%;" onClick="modal_complete_close();" /></div>
					<div class="pc"><img src="/common/images/promotion/pm_pop_end_3.png" style="width:100%; cursor:pointer;" onClick="javascript:nextgo2();"/></div>
					<div class="mo"><img src="/common/images/promotion/pm_pop_end_3.png" style="width:100%; cursor:pointer;" onClick="javascript:nextgo2_mo();"/></div>
				</div>
			</div>
		</div>
		
		<div class="modal modal_hint">
			<div class="modal_container">
				<div class="modal_close">
					<img src="/common/images/promotion/modal_close.png" />
				</div>
				<div class="modal_contents">
					<img src="/common/images/promotion/pm_pop_hint.png" style="width:100%;" onClick="modal_hint_close();" />
				</div>
			</div>
		</div>
		
		<c:if test="${strView eq 'prev'}">
		<div class="modal modal_not_time">
			<div class="modal_container">
				<div class="modal_contents">
					<a href="/main/index.do"><img src="/common/images/promotion/pm_pop_prev.png" style="width:100%;" /></a>
				</div>
			</div>
		</div>
		</c:if>
		
		<c:if test="${strView eq 'next'}">
		<div class="modal modal_not_time">
			<div class="modal_container">
				<div class="modal_contents">
					<div><img src="/common/images/promotion/pm_pop_end_1.png" style="width:100%; cursor:pointer;" onClick="javascript:nextgo1();"/></div>
					<div><a href="/main/index.do"><img src="/common/images/promotion/pm_pop_end_2.png" style="width:100%;"/></a></div>
					<div class="pc"><img src="/common/images/promotion/pm_pop_end_3.png" style="width:100%; cursor:pointer;" onClick="javascript:nextgo2();"/></div>
					<div class="mo"><img src="/common/images/promotion/pm_pop_end_3.png" style="width:100%; cursor:pointer;" onClick="javascript:nextgo2_mo();"/></div>
										
				</div>
			</div>
		</div>
		</c:if>
	</c:when>
	<c:otherwise>
		<a href="https://www.naver.com/" target="_blank"><img src="/common/images/promotion/pm_pc_notnaver.jpg" style="width:100%;" class="pc"/></a>
		<a href="https://www.naver.com/" target="_blank"><img src="/common/images/promotion/pm_mo_notnaver.jpg" style="width:100%;" class="mo" /></a>
	</c:otherwise>
 </c:choose>	
