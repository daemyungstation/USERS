<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
<!doctype html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<title>대명아임레디</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,maximum-scale=1.0,minimum-scale=1.0,target-densitydpi=medium-dpi" />
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

		<link rel="stylesheet" href="/common/css/lifeway_style.css" />
		<script type="text/javascript" src="/common/js/jquery-1.8.2.min.js"></script>
		<!--  20200701 넷퍼넬 삭제요청 -->
		<!--  <script type="text/javascript" src="/common/js/netfunnel.js"></script> -->
		<!--  <script type="text/javascript" src="/common/js/dmskin.js"></script> -->
		<script type="text/javascript"></script>
		<script type="text/javascript" src="https://sso.daemyungimready.com/api/sso"></script>

		<script type="text/javascript">
		//<![CDATA[
			if (document.location.hostname == 'www.daemyunglifeway.com') {
				document.location.href = "https://www.daemyungimready.com" + document.location.pathname;
			}

			var oneNum = -1, twoNum = -1, thrNum = -1, fouNum = -1;
			
			<c:forEach var="indicator" items="${parntMenuList}" varStatus="status">
				<c:choose>
					<c:when test="${status.count eq 1}">
						oneNum = "${indicator.pstn}";
					</c:when>
					<c:when test="${status.count eq 2}">
						twoNum = "${indicator.pstn}";
					</c:when>
					<c:when test="${status.count eq 3}">
						thrNum = "${indicator.pstn}";
					</c:when>
					<c:when test="${status.count eq 4}">
						fouNum = "${indicator.pstn}";
					</c:when>
				</c:choose>
			</c:forEach>
			
		//]]>
		</script>			
		<script type="text/javascript" src="/common/js/common.js"></script>
		<script type="text/javascript" src="/common/js/fnc.js"></script>
		<script type="text/javascript" src="/common/js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="/common/js/TweenMax.js"></script>		
		<script type="text/javascript" src="/common/js/jquery.event.drag-1.5.min.js"></script>
		<script type="text/javascript" src="/common/js/jquery.touchSlider.js"></script>
		<!--<script type="text/javascript" src="/common/js/jquery.magnific-popup.min.js"></script>-->
		<script type="text/javascript">
			var curVisual = 0;
			var isMove = false;
			var maxVisual = 2;
			var rInterval;
			var rTime = 5000;
			var isPlay = true;
			var curMainNoti = 0;
			var maxMainNoti = 0;
			jQuery(document).ready(function(){
					
				rInterval = setInterval("rVisual()", rTime);
	
				jQuery(".footerDiv .noti .bts a").hover(function(){
					clearInterval(rInterval);	
				}, function(){
					clearInterval(rInterval);	
					rInterval = setInterval("rVisual()", rTime);
				});
				
				//웹공지
				curMainNoti = 0;
				maxMainNoti = jQuery(".footerDiv .noti .nList a").size()-1;
				jQuery(".footerDiv .noti .nList a").each(function(q){
					jQuery(".footerDiv .noti .nList a").eq(q).css('top', q*55);
				});
				jQuery(".footerDiv .noti .bts a").each(function(q){
					jQuery(this).click(function(){
						if(q == 1){
							TweenMax.to(jQuery(".footerDiv .noti .nList a").eq(curMainNoti), .5, {top:55, ease:Power4.easeOut});
							curMainNoti--;
							if(curMainNoti < 0) curMainNoti = maxMainNoti;
							TweenMax.to(jQuery(".footerDiv .noti .nList a").eq(curMainNoti), 0, {top:-55, ease:Power4.easeOut});
							TweenMax.to(jQuery(".footerDiv .noti .nList a").eq(curMainNoti), .5, {top:0, ease:Power4.easeOut});
						}else if(q == 0){
							TweenMax.to(jQuery(".footerDiv .noti .nList a").eq(curMainNoti), .5, {top:-55, ease:Power4.easeOut});
							curMainNoti++;
							if(curMainNoti > maxMainNoti) curMainNoti = 0;
							TweenMax.to(jQuery(".footerDiv .noti .nList a").eq(curMainNoti), 0, {top:55, ease:Power4.easeOut});
							TweenMax.to(jQuery(".footerDiv .noti .nList a").eq(curMainNoti), .5, {top:0, ease:Power4.easeOut});
						}
					});
				});
	
				//윈도우팝업
				var rollSize = jQuery(".winPop .rollImg").size() - 1;
				var rollNum = 0;
				var rollClick = false;
				var popRollAuto;
				popRollAuto = setInterval('popVisual()', 8000);
				jQuery(".winPop .popDiv > a").each(function(i){
					jQuery(this).click(function(){
						if(rollSize > 0){
							if(i == 1){
								if(rollClick == false){
									rollClick = true;
									TweenMax.to(jQuery(".winPop .rollImg").eq(rollNum), .8, {left:'-100%', ease:Power4.easeOut});
									rollNum++;
									if(rollNum > rollSize) rollNum = 0;
									TweenMax.to(jQuery(".winPop .rollImg").eq(rollNum), 0, {left:'100%', ease:Power4.easeOut});
									TweenMax.to(jQuery(".winPop .rollImg").eq(rollNum), .8, {left:0, ease:Power4.easeOut, onComplete:function(){
										rollClick = false;
									}});
								}
								
							}else{
								if(rollClick == false){
									rollClick = true;
									TweenMax.to(jQuery(".winPop .rollImg").eq(rollNum), .8, {left:'100%', ease:Power4.easeOut});
									rollNum--;
									if(rollNum < 0) rollNum = rollSize;
									TweenMax.to(jQuery(".winPop .rollImg").eq(rollNum), 0, {left:'-100%', ease:Power4.easeOut});
									TweenMax.to(jQuery(".winPop .rollImg").eq(rollNum), .8, {left:0, ease:Power4.easeOut, onComplete:function(){
										rollClick = false;
									}});
								}
							}
						}
					});
				});
				
				jQuery(".winPop .popDiv .close a").click(function(){
					TweenMax.to(jQuery(".winPop"), .5, {height:0, ease:Power4.easeInOut});
				});
				
				jQuery(".winPop").hover(function(){
					clearInterval(popRollAuto);
				}, function(){
					clearInterval(popRollAuto);
					popRollAuto = setInterval('popVisual()', 8000);
				});
				
				jQuery(".winPop .rollImg").each(function(index, obj){
					var img = jQuery(this).find("a img").remove();
					
					jQuery(this).find("a").empty();
					jQuery(this).css("background-image", "url(" + img.attr("src") + ")");
				});

				if(getCookie("popup1") == "false")
				{
					jQuery(".winPop").hide();
				}

				if(getCookie("popup2") == "false")
				{
					jQuery(".layerBg").hide();
					jQuery(".layerPopup").hide();
				}
				else
				{
					jQuery(".layerBg").show();
					jQuery(".layerPopup").show();
				}
				
				jQuery(".closePop").click(function(){
					TodayClose(this, "popup2");
					
					jQuery(".layerBg").hide();
					jQuery(".layerPopup").hide();
				});
			});
	
	
			function rVisual(){
				if(jQuery(".footerDiv .noti .nList a").length > 1) {
					TweenMax.to(jQuery(".footerDiv .noti .nList a").eq(curMainNoti), .5, {top:55, ease:Power4.easeOut});
					curMainNoti--;
					if(curMainNoti < 0) curMainNoti = maxMainNoti;
					TweenMax.to(jQuery(".footerDiv .noti .nList a").eq(curMainNoti), 0, {top:-55, ease:Power4.easeOut});
					TweenMax.to(jQuery(".footerDiv .noti .nList a").eq(curMainNoti), .5, {top:0, ease:Power4.easeOut});
				}
			}
	
			function popVisual()
			{
				jQuery(".winPop .popDiv .next").click();
			}
	
			function TodayClose(trgtObj, trgtNm)
			{
				if (jQuery(trgtObj).siblings("input[type='checkbox']").is(":checked")) {
					setCookie(trgtNm, "false", 1);
				}
			}
			
			//Family Site 홈페이지 이동
			function moveFooterAflt()
			{
				var url = jQuery("#selectAflt").val();
				
				if(!url)
				{
					alert("Family Site를 선택해 주세요.");
					jQuery("#selectAflt").focus();
				}
				else
				{
					window.open(url, "_blank");
				}	
			}

			//회원몰 홈페이지 이동
			function goShop()
			{
				//window.open("http://lifewayshopping.com/", "_blank");
				window.open("https://www.imreadymall.com/", "_blank");
			}
			jQuery(window).load(function(){
				if(jQuery(window).width() >= 1183){
					TweenMax.to(jQuery(".mainCon"), 1, {bottom:249, ease:Power4.easeOut});
					TweenMax.to(jQuery(".mainCon2"), 1, {bottom:0, ease:Power4.easeOut});

					TweenMax.to(jQuery(".mVisual .controll .unit .btns"), 1, {bottom:165, delay:.1, ease:Power4.easeOut});

				}else if(jQuery(window).width() <= 1182 && jQuery(window).width() >= 963){

					TweenMax.to(jQuery(".mainCon"), 1, {bottom:249, ease:Power4.easeOut});
					TweenMax.to(jQuery(".mainCon2"), 1, {bottom:0, ease:Power4.easeOut});

					TweenMax.to(jQuery(".mVisual .controll .unit .btns"), 1, {bottom:165, delay:.1, ease:Power4.easeOut});

				}else if(jQuery(window).width() <= 964){
					//TweenMax.to(jQuery("#wrapper.main"), 1.5, {height:jQuery(".main #footer").height() + jQuery(".mVisualM li img").height() + 50, ease:Power4.easeOut});
					TweenMax.to(jQuery(".mConbody"), 1.5, {height:jQuery(".main #footer").height() + jQuery(".mVisualM li img").height() + 42, ease:Power4.easeOut});
					TweenMax.to(jQuery(".mcb"), 1.5, {height:jQuery(".main #footer").height() + jQuery(".mVisualM li img").height() + 42, ease:Power4.easeOut});

					TweenMax.to(jQuery(".mainCon"), 1.5, {bottom:jQuery(".main #footer").height() + 43, ease:Power4.easeOut});
					TweenMax.to(jQuery(".mainCon2"), 1.5, {bottom:-(jQuery(".mainCon2").height()-jQuery(".main #footer").height() - 43), ease:Power4.easeOut});
				}
				jQuery(".mainConDiv .open .on").css("opacity","1");
				//TweenMax.fromTo(jQuery(".mainConDiv .open .on"), 0, {opacity:1}, {opacity:0, repeat:0, yoyo:false, ease:Power3.easeOut});
				curMcon = true;
			});
		</script>
		<script type="text/javascript">
		    var roosevelt_params = {
		        retargeting_id:'LWagAbDHNiW5fBgMIwR_LQ00',
		        tag_label:'Kawbbq51QMOik2wIJAVRPA'
		    };
		</script>
		<script type="text/javascript" src="//adimg.daumcdn.net/rt/roosevelt.js" async></script>
		<!-- Facebook Pixel Code -->
<!-- 
		<script type="text/javascript">
			!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
			n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
			n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
			t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
			document,'script','https://connect.facebook.net/en_US/fbevents.js');
			
			fbq('init', '464090003784561');
			fbq('track', "PageView");
		</script>
		<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=464090003784561&ev=PageView&noscript=1" /></noscript>
-->
		<!-- End Facebook Pixel Code -->
		<!-- 
		<script type="text/javascript" src="/common/js/logAnalysis.js"></script>
		 -->
		<!--[if lt IE 9]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
		
	<script type='text/javascript' src='/common/js/swiper.min.js'></script>
	<link rel='stylesheet' type='text/css' href='/common/css/swiper.min.css' />
	<style>
	@font-face{
		font-family:"NanumSquareB";
		src:url('/common/css/fonts/NanumSquareB.eot');
		src:url('/common/css/fonts/NanumSquareB.eot?#iefix') format('embedded-opentype'),
		url('/common/css/fonts/NanumSquareB.woff') format('woff'),
		url('/common/css/fonts/NanumSquareB.ttf') format('truetype');
		src:local('?'), url('/common/css/fonts/NanumSquareB.woff') format('woff');
	}
	
	@font-face{
		font-family:"NanumSquareR";
		src:url('/common/css/fonts/NanumSquareR.eot');
		src:url('/common/css/fonts/NanumSquareR.eot?#iefix') format('embedded-opentype'),
		url('/common/css/fonts/NanumSquareR.woff') format('woff'),
		url('/common/css/fonts/NanumSquareR.ttf') format('truetype');
		src:local('?'), url('/common/css/fonts/NanumSquareR.woff') format('woff');
	}
	
	@font-face{
		font-family:"NanumSquareEB";
		src:url('/common/css/fonts/NanumSquareEB.eot');
		src:url('/common/css/fonts/NanumSquareEB.eot?#iefix') format('embedded-opentype'),
		url('/common/css/fonts/NanumSquareEB.woff') format('woff'),
		url('/common/css/fonts/NanumSquareEB.ttf') format('truetype');
		src:local('?'), url('/common/css/fonts/NanumSquareEB.woff') format('woff');
	}

	/* 푸터 - 메인 : STR */
	#footer_main { position:fixed; width:100%; bottom:-175px; left:0; text-align:center; background:#283066; z-index:999;}
	#footer_main .footerDiv{position:relative; width:100%; height:55px; overflow:hidden; margin:auto; color:#fff; text-align:left}
	#footer_main .footerDiv .noti{position:relative; width:50%; height:55px; overflow:hidden; float:left; border-right:1px solid #535985; padding-left:9%; box-sizing:border-box; }
	#footer_main .footerDiv .noti .tit { position:relative; width:75px; height:55px; padding:20px 0 0 30px; box-sizing:border-box; float:left; font-family:'NanumSquareB', dotum,sans-serif; background:url('/common/images/main/main_noti_icon.png') no-repeat 0 16px;}
	#footer_main .footerDiv .noti .tit::after { position:absolute; content:''; top:20px; right:0; width:1px; height:15px; background:#fff; }
	#footer_main .footerDiv .noti .nList{position:relative; width:calc(100% - 200px) ; height:55px; overflow:hidden; margin-left:29px; float:left; }
	#footer_main .footerDiv .noti .nList a{position:absolute; top:20px; left:0; width:100%; height:15px; padding:20px 0; display:block; color:#fff}
	#footer_main .footerDiv .noti .nList a .date{position:absolute; top:0; right:0; height:15px; padding:20px 0; display:block; color:#fff; font-size:13px;}
	#footer_main .footerDiv .noti .bts{width:70px; height:55px; overflow:hidden; float:right;}
	#footer_main .footerDiv .noti .bts a{display:block; text-align:center; height:6px;}
	#footer_main .footerDiv .noti .bts a.up{padding:15px 0 5px}
	#footer_main .footerDiv .noti .bts a.down{padding:5px 0 15px}
	#footer_main .footerDiv .contact { position:relative; width:50%; height:55px; box-sizing:border-box; overflow:hidden; float:left; font-size:15px; padding-left: 5%; text-align:left; }
	#footer_main .footerDiv .open{position:absolute; top:0; right:0; width:55px; height:55px; overflow:hidden; float:left;}
	#footer_main .footerDiv .open img{width:55px; height:55px;}
	#footer_main .footerDiv .open img.on{position:absolute; top:0; left:0; opacity:0}
	#footer_main .footerDiv .contact span{margin:0 6px; color:#ffffff; float:none; width:auto; line-height:55px; }
	#footer_main .footerDiv .contact .contact1 { width:auto; float:none; display:inline-block; line-height:55px; background:url('/common/images/main/contact_icon.png') no-repeat 18px 12px; padding-left:60px; box-sizing:border-box;}
	#footer_main .footerDiv .contact .contact2 { width:auto; float:none; display:inline-block; line-height:55px; }
	/* 푸터 - 메인 : END */
	
	.clear { clear:both; }
	#main-wraper { position:relative; width:100%; }

	/* 컨텐츠 영역 왼쪽 : STR */
	#contents_left { position:fixed; display:block; float:none; width:50%; top:102px; left:0; height: calc(100vh - 156px); }
	#contents_left .swiper { width:100%; height:100%; }
	#contents_left .left-visual { position:relative; width:100%; height:100%; cursor:pointer; }
	#contents_left .left-visual .left-visual-title { position: relative; z-index:2; }
	#contents_left .left-visual .left-visual-title img { position: relative; }
	#contents_left .left-visual .left-visual-content { position: relative; font-size:21px; font-family:'NanumSquareR', dotum,asans-serif;  color:#282828; line-height:160%; font-weight:600; word-break:keep-all; z-index:2; }
	#contents_left .left-visual .left-visual-content small { font-size:0.8em; display:block; line-height:120%; }
	#contents_left .left-visual .left-visual-btn { position: absolute; z-index:2; }
	#contents_left .left-visual .left-visual-img { position: absolute;  z-index:1; top:0; left:0; }
	
	#contents_left .btn_prev { position:absolute; display:none; top:50%; left:0; margin-top:-33px; z-index:1; text-align:left; }
	#contents_left .btn_next { position:absolute; display:none; top:50%; right:0; margin-top:-33px; z-index:1; text-align:right; }
	#contents_left .swiper-pagination { position: absolute; left: 50%; bottom:20px;-webkit-transform: translateX( -50%);-ms-transform: translateX( -50%);transform: translateX( -50%); z-index: 1;}
	#contents_left .swiper-pagination .swiper-pagination-bullet {position: relative;display: inline-block; width:14px; height:14px; background:#fff; border-radius: 50%; margin-left:7px; opacity:.7;}
	#contents_left .swiper-pagination .swiper-pagination-bullet:first-child {margin-left: 0;}
	#contents_left .swiper-pagination .swiper-pagination-bullet-active { opacity:1; width:45px; border-radius:14px; }
	/* 컨텐츠 영역 왼쪽 : END */
	
	/* 컨텐츠 영역 오른쪽 : STR */
	#contents_right { position:relative; float:none; width:50%; top:0; left:50%; height:auto; overflow:auto; padding-top:102px; padding-bottom:55px; box-sizing:border-box;}
	#contents_right .right-container { width:100%; }
	#contents_right .right-container .right-inner { width:100%; height:100%; background:url('/common/images/main/right_bg.jpg') center top repeat-y; }
	#contents_right .right-section { position:relative; padding-top:35px; box-sizing:border-box; }
	#contents_right .right-section:last-child { padding-bottom: 50px; }
	#contents_right .right-section .right-section-title { position:relative; padding-top:25px; box-sizing:border-box; font-size:28px; font-family:'NanumSquareR', dotum,asans-serif;  color:#505050; letter-spacing:-1px; text-align:center; }
	#contents_right .right-section .right-section-title span { font-family:'NanumSquareEB', dotum,asans-serif; font-size:34px; font-weight:800; }
	#contents_right .right-section .right-section-title .top-bar { position:absolute; top:0px; left:50%; margin-left:-25px; width:50px; height:2px; }
	#contents_right .right-section .right-section-title .top-bar.r01 { background:#62c0d9; }
	#contents_right .right-section .right-section-title .top-bar.r02 { background:#f38ca6; }
	#contents_right .right-section .right-section-title .top-bar.r03 { background:#ffcd72; }
	
	#contents_right .right-section .right-section-contents { position:relative; width:90%; margin:35px auto 0 auto; }
	#contents_right .right-section .right-section-contents a { color:#505050; }
	#contents_right .right-section .right-section-contents .right-section-content { float:left; margin-left:2%; width:49%; }
	#contents_right .right-section .right-section-contents .right-section-content:first-child { margin-left: 0; }
	#contents_right .right-section .right-section-contents .right-section-content .right-section-content-img { width:100%; }
	#contents_right .right-section .right-section-contents .right-section-content .right-section-content-img img { width:100%; }
	#contents_right .right-section .right-section-contents .right-section-content .right-section-content-title { margin-top:20px; font-family:'NanumSquareEB', dotum,asans-serif; font-size:18px; }
	#contents_right .right-section .right-section-contents .right-section-content .right-section-content-msg { margin-top:10px; font-family:'NanumSquareB', dotum,asans-serif; font-size:15px; line-height:140%; word-break:keep-all;}

	body { width:100%; height:auto; overflow: auto;}
	#header { position:fixed; top:0; }
	#wrapper.main{ height:auto; overflow: hidden; }
	#footer { position:relative !important; text-align:left; }
	/* 컨텐츠 영역 오른쪽 : END */

	@media all and (max-width:1919px) {
		#contents_left .left-visual .left-visual-content { font-size: 1.3rem; }
		#contents_left .btn_prev img{ width:80%; }
		#contents_left .btn_next img{ width:80%; }
	}
	@media all and (max-width:1400px) {
		#contents_left .left-visual .left-visual-content { font-size: 1.2rem; }
	}
	@media all and (max-width:1200px) {
		#contents_left .left-visual .left-visual-content { font-size: 1.1rem; }
	}
	@media all and (max-width:980px) {
		body { position:relative; width:100%; height:auto; max-width:100%; margin:0 auto; overflow:auto; }
		#header { position:relative; }

		#footer_main { bottom:auto; position:relative !important; }
		#footer_main .footerDiv { width:100%; height:70px; overflow:auto; }
		#footer_main .footerDiv .noti { display:none; }
		#footer_main .footerDiv .contact { width:100%; height:70px; padding:0; overflow:auto; font-size:0.8rem; text-align:center; }
		#footer_main .footerDiv .contact span { margin:0; float:left; width:1px; line-height:70px; }
		#footer_main .footerDiv .contact .contact1 { width:calc(50% - 1px); float:left; line-height:70px; background:none; padding:0; }
		#footer_main .footerDiv .contact .contact2 { width: calc(50% - 1px); float:left; line-height:70px; }
	
		#contents_left { position:relative; display:block; float:none; width:100%; height:660px; top:0; }
		#contents_left .left-visual .left-visual-content { font-size: 1.3rem; }
		#contents_left .btn_prev { display:none; }
		#contents_left .btn_next { display:none; }
			
		#contents_right { float:none; width:100%; height:auto; overflow:auto; left: 0; padding:0; }
		#contents_right .right-container .right-inner { background:url('/common/images/main/m_right_bg.jpg') center top repeat-y; background-size:100% auto;}
		#contents_right .right-section .right-section-title { font-size:1.3rem; }
		#contents_right .right-section .right-section-title span { font-size:1.5rem; }
		#contents_right .right-section .right-section-contents { position:relative; width:80%; margin:0 auto 0 auto; }
		#contents_right .right-section .right-section-contents .right-section-content { float:none; margin:35px auto 0 auto; width:100%; }
		#contents_right .right-section .right-section-contents .right-section-content .right-section-content-title { margin-top:10px; font-size:1.1rem; letter-spacing:-1px; }
		#contents_right .right-section .right-section-contents .right-section-content .right-section-content-msg { margin-top:5px; font-size:1.0rem; letter-spacing:-1px;}
		
		#contents_left .swiper-pagination .swiper-pagination-bullet { width:10px; height:10px; }
		#contents_left .swiper-pagination .swiper-pagination-bullet-active { opacity:1; width:25px; border-radius:10px; }
	}
	@media all and (max-width:800px) {
		#contents_left .left-visual .left-visual-content { font-size: 1.2rem; }
	}
	@media all and (max-width:640px) {
		#contents_left .left-visual .left-visual-content { font-size: 1.0rem; }
	}
	@media all and (max-width:500px) {
		#contents_left .left-visual .left-visual-content { font-size: 0.9rem; }
	}
	@media all and (max-width:400px) {
		#contents_left .left-visual .left-visual-content { font-size: 0.8rem; }
	}
	@media all and (max-width:320px) {
		#contents_left .left-visual .left-visual-content { font-size: 0.7rem; }
	}

	/* FOOTER CSS START */
	#footer { width: 100%; height:175px; border-top: 1px solid #ddd; background: #f7f7f7; z-index: 800; box-sizing:border-box; }
	#footer .footDiv { position: relative; width: 1200px; height: auto; margin: auto; padding: 40px 0; overflow: hidden; }
	#footer .footDiv .fLine { clear:both; }
	#footer .footDiv .fUtil { float:left; }
	#footer .footDiv .fUtil a { display:inline-block; height:32px; line-height:32px; font-size:15px; }
	#footer .footDiv .fUtil a.safe-key { margin-left:10px; }
	#footer .footDiv .fUtil select { font-size:15px; position:relative; top:auto; right:auto; width:auto; font-family:"NanumGothic"; }
	#footer .footDiv .fUtil a.linkBt { position:relative; top:auto; right:auto; text-align:center; background: #666; color: #fff; padding:0 20px; }
	#footer .footDiv .fUtil.fbtns img { vertical-align:middle; }
	#footer .footDiv .awardMark { float:right; margin-top:15px; border-left: 1px solid #d2d1d1; }
	#footer .footDiv .awardMark img { float:left; height:50px; margin-left:25px; }
	#footer .footDiv .awardMark .webaward span { float:left; color:#888; box-sizing: border-box; display:inline-block; padding-top:12px; font-size: 13px; }
	#footer .footDiv .copyRight { float:left; margin-top:20px; font-size:13px; color:#888; line-height:140%; }
	#footer .footDiv .copyRight p { font-size:12px; color:#888; margin-top:10px; font-family:"NanumGothic"; }
	@media (max-width: 1199px){
		#footer_main { bottom:-219px; }
		#footer { height:219px; }
		#footer .footDiv { width:94%; margin: 0 auto; height:auto; }
		#footer .footDiv .fUtil { width:calc(100% - 400px); }
		#footer .footDiv .fUtil.fbtns { width:400px; }
		#footer .footDiv .fUtil a { height:auto; line-height:160%; }
		#footer .footDiv .awardMark { width:300px; }
		#footer .footDiv .copyRight { width:calc(100% - 310px); line-height: 160%; }
	}
	@media (max-width: 980px){
		#footer { height:auto; }
		#footer .footDiv .fLine { clear: none; }
		#footer .footDiv .fLine2 { clear: both; }
		#footer .footDiv .fUtil { float:none; width:100%; margin-bottom:10px; }
		#footer .footDiv .fUtil.fbtns { float:left; margin-bottom:0px; height:50px; margin-top: 10px; }
		#footer .footDiv .fUtil a.safe-key { margin-left:0px; }
		#footer .footDiv .fUtil select { top:0px; }
		#footer .footDiv .fUtil a.linkBt { height:32px; line-height:32px; top:0px; }
		#footer .footDiv .awardMark { float:left; margin-top:0; }
		#footer .footDiv .copyRight { float:none; width:97%; margin-top:10px; }
	}
	@media (max-width: 800px){
		#footer { height:auto; }
		#footer .footDiv { padding:20px 0; }
		#footer .footDiv .fUtil { float:none; margin:0; }
		#footer .footDiv .fUtil.fbtns { float:none; display:none; }
		#footer .footDiv .fUtil select { display:inline-block; }
		#footer .footDiv .awardMark { float:none; margin:10px auto; border:none;  width: 400px; text-align: center; }
		#footer .footDiv .awardMark a.webaward img { margin-left:0 10px; }
		#footer .footDiv .copyRight { float:none; width:97%; margin-top:10px; }
	}
	/* FOOTER CSS END */
	</style>
	<script>
	var swiper;
	var swiper_m;
	jQuery(document).ready(function () {
		pc_swiper();
		left_change();

		jQuery("#contents_left").mouseenter(function(){
			jQuery("#contents_left .btn_prev").css({"display":"inline-block"});
			jQuery("#contents_left .btn_next").css({"display":"inline-block"});
		});
		jQuery("#contents_left").mouseleave(function(){
			jQuery("#contents_left .btn_prev").css({"display":"none"});
			jQuery("#contents_left .btn_next").css({"display":"none"});
		});


		jQuery("#footer_main").mouseenter(function(){
			if(jQuery(document).width() >= 980){
				jQuery("#footer_main").stop().animate({
					bottom: 0
				}, 300);
			}
		});
		jQuery("#footer_main").mouseleave(function(){
			if(jQuery(document).width() >= 980){
				if (!jQuery("#selectAflt").is(":focus")) {
					if(jQuery(document).width() >= 1200){
						jQuery("#footer_main").stop().animate({
							bottom: -175
						}, 300);
					}else {
						jQuery("#footer_main").stop().animate({
							bottom: -219
						}, 300);
					}
				}
			}
		});
		
		jQuery("#selectAflt").change(function(){
			jQuery(this).blur();
		});
	});
	
	jQuery(window).load(function () {
		left_change();
	});

	//좌측 비쥬얼 스와이프 기능
	function pc_swiper() {
		swiper = new Swiper('.swiper', {
			autoplay: {
				delay: 3000
			},
			loop: true,
			delay: 2000,
			disableOnInteraction: false,
			navigation: {
				nextEl: '.btn_next',
				prevEl: '.btn_prev'
			},
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
	}

	function left_change() {
		left_resize();
	}
	
	function left_resize() {
		if(jQuery(document).width() <= 1920){
			//좌측 타이틀 이미지를 가로 비율대로.
			jQuery(".left-visual-title img").each(function(index){
				if(typeof jQuery(this)[0].naturalWidth != "undefined") {
					var this_width = (jQuery(this)[0].naturalWidth / 960) * jQuery("#contents_left").width();
					jQuery(this).width(this_width);
				}
			});
			jQuery(".left-visual-img img").each(function(index){
				if(typeof jQuery(this)[0].naturalWidth != "undefined") {
					var this_width = (jQuery(this)[0].naturalWidth / 960) * jQuery("#contents_left").width();
					jQuery(this).width(this_width);
				}
			});
			jQuery(".left-visual-btn img").each(function(index){
				if(typeof jQuery(this)[0].naturalWidth != "undefined") {
					var this_width = (jQuery(this)[0].naturalWidth / 960) * jQuery("#contents_left").width();
					jQuery(this).width(this_width);
				}
			});
		}else {
			//좌측 타이틀 이미지를 원래 크기대로.
			jQuery(".left-visual-title img").each(function(index){
				if(typeof jQuery(this)[0].naturalWidth != "undefined") {
					jQuery(this).width(jQuery(this)[0].naturalWidt);
				}
			});
			jQuery(".left-visual-img img").each(function(index){
				if(typeof jQuery(this)[0].naturalWidth != "undefined") {
					jQuery(this).width(jQuery(this)[0].naturalWidt);
				}
			});
			jQuery(".left-visual-btn img").each(function(index){
				if(typeof jQuery(this)[0].naturalWidth != "undefined") {
					jQuery(this).width(jQuery(this)[0].naturalWidt);
				}
			});
		}
		
		if(jQuery(".nList a").width() <= 310) {
			jQuery(".nList a span.date").hide();
		}else {
			jQuery(".nList a span.date").show();
		}
		
		if(jQuery(document).width() > 980){
			//푸터 높이 변경
			if (!jQuery("#selectAflt").is(":focus")) {
				if(jQuery(document).width() >= 1200){
					jQuery("#footer_main").css({
						bottom: -175
					});
				}else {
					jQuery("#footer_main").css({
						bottom: -219
					});
				}
			}
			jQuery("#contents_left").css("height", "calc(100vh - 156px)");
		//모바일 화면일 경우
		}else{
			var mh = jQuery(window).width() * 0.9696;
			jQuery("#contents_left").height(mh);
			
			jQuery("#footer_main").css({ 
				bottom:'auto', 
				position:'relative !important'
			});
		}
		jQuery(window).one("resize", function(){
			left_resize();
		});
	}

	function fnLogout(){
		$('<iframe>').attr('src','/member/login/setLogout_sso.do').css({
			'width':0,
			'height':0,
			'opacity':0
		}).appendTo('body');									
		
		SSO.clearSSOToken;
		window.top.location.href='/';
	}
	</script>		
	
	<style>
		.layer_pop_pc { display:block; }
		.layer_pop_mo { display:none; }
		@media (max-width: 640px) {
			.layer_pop_pc { display:none; }
			.layer_pop_mo { display:block; }
		}
	</style>
	<!--네이버 연관채널 소스 -->
		<span itemscope="" itemtype="http://schema.org/Organization">
			<link itemprop="url" href="https://www.daemyungimready.com">
			<a itemprop="sameAs" href="https://www.facebook.com/imreadyDM"></a>
			<a itemprop="sameAs" href="https://www.instagram.com/daemyungimready"></a>
			<a itemprop="sameAs" href="https://www.youtube.com/channel/UC7fsSmcs6_llD6Cwo5HipXg"></a>
		</span>
<!--네이버 연관채널 소스 -->
	
	</head>
	<body>
		<div class="layer_pop pop_img hidden" id="layerPopupArea">
			<div style="padding:0; height:auto;">
				<div id="imageArea">
				<%--<img src="/common/images/main/layerpop_deamyung.png" />--%>
				</div>
				<ul class="btn_popup_close">
					<li class="today_close">
						<input type="checkbox" id="todayNotMainPopup" title="오늘 그만 보기" style="height: 13px;"/>
						<label for="todayNotMainPopup">오늘 그만 보기</label>
					</li>
					<li>
						<a href="javascript:" onclick="pop_img_close()">닫기</a>
					</li>	
				</ul>
			</div>
		</div>
		<div class="layer_pop pop_youtube" hidden>
			<div style="padding:0 !important; background:transparent;">
				<div class="center">
					<span class="btn_x" onclick="pop_you_close()"></span>
					<table border="0" class="layer_pop_pc">
						<tr>
							<td style="width:50%;"><a href="http://imdirect.co.kr/index?sub=ZERO&track=track16" target="_blank"><img src="/common/images/main/main_pop_20190828_pc_01.jpg" style="width:100%;"></a></td>
							<td style="width:50%;"><a href="http://member.imreadymall.com/event/goods_event.php?event_ix=617&event_type=P" target="_blank"><img src="/common/images/main/main_pop_20190828_pc_02.jpg" style="width:100%;"></a></td>
						</tr>
					</table>
					<table border="0" class="layer_pop_mo">
						<tr>
							<td style="width:100%;"><a href="http://imdirect.co.kr/index?sub=ZERO&track=track16" target="_blank"><img src="/common/images/main/main_pop_20190828_mo_02.jpg" style="width:100%;"></a></td>
						</tr>
						<tr>
							<td style="width:100%;"><a href="http://member.imreadymall.com/event/goods_promotion.php?kind=P&event_ix=618" target="_blank"><img src="/common/images/main/main_pop_20190828_mo_01.jpg" style="width:100%;"></a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<c:set var="agreementForThirdParty" value="${agreementForThirdParty}" /><!-- 리조트예약 버튼 동의필요시 -->
		
		<div id="wrapper" class="main">
			<div id="header">
				<div class="headDiv">
					<h1><img id="netFunnel" src="/common/images/logo.gif" alt="" style="cursor:pointer"/></a></h1>
					<div class="util">
						<c:choose>
							<c:when test="${agreementForThirdParty eq 'Y'}">
								<a href="https://www.bucketmarket.co.kr/?&utm_source=iamready_hp&utm_medium=display&utm_campaign=iamready&utm_term=June&utm_content=direct_banner" class="mbcardBtn mbResortBtn2 btnResortN" target="_blank">다이렉트 가입</a>
							</c:when>
							<c:otherwise>
								<a href="https://www.bucketmarket.co.kr/?&utm_source=iamready_hp&utm_medium=display&utm_campaign=iamready&utm_term=June&utm_content=direct_banner" class="mbcardBtn mbResortBtn2 btnResortN" target="_blank">다이렉트 가입</a>
							</c:otherwise>
						</c:choose>
						<a href="javascript:goShop()" class="mbcardBtn">회원몰</a>
						<!-- <a href="/my-lifeway/membership-card/index.do" class="mbcardBtn"><img src="/common/images/btn/mbcard_btn.png" alt="멤버십 카드"></a> -->
						<span>|</span>
						<c:choose>
							<c:when test="${not empty sessionScope.userLgnMap}">
								<a href="/my-lifeway/join-product-information/join-details/index.do" class="myInfo">나의 아임레디</a>
								<!--<span>|</span>
								 a href="/onlineproduct/normal/agree.do">온라인 상품가입</a-->
								 <span>|</span>
								<!-- a href="/member/login/setLogout.do">로그아웃</a -->
								<!-- a href="javascript:fnLogout()">로그아웃</a -->
								<a href="/member/login/setLogout_sso.do">로그아웃</a>
								<%-- 
								<span>|</span>
								<a href="<fmt:message key="Globals.httpAdminUrl" />" target="_blank" title="새창열림">인트라넷</a>
								--%>
							</c:when>
							<c:otherwise>
								<a href="/member/login/Login.do">로그인</a>
								<!--<span>|</span>
								 a href="/onlineproduct/normal/agree.do">온라인 상품가입</a--> 
								<span>|</span>
								<a href="/member/join/agree.do">회원가입</a>
								<%--
								<span>|</span>
								<a href="<fmt:message key="Globals.httpAdminUrl" />" target="_blank" title="새창열림">인트라넷</a>
								--%>
							</c:otherwise>							
						</c:choose>
					</div>
					
					<div id="gnb" style="background-color: white">
						<c:set var="gnbNo" value="0" />
						<c:set var="cdnlNo" value="one,two,thr,fou,fiv,six,sev,eig,nin,ten" />
						
						<c:forEach var="gnb" items="${gnbMenuList}" varStatus="status">
							<c:if test="${not fn:startsWith(gnb.menuNm, '@@')}">
								<c:if test="${gnb.dpth eq 2}">
									<c:if test="${not status.first}">
										</div>
										<c:set var="gnbNo" value="${gnbNo + 1}" />
									</c:if>
									<a href="${egov:nvl(gnb.userLink, 'javascript:')}" target="${egov:decode(gnb.userWndYn, 'Y', '_blank', '_self')}" class="oneD">${fn:replace(gnb.menuNm, '&lt;br&gt;', '<br />')}</a>
									<div class="twoD ${fn:split(cdnlNo, ',')[gnbNo]}">
								</c:if>
								
								<c:if test="${gnb.dpth eq 3}">
									<a href="${egov:nvl(gnb.userLink, 'javascript:')}" target="${egov:decode(gnb.userWndYn, 'Y', '_blank', '_self')}">${fn:replace(gnb.menuNm, '&lt;br&gt;', '<br />')}</a>
								</c:if>
							</c:if>
						</c:forEach>
						</div>
					</div>
					
					<div class="mbBtns">
						<c:choose>
							<c:when test="${agreementForThirdParty eq 'Y'}">
								<a href="https://www.bucketmarket.co.kr/?&utm_source=iamready_hp&utm_medium=display&utm_campaign=iamready&utm_term=June&utm_content=direct_banner" class="mbcardBtn2 mbResortBtn2 btnResortY" target="_blank">다이렉트 가입</a>
							</c:when>
							<c:otherwise>
								<a href="https://www.bucketmarket.co.kr/?&utm_source=iamready_hp&utm_medium=display&utm_campaign=iamready&utm_term=June&utm_content=direct_banner" class="mbcardBtn2 mbResortBtn2 btnResortN" target="_blank">다이렉트 가입</a>
							</c:otherwise>
						</c:choose>
						<a href="javascript:goShop();" class="mbcardBtn2">회원몰</a>
					</div>
					
					<a href="javascript:" class="mobileMenu"><img src="/common/images/btn/mobile_menubt.gif" alt="" /></a>
				</div>
				
				<div class="twoDbg"></div>
			</div><!--// header -->
			
			<p class="dimdBg"></p>
			
			<!-- 모바일 gnb -->
			<div id="gnbM">
				<div class="mUtil">
					<c:choose>
						<c:when test="${not empty sessionScope.userLgnMap}">
							<a href="/my-lifeway/join-product-information/join-details/index.do" class="myInfo">나의 아임레디</a>
							<!--<span>|</span>
								 a href="/onlineproduct/normal/agree.do">온라인 상품가입</a-->
							<span>|</span>
							<!-- a href="/member/login/setLogout.do">로그아웃</a -->
							<!-- a href="javascript:fnLogout()">로그아웃</a -->
							<a href="/member/login/setLogout_sso.do">로그아웃</a>
						</c:when>
						<c:otherwise>
							<a href="/member/login/Login.do">로그인</a>
							<!--<span>|</span>
								 a href="/onlineproduct/normal/agree.do">온라인 상품가입</a-->
							<span>|</span>
							<a href="/member/join/agree.do">회원가입</a>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="gnbDiv">
					<c:set var="mGnbCnt" value="${fn:length(gnbMenuList)}" />
					
					<c:forEach var="mGnb" items="${gnbMenuList}" varStatus="status">
						<c:if test="${not fn:startsWith(mGnb.menuNm, '@@') or fn:startsWith(mGnb.userLink, '/my-lifeway/')}">
							<fmt:formatNumber var="curntDpth" value="${mGnb.dpth}" type="number" groupingUsed="false" />
							
						  	<c:choose>
						  		<c:when test="${status.count lt mGnbCnt}">
						  			<fmt:formatNumber var="nxtDpth" value="${gnbMenuList[status.count].dpth}" type="number" groupingUsed="false" /> 
						  		</c:when>
						  		<c:otherwise>
						  			<fmt:formatNumber var="nxtDpth" value="0" type="number" groupingUsed="false" /> 
						  		</c:otherwise>
						  	</c:choose>
						  	
						  	<c:choose>
						  		<c:when test="${curntDpth lt nxtDpth}">
						  			<a href="javascript:" class="${egov:decode(curntDpth, 2, 'one', egov:decode(curntDpth, 3, 'twoD', 'thrD'))}">
						  				${fn:replace(fn:replace(mGnb.menuNm, '@@', ''), '&lt;br&gt;', '<br />')}
						  		</c:when>
						  		<c:otherwise>
						  			<a href="${egov:nvl(mGnb.userLink, 'javascript:')}" target="${egov:decode(mGnb.userWndYn, 'Y', '_blank', '_self')}" class="${egov:decode(curntDpth, 2, 'one', egov:decode(curntDpth, 3, 'twoD', 'thrD'))}">
						  				${fn:replace(fn:replace(mGnb.menuNm, '@@', ''), '&lt;br&gt;', '<br />')}
						  		</c:otherwise>
						  	</c:choose>
						  	
						  	<c:if test="${mGnb.kwrd eq 'NEW'}">
								<span class="newIcon"><img src="/common/images/icon/m_lnb_new_icon.gif" width="36px" height="16px" alt="NEW" /></span>
							</c:if>
							<c:if test="${mGnb.kwrd eq 'RENEWAL'}">
								<span class="newIcon"><img src="/common/images/icon/lnb_renewal_icon.gif" width="45px" height="16px" alt="RENEWAL" /></span>
							</c:if>
							
							</a>
						  	
							<c:if test="${curntDpth lt nxtDpth}">
								<div class="${egov:decode(curntDpth, 2, 'two', 'thr')}">
							</c:if>
							
							<c:choose>
								<c:when test="${status.count eq mGnbCnt}">
									<c:forEach begin="1" end="${curntDpth - 2}" step="1" varStatus="close">
										</div>
									</c:forEach> 
								</c:when>
								<c:when test="${curntDpth gt nxtDpth}">
									<c:forEach begin="1" end="${curntDpth - nxtDpth}" step="1" varStatus="close">
						       			</div>
									</c:forEach> 
								</c:when>
							</c:choose>
						</c:if>
					</c:forEach>
				</div>
				
				<a href="javascript:" class="mobileMenuXbt"><img src="/common/images/btn/mobile_gnbxbt.gif" alt="" /></a>
			</div>
			<!-- //모바일 gnb -->	
		
			<div id="main-wraper">
				<!-- left div -->
				<div id="contents_left">
					<div class="swiper swiper-container">
						<ul class="swiper-wrapper">
							<c:if test="${fn:length(visualList) > 0}">
								<c:forEach var="vlist" items="${visualList}">
									<li class="left-visual swiper-slide" style="background-color:${ vlist.webBgColor };"
										<c:if test="${vlist.linkType eq '_blank'}"> 
										onclick="javascript:window.open('${ vlist.link }', '_blank');"
										</c:if>
										<c:if test="${vlist.linkType ne '_blank'}"> 
										onclick="javascript:location.href='${ vlist.link }';"
										</c:if>
									>
										<div class="left-visual-img" style="position:absolute;top:${ vlist.bgXyAry[0] }; left:${ vlist.bgXyAry[1] }; right:${ vlist.bgXyAry[2] }; bottom:${ vlist.bgXyAry[3] };">
											<img src="/common/images/main/upload/${ vlist.webBgSaveFileNm }">
										</div>
										<div class="left-visual-title" style="position:relative; top:${ vlist.titleImgXyAry[0] }%; left:${ vlist.titleImgXyAry[1] }%;">
											<img src="/common/images/main/upload/${ vlist.webTitleSaveFileNm }" alt="${ vlist.webTitleDsc }"/>
										</div>
										<c:if test="${vlist.webTitleTxt ne ''}">
											<div class="left-visual-content"  style="position:relative; top:${ vlist.titleTxtXyAry[0] }%; left:${ vlist.titleTxtXyAry[1] }%; width:calc(100% - ${ vlist.titleTxtXyAry[1] * 2 }%);">
												<span>${ vlist.webTitleTxt }</span>
											</div>
										</c:if>
										<div class="left-visual-btn" style="position:absolute; bottom:${ vlist.btnXyAry[0] }%; left:${ vlist.btnXyAry[1] }%;">
											<img src="/common/images/main/upload/${ vlist.webBtnSaveFileNm }"/>
										</div>
									</li>
								</c:forEach>
							</c:if>
						</ul>
						<a href="#" class="btn_prev"><img src="/common/images/main/slide_prev_btn.png"></a>
						<a href="#" class="btn_next"><img src="/common/images/main/slide_next_btn.png"></a>
						<div class="swiper-pagination"></div>
					</div>
				</div>
				
			
				<!-- right div -->
				<div id="contents_right">
					<div class="right-container">
						<div class="right-inner">
							<c:if test="${fn:length(contentList) > 0}">
								<c:forEach var="clist" items="${contentList}">
									<div class="right-section">
										<div class="right-section-title">
											<div class="top-bar" style="background:${ clist.titleColor };"></div>
											${ clist.titleTxt }
										</div>
										<c:if test="${fn:length(contentDtlList) > 0}">
											<div class="right-section-contents">
												<c:forEach var="dlist" items="${contentDtlList}">
													<c:if test="${dlist.cntnsMstSeq eq clist.cntnsMstSeq}">
														<div class="right-section-content">
															<div class="right-section-content-img"><a href="${ dlist.link }" target="${ dlist.linkType }"><img src="/common/images/main/upload/${ dlist.imgSaveFileNm }"></a></div>
															<div class="right-section-content-title"><a href="${ dlist.link }" target="${ dlist.linkType }">${ dlist.title }</a></div>
															<div class="right-section-content-msg"><a href="${ dlist.link }" target="${ dlist.linkType }">${ dlist.dsc }</a></div>
														</div>
													</c:if>
												</c:forEach>
											</div>
											<div class="clear"></div>
										</c:if>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			
			<div id="footer_main">
				<div class="footerDiv">
					<div class="noti">
						<p class="tit">공지</p>
						<div class="nList">
							<c:if test="${fn:length(noticeMap.list) > 0}">
								<c:forEach var="list" items="${noticeMap.list}">
									<a href="/customer-center/communityid/${list.communityId}/view.do?idx=${list.idx}" style="top: 0px;">
										<span class="txt">${egov:tldCutString(list.title, '...', 26)}</span>
										<span class="date">${egov:convertDate(list.regdate, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd', '')}</span>
									</a>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(noticeMap.list) eq 0}">
								<a>등록된 공지사항이 없습니다.</a>
							</c:if>
						</div>
						<div class="bts">
							<a href="javascript:" class="up" title="이전"><img src="/common/images/main/main_noti_up.png" alt=""></a>
							<a href="javascript:" class="down" title="다음"><img src="/common/images/main/main_noti_down.png" alt=""></a>
						</div>
					</div>
			
					<div class="contact">
						<div class="contact1"><strong>컨택센터  <a href="tel:1588-8511" style="color:#fff;">1588-8511</a></strong></div>
						<span>|</span>
						<div class="contact2"><strong>24시 장례접수  <a href="tel:1588-2227" style="color:#fff;">1588-2227</a></strong></div>
					</div>
				</div>
			
				<div id="footer">
					<div class="footDiv">
						<div class="fUtil">
							<a href="/operation-guide/privacy/index.do" class="red">개인정보처리방침</a>
							<span>|</span>
							<a href="/operation-guide/terms/index.do">이용약관</a>
							<span>|</span>
							<a href="/customer-center/communityid/7/list.do">고객센터</a>
							<span>|</span>
							<a href="/operation-guide/important/index.do">중요정보 고시사항</a>
							<span>|</span>
							<!--<a href="/operation-guide/outsourcing-guide/index.do">외주 용역 안내</a>
							<span>|</span>-->
							<a href="/operation-guide/legal/index.do">법적고지</a>
							<span>|</span>
							<a href="/operation-guide/staff-search/index.do">담당사원 검색</a>
							<span>|</span>
							<a href="/my-lifeway/membership-card/index.do" class="red">멤버십 카드 정보</a>
							<span>|</span>
							<c:choose>
								<c:when test="${agreementForThirdParty eq 'Y'}">
									<a href="https://www.sonohotelsresorts.com/mv.dp/dmparse.dm?menuCd=5551000" class="red mbResortBtn2" target="_blank">리조트객실예약</a>
								</c:when>
								<c:otherwise>
									<a href="/my-lifeway/member/resortagree/index.do" class="red mbResortBtn2" onclick="alert('대명리조트 예약을 위해서는 개인정보 제 3자 제공에 동의하셔야 합니다.\n나의 대명아임레디 리조트 객실 예약을 위한 (주)대명레저산업 개인정보 제공동의페이지로 이동합니다.');">리조트객실예약</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="fUtil fbtns">
							<a href="javascript:setPopup('/safe-key/index.do', 'NiceSafeKeyPop', 685, 585);" class="safe-key">
								<img src="/common/images/btn/btn_safe_key.gif" alt="본인인증"/>
							</a>
							<select id="selectAflt" title="계열사 홈페이지 선택">
								<option value="">Family Site</option>
								<option value="https://www.daemyungsono.com">대명 소노그룹</option>
								<option value="https://www.sonohotelsresorts.com">소노호텔&리조트</option>
								<!-- <option value="http://www.daemyungtourmall.com">대명투어몰</option> -->
								<option value="http://www.dgolfclub.com">대명골프클럽</option>
								<option value="http://www.sonofeliceeclub.com">승마클럽</option>
								<!-- option value="http://www.mvlhotel.com">엠블호텔</option -->
								<option value="http://www.sonofeliceconvention.com">소노펠리체컨벤션</option>
								<!-- option value="http://www.bornwedding.com">대명본웨딩</option -->
								<!-- option value="http://www.withone.co.kr">대명위드원</option -->
								<option value="https://www.sonoseason.com/main">대명소노시즌</option>
								<option value="http://www.daemyungcon.co.kr">대명건설</option>
								<option value="http://www.daemyungwelfare.org">대명복지재단</option>
								<option value="http://www.daemyung.co.kr/ethics">대명윤리경영</option>
								<!-- option value="http://www.solbi.com/main.asp">U-솔비넷</option -->
							</select>
							<a href="javascript:moveFooterAflt();" class="linkBt">이동</a>
						</div>
						<div class="fLine"></div>
						<p class="awardMark">
							<a class="webaward" href="http://www.i-award.or.kr/Web/Assess/FinalCandidateView.aspx?REG_SEQNO=6375" target="_blank">
								<img src="/common/images/icon/webaward.png" alt="웹어워드코리아2016 금융분야 대상" />
							</a>
							<!--KISA Certificate Mark-->
							<a href='javascript:window.open("https://www.ucert.co.kr/trustlogo/sseal_cert.html?sealnum=9a580dc986ab7c3b6b462bb026d232fc5a9c22918607df4d38371d96322a6e5f&sealid=1052153389637f8545b5232d9ff940648bb0c6394e46b9a326244e5526a179e157b2d2b8ae0ce2a6e39e87bc54492dc9","mark","scrollbars=no,resizable=no,width=565,height=780");'>
								<img src="https://www.daemyungimready.com/common/images/icon/kisia.png" align="absmiddle" style="cursor:hand; width: 71.74px; height:40px; padding-top: 5px; border: none;"></a>
							<!--KISA Certificate Mark-->

							<a class href="javascript:window.open('/ism-popup/ismsp.do','window','width=810, height=1050, left=0, top=0, scrollbars=0, resizable=no')">
								<img src="/common/images/main/isms_p.png" alt="ISMS-P 인증 달성"/>
							</a>
						</p>
						<div class="fLine2"></div>
						<div class="copyRight">
							서울지점(우편수신처) : 서울시 강남구 강남대로 624, 14층(신사동, 아이씨티타워)
							<span>|</span>
							본점 : 강원도 홍천군 서면 한치골길 262 (소노호텔앤리조트, 비발디파크)<br>
							 대표자 (주)대명스테이션 대표이사 최성훈
							<span>|</span>
							사업자등록번호 220-88-09321 
							<span>|</span>
							통신판매신고번호 2021-강원홍천-0050
							<p>COPYRIGHT DAEMYUNGSTATION.CO,.LTD. ALL RIGHTS RESERVED.</p>
						</div>
						<div style="clear:both;"></div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- WIDERPLANET  SCRIPT START 2016.4.29 -->
		<div id="wp_tg_cts" style="display:none;"></div>
		<script type="text/javascript">
			var wptg_tagscript_vars = wptg_tagscript_vars || [];
			wptg_tagscript_vars.push(
			(function() {
				return {
					wp_hcuid:"",   /*Cross device targeting을 원하는 광고주는 로그인한 사용자의 Unique ID (ex. 로그인 ID, 고객넘버 등)를 암호화하여 대입.
							*주의: 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
					ti:"24360",	/*광고주 코드*/
					ty:"Home",	/*트래킹태그 타입*/
					device:"web"	/*디바이스 종류 (web 또는 mobile)*/
					
				};
			}));
		</script>
		<script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
		
		  ga('create', 'UA-77651223-1', 'auto');
		  ga('send', 'pageview');
		</script>
		<script type="text/javascript" async src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
		<!-- // WIDERPLANET  SCRIPT END 2016.4.29 -->
	
		<script type="text/javascript">
		//<![CDATA[
			// pc , mobile 리조트 예약 버튼 링크 변경 
			var filter = "win16|win32|win64|mac|macintel"; 
			
			if ( navigator.platform ) { 
				if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
					//mobile
					jQuery(".btnResortY").attr("href", "http://m.daemyungresort.com/#/MCA0022_login/MOP0058_reserve_room_cyber");
				} else { 
					//pc
					jQuery(".btnResortY").attr("href", "https://www.sonohotelsresorts.com/mv.dp/dmparse.dm?menuCd=5560000");
				}
			}
		//]]>
		</script>

		<script type="text/javascript">
		
			window.onload = function() {
		//  20200701 넷퍼넬 삭제요청
		//	 	NetFunnel_Complete();
				play_youtube();
				console.log(getCookie("todayNotMainPopup"));
				if(!getCookie("todayNotMainPopup")) {
					getPopupInfo();
				}
			};

			function play_youtube(){
				$(".pop_youtube").removeClass("hidden");
				var v = $("#id_youtube");
				/*if ($(window).width() > 1169) {
					var v = $("#id_youtube_pc");
				}else if ($(window).width() <= 1169) {
					var v = $("#id_youtube_mo");
				}*/
				// URL 변경 수정 v.attr("src","https://www.youtube.com/embed/g5FeYZU9aDg?autoplay=0&amp;rel=0");
				//v.attr("src","https://www.youtube.com/embed/tp4dJ-FETXg?autoplay=0&amp;rel=0");
				//v.attr("src","https://www.youtube.com/embed/9Gkms-Y54Pg?autoplay=0&amp;rel=0");
				v.attr("src","https://www.youtube.com/embed/jlpzrDLTU70?autoplay=0&amp;rel=0");
			}

			function pop_you_close(){
				$(".pop_youtube").addClass("hidden");
				$("iframe").attr("src","");
			}

			function pop_img_close(){
				if (document.getElementById('todayNotMainPopup').checked) {
					setCookie("todayNotMainPopup", true, 1);
				}
				$(".pop_img").addClass("hidden");
			}

			function getPopupInfo() {
				$.ajax({
					type: 'GET',
					url: '/main/popup.ajax',
					success: function(result) {
						if (!$.isEmptyObject(result)) {
							//console.log('pop result :: ', result);
							if (result.type === 'W') {
								// WINDOW POPUP
                                document.getElementById('popupCntn').value = result.cntn;
								document.getElementById('todayYn').value = result.todayYn;
								var popupX = (window.screen.width / 2);
								var popupY = (window.screen.height / 2);
								console.log(popupX, popupY);
                                var options = "menubar=no, toolbar=no, location=no, status=no, directories=no, scrollbars=yes, resizable=yes, left=" + popupX + ", top=" + popupY + "";

                                window.open("./popup.do", "_blank", options);
							} else {
								// LAYER POPUP
								document.getElementById('imageArea').innerHTML = result.cntn;
								document.getElementById('layerPopupArea').classList.remove("hidden");
								if (result.todayYn == 'N') {
									document.getElementsByClassName('btn_popup_close')[0].classList.add('btn_popup_close_alone');
								}
							}
						} else {
							console.log('nothing');
						}
					}
				});
			}

		</script>
		<!--  20200701 넷퍼넬 삭제요청 -->
<!--  		<script type="text/javascript">
		function goAction(aid){
			//Netfunnel 자원 사용 요청
			NetFunnel_Action({action_id:aid,skin_id:''}, function(ev, ret){
				window.location.href = "/main/index.do";
			});
		}
		
			$("#netFunnel").click(function() {
				goAction('main');
			});
		</script>
 -->
        <input type="hidden" id="popupCntn" />
        <input type="hidden" id="todayYn" />
	</body>
</html>