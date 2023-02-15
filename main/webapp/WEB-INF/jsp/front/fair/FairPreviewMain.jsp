<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/jsp/include/el.jspf" %>
<!doctype html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<title>${config.fcfgTitle}</title>
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
		
		<script type="text/javascript" src="/common/js/jquery-1.8.2.min.js"></script>
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
		
		body,ul,li { margin:0; padding:0; font-family:"NotoKrR", sans-serif;  }
		li { list-style:none; }
		.container { position:relative; width:1080px; margin:0 auto; line-height:0; text-align:center; }
		
		.header { position:relative; width:100%; height:150px; background-image:url('/common/images/fairimage/main_top.jpg'); background-size: cover; background-position: top center; }
		.header .header_logo { position:relative; margin: 0 auto; text-align:center; }
		
		.bannerList { position:relative; width:100%; height:${bannerHeight}px; }
		.bannerList .banner { width:100%; height:${bannerHeight}px; background-size:cover; text-align:center; }
		.bannerList .btn_prev { position:absolute; top:50%; left:50%; margin-left:-500px; z-index:1; }
		.bannerList .btn_next { position:absolute; top:50%; right:50%; margin-right:-500px; z-index:1; }
		
		.dday { position:absolute; width:100%; bottom:40px; left:0; z-index:1; text-align:center; line-height:0; }
		.dday .dday_container { width:auto; display: inline-block; font-family:"NotoKrM", sans-serif; }
		.dday .dday_container .day { float:left; display:block; padding:0px 50px; height:95px; line-height:95px; text-align:center; background:#000000; color:#ffffff;  font-size:55px;  border-radius:5px; box-sizing:border-box; }
		.dday .dday_container .time { float:left; margin-left:5px; display:block; width:80px; height:95px; line-height:95px; text-align:center; background:#ffffff; color:#000000;  font-size:55px;  border-radius:5px; box-sizing:border-box; }
		.dday .dday_container .comma { float:left; margin-left:5px; display:block; height:95px; line-height:0; }
		.dday .dday_container .comma .box { display:block; width:7px; height:7px; background:#ffffff; line-height:0; margin-top:30px; }
		.dday .dday_container .comma .box.bottom { margin-top:20px; }
		.dday .dday_container .ddat_title { display:block; line-height:normal; text-align:center; color:#ffffff;  font-size:22px;  margin-top: 10px; font-family:"NotoKrL", sans-serif; }
		
		.point { position:relative; width:100%; background-size:cover; }
		.point .pointTitle { padding-top:80px; text-align:center; box-sizing:border-box; }
		.point .pointSub { position:relative; display:inline-block; margin-top:70px; margin-left:5px; margin-right:5px; box-shadow: 6px 6px 6px 0 rgba(0,0,0,.2); box-sizing:border-box; }
		.point .pointSub .pointOver { position:absolute; top:0; left:0; width:100%; height:100%; opacity:0.95; text-align:center; display:none; }
		.point .pointSub .pointOver .pointOverContainer { position:relative; width:100%; display:inline-block; transform:translateY(50%); }
		.point .pointSub .pointOver .pointLine { width:20%; height:3px; background:#ffffff; margin:0 auto; }
		.point .pointSub .pointOver .pointDesc { display:inline-block; margin-top:40px; line-height:140%;  color:#ffffff; font-size:24px; }

		.category { position:relative; width:100%; padding:30px 0; }
		.category .categorySub { position:relative; display:inline-block; cursor:pointer; }
		.category .categorySub .categoryTitle { position:absolute; top:15px; left:25px; line-height:140%;  color:#000000; font-size:26px;  }
		.category .categorySub .categorySubTitle { position:relative; line-height:120%;  color:#000000; font-size:17px; padding:15px 0; font-family: "NotoKrM", sans-serif;}
		
		.productCategory { position:relative; }
		.productCategory .productCategoryTitle { position: absolute; top:45px; left:0; width:100%; text-align:center; line-height:140%; color:#ffffff; font-size:22px; z-index:1; }
		.productCategory .product { position:relative; width:100%; background-size:cover; background-position: center; text-align:center; }
		.productCategory .product .productContainer { position:relative; display:inline-block; transform:translateY(50%); box-shadow: 6px 6px 6px 0 rgba(0,0,0,.2); }
		.productCategory .product .productContainer .productTitle { position:absolute; top:-110px; width:100%; text-align:center; line-height:140%;  color:#ffffff; font-size:36px; }
		.productCategory .product .productContainer .productDetail { position:absolute; top:120px; left:65px; width:340px; height:300px; padding:20px 25px; box-sizing:border-box; background-color:rgba(255,255,255,0.8); }
		.productCategory .product .productContainer .productDetail .productLabel { position:relative; text-align:left; display:none; }
		.productCategory .product .productContainer .productDetail .productLabel .productLabelDetail { display:inline-block; line-height:120%;  color:#ffffff; font-size:15px; margin-left:5px; padding:5px; box-sizing:border-box; min-width:70px; text-align:center; }
		.productCategory .product .productContainer .productDetail .productLabel .productLabelDetail:first-child { margin-left:0; }
		.productCategory .product .productContainer .productDetail .productSubTitle { position:relative; text-align:left; line-height:120%;  color:#000000; font-size:23px; margin-top:5px; font-family: "NotoKrM", sans-serif; }
		.productCategory .product .productContainer .productDetail .productDesc { position:relative; text-align:left; line-height:160%;  color:#5f5f5f; font-size:15px; margin-top:10px; font-family: "NotoKrM", sans-serif; }
		.productCategory .product .productContainer .productDetail .productPrice { display:none; position:relative; text-align:right; margin-top:20px; }
		.productCategory .product .productContainer .productDetail .productPrice .prefix { line-height:120%;  color:#000000; font-size:30px; font-family: "NotoKrM", sans-serif; letter-spacing:-1px; }
		.productCategory .product .productContainer .productDetail .productPrice .price { line-height:120%;  color:#ff3b85; font-size:33px; font-family: "NotoKrM", sans-serif; letter-spacing:-1px; }
		.productCategory .product .productContainer .productDetail .productPrice .won { line-height:120%;  color:#000000; font-size:20px; font-family: "NotoKrM", sans-serif; letter-spacing:-1px; }
		.productCategory .product .productContainer .productDetail .productBtn { position:absolute; bottom:0; left:0; width:100%; height:50px; background-color:#282b5d; line-height:50px;  color:#ffffff; font-size:20px; text-decoration:none; }
		.productCategory .btn_prev { position:absolute; top:50%; left:50%; margin-left:-540px; z-index:1; }
		.productCategory .btn_next { position:absolute; top:50%; right:50%; margin-right:-540px; z-index:1; }
		.productCategory .swiper-pagination { position: absolute; width:auto; padding:5px 15px; left: 50%; bottom:45px; box-sizing:border-box; -webkit-transform: translateX(-50%);-ms-transform: translateX(-50%);transform: translateX(-50%); z-index: 1;}
		.productCategory .swiper-pagination .swiper-pagination-bullet {position: relative;display: inline-block; width:12px; height:12px; background:#fff; border-radius: 50%; margin-left:45px; opacity:.3;}
		.productCategory .swiper-pagination .swiper-pagination-bullet:first-child {margin-left: 0;}
		.productCategory .swiper-pagination .swiper-pagination-bullet-active { opacity:1; }
		.productCategory .productList { position:absolute; bottom:50px; left:50%; transform:translateX(-50%); margin-left:440px; display:block; width:150px; height:34px; line-height:33px; background-color:rgba(40,43,93,1); border-radius:17px;  color:#ffffff; font-size:17px; z-index:1; text-align:center; cursor:pointer; }
		
		.productListModal { position:absolute; top:0; left:0; width:100%; height:100%; background-color:rgba(0,0,0,.65); z-index:2; display:none; }
		.productListModal .productListContainer { position:absolute; top:50px; left:50%; width:1080px; transform:translateX(-50%); }
		.productListModal .productListContainer .productListTitle { color:#ffffff;  font-size:30px; letter-spacing: -2px; text-align:center; line-height:56px; }
		.productListModal .productListContainer .productListClose { position: absolute; top:0px; right: 30px; display: inline-block; padding: 0; width: 2px; height: 56px; background: #ffffff; transform: rotate(45deg); cursor:pointer; }
		.productListModal .productListContainer .productListClose:before { display: block; content: ""; position: absolute; top: 50%; left: -26px; width: 56px; height: 2px; margin-top: -1px; background: #ffffff; }
		.productListModal .productListContainer .productListClose a { display:block; width:56px; height: 56px; top: 0px; left: -26px; position: absolute; transform: rotate(45deg); }
		
		.event { position:relative; margin-bottom:30px; }
		.event .eventTitle { position:relative; margin-top:45px; width:100%; text-align:center; line-height:140%;  color:#000000; font-size: 22px; font-family: "NotoKrM", sans-serif; letter-spacing: -1px; }
		.event .eventSubTitle { position:relative; margin-top:10px; width:100%; text-align:center; line-height:120%;  color:#000000; font-size: 34px; letter-spacing: -1px; }
		.event .eventList { display:inline-block; }
		.event .eventList .eventRow { float:left; margin-top:25px; margin-left:25px; }
		.event .eventList .eventRow:first-child { margin-left:0; }

		.footer { position:relative; width:100%; }
		.footer .links { height:45px; background:#282b5d; color:#ffffff; }
		.footer .links a { line-height:45px;  color:#ffffff; font-size:14px; text-decoration:none; font-family: "NotoKrL", sans-serif; }
		.footer .links span { line-height:25px; font-size:10px; padding:0 20px; box-sizing:border-box; }
		
		.footer .logo { float:left; padding:25px; box-sizing:border-box; }
		.footer .info { float:left; padding-top:30px; width:calc(100% - 280px); text-align:left; }
		.footer .info span { line-height:140%; padding:0 5px; box-sizing:border-box;  color:#888888; font-size:12px;  }
		.footer .info span.txt { padding:0; }
		.footer .info .copyright { line-height:140%; padding:5px 0 0 0; box-sizing:border-box;  color:#888888; font-size:12px;  text-align:left; }
		
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
		function ddayTime() {
			var dday = new Date("${config.fcfgEtimeDate}").getTime();
			var nday = new Date().getTime();
			
			if(dday > nday) {
				var distance  = dday - nday;
				var dd = Math.floor(distance / (1000 * 60 * 60 * 24));
			    var hh = ""+ Math.floor((distance / (1000*60*60)) % 24);
			    var mm = ""+ Math.floor((distance / (1000*60)) % 60);
			    var ss = ""+ Math.floor((distance / 1000) % 60);
				
			    if(hh.length < 2) hh = "0"+ hh;
			    if(mm.length < 2) mm = "0"+ mm;
			    if(ss.length < 2) ss = "0"+ ss;
	
			    jQuery("#dd").html("마감 D-"+ dd);
			    if(dd == 0) jQuery("#dd").html("마감 D-DAY");
			    jQuery("#hh0").html(hh.substring(0,1));
			    jQuery("#hh1").html(hh.substring(1,2));
			    jQuery("#mm0").html(mm.substring(0,1));
			    jQuery("#mm1").html(mm.substring(1,2));
			    jQuery("#ss0").html(ss.substring(0,1));
			    jQuery("#ss1").html(ss.substring(1,2));
			    
				setTimeout(ddayTime, 1000);
			}else {
				jQuery("body")
				.html('<div class="end"><img src="/common/images/fairimage/parking_pc.png"></div>')
				.css({"width":"100%", "height":"100px", "background-image":"url('/common/images/fairimage/parking_pc_bg.jpg')", "background-size":"cover"});
			}
		}
		jQuery(document).ready(function(){
			<c:if test="${config.fcfgStatus eq 'Y'}">
			var dday = new Date("${config.fcfgEtimeDate}").getTime();
			var nday = new Date().getTime();
			
			if(dday > nday) {
				ddayTime();
			}
			</c:if>
			<c:if test="${config.fcfgStatus eq 'N'}">
			jQuery("body")
			.html('<div class="end"><img src="/common/images/fairimage/parking_pc.png"></div>')
			.css({"width":"100%", "height":"100px", "background-image":"url('/common/images/fairimage/parking_pc_bg.jpg')", "background-size":"cover"});
			return;
			</c:if>
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
				on: {
					autoplayStop: function () {
						this.autoplay.start();
					}
				}
			});
			
			swiperProduct = new Swiper('.swiperProduct', {
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
				}
			});
			
			jQuery(".pointSub").mouseenter(function(){
				jQuery(this).find(".pointOver").slideDown('fast');
			});
			
			jQuery(".pointSub").mouseleave(function(){
				jQuery(this).find(".pointOver").slideUp('fast');
			});
			
			jQuery(".productLabel").each(function(){
				var label = JSON.parse(jQuery(this).text());
				if(label.length > 0) {
					var html = '';
					for(var i = 0; i < label.length; i++) {
						html += '<span class="productLabelDetail" style="background-color:'+ label[i].BGCOLOR +';">'+ label[i].TITLE +'</span>';
					}
					jQuery(this).html(html).show();
				}
			});
			
			jQuery(".productPrice").each(function(){
				var input = JSON.parse(jQuery(this).text());
				var key = input.PRICE[0].KEY;
				var html = "<span class='price'>"+ parseInt(input.PRICE[0].PRICE).format() +"</span><span class='won'>원~</span>";
				if(key != "-1" && input.INPUT[key].TITLE == "인원") {
					html = "<span class='prefix'>&nbsp;"+ input.INPUT[key].VALUE[0].replace("명", "인") +"&nbsp;</span>"+ html;
				}
				jQuery(this).html(html).show();
			});
			
			jQuery("#productListClose").click(function(){
				jQuery(".productListModal").hide();
			});
		});
		
		jQuery.fn.extend({
			categoryMove: function() {
				var index = jQuery(this).index();
				var top = jQuery(".productCategory").eq(index).offset().top;
				jQuery('html, body').animate({scrollTop: top}, 500);
			},
			
			productListShow: function(FC_SEQ, pageIndex) {
				if(jQuery(this).attr("class") == 'productList') {
					//jQuery("#productListTitle").text(jQuery(this).prev().text());	
				}				
				jQuery.ajax({
					url: "./productList.do",
					type: "GET",
					dataType: "html",
					data: {
						"fcseq": FC_SEQ,
						"pageIndex": pageIndex
					},
					success: function(data) {
						jQuery("#productListHtml").html(data);
						jQuery(".productListModal").height(jQuery(document).height()).show();
						jQuery(".productListContainer").css("top", jQuery(document).scrollTop() + 50);
						
					}
				});
			}
		});
	</script>
	<body>
	
	
	<!--  PC 화면  -->
	<div id="pc">
		<div class="header">
			<div class="container">
				<div class="header_logo"><img src="/common/images/fairimage/main_top_title.png"></div>
			</div>
		</div>
		
		<c:if test="${fn:length(bannerList) > 0}">
			<div class="bannerList">
				<div class="swiper swiper-container">
					<ul class="swiper-wrapper">
						<c:forEach var="blist" items="${bannerList}">
							<li class="swiper-slide">
								<c:if test="${blist.fbtLink ne null}">
									<a href="${blist.fbtLink}"
									<c:if test="${blist.fbtLinkType ne null}">
										target = "${blist.fbtLinkType}"
									</c:if>
									<c:if test="${blist.fbtLinkType eq null}">
										target = "_blank"
									</c:if>
									>
								</c:if>
								<div class="banner" style="background-image:url(/common/images/fairimage/${blist.fbtImageBgSaveNm});">
									<img src="/common/images/fairimage/${blist.fbtImageWSaveNm}" title="${blist.fbtImageWRealNm}">
								</div>
								<c:if test="${blist.fbtLink ne null}">
								</a>
								</c:if>
							</li>
						</c:forEach>
					</ul>
					<a href="#" class="btn_prev"><img src="/common/images/fairimage/main_banner_arrow_left.png"></a>
					<a href="#" class="btn_next"><img src="/common/images/fairimage/main_banner_arrow_right.png"></a>
				</div>
				<c:if test="${config.fcfgStatus eq 'Y'}">
				<div class="dday">
					<div class="dday_container">
						<div class="day" id="dd">마감 D-DAY</div>
						<div class="time" id="hh0">0</div>
						<div class="time" id="hh1">0</div>
						<div class="comma"><span class="box"></span><span class="box bottom"></span></div>
						<div class="time" id="mm0">0</div>
						<div class="time" id="mm1">0</div>
						<div class="comma"><span class="box"></span><span class="box bottom"></span></div>
						<div class="time" id="ss0">0</div>
						<div class="time" id="ss1">0</div>
						<div style="clear:both;"></div>
						
						<div class="ddat_title">${config.fcfgDdayTitle}</div>
					</div>
				</div>
				</c:if>
			</div>
		</c:if>
		
		<c:if test="${point ne null && pointSubList ne null && fn:length(pointSubList) > 0}">
			<div class="point" style="height:${pointHeight}px; background-image:url('/common/images/fairimage/${point.fmImageBgSaveNm}');">
				<div class="container">
					<div class="pointTitle"><img src="/common/images/fairimage/${point.fmImageTitleSaveNm}"></div>
					<c:forEach var="pointSub" items="${pointSubList}">
						<div class="pointSub">
							<div><img src="/common/images/fairimage/${pointSub.fmsImageWSaveNm}" title="${pointSub.fmsImageWRealNm}"></div>
							<div class="pointOver" style="background-color:${pointSub.fmsBgcolor};">
							<div class="pointOverContainer">
								<div class="pointLine"></div>
								<div class="pointDesc">${pointSub.fmsDesc}</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		
		<c:if test="${fn:length(cateList) > 0}">
			<div class="category">
				<div class="container">
					<c:forEach var="cate" items="${cateList}">
						<div class="categorySub" onclick="javascript:jQuery(this).categoryMove();">
							<div><img src="/common/images/fairimage/${cate.fcImageWSaveNm}" title="${cate.fcImageWRealNm}"></div>
							<div class="categoryTitle">${cate.fcTitle}</div>
							<div class="categorySubTitle" style="border-bottom:5px solid ${cate.fcBgcolor};">${cate.fcSubtitle}</div>
						</div>
					</c:forEach>
				</div>
			</div>
		
			<c:forEach var="cate" items="${cateList}">
				<c:if test="${fn:length(cate.productList) > 0}">
					<div class="productCategory">
						<div class="swiperProduct swiper-container">
							<ul class="swiper-wrapper">
								<c:forEach var="product" items="${cate.productList}">
									<li class="swiper-slide">
										<div class="product" style="height:${product.fpMainHeight}px; background-image:url('/common/images/fairimage/${product.fpMainImageBgSaveNm}');">
											<div class="container">
												<div class="productContainer">
													<div><img src="/common/images/fairimage/${product.fpMainImageWSaveNm}" title="${product.fpMainImageWRealNm}"></div>
													<div class="productTitle" <c:if test="${cate.fcCategoryTitleColor ne null}">style="color:${cate.fcCategoryTitleColor};"</c:if>>${product.fpMainTitle}</div>
													<div class="productDetail">
														<div class="productLabel">${product.fpLabel}</div>
														<div class="productSubTitle">${product.fpMainSubtitle}</div>
														<div class="productDesc">${product.fpMainDesc}</div>
														<div class="productPrice">${product.fpInput}</div>
														<a class="productBtn" href="/fair/${product.fpSeq}/preview_detail.do">자세히보기</a>
													</div>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
							<a href="#" class="btn_prev"><img src="/common/images/fairimage/product_arrow_left.png"></a>
							<a href="#" class="btn_next"><img src="/common/images/fairimage/product_arrow_right.png"></a>
							<div class="swiper-pagination"></div>
						</div>
						<div class="productCategoryTitle" <c:if test="${cate.fcCategoryTitleColor ne null}">style="color:${cate.fcCategoryTitleColor};"</c:if>>${cate.fcCategoryTitle}</div>
						<a class="productList" onclick="javascript:jQuery(this).productListShow('${cate.fcSeq}', '1');">+ 전체상품보기</a>
					</div>
				</c:if>
			</c:forEach>
		</c:if>
	
		<c:if test="${fn:length(eventList) > 0}">
			<div class="event">
				<div class="container">
					<div class="eventTitle">항공, 호텔, 패스, 입장권 이벤트</div>
					<div class="eventSubTitle">대박나라 이벤트 모아보기</div>
					<c:forEach var="event" items="${eventList}">
						<ul class="eventList">
							<c:if test="${event.feType eq '3'}">
								<li class="eventRow"><a href="${event.feLink1}" target="${event.feLink1Type}"><img src="/common/images/fairimage/${event.feImage1WSaveNm}"></a></li>
								<li class="eventRow"><a href="${event.feLink2}" target="${event.feLink2Type}"><img src="/common/images/fairimage/${event.feImage2WSaveNm}"></a></li>
								<li class="eventRow"><a href="${event.feLink3}" target="${event.feLink3Type}"><img src="/common/images/fairimage/${event.feImage3WSaveNm}"></a></li>
							</c:if>
							<c:if test="${event.feType eq '2'}">
								<li class="eventRow"><a href="${event.feLink1}" target="${event.feLink1Type}"><img src="/common/images/fairimage/${event.feImage1WSaveNm}"></a></li>
								<li class="eventRow"><a href="${event.feLink2}" target="${event.feLink2Type}"><img src="/common/images/fairimage/${event.feImage2WSaveNm}"></a></li>
							</c:if>
							<c:if test="${event.feType eq '1'}">
								<li class="eventRow"><a href="${event.feLink1}" target="${event.feLink1Type}"><img src="/common/images/fairimage/${event.feImage1WSaveNm}"></a></li>
							</c:if>
							<li style="clear:both;"></li>
						</ul>
						</c:forEach>
				</div>
			</div>
		</c:if>
		
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
		
		<div class="productListModal">
			<div class="productListContainer">
				<div class="productListTitle" id="productListTitle">상품 전체보기</div>
				<div class="productListClose"><a id="productListClose"></a></div>
				<div id="productListHtml"></div>
			</div>	
		</div>
	</div>
	
	</body>
</html>