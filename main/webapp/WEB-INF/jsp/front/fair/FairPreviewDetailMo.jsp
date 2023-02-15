<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/jsp/include/el.jspf" %>
<!doctype html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<title>${config.fcfgTitle}</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=640, target-densitydpi=device-dpi, user-scalable=no">
		<meta name="author" content="http://www.daemyungimready.com" />
		<meta name="keywords" content="대명아임레디, 라이프케어, 상조/웨딩/여행, 업계 최초 멤버십/결합혜택, 회원가입, 고객센터" />
		<meta name="description" content="대명아임레디, 라이프케어, 상조/웨딩/여행, 업계 최초 멤버십/결합혜택, 회원가입, 고객센터" />
		<meta name="format-detection" content ="telephone=no"/>
		<meta name="naver-site-verification" content="1e3c1710408be91577f020b8af5f265899f170ca"/>
		<meta property="og:type" content="article" />
		<meta property="og:site_name" content="대명아임레디" />
		<meta property="og:title" content="대명아임레디" />
		<meta property="og:description" content="대명아임레디, 라이프케어, 상조/웨딩/여행, 업계 최초 멤버십/결합혜택, 회원가입, 고객센터" />
		<meta property="og:image" content="http://www.daemyunglifeway.com/common/images/logo.gif" />
		<link rel="shortcut icon" href="/common/images/favicon_16.ico" type="image/x-icon" />
		<link rel="icon" href="/common/images/favicon_16.ico" type="image/x-icon" />
		
		<script type="text/javascript" src="/common/js/jquery-1.8.2.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
		<script type='text/javascript' src='/common/js/swiper.min.js'></script>
		<link rel='stylesheet' type='text/css' href='/common/css/swiper.min.css' />
	</head>
	
	<style>
		@font-face {
			font-family: 'NotoKrL';
			font-style: normal;
			font-weight: 100;
			src: local('Noto Sans Light'), local('NotoSans-Light'), url(/common/css/fonts/NotoSans-Light.eot);
			src: url(/common/css/fonts/NotoSans-Light.eot?#iefix) format('embedded-opentype'),
			url(/common/css/fonts/NotoSans-Light.woff2) format('woff2'),
			url(/common/css/fonts/NotoSans-Light.woff) format('woff');;
		}
		@font-face {
			font-family: 'NotoKrR';
			font-style: normal;
			font-weight: 300;
			src: local('Noto Sans Regular'), local('NotoSans-Regular'), url(/common/css/fonts/NotoSans-Regular.eot);
			src: url(/common/css/fonts/NotoSans-Regular.eot?#iefix) format('embedded-opentype'),
			url(/common/css/fonts/NotoSans-Regular.woff2) format('woff2'),
			url(/common/css/fonts/NotoSans-Regular.woff) format('woff');
		}
		@font-face {
			font-family: 'NotoKrM';
			font-style: normal;
			font-weight: 500;
			src: local('Noto Sans Medium'), local('NotoSans-Medium'), url(/common/css/fonts/NotoSans-Medium.eot);
			src: url(/common/css/fonts/NotoSans-Medium.eot?#iefix) format('embedded-opentype'),
			url(/common/css/fonts/NotoSans-Medium.woff2) format('woff2'),
			url(/common/css/fonts/NotoSans-Medium.woff) format('woff');
		}
		@font-face {
			font-family: 'NotoKrB';
			font-style: normal;
			font-weight: 700;
			src: local('Noto Sans Bold'), local('NotoSans-Bold'), url(/common/css/fonts/NotoSans-Bold.eot);
			src: url(/common/css/fonts/NotoSans-Bold.eot?#iefix) format('embedded-opentype'),
			url(/common/css/fonts/NotoSans-Bold.woff2) format('woff2'),
			url(/common/css/fonts/NotoSans-Bold.woff) format('woff');
		}
		
		body,ul,li,table { margin:0; padding:0; font-family:"NotoKrR", sans-serif; word-break:keep-all; }
		li { list-style:none; }
		.container { position:relative; max-width:640px; margin:0 auto; line-height:0; text-align:center; }
		
		.header { position:relative; width:100%; background-color:#1d2349; }
		.header .header_logo { float:left; margin-top:24px; margin-left:20px }
		.header .header_title { float:left; box-sizing:border-box; font-weight:400; color:#ffffff; font-size:25px; margin-top:30px; margin-bottom:30px; width: 330px; line-height: normal; text-align: left; }
		.header .header_title span { float:left; line-height:140%; padding:0 10px 0 15px;  }
		.header .header_title .header_txt { float:left; width:290px; }
		.header .header_back { float:right; margin-top:24px; margin-right:20px; cursor:pointer; }
		
		.input { position:relative; margin:20px; border:1px solid #dcdcdc; box-sizing:border-box; padding:25px; }
		.input .thumnail { position:relative; width:550px; height:350px; } 
		.input .thumnail .swiper-pagination { position: absolute; width:auto; padding:5px 15px; left: 50%; bottom:20px; box-sizing:border-box; border-radius:40px; background-color:rgba(0,0,0,.3); -webkit-transform: translateX(-50%);-ms-transform: translateX(-50%);transform: translateX(-50%); z-index: 1;}
		.input .thumnail .swiper-pagination .swiper-pagination-bullet {position: relative;display: inline-block; width:14px; height:14px; background:#fff; border-radius: 50%; margin-left:20px; opacity:.3;}
		.input .thumnail .swiper-pagination .swiper-pagination-bullet:first-child {margin-left: 0;}
		.input .thumnail .swiper-pagination .swiper-pagination-bullet-active { opacity:1; }
		.input .thumnail .productLabel { position:absolute; top:20px; left:20px; z-index:1; }
		.input .thumnail .productLabel .productLabelDetail { display:inline-block; line-height:120%;  color:#ffffff; font-size:20px; margin-left:5px; padding:5px; box-sizing:border-box; min-width:70px; text-align:center; }
		.input .thumnail .productLabel .productLabelDetail:first-child { margin-left:0; }
		
		.input .form { margin:10px 0 0 0; }
		.input .form table {  }
		.input .form td { height:60px; line-height:60px; position:relative; }
		.input .form td.title { width:150px; padding-left:25px; background-color:#f2f6fe; text-align:left; font-weight:400; color:#717171; font-size:30px; letter-spacing: -1px; }
		.input .form td.write { width:400px; background-color:#f2f6fe; font-weight:600; color:#000c57; font-size:26px; letter-spacing: -1px; line-height:normal; padding-right:10px;}
		.input .form td.write a { display:block; font-weight:600; color:#000c57; width:100%; font-size:26px; letter-spacing:-1px; text-decoration:none; }
		.input .form td.write.color { color:#FF3B85; }
		.input .form td.write.color a { color:#FF3B85; }
		
		.input .form td.write input { width:90%; height:100%; line-height:45px; background-color:transparent; color:#000c57; font-weight:400; color:#000c57; font-size:30px; border:none; padding: 0 20px; box-sizing: border-box;border: 1px solid #eeeeee; background: #ffffff; height: 40px; line-height: 40px; border-radius: 20px;}
		.input .form td.write select { width:90%; height:100%; line-height:45px; background-color:transparent; color:#000c57; font-weight:400; color:#000c57; font-size:30px; border:none; padding: 0 20px; box-sizing: border-box;border: 1px solid #eeeeee; background: #ffffff; height: 40px; line-height: 40px; border-radius: 20px;}
		.input .form td.write input.inputPhone { width:30%; text-align:center; }
		.input .form td.spacetr { height:15px; background-color:#ffffff; }
		
		.input .form td.email_id { width:160px; }
		.input .form td.email_id input { height:40px; border:1px solid #eeeeee; background:#ffffff; box-sizing:border-box; }
		.input .form td.email_txt { width:30px; font-weight:600; color:#717171; font-size:20px; text-align:center; }
		.input .form td.email_domain { width:150px; }
		.input .form td.email_domain input { height:40px; border:1px solid #eeeeee; background:#ffffff; box-sizing:border-box; }
		.input .form td.email_list { text-align:left; }
		.input .form td.email_list select { width:auto; text-align:left; background-color: #cadcff; border-radius: 30px; width: 325px; margin-left: 10px; height: 50px; margin-bottom:10px;}
		
		.input .form .price { margin-top:40px; text-align:center; }
		.input .form .price .price_value { font-weight:600; color:#ff3b85; font-size:40px; }
		.input .form .price .won { font-weight:400; color:#00000; font-size:35px; }
		
		.input .form .input_submit { margin-top:20px; }
		.input .form .input_submit button { width:100%; position:relative; display:block; background-color:#ff3b85; color:#ffffff; font-weight:600; font-size:25px; border:none; line-height: 100%; padding:15px 40px; border-radius:5px; letter-spacing: -1px; cursor:pointer; }
		.input .form .input_submit button .loading { position:absolute; width:100%; height:100%; top:0; left:0; background-color:rgba(255,255,255,0.7); display:none; }
		.input .form .input_submit button .loading img { position:absolute; top:50%; left:50%; margin-top:-16px; margin-left:-16px; }
		.input .form .input_rule { float:center; margin-top:50px; position:relative; }
		.input .form .input_rule .label_agree { color:#717171; font-weight:400; font-size:23px; letter-spacing: -2px; }
		.input .form .input_rule input { width:20px; height:20px; margin:0 5px; vertical-align: text-bottom; }
		.input .form .input_rule .agree_txt { color:#a2a2a2; font-weight:600; font-size:20px; letter-spacing: -2px; }
		.input .form .input_rule .agree_text { position:absolute; width:600px; height:500px; overflow-y:auto; top:30px; left:-26px; background-color:#ffffff; padding:20px 25px; box-sizing:border-box; border:1px solid #e4e4e4; z-index:1; display:none; }
		.input .form .input_rule .agree_text .agreeTextTitle { color:#292d6c; font-weight:600; font-size:20px; letter-spacing: -2px; text-align:left; line-height: 100%; }
		.input .form .input_rule .agree_text .agreeTextClose { position: absolute; top: 20px; right: 30px; display: inline-block; padding: 0; width: 1px; height: 20px; background: #292d6c; transform: rotate(45deg); cursor:pointer; }
		.input .form .input_rule .agree_text .agreeTextClose:before { display: block; content: ""; position: absolute; top: 50%; left: -10px; width: 20px; height: 1px; margin-top: -1px; background: #292d6c; }
		.input .form .input_rule .agree_text .agreeTextClose a { display:block; display:block; width:20px; height: 20px; top: 0px; left: -10px; position: absolute; transform: rotate(45deg); }
		.input .form .input_rule .agree_text .agree_telegram { color:#717171; font-weight:400; font-size:19px; letter-spacing: -2px; text-align:left; line-height: 140%; margin-top:20px; word-break:break-all; }
		
		#benefitList { position:absolute; width:548px; top:80px; left:0px; background-color:#ffffff; padding:20px 25px; box-sizing:border-box; border:1px solid #e4e4e4; z-index:1; display:none;  }
		#benefitList .benefitTitle { color:#292d6c; font-weight:400; font-size:30px; letter-spacing: -2px; text-align:left; line-height: 100%; }
		#benefitList .benefitClose { position: absolute; top: 20px; right: 30px; display: inline-block; padding: 0; width: 1px; height: 30px; background: #292d6c; transform: rotate(45deg); cursor:pointer; }
		#benefitList .benefitClose:before { display: block; content: ""; position: absolute; top: 50%; left: -15px; width: 30px; height: 1px; margin-top: -1px; background: #292d6c; }
		#benefitList .benefitClose a { display:block; width:30px; height: 30px; top: 0px; left: -10px; position: absolute; transform: rotate(45deg); }
		
		#benefitList .benefitContainer {}
		#benefitList .benefitContainer .benefitList { float:left; margin-left:20px; width:215px; padding-bottom:20px; background-color:#f2f6fe; border:2px solid #f2f6fe; box-sizing:border-box; margin-top:20px; cursor:pointer; }
		#benefitList .benefitContainer .benefitList.left { margin-left:30px; }
		#benefitList .benefitContainer .benefitList.active { border:2px solid #3dccd9; }
		
		#benefitList .benefitContainer .benefitList .benefitLi { position:relative; display:inline-block; margin-top:20px; }
		#benefitList .benefitContainer .benefitList .benefitLi .benefitList_img { text-align:center; line-height:0; }
		#benefitList .benefitContainer .benefitList .benefitLi .benefitList_img img { min-width:150px; }
		#benefitList .benefitContainer .benefitList .benefitLi .benefitList_title { color:#524f56; font-weight:600; font-size:23px; letter-spacing:-2px; text-align:center; line-height:120%; margin-top:20px; }
		#benefitList .benefitContainer .benefitList .benefitLi .benefitList_subtitle { color:#524f56; font-weight:400; font-size:23px; letter-spacing:-2px; text-align:center; line-height:120%; }
		#benefitList .benefitContainer .benefitList .benefitLi .benefitList_desc { color:#524f56; font-weight:400; font-size:23px; letter-spacing:-2px; text-align:center; line-height:120%; }
		
		.detail { position:relative; }
		.detail .detail_bg { background-size:cover; background-position:center; line-height:0; }
		.detail .detail_content { text-align:center; }
		
		.topMove { position:fixed; left:0px; bottom:0px; line-height:0; display:none; }
		.topMove img { }
		
		.footer { position:relative; width:100%; padding-bottom:90px; box-sizing:border-box; }
		.footer .logo {  }
		.footer .links { background:#ffffff; padding:30px 30px 0 30px; box-sizing:border-box; }
		.footer .links a { line-height:normal; font-weight:400; color:#545454; font-size:20px; text-decoration:none; }
		.footer .links span { line-height:normal; font-size:18px; padding:0 10px; box-sizing:border-box; }
		
		.footer .info { line-height:normal; padding:20px 30px 30px 30px; text-align:left; }
		.footer .info span { height:normal; padding:0 5px; box-sizing:border-box; font-weight:400; color:#888888; font-size:14px; letter-spacing: -1px; }
		.footer .info span.txt { padding:0; }
		.footer .info .copyright { line-height:normal; padding:10px 0 0 0; box-sizing:border-box; font-weight:400; color:#888888; font-size:14px; letter-spacing: -1px; text-align:left; }
		
		.end { width:100%; margin:0 auto; }
	</style>

	<script>
		Number.prototype.format = function(){
		    if(this==0) return 0;
		    var reg = /(^[+-]?\d+)(\d{3})/;
		    var n = (this + '');
		    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		    return n;
		};
		jQuery(document).ready(function(){
			
			<c:if test="${config.fcfgEtimeDate eq null && config.fcfgStatus ne 'A' || config.fcfgStatus eq 'N'}">
			jQuery("body").html('<div class="end"><img src="/common/images/fairimage/parking_mo.png"></div>')
			return;
			</c:if>
			
			jQuery(".header_back").click(function(){
				history.back();
			});
			
			jQuery("textarea[name='THUMNAIL']").each(function(){
				var swiperThumnail = new Swiper('.swiperThumnail', {
					autoplay: {
						delay: 3000
					},
					loop: true,
					delay: 2000,
					disableOnInteraction: false,
					pagination: {
						el: '.swiper-pagination',
						clickable: true,
						renderBullet: function (index, className) {
							return '<span class="' + className + '"></span>';
						}
					},
					on: {
						autoplayStop: function () {
							this.autoplay.start();
						}
					}
				});
				
				var jsonThumnail = JSON.parse(jQuery(this).val());
				for(var i = 0; i < jsonThumnail.length; i++) {
					swiperThumnail.appendSlide('<li class="swiper-slide"><img src="/common/images/fairimage/'+ jsonThumnail[i].M_SAVE_NM +'" title="'+ jsonThumnail[i].M_REAL_NM +'"></li>');
				}
			});
			
			jQuery("textarea[name='INPUT']").each(function(){
				var html = '<table border="0" cellpadding="0" cellspacing="0">';
				
				var jsonInput = JSON.parse(jQuery(this).val());
				for(var i = 0; i < jsonInput.INPUT.length; i++) {
					var input = jsonInput.INPUT[i];
					
					//상품명
					if(i == 2) {
						html += '<tr>';
						html += '<td class="spacetr"></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td class="title">예약상품</td>';
						html += '<td class="write col3 txt wrap color">${product.fpMainTitle}</td>';
						html += '</tr>';
					//결합혜택
					} else if(i == 4) {
						html += '<tr>';
						html += '<td class="spacetr" colspan="2"><div id="benefitList"></div></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td class="title" onclick="javascript:jQuery(this).benefit_list();">결합혜택</td>';
						html += '<td class="write col3 txt color">';
						html += '<a onclick="javascript:jQuery(this).benefit_list();" id="benefit_product">선택하기</a></td>';
						html += '</tr>';
					}
					
					if(input.KEY == "TEXT") {
						html += '<tr>';
						html += '<td class="spacetr"></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td class="title" onclick="javascript:jQuery(this).focusinput(\''+ input.KEY +'\', '+ i +')">'+ input.TITLE +'</td>';
						html += '<td class="write">';
						html += '<input type="hidden" name="input'+ i +'_key" value="'+ input.KEY +'">';
						html += '<input type="hidden" name="input'+ i +'_title" value="'+ input.TITLE +'">';
						html += '<input type="text" class="inputText" name="input'+ i +'" id="input'+ i +'" value="" placeholder="" maxlength="20">';
						html += '</td>';
						html += '</tr>';
					}
					if(input.KEY == "HPHONE") {
						html += '<tr>';
						html += '<td class="spacetr"></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td class="title" onclick="javascript:jQuery(this).focusinput(\''+ input.KEY +'\', '+ i +')">'+ input.TITLE +'</td>';
						html += '<td class="write">';
						html += '<input type="hidden" name="input'+ i +'_key" value="'+ input.KEY +'">';
						html += '<input type="hidden" name="input'+ i +'_title" value="'+ input.TITLE +'">';
						html += '<input type="tel" class="inputPhone" name="input'+ i +'_1" id="input'+ i +'_1" value="" placeholder="" maxlength="3">';
						html += '<input type="tel" class="inputPhone" name="input'+ i +'_2" id="input'+ i +'_2" value="" placeholder="" maxlength="4">';
						html += '<input type="tel" class="inputPhone" name="input'+ i +'_3" id="input'+ i +'_3" value="" placeholder="" maxlength="4">';
						html += '</td>';
						html += '</tr>';
					}
					if(input.KEY == "NUMBER") {
						html += '<tr>';
						html += '<td class="spacetr"></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td class="title" onclick="javascript:jQuery(this).focusinput(\''+ input.KEY +'\', '+ i +')">'+ input.TITLE +'</td>';
						html += '<td class="write">';
						html += '<input type="hidden" name="input'+ i +'_key" value="'+ input.KEY +'">';
						html += '<input type="hidden" name="input'+ i +'_title" value="'+ input.TITLE +'">';
						html += '<input type="number" class="inputNumber" name="input'+ i +'" id="input'+ i +'" value="" placeholder="" maxlength="20">';
						html += '</td>';
						html += '</tr>';
					}
					if(input.KEY == "SELECT") {
						html += '<tr>';
						html += '<td class="spacetr"></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td class="title" onclick="javascript:jQuery(this).focusinput(\''+ input.KEY +'\', '+ i +')">'+ input.TITLE +'</td>';
						html += '<td class="write">';
						html += '<input type="hidden" name="input'+ i +'_key" value="'+ input.KEY +'">';
						html += '<input type="hidden" name="input'+ i +'_title" value="'+ input.TITLE +'">';
						html += '<input type="hidden" name="input'+ i +'" value="'+ input.VALUE[0] +'" id="input'+ i +'">';
						html += '<select class="inputSelect" name="input'+ i +'_select" id="input'+ i +'_select">';
						if(jQuery.isArray(input.VALUE)) {
							for(var k = 0; k < input.VALUE.length; k++) {
								html += '<option value="'+ k +'">'+ input.VALUE[k] +'</option>';
							}
						}else {
							html += '<option value="'+ k +'">'+ input.VALUE +'</option>';
						}
						html += '</select>';
						html += '</td>';
						html += '</tr>';
					}
					if(input.KEY == "DATE") {
						html += '<tr>';
						html += '<td class="spacetr"></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td class="title" onclick="javascript:jQuery(this).focusinput(\''+ input.KEY +'\', '+ i +')">'+ input.TITLE +'</td>';
						html += '<td class="write">';
						html += '<input type="hidden" name="input'+ i +'_key" value="'+ input.KEY +'">';
						html += '<input type="hidden" name="input'+ i +'_title" value="'+ input.TITLE +'">';
						if(input.VALUE != "" && input.VALUE.length > 0) {
							html += '<input type="text" class="inputDate" name="input'+ i +'" id="input'+ i +'" value="" data-value="'+ input.VALUE.join(",") +'" placeholder="" maxlength="readonly">';
						}else {
							html += '<input type="text" class="inputDate" name="input'+ i +'" id="input'+ i +'" value="" data-value="" placeholder="" maxlength="readonly">';
						}
						html += '</td>';
						html += '</tr>';
					}
					if(input.KEY == "EMAIL") {
						html += '<tr>';
						html += '<td class="spacetr"></td>';
						html += '</tr>';
						html += '</tr>';
						html += '<td class="title" onclick="javascript:jQuery(this).focusinput(\''+ input.KEY +'\', '+ i +')">'+ input.TITLE +'</td>';
						html += '<td class="write col3">';
						html += '<input type="hidden" name="input'+ i +'_key" value="'+ input.KEY +'">';
						html += '<input type="hidden" name="input'+ i +'_title" value="'+ input.TITLE +'">';
						html += '<table border="0" cellpadding="0" cellspacing="0">';
						html += '<tr>';
						html += '<td class="email_id">';
						html += '<input type="text" name="input'+ i +'_id" id="input'+ i +'_id" value="">';
						html += '</td>';
						html += '<td class="email_txt">@</td>';
						html += '<td class="email_domain"><input type="text" name="input'+ i +'_domain" id="input'+ i +'_domain" value=""></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td class="email_list" colspan="3">';
						html += '<select>';
						html += '<option value="">직접입력</option>';
						html += '<option value="naver.com">naver.com</option>';
						html += '<option value="hanmail.net">hanmail.net</option>';
						html += '<option value="daum.net">daum.net</option>';
						html += '<option value="gmail.com">gmail.com</option>';
						html += '<option value="nate.com">nate.com</option>';
						html += '</select>';
						html += '</td>';
						html += '</tr>';
						html += '</table>';						
						html += '</td>';
						html += '<tr>';
					}
					document.productJoin.FU_INPUT_COUNT.value = i;
				}
				html += '</table>';
				
				jQuery("#inputform").append(html);
				
				//숫자 입력 이벤트 세팅
				jQuery(".inputPhone").keyup(function(){
					var value = jQuery(this).val().replace(/[^0-9]/g, '');
					jQuery(this).val(value);
				});
				
				//달력 세팅
				$.datepicker.setDefaults({
			        dateFormat: 'yy-mm-dd',
			        prevText: '이전 달',
			        nextText: '다음 달',
			        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			        showMonthAfterYear: true,
			        yearSuffix: '년'
			    });
				for(var i = 0; i < jsonInput.INPUT.length; i++) {
					var input = jsonInput.INPUT[i];
					if(input.KEY == "DATE") {
						if(input.VALUE.length > 0) {
							jQuery('#input'+ i).datepicker({
								beforeShowDay: function(date) {
									enabDate = jQuery(this).data("value").split(",");
									for(var k = 0; k < enabDate.length; k++) {
										if(enabDate[k].indexOf("~") > -1) {
											var rangeDate = enabDate[k].split("~");
											if(rangeDate[0] && rangeDate[1]) {
												var rangeSdate = new Date(rangeDate[0].replace( /(\d{4})-(\d{2})-(\d{2})/, "$1/$2/$3"));
												var rangeEdate = new Date(rangeDate[1].replace( /(\d{4})-(\d{2})-(\d{2})/, "$1/$2/$3"));
												var rangeDdate = (rangeEdate.getTime() - rangeSdate.getTime()) / (1000 * 3600 * 24);
												
												enabDate.push(rangeDate[0]);
												enabDate.push(rangeDate[1]);
												for(var m = 1; m < rangeDdate; m++) {
													rangeSdate.setDate(rangeSdate.getDate() + 1); 
													rangeYear = rangeSdate.getFullYear();
													rangeMonth = (rangeSdate.getMonth() + 1)+"";
													if(rangeMonth.length < 2) {
														rangeMonth = "0"+ rangeMonth;
													}
													rangeDay = rangeSdate.getDate()+"";
													if(rangeDay.length < 2) {
														rangeDay = "0"+ rangeDay;
													}
													enabDate.push(rangeYear +"-"+ rangeMonth +"-"+ rangeDay);
												}
											}
										}
									}
									
									diffYear = date.getFullYear();
									diffMonth = (date.getMonth() + 1)+"";
									if(diffMonth.length < 2) {
										diffMonth = "0"+ diffMonth;
									}
									diffDay = date.getDate()+"";
									if(diffDay.length < 2) {
										diffDay = "0"+ diffDay;
									}
									diffDate = diffYear +"-"+ diffMonth +"-"+ diffDay;
									if (jQuery.inArray(diffDate, enabDate) > -1) { 
										return [true, ""]; 
									}else {
										return [false, ""]; 
									} 
								}
							});
						}else{
							jQuery('#input'+ i).datepicker();
						}
					}
				}
			
				//이메일 이벤트 세팅
				jQuery(".email_list > select").change(function(){
					if(jQuery(this).val() != "") {
						jQuery(this).closest("table").find(".email_domain").find("input:eq(0)").val(jQuery(this).val()).attr("readonly", true);
					}else {
						jQuery(this).closest("table").find(".email_domain").find("input:eq(0)").val("").attr("readonly", false);
					}
				});
				
				//가격 세팅
				jQuery("#price_value").text(parseInt(jsonInput.PRICE[0].PRICE).format());
				document.productJoin.FU_PRICE.value = jsonInput.PRICE[0].PRICE;
				
				var jsonPrice = jsonInput.PRICE;
				var key = jsonPrice[0].KEY;
				jQuery("select[name='input"+ key +"_select']").change(function(){
					for(var i = 0; i < jsonPrice.length; i++) {
						if(jsonPrice[i].VALUE == jQuery(this).val()) {
							if(isNaN(parseInt(jsonPrice[i].PRICE))) {
								jQuery("#price_value").text("0");
								alert(jsonPrice[i].PRICE);
							}else {
								jQuery("#price_value").text(parseInt(jsonPrice[i].PRICE).format());
							}
						}
					}
					jQuery("#benefitList").hide();
					jQuery("#benefit_product").html("선택하기");
				});
				
				jQuery(".inputSelect").change(function(){
					var name = jQuery(this).attr("name").replace("_select", "");
					jQuery("input[name='"+ name +"']").val(jQuery(this).find('option:selected').text());
				});
				
				//폼 입력 검증
				jQuery("#formSubmit").click(function(){
					alert("미리보기 화면은 구매할 수 없습니다.")
				});
			});
			
			jQuery("textarea[name='LABEL']").each(function(){
				var jsonLabel = JSON.parse(jQuery(this).val());
				if(jsonLabel.length > 0) {
					var html = '';
					for(var i = 0; i < jsonLabel.length; i++) {
						html += '<span class="productLabelDetail" style="background-color:'+ jsonLabel[i].BGCOLOR +';">'+ jsonLabel[i].TITLE +'</span>';
					}
					jQuery("#thumnailLabel").html(html);
				}
			});
			
			jQuery("textarea[name='DEATIL']").each(function(){
				var html = '';
				var jsonDetail = JSON.parse(jQuery(this).val());
				for(var i = 0; i < jsonDetail.length; i++) {
					var detail = jsonDetail[i];
					
					var bgi = '';
					var bgc = '';
					if(detail.BG_SAVE_NM != '') bgi = 'background-image:url(\'/common/images/fairimage/'+ detail.BG_SAVE_NM +'\');';
					if(detail.BGCOLOR != '') bgc = 'background-color:'+ detail.BGCOLOR +';';
					html += '<div class="detail_bg" id="detailDiv'+ i +'" style="'+ bgi + bgc +'">';
					html += '<div class="detail_content"><img src="/common/images/fairimage/'+ detail.M_SAVE_NM +'" alt="'+ detail.M_REAL_NM +'"></div>';
					html += '</div>';
				}
				
				jQuery(".detail").html(html);
			});
			
			jQuery("#agreeClose").click(function(){
				jQuery(".agree_text").hide();
			});
			
			jQuery("#agreeOpen").click(function(){
				jQuery(".agree_text").show();
			});
			
			$(document.body).on('touchmove', onScroll); // for mobile
			$(window).on('scroll', onScroll); 
		});
		
		function onScroll() {
			var scrollTop = jQuery(".detail_content").offset().top;
			if(jQuery("html, body").scrollTop() > scrollTop) {
				jQuery(".topMove").fadeIn();
			}else {
				jQuery(".topMove").fadeOut();
			}
		}
		
		jQuery.fn.extend({
			benefit_list: function() {		
				var json = JSON.parse(jQuery("textarea[name='INPUT']").val());
				var jsonPrice = json.PRICE;
				var jsonBenefit = json.BENEFIT;
				var key = jsonBenefit[0].KEY;
				
				if(key > -1) {
					var val = jQuery("select[name='input"+ key +"_select']").val();
				}else {
					var val = -1;
				}
		
				var chk = false;
				var html = "";
				for(var i = 0; i < jsonBenefit.length; i++) {
					if(jsonBenefit[i].VALUE == val) {
						var sBenefit = jsonBenefit[i].BENEFIT;
						
						html += '<div class="benefitTitle">결합혜택 선택</div>';
						html += '<div class="benefitClose"><a id="benefitClose"></a></div>';
						html += '<ul class="benefitContainer">';
						
						for(var k = 0; k < sBenefit.length; k++) {
							var classLeft = "";
							if(k % 2 != 0) classLeft = " left";
							if(sBenefit[k].fbSeq == productJoin.FU_BENEFIT_SEQ.value)  classLeft += " active";
							html += '<li class="benefitList'+ classLeft +'" data-seq="'+ sBenefit[k].fbSeq +'" data-title="'+ sBenefit[k].fbTitle +'" data-subtitle="'+ sBenefit[k].fbSubtitle +'" data-model="'+ sBenefit[k].fbModel +'" data-price="'+ sBenefit[k].fbPrice +'" data-path="'+ sBenefit[k].fbPath +'" data-save="'+ sBenefit[k].fbSave +'" data-real="'+ sBenefit[k].fbReal +'" onclick="javascript:jQuery(this).benefit_select();">';
							html += '<div class="benefitLi">';
							html += '<div class="benefitList_img"><img src="/common/images/fairimage/'+ sBenefit[k].fbSave +'" title="'+ sBenefit[k].fbReal +'"></div>';
							html += '<div class="benefitList_title">'+ sBenefit[k].fbTitle +'</div>';
							html += '<div class="benefitList_subtitle">'+ sBenefit[k].fbSubtitle +'</div>';
							html += '<div class="benefitList_desc">'+ sBenefit[k].fbModel +'</div>';
							html += '</div>';
							html += '</li>';
						}
						html += '<li style="clear:both;"></li>';
						html += '</ul>';
						
						if(sBenefit.length > 0) chk = true;
					}
				}		
				if(chk == false) {
					alert("선택하실 수 있는 결합혜택이 없습니다.");
					return;
				}else {
					jQuery("#benefitList").html(html).show();
				}

				jQuery("#benefitClose").click(function(){
					jQuery("#benefitList").hide();
				});
			},
			
			benefit_select: function() {
				jQuery(".benefitList").removeClass("active");
				jQuery(this).addClass("active");
				jQuery("#benefitList").fadeOut();
				
				var seq = jQuery(this).data("seq");
				var title = jQuery(this).data("title"); 
				var subtitle = jQuery(this).data("subtitle"); 
				var model = jQuery(this).data("model"); 
				var price = jQuery(this).data("price"); 
				var path = jQuery(this).data("path"); 
				var save = jQuery(this).data("save"); 
				var real = jQuery(this).data("real");
				
				var f = document.productJoin;
				f.FU_BENEFIT_SEQ.value = seq;
				f.FU_BENEFIT_TITLE.value = title;
				f.FU_BENEFIT_SUBTITLE.value = subtitle;
				f.FU_BENEFIT_MODEL.value = model;
				f.FU_BENEFIT_PRICE.value = price;
				f.FU_BENEFIT_PATH.value = path;
				f.FU_BENEFIT_SAVE.value = save;
				f.FU_BENEFIT_REAL.value = real;
				
				jQuery("#benefit_product").html(title +"&nbsp"+ subtitle +"&nbsp"+ model);
			},
			
			focusinput: function(key, index) {
				if(key == "SELECT") {
					jQuery("#input"+ index +"_select").focus();
				}else if(key == "EMAIL") {
					jQuery("#input"+ index +"_id").focus();
				}else {
					jQuery("#input"+ index).focus();
				}
			}
		});
	</script>
	
	<body>
	
	<c:if test="${product ne null}">
	<div class="header">
		<div class="container">
			<div class="header_logo"><a href="/fair/preview.do"><img src="/common/images/fairimage/top_logo.png"></a></div>
			<div class="header_title">
				<span>|</span>
				<div class="header_txt">${product.fpMainTitle}</div>
			</div>
			<div class="header_back"><img src="/common/images/fairimage/top_back.png"></div>
			<div style="clear:both;"></div>
		</div>
	</div>
	
	<div class="container">
		<div class="input">
			<form id="productJoin" name="productJoin">
				<input type="hidden" name="FAIR_PRODUCT_FP_SEQ" value="${product.fpSeq}">
				<input type="hidden" name="FU_INPUT_COUNT" value="">
				<input type="hidden" name="FU_BENEFIT_SEQ" value="">
				<input type="hidden" name="FU_BENEFIT_TITLE" value="">
				<input type="hidden" name="FU_BENEFIT_SUBTITLE" value="">
				<input type="hidden" name="FU_BENEFIT_MODEL" value="">
				<input type="hidden" name="FU_BENEFIT_PRICE" value="">
				<input type="hidden" name="FU_BENEFIT_PATH" value="">
				<input type="hidden" name="FU_BENEFIT_SAVE" value="">
				<input type="hidden" name="FU_BENEFIT_REAL" value="">

				<input type="hidden" name="FU_PRICE" value="">
				<div class="thumnail">
					<div id="swiperThumnail" class="swiperThumnail swiper-container">
						<ul class="swiper-wrapper">
							
						</ul>
						<div class="swiper-pagination"></div>
					</div>
					<div class="productLabel" id="thumnailLabel"></div>
				</div>
				<div class="form">
					<div id="inputform"></div>
				
					<div class="price">
						<span id="price_value" class="price_value"></span>
						<span class="won">원</span>
					</div>
	
					<div class="input_rule">
						<label for="input_agree" class="label_agree">개인정보제공 동의</label>
						<input type="checkbox" name="FU_AGREE" value="Y" id="input_agree">
						<a class="agree_txt" id="agreeOpen">전문보기</a>
						<div class="agree_text">
							<div class="agreeTextTitle">개인정보제공동의</div>
							<div class="agreeTextClose"><a id="agreeClose"></a></div>
							<div class="agree_telegram">
								제1조(목적)
								
								이 약관은 (주)대명스테이션(이하 "회사"라 함)이 운영하는 인터넷사이트(이하 "사이트"라 함)를 통하여 제공하는 전자상거래 서비스(이하 "서비스"라 함)와 관련하여 "회사"와 "회원"(제2조에 정합니다)의 권리와 의무, 책임사항 및 "회원"의 "서비스" 이용절차에 관한 사항을 규정함을 목적으로 합니다. 이 약관은 PC 통신, 스마트폰(안드로이드폰, 아이폰 등) 앱, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용됩니다.
								제2조(용어의 정의)
								
								① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
								
								1. "회사"가 운영하는 "사이트"(2018. 11. 현재)는 아래와 같습니다.
								
								* daemyungimready.com
								
								* imreadymall.com
								
								- 추후 "회사"에서 공지하고 제공하는 기타 웹사이트
								
								2. 회원: "회사"의 선불식 할부거래 상품(상조, 여행 등)에 가입한 자 중 개인정보를 제공하여 회원등록을 한 자로서 이 약관에 따라 "회사"와 "서비스" 이용계약을 체결하고 아이디를 부여 받은 자를 말합니다. 또한 웹사이트에 개인정보를 제공하여 회원등록을 한 자로서, 웹사이트의 정보를 지속적으로 제공받으며, 웹사이트에서 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
								
								3. 비회원: “비회원”이라 함은 “회사”의 회원으로 가입하지 않고 “사이트”가 제공하는 서비스를 이용하는 자를 말합니다.
								
								4. 아이디(ID): "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 선정하고 "회사"가 승인한 문자와 숫자의 조합을 말합니다.
								
								5. 비밀번호(Password): "회원"의 동일성 확인과 "회원"의 권익 및 비밀보호를 위하여 "회원" 스스로가 설정하여 "회사"에 등록한 영문과 숫자의 조합을 말합니다.
								
								6. 판매자: 상품 또는 서비스의 원활한 판매를 위하여 “회사”로부터 판매대행 서비스를 제공받는 자를 말합니다.
								
								7. 티켓: 상품 또는 서비스(이하 "상품 등"이라 함)를 정상적인 가격보다 할인된 가격으로 이용할 수 있는 디지털 증권을 말합니다.
								
								8. 레디캐시: 레디캐시 이용을 동의한 "회원"이 “회사”와 상품 계약으로 인해 "회사"에 납입한 금액 중 일부를 “회사”가 운영하는 사이트 내 상품 및 서비스 구매 시 이용 가능한 결제수단이자 사이버 화폐를 말합니다.
								
								9. 포인트: “회원”은 구매활동, 이벤트 참여 등에 따라 사이트 내 상품 및 서비스 구매 시 이용 가능한 결제수단을 의미합니다.
								
								10. 게시물: "회원"이 "서비스"를 이용함에 있어 "사이트" 상에 게시한 부호, 문자, 음성 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
								
								11. 쿠폰: 상품 또는 서비스를 구매할 때 표시된 금액 또는 비율만큼 구매가격을 할인받을 수 있는 “회사” 또는 “판매자” 전용의 온라인/모바일/오프라인 쿠폰을 말합니다. “회사”는 “판매자”의 동의가 있는 경우에 한하여 쿠폰 적용에 따른 할인된 상품가격으로 판매를 대행할 수 있으며, “판매자”의 동의가 없는 경우 당해 거래는 취소 처리됩니다.
								
								② 이 약관에서 정의되지 않은 용어는 관련법령이 정하는 바에 따릅니
							</div>
						</div>
					</div>
					<div class="input_submit"><button type="button" id="formSubmit">상담 신청하기<div class="loading"><img src="/common/images/fairimage/ajax-loader.gif"></div></button></div>
				</div>
				<div style="clear:both;"></div>
			</div>
		</form>
	</div>
	
	<div class="detail" id="detail">
	</div>
	
	<div class="footer">
		<div class="logo"><img class="logo" src="/common/images/fairimage/footer_logom.png"></div>
		<div class="links">
			<a href="https://www.daemyungimready.com/operation-guide/privacy/index.do" target="_blank">개인정보취급방침</a>
			<span>|</span>
			<a href="https://www.daemyungimready.com/daemyung-lifeway/introduction/contentsid/212/index.do" target="_blank">회사소개</a>
			<span>|</span>
			<a href="https://www.daemyungimready.com/main/index.do" target="_blank">공식홈페이지</a>
			<span>|</span>
			<a href="https://www.imreadymall.com" target="_blank">회원몰</a>
		</div>
		<div class="info">
			<span class="txt">서울시 송파구 법원로 135 대명타워</span>
			<span>|</span>
			<span class="txt">사업자등록번호 220-88-09321</span>
			<span>|</span>
			<span class="txt">대표자 (주)대명스테이션 대표이사 서준혁, 최성훈</span>
			<span>|</span>
			<span class="txt">통신판매신고번호 제2016-서울송파-0669호</span>
			<div class="copyright">
				COPYRIGHT DAEMYUNGSTATION.CO,.LTD. ALL RIGHTS RESERVED.
			</div>
		</div>
	</div>
	
	<div class="topMove"><a href="#"><img class="logo" src="/common/images/fairimage/btn_top_mo.png"></a></div>
	
	<textarea name="INPUT" style="display:none;">${product.fpInput}</textarea>
	<textarea name="THUMNAIL" style="display:none;">${product.fpThumnail}</textarea>
	<textarea name="DEATIL" style="display:none;">${product.fpDetail}</textarea>
	<textarea name="LABEL" style="display:none;">${product.fpLabel}</textarea>
	</c:if>
	
	<c:if test="${product eq null}">
	<script>
	jQuery(document).ready(function(){
		alert("상품이 존재하지 않습니다.");
		history.back();
	});
	</script>
	</c:if>
	</body>
</html>