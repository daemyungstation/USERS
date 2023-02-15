<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/jsp/include/el.jspf" %>
<!doctype html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<title>${config.fcfgTitle}</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,minimum-scale=1.0" />
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

		body,ul,li,table { margin:0; padding:0; font-family:"NotoKrR", sans-serif; }
		li { list-style:none; }
		
		select {
			background: url(/common/images/fairimage/select_arrow.png) no-repeat 95% 50%;  
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
			border: 1px solid #999;
			border-radius: 0px;
		}
		select::-ms-expand { display: none; }
		
		.container { position:relative; max-width:1080px; margin:0 auto; line-height:0; text-align:center; }
		
		.header { position:relative; width:100%; height:100px; background-color:#1d2349; }
		.header .header_logo { float:left; margin-top:24px; }
		.header .header_title { float:left; box-sizing:border-box; font-weight:400; color:#ffffff; font-size:25px; margin-top:30px; }
		.header .header_title span { line-height:140%; padding:0 10px 0 15px;  }
		.header .header_back { float:right; margin-top:24px; cursor:pointer; }
		
		.input { border:1px solid #dcdcdc; box-sizing:border-box; padding:25px; margin-top:30px; margin-bottom:30px; }
		.input .thumnail { position:relative; float:left; width:380px; height:460px; } 
		.input .thumnail .swiper-pagination { position: absolute; width:auto; padding:5px 15px; left: 50%; bottom:20px; box-sizing:border-box; border-radius:40px; background-color:rgba(0,0,0,.3); -webkit-transform: translateX(-50%);-ms-transform: translateX(-50%);transform: translateX(-50%); z-index: 1;}
		.input .thumnail .swiper-pagination .swiper-pagination-bullet {position: relative;display: inline-block; width:14px; height:14px; background:#fff; border-radius: 50%; margin-left:20px; opacity:.3;}
		.input .thumnail .swiper-pagination .swiper-pagination-bullet:first-child {margin-left: 0;}
		.input .thumnail .swiper-pagination .swiper-pagination-bullet-active { opacity:1; }
		.input .thumnail .productDetail { position:absolute; text-align:left; top:20px; left:20px; z-index:1; }
		.input .thumnail .productDetail .productLabelDetail { display:inline-block; line-height:120%;  color:#ffffff; font-size:15px; margin-left:5px; padding:5px; box-sizing:border-box; min-width:70px; text-align:center; }
		.input .thumnail .productDetail .productLabelDetail:first-child { margin-left:0; }
	
		.input .form { float:left; margin:0 0 0 50px; }
		.input .form table {  }
		.input .form td { height:45px; line-height:45px; position:relative; }
		.input .form td.title { width:100px; padding-left:25px; background-color:#f2f6fe; text-align:left; font-weight:600; color:#717171; font-size:16px; letter-spacing: -1px; }
		.input .form td.write { width:165px; background-color:#f2f6fe; font-weight:600; color:#000c57; font-size:16px; letter-spacing: -1px; }
		.input .form td.write div.col1 { width:165px; }
		.input .form td.write div.col3 { width:470px; }
		.input .form td.write div.inputround { box-sizing: border-box; border: 1px solid #eeeeee; border-radius: 20px; background:#ffffff; height:30px; line-height:30px; }
		.input .form td.write div.wrap { text-overflow:ellipsis; white-space:nowrap; word-wrap:normal; overflow:hidden; color:#FF3B85; }
		.input .form td.write a { display:block; font-weight:600; color:#000c57; width:100%; font-size:16px; letter-spacing:-1px; text-decoration:none; text-overflow:ellipsis; white-space:nowrap; word-wrap:normal; overflow:hidden; }
		
		.input .form td.write.col3 { width:470px; }
		.input .form td.write input { width: 90%; height: 30px; line-height: 30px; background-color: #ffffff; color: #000c57; font-weight: 600; font-size: 16px; padding: 0 10px; box-sizing: border-box; border: 1px solid #eeeeee; border-radius: 20px; }
		.input .form td.write select { width: 90%; height: 30px; line-height: 30px; background-color: #ffffff; color: #000c57; font-weight: 600; font-size: 16px; padding: 0 10px; box-sizing: border-box; border: 1px solid #eeeeee; border-radius: 20px; }
		.input .form td.write input.inputPhone { width:30%; text-align:center; }
		.input .form td.space { width:15px; } 
		.input .form td.spacetr { height:15px; background-color:#ffffff; }
		
		.input .form td.email_id { width:150px; }
		.input .form td.email_id input { height:30px; border:1px solid #eeeeee; border-radius:30px; background:#ffffff; box-sizing:border-box; }
		.input .form td.email_txt { width:30px; font-weight:600; color:#717171; font-size:20px; text-align:center; }
		.input .form td.email_domain { width:120px; }
		.input .form td.email_domain input { height:30px; border:1px solid #eeeeee; border-radius:30px; background:#ffffff; box-sizing:border-box; }
		.input .form td.email_list { width:150px; text-align:right; }
		.input .form td.email_list select { width:auto; max-width:150px; height:30px; text-align:right; background-color: #cadcff; border-radius: 20px;}
		
		.input .form .price { margin-top:40px; text-align:right; }
		.input .form .price .price_value { font-weight:600; color:#ff3b85; font-size:35px; }
		.input .form .price .won { font-weight:400; color:#00000; font-size:30px; }
		
		.input .form .input_submit { float:left; margin-top:20px; }
		.input .form .input_submit button { position:relative; display:block; background-color:#ff3b85; color:#ffffff; font-weight:600; font-size:25px; border:none; line-height: 100%; padding:15px 40px; border-radius:5px; letter-spacing: -1px; cursor:pointer; }
		.input .form .input_submit button .loading { position:absolute; width:100%; height:100%; top:0; left:0; background-color:rgba(255,255,255,0.7); display:none; }
		.input .form .input_submit button .loading img { position:absolute; top:50%; left:50%; margin-top:-16px; margin-left:-16px; }
		.input .form .input_rule { float:right; margin-top:50px; position:relative; }
		.input .form .input_rule .label_agree { color:#717171; font-weight:400; font-size:17px; letter-spacing: -2px; }
		.input .form .input_rule input { width:20px; height:20px; margin:0 5px; vertical-align: text-bottom; }
		.input .form .input_rule .agree_txt { color:#a2a2a2; font-weight:600; font-size:15px; letter-spacing: -2px; }
		.input .form .input_rule .agree_text { position:absolute; top:30px; left:-325px; background-color:#ffffff; box-sizing:border-box; z-index:1; display:none; }
		.input .form .input_rule .agree_text .agreeTextClose { position: absolute; top: 30px; right: 20px; display: inline-block; padding: 0; width: 1px; height: 20px; background: #292d6c; transform: rotate(45deg); cursor:pointer; }
		.input .form .input_rule .agree_text .agreeTextClose:before { display: block; content: ""; position: absolute; top: 50%; left: -10px; width: 20px; height: 1px; margin-top: -1px; background: #292d6c; }
		.input .form .input_rule .agree_text .agreeTextClose a { display:block; display:block; width:20px; height: 20px; top: 0px; left: -10px; position: absolute; transform: rotate(45deg); }
		.input .form .input_rule .agree_text .agree_telegram { color:#717171; font-weight:400; font-size:12px; letter-spacing: -2px; text-align:left; line-height: 140%; margin-top:20px; word-break:break-all; }
		
		#benefitList { position:absolute; width:340px; top:50px; right:0px; background-color:#ffffff; padding:20px 25px; box-sizing:border-box; border:1px solid #e4e4e4; z-index:1; display:none;  }
		#benefitList .benefitTitle { color:#292d6c; font-weight:600; font-size:20px; letter-spacing: -2px; text-align:left; line-height: 100%; }
		#benefitList .benefitClose { position: absolute; top: 20px; right: 30px; display: inline-block; padding: 0; width: 1px; height: 20px; background: #292d6c; transform: rotate(45deg); cursor:pointer; }
		#benefitList .benefitClose:before { display: block; content: ""; position: absolute; top: 50%; left: -10px; width: 20px; height: 1px; margin-top: -1px; background: #292d6c; }
		#benefitList .benefitClose a { display:block; width:20px; height: 20px; top: 0px; left: -10px; position: absolute; transform: rotate(45deg); }
		
		#benefitList .benefitContainer {}
		#benefitList .benefitContainer .benefitList { float:left; width:134px; height:134px; background-color:#f2f6fe; border:2px solid #f2f6fe; box-sizing:border-box; margin-top:20px; cursor:pointer; }
		#benefitList .benefitContainer .benefitList.left { margin-left:20px; }
		#benefitList .benefitContainer .benefitList.active { border:2px solid #3dccd9; }
		
		#benefitList .benefitContainer .benefitList .benefitLi { position:relative; display:inline-block; vertical-align: text-top; }
		#benefitList .benefitContainer .benefitList .benefitLi .benefitList_img { text-align:center; line-height:0; }
		#benefitList .benefitContainer .benefitList .benefitLi .benefitList_img img { max-width:85px; max-height:55px; }
		#benefitList .benefitContainer .benefitList .benefitLi .benefitList_title { color:#524f56; font-weight:600; font-size:15px; letter-spacing:-2px; text-align:center; line-height:120%; margin-top:5px; }
		#benefitList .benefitContainer .benefitList .benefitLi .benefitList_subtitle { color:#524f56; font-weight:400; font-size:15px; letter-spacing:-2px; text-align:center; line-height:120%; }
		#benefitList .benefitContainer .benefitList .benefitLi .benefitList_desc { color:#524f56; font-weight:400; font-size:15px; letter-spacing:-2px; text-align:center; line-height:120%; }
		
		.detail { position:relative; }
		.detail .detail_bg { background-size:cover; background-position:center; line-height:0; }
		.detail .detail_content { text-align:center; }
		#detailTab { position:absolute; top:0px; width:1080px; left:50%; transform:translateX(-50%); background:#e1e1e1; border-radius:5px; box-sizing:border-box; text-align:center; border:1px solid #d7d7d7; box-shadow: 0px 6px 6px 0 rgba(0,0,0,.2); }
		#detailTabUl { display:inline-block; overflow:hidden; }
		#detailTab li { float:left; position:relative; padding:10px 45px; box-sizing:border-box; }
		#detailTab li:after { content:''; position:absolute; top:50%; left:0; transform:translateY(-50%); width:2px; height:23px; background:#efe7fa; }
		#detailTab li:first-child:after { display:none; }
		#detailTab li:last-child:after { display:none; }
		#detailTab li a { display:block; width:100%; height:100%; color:#000000; font-weight:600; font-size:22px; text-decoration:none; cursor:pointer; }
		
		.footer { position:relative; width:100%; }
		.footer .links { height:45px; background:#282b5d; color:#ffffff; }
		.footer .links a { line-height:45px; font-weight:400; color:#ffffff; font-size:12px; text-decoration:none; }
		.footer .links span { line-height:25px; font-size:10px; padding:0 20px; box-sizing:border-box; }
		
		.footer .logo { float:left; padding:25px; box-sizing:border-box; }
		.footer .info { float:left; padding-top:30px; width:calc(100% - 280px); text-align:left; }
		.footer .info span { line-height:140%; padding:0 5px; box-sizing:border-box; font-weight:400; color:#888888; font-size:12px; letter-spacing: -1px; }
		.footer .info span.txt { padding:0; }
		.footer .info .copyright { line-height:140%; padding:5px 0 0 0; box-sizing:border-box; font-weight:400; color:#888888; font-size:12px; letter-spacing: -1px; text-align:left; }
		
		.topMove { position:relative; width:1080px; bottom:0; text-align:right; margin:0 auto; }
		.topMove a { position:fixed; bottom:0; right:0; text-decoration:none; }
		.topMove a img { display: inline-block; margin-left: 0px; }
		
		.end { width:956px; margin:0 auto; }
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
			jQuery("body")
			.html('<div class="end"><img src="/common/images/fairimage/parking_pc.png"></div>')
			.css({"width":"100%", "height":"100px", "background-image":"url('/common/images/fairimage/parking_pc_bg.jpg')", "background-size":"cover"});
			return;
			</c:if>
			
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
					swiperThumnail.appendSlide('<li class="swiper-slide"><img src="/common/images/fairimage/'+ jsonThumnail[i].W_SAVE_NM +'" title="'+ jsonThumnail[i].W_REAL_NM +'"></li>');
				}
			});
			
			jQuery("textarea[name='INPUT']").each(function(){
				var html = '<table border="0" cellpadding="0" cellspacing="0">';
				html += '<tr>';
				
				var jsonInput = JSON.parse(jQuery(this).val());
				for(var i = 0; i < jsonInput.INPUT.length; i++) {
					var input = jsonInput.INPUT[i];
					//상품명
					if(i == 2) {
						html += '</tr>';
						html += '<tr>';
						html += '<td class="spacetr" colspan="5"></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td class="title">예약상품</td>';
						html += '<td class="write col3 txt" colspan="4"><div class="wrap col3">${product.fpMainTitle}</div></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td class="spacetr" colspan="5"></td>';
						html += '</tr>';
						html += '<tr>';
					//결합혜택
					} else if(jsonInput.INPUT.length % 2 == 1 && i == 4) {
						html += '</tr>';
						html += '<tr>';
						html += '<td class="spacetr" colspan="5"></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td class="title" onclick="javascript:jQuery(this).benefit_list();">결합혜택</td>';
						html += '<td class="write col3 txt" colspan="4">';
						html += '<a href="#" onclick="javascript:jQuery(this).benefit_list();"><div class="wrap col3 inputround" id="benefit_product">선택하기</div></a><div id="benefitList"></div></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td class="spacetr" colspan="5"></td>';
						html += '</tr>';
						html += '<tr>';
					} else if(jsonInput.INPUT.length % 2 == 0 && i == 5) {
						html += '<td class="space"></td>';
						html += '<td class="title" onclick="javascript:jQuery(this).benefit_list();">결합혜택</td>';
						html += '<td class="write">';
						html += '<a href="#" onclick="javascript:jQuery(this).benefit_list();"><div class="wrap col1 inputround" id="benefit_product">선택하기</div></a><div id="benefitList"></div></td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td class="spacetr" colspan="5"></td>';
						html += '</tr>';
						html += '<tr>';
					} else if(i > 0 && i % 2 == 0) {
						html += '</tr>';
						html += '<tr>';
						html += '<td class="spacetr" colspan="5"></td>';
						html += '</tr>';
						html += '<tr>';
					}else {
						if(i > 0) {
							html += '<td class="space"></td>';
						}
					}
					
					if(input.KEY == "TEXT") {
						html += '<td class="title" onclick="javascript:jQuery(this).focusinput(\''+ input.KEY +'\', '+ i +')">'+ input.TITLE +'</td>';
						html += '<td class="write">';
						html += '<input type="hidden" name="input'+ i +'_key" value="'+ input.KEY +'">';
						html += '<input type="hidden" name="input'+ i +'_title" value="'+ input.TITLE +'">';
						html += '<input type="text" class="inputText" name="input'+ i +'" id="input'+ i +'" value="" placeholder="" maxlength="20">';
						html += '</td>';
					}
					if(input.KEY == "HPHONE") {
						html += '<td colspan="2">';
						html += '<table border="0" cellpadding="0" cellspacing="0">';
						html += '<tr>';
						html += '<td class="title" style="width:50px;" onclick="javascript:jQuery(this).focusinput(\''+ input.KEY +'\', '+ i +')">'+ input.TITLE +'</td>';
						html += '<td class="write" style="width:215px;">';
						html += '<input type="hidden" name="input'+ i +'_key" value="'+ input.KEY +'">';
						html += '<input type="hidden" name="input'+ i +'_title" value="'+ input.TITLE +'">';
						html += '<input type="text" class="inputPhone" name="input'+ i +'_1" id="input'+ i +'_1" value="" placeholder="" maxlength="3">';
						html += '<input type="text" class="inputPhone" name="input'+ i +'_2" id="input'+ i +'_2" value="" placeholder="" maxlength="4">';
						html += '<input type="text" class="inputPhone" name="input'+ i +'_3" id="input'+ i +'_3" value="" placeholder="" maxlength="4">';
						html += '</td>';
						html += '</tr>';
						html += '</table>';
						html += '</td>';
					}
					if(input.KEY == "NUMBER") {
						html += '<td class="title" onclick="javascript:jQuery(this).focusinput(\''+ input.KEY +'\', '+ i +')">'+ input.TITLE +'</td>';
						html += '<td class="write">';
						html += '<input type="hidden" name="input'+ i +'_key" value="'+ input.KEY +'">';
						html += '<input type="hidden" name="input'+ i +'_title" value="'+ input.TITLE +'">';
						html += '<input type="text" class="inputNumber" name="input'+ i +'" id="input'+ i +'" value="" placeholder="" maxlength="20">';
						html += '</td>';
					}
					if(input.KEY == "SELECT") {
						html += '<td class="title" onclick="javascript:jQuery(this).focusinput(\''+ input.KEY +'\', '+ i +')">'+ input.TITLE +'</td>';
						html += '<td class="write">';
						html += '<input type="hidden" name="input'+ i +'_key" value="'+ input.KEY +'">';
						html += '<input type="hidden" name="input'+ i +'_title" value="'+ input.TITLE +'">';
						if(jQuery.isArray(input.VALUE)) {
							html += '<input type="hidden" name="input'+ i +'" value="'+ input.VALUE[0] +'" id="input'+ i +'">';
						}else {
							html += '<input type="hidden" name="input'+ i +'" value="'+ input.VALUE +'" id="input'+ i +'">';
						}
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
					}
					if(input.KEY == "DATE") {
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
					}
					if(input.KEY == "EMAIL") {
						html += '</tr>';
						html += '<td class="title" onclick="javascript:jQuery(this).focusinput(\''+ input.KEY +'\', '+ i +')">'+ input.TITLE +'</td>';
						html += '<td class="write col3" colspan="4">';
						html += '<input type="hidden" name="input'+ i +'_key" value="'+ input.KEY +'">';
						html += '<input type="hidden" name="input'+ i +'_title" value="'+ input.TITLE +'">';
						html += '<table border="0" cellpadding="0" cellspacing="0">';
						html += '<tr>';
						html += '<td class="email_id">';
						html += '<input type="text" name="input'+ i +'_id" id="input'+ i +'_id" value="">';
						html += '</td>';
						html += '<td class="email_txt">@</td>';
						html += '<td class="email_domain"><input type="text" name="input'+ i +'_domain" id="input'+ i +'_domain" value=""></td>';
						html += '<td class="email_list">';
						html += '<select>';
						html += '<option value="">선택해주세요.</option>';
						html += '<option value="write">직접입력</option>';
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
					document.productJoin.FU_INPUT_COUNT.value = i + 1;
				}
				html += '</tr>';
				html += '</table>';
				
				jQuery("#inputform").append(html);
				
				//숫자 입력 이벤트 세팅
				jQuery(".inputPhone").keyup(function(){
					var value = jQuery(this).val().replace(/[^0-9]/g, '');
					jQuery(this).val(value);
				});
				
				//달력 세팅
				jQuery.datepicker.setDefaults({
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
							
							var startDateAry = jQuery('#input'+ i).data("value").split(",");
							var startDate = null;
							if(startDateAry.length > 0) {
								startDate = new Array();
								for(var k = 0; k < startDateAry.length; k++) {
									if(startDateAry[k].indexOf("~") > -1) {
										var startDateAry1 = startDateAry[k].split("~"); 
										if(startDateAry1[0]) {
											startDate.push(startDateAry1[0]);
										}
									}else {
										startDate.push(startDateAry[k]);
									}
								}
								startDate = startDate.sort();
								startDate = startDate[0]
							} 
							
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
								},
								defaultDate: startDate
							});
						}else{
							jQuery('#input'+ i).datepicker();
						}
					}
				}
			
				//이메일 이벤트 세팅
				jQuery(".email_list > select").change(function(){
					if(jQuery(this).val() != "write" && jQuery(this).val() != "") {
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
								jQuery("#price_value").text("상담 후 안내");
								jQuery("#price_unit").text("");
								document.productJoin.FU_PRICE.value = "0";
								alert(jsonPrice[i].PRICE);
							}else {
								jQuery("#price_value").text(parseInt(jsonPrice[i].PRICE).format());
								jQuery("#price_unit").text("원");
								document.productJoin.FU_PRICE.value = jsonPrice[i].PRICE;
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
					for(var i = 0; i < jsonInput.INPUT.length; i++) {
						var input = jsonInput.INPUT[i];
						
						if(input.KEY == "TEXT") {
							if(jQuery("#input"+ i).val() == "") {
								alert(input.TITLE +"을(를) 입력해주세요.");
								jQuery("#input"+ i).focus();
								return;
							}
						}
						if(input.KEY == "HPHONE") {
							if(jQuery("#input"+ i +"_1").val() == "") {
								alert(input.TITLE +"을(를) 입력해주세요.");
								jQuery("#input"+ i +"_1").focus();
								return;
							}
							if(jQuery("#input"+ i +"_2").val() == "") {
								alert(input.TITLE +"을(를) 입력해주세요.");
								jQuery("#input"+ i +"_2").focus();
								return;
							}
							if(jQuery("#input"+ i +"_3").val() == "") {
								alert(input.TITLE +"을(를) 입력해주세요.");
								jQuery("#input"+ i +"_3").focus();
								return;
							}
						}
						if(input.KEY == "NUMBER") {
							if(jQuery("#input"+ i).val() == "") {
								alert(input.TITLE +"을(를) 입력해주세요.");
								jQuery("#input"+ i).focus();
								return;
							}
						}
						if(input.KEY == "SELECT") {
							if(jQuery("#input"+ i).val() == "") {
								alert(input.TITLE +"을(를) 입력해주세요.");
								jQuery("#input"+ i +"_select").focus();
								return;
							}
						}
						if(input.KEY == "DATE") {
							if(jQuery("#input"+ i).val() == "") {
								alert(input.TITLE +"을(를) 입력해주세요.");
								jQuery("#input"+ i).focus();
								return;
							}
						}
						if(input.KEY == "EMAIL") {
							if(jQuery("#input"+ i +"_id").val() == "") {
								alert(input.TITLE +"의 아이디를 입력해주세요.");
								jQuery("#input"+ i +"_id").focus();
								return;
							}
							if(jQuery("#input"+ i +"_domain").val() == "") {
								alert(input.TITLE +"의 도메인을 입력해주세요.");
								jQuery("#input"+ i +"_domain").focus();
								return;
							}
						}
					}
					
					var jsonPrice = jsonInput.PRICE;
					var key = jsonPrice[0].KEY;
					if(key != "-1") {
						for(var i = 0; i < jsonPrice.length; i++) {
							if(jsonPrice[i].VALUE == jQuery("select[name='input"+ key +"_select']").val()) {
								if(!isNaN(parseInt(jsonPrice[i].PRICE))) {
									if(document.productJoin.FU_BENEFIT_SEQ.value == "") {
										alert("결합혜택을 선택해주세요.");
										return;
									}
								}
							}
						}
					}else {
						if(document.productJoin.FU_BENEFIT_SEQ.value == "") {
							alert("결합혜택을 선택해주세요.");
							return;
						}
					}
					
					if(document.productJoin.FU_AGREE.checked == false) {
						alert("개인정보 제공에 동의해주세요.");
						document.productJoin.FU_AGREE.focus();
						return;
					}
					
					var options = { 
				        url: "/fair/action.ajax", 
				        type: "post", 
				        dataType: "json", 
				        beforeSubmit: function() {
				        	jQuery("#formSubmit").attr("disabled", true).find(".loading").show();
				        }, 
				        success: function(data) {
				        	if(data.result == "NOT PHONE") {
				        		alert("정상적이지 않은 연락처입니다. 다시 입력해주세요.");
				        		jQuery("#formSubmit").attr("disabled", false).find(".loading").hide();
				        		return;
				        	}
				        	if(data.result == "NOT NAME") {
				        		alert("정상적이지 않은 이름입니다. 다시 입력해주세요.");
				        		jQuery("#formSubmit").attr("disabled", false).find(".loading").hide();
				        		return;
				        	}
				        	(function (img) { img.onload = function () {
				            	var length = localStorage.BuzzAd.length;
				                if(localStorage.BuzzAd.indexOf('10023_71ffbffd-ccf1-4edf-9c4c') != -1){
				                  //alert("[Success] Action Completed!");
				                };
				                //*필요시 여기서 리다이렉트 수행*/
						     };
						     if (localStorage.BuzzAd == null) { localStorage.BuzzAd = ""; }
						     img.src = "//track.buzzvil.com/action/pb/cpa/default/pixel.gif" + localStorage.BuzzAd; }) (new Image())
				        	var html = "<div style='position: fixed; width: 100%; height: 100%; background-color: rgba(0,0,0,.7); z-index: 2; top: 0; left: 0;'><a href='#' onclick='javascript:location.reload();'><img src='/common/images/fairimage/consult_complete.png' style='position:absolute; top:50%; left:50%; transform:translate(-50%, -50%);'></a></div>";
							jQuery("body").append(html);
				        },
				        error: function(){
				        	alert("저장에 실패하였습니다. 다시 시도해주세요.")
				        }
				    }; 
			        jQuery("#productJoin").ajaxSubmit(options); 
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
				var tab = '<div id="detailTab"><ul id="detailTabUl">';
				var jsonDetail = JSON.parse(jQuery(this).val());
				for(var i = 0; i < jsonDetail.length; i++) {
					var detail = jsonDetail[i];
					
					tab += '<li><a onclick="javascript:jQuery(this).detailMove('+ i +');">'+ detail.TITLE +'</a></li>';
					
					var bgi = '';
					var bgc = '';
					if(detail.BG_SAVE_NM != '') bgi = 'background-image:url(\'/common/images/fairimage/'+ detail.BG_SAVE_NM +'\');';
					if(detail.BGCOLOR != '') bgc = 'background-color:'+ detail.BGCOLOR +';';
					html += '<div class="detail_bg" id="detailDiv'+ i +'" style="'+ bgi + bgc +'">';
					if(i == jsonDetail.length -1) {
						html += '<div class="detail_content"><img src="/common/images/fairimage/'+ detail.W_SAVE_NM +'" alt="'+ detail.W_REAL_NM +'" onload="javascript:load_detail();"></div>';
					}else {
						html += '<div class="detail_content"><img src="/common/images/fairimage/'+ detail.W_SAVE_NM +'" alt="'+ detail.W_REAL_NM +'"></div>';
					}
					html += '</div>';
				}
				tab += '<li style="clear:both;width:0;padding:0;"></li></ul></div>';
				
				jQuery(".detail").html(html);
				jQuery(".detail").append(tab);
				
				jQuery(document).scroll(function(){
					if(jQuery(this).scrollTop() >= jQuery("#detail").offset().top) {
						jQuery("#detailTab").css({"position":"fixed"});
					}else {
						jQuery("#detailTab").css({"position":"absolute"});
					}
				});
			});
			
			jQuery("#agreeClose").click(function(){
				jQuery(".agree_text").hide();
			});
			
			jQuery("#agreeOpen").click(function(){
				jQuery(".agree_text").show();
			});
		});
		
		function load_detail(){
			jQuery(window).scrollTop(jQuery("#detail").offset().top);
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
				var keyAry = new Array();
				for(var i = 0; i < jsonBenefit.length; i++) {
					if(jsonBenefit[i].VALUE == val) {
						var sBenefit = jsonBenefit[i].BENEFIT;
						for(var k = 0; k < sBenefit.length; k++) {
							keyAry.push(sBenefit[k].fbSeq);
						}
// 						html += '<div class="benefitTitle">결합혜택 선택</div>';
// 						html += '<div class="benefitClose"><a href="#" id="benefitClose"></a></div>';
// 						html += '<ul class="benefitContainer">';
						
// 						for(var k = 0; k < sBenefit.length; k++) {
// 							var classLeft = "";
// 							if(k % 2 != 0) classLeft = " left";
// 							if(sBenefit[k].fbSeq == productJoin.FU_BENEFIT_SEQ.value)  classLeft += " active";
// 							html += '<li class="benefitList'+ classLeft +'" data-seq="'+ sBenefit[k].fbSeq +'" data-title="'+ sBenefit[k].fbTitle +'" data-subtitle="'+ sBenefit[k].fbSubtitle +'" data-model="'+ sBenefit[k].fbModel +'" data-price="'+ sBenefit[k].fbPrice +'" data-path="'+ sBenefit[k].fbPath +'" data-save="'+ sBenefit[k].fbSave +'" data-real="'+ sBenefit[k].fbReal +'" onclick="javascript:jQuery(this).benefit_select();">';
// 							html += '<div class="benefitLi">';
// 							html += '<div class="benefitList_img"><img src="/common/images/fairimage/'+ sBenefit[k].fbSave +'" title="'+ sBenefit[k].fbReal +'"></div>';
// 							html += '<div class="benefitList_title">'+ sBenefit[k].fbTitle +'</div>';
// 							html += '<div class="benefitList_subtitle">'+ sBenefit[k].fbSubtitle +'</div>';
// 							html += '<div class="benefitList_desc">'+ sBenefit[k].fbModel +'</div>';
// 							html += '</div>';
// 							html += '</li>';
// 						}
// 						html += '<li style="clear:both;"></li>';
// 						html += '</ul>';
						
						if(sBenefit.length > 0) chk = true;
					}
				}		
				if(chk == false) {
					alert("선택하실 수 있는 결합혜택이 없습니다.");
					return;
				}else {		
					jQuery.ajax({
						url: "/fair/benefitList.do",
						type: "POST",
						dataType: "HTML",
						data: {
							"fbSeq": keyAry.join(",")
						},
						error: function(data) {
			            },
						success: function(html) {
							jQuery("#benefitList").html(html).show();
							jQuery("#benefitClose").click(function(){
								jQuery("#benefitList").hide();
							});
						}
					});
				}			
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
			
			detailMove: function(index){
				var scrollTop = jQuery("#detailDiv"+index).offset().top - 55;
				jQuery('html, body').animate({scrollTop: scrollTop}, 500);
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
		
		function moveTop() {
			jQuery(window).scrollTop(0);
		}
		
		if (/bz_tracking_id/.test(location.search)) { localStorage.BuzzAd = location.search }
	</script>
	
	<body>
	
	<c:if test="${product ne null}">
	<div class="header">
		<div class="container">
			<div class="header_logo"><a href="/fair/index.do"><img src="/common/images/fairimage/top_logo.png"></a></div>
			<div class="header_title">
				<span>|</span>
				${product.fpMainTitle}
			</div>
			<div class="header_back"><a href="/fair/index.do"><img src="/common/images/fairimage/top_back.png"></a></div>
			<div style="clear:both;"></div>
		</div>
	</div>
	
	<div class="container" style="width:1080px;">
		<div class="input">
			<form id="productJoin" name="productJoin">
				<input type="hidden" name="fromurl" value="${fromurl}">
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
					<div class="productDetail" id="thumnailLabel"></div>
				</div>
				<div class="form">
					<div id="inputform"></div>
				
					<div class="price">
						<span id="price_value" class="price_value"></span>
						<span id="price_unit" class="won">원</span>
					</div>
	
					<div class="input_submit"><button type="button" id="formSubmit">상담 신청하기<div class="loading"><img src="/common/images/fairimage/ajax-loader.gif"></div></button></div>
					<div class="input_rule">
						<label for="input_agree" class="label_agree">개인정보제공 동의</label>
						<input type="checkbox" name="FU_AGREE" value="Y" id="input_agree">
						<a href="#" class="agree_txt" id="agreeOpen">전문보기</a>
						<div class="agree_text">
							<div class="agreeTextClose"><a href="#" id="agreeClose"></a></div>
							<div class="agree_telegram"><img src="/common/images/fairimage/rule.png"></div>
						</div>
					</div>
				</div>
				<div style="clear:both;"></div>
			</div>
		</form>
	</div>
	
	<div class="detail" id="detail">
	</div>
	
	<div class="footer">
		<div class="links">
			<div class="container">
				<a href="https://www.daemyungimready.com/operation-guide/privacy/index.do" target="_blank">개인정보취급방침</a>
				<span>|</span>
				<a href="https://www.daemyungimready.com/daemyung-lifeway/introduction/contentsid/212/index.do" target="_blank">회사소개</a>
				<span>|</span>
				<a href="https://www.daemyungimready.com/main/index.do" target="_blank">공식홈페이지</a>
				<span>|</span>
				<a href="https://www.imreadymall.com" target="_blank">회원몰</a>
			</div>
		</div>
		<div class="container">
			<img class="logo" src="/common/images/fairimage/footer_logo.png">
			<div class="info">
				<span class="txt">서울시 송파구 법원로 135 대명타워</span>
				<span>|</span>
				<span class="txt">사업자등록번호 220-88-09321</span>
				<span>|</span>
				<span class="txt">대표자 (주)대명스테이션 대표이사 서준혁, 최성훈</span>
				<br>
				<span class="txt">통신판매신고번호 제2016-서울송파-0669호</span>
				<div class="copyright">
					COPYRIGHT DAEMYUNGSTATION.CO,.LTD. ALL RIGHTS RESERVED.
				</div>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
	
	<div class="topMove"><a style="cursor:pointer;" onclick="javascript:moveTop();"><img class="logo" src="/common/images/fairimage/btn_top.png"></a></div>
	
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
	
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-154355799-1"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'UA-154355799-1');
	</script>
	</body>
</html>