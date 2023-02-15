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
		
		body,ul,li { margin:0; padding:0; font-family:"NotoKrR", sans-serif; line-height: 0; word-break:keep-all; }
		li { list-style:none; }
		.container { position:relative; width:640px; margin:0 auto; line-height:0; text-align:center; }
		
		.header { position:relative; }
		
		.bannerList { position:relative; width:100%; }
		.bannerList .banner { width:100%; height:${bannerHeight}px; background-size:cover; text-align:center; }
		.bannerList .btn_prev { position:absolute; top:50%; left:50%; margin-left:-300px; z-index:1; }
		.bannerList .btn_next { position:absolute; top:50%; right:50%; margin-right:-300px; z-index:1; }
		
		.dday { position:absolute; width:510px; bottom:65px; left:50%; transform:translateX(-50%); z-index:1; text-align:center; line-height:0; }
		.dday .dday_container { width:auto; display: inline-block; }
		.dday .dday_container .day { display:block; background:#000000; border-radius:5px; box-sizing:border-box; }
		.dday .dday_container .day #dd { text-align:center; color:#ffffff;  font-size:42px;  line-height:normal; padding-top: 10px;}
		.dday .dday_container .day .time_container { display:inline-block; margin:10px 20px 20px; }
		.dday .dday_container .day .time_container .time { float:left; margin-left:5px; display:block; width:65px; height:80px; line-height:80px; text-align:center; background:#ffffff; color:#000000;  font-size:50px;  border-radius:5px; box-sizing:border-box; }
		.dday .dday_container .day .time_container .time:first-child { margin-left:0; }
		.dday .dday_container .day .time_container .comma { float:left; margin-left:5px; display:block; height:65px; line-height:0; }
		.dday .dday_container .day .time_container .comma .box { display:block; width:7px; height:7px; background:#ffffff; line-height:0; margin-top:15px; }
		.dday .dday_container .day .time_container .comma .box.bottom { margin-top:20px; }
		.dday .dday_container .ddat_title { display:block; line-height:normal; text-align:center; color:#ffffff;  font-size:20px;  margin-top: 10px; letter-spacing: -2px;  }
		
		.point { position:relative; width:100%; background-size:100%; padding-bottom:50px; box-sizing:border-box; }
		.point .pointTitle { padding-top:80px; text-align:center; box-sizing:border-box; }
		.point .pointSub { position:relative; margin-top:50px; }
		.point .pointDesc { position: absolute; top: 155px; left: 285px; width:320px; display: inline-block; margin-top: 0; line-height: 120%; font-weight: 500; color: #000000; font-size: 25px; text-align: left; letter-spacing: -2px; }

		.category { position:relative; width:100%; padding:30px 0; }
		.category .categorySub { position:relative; display:inline-block; cursor:pointer; margin-left:50px; }
		.category .categorySub:first-child { margin-left:0; }
		.category .categorySub .categoryTitle { position:relative; line-height:140%;  color:#000000; font-size:20px; }
		
		.productCategory { position:relative; }
		.productCategory .productCategoryTitle { position: absolute; top:45px; left:0; width:100%; text-align:center; line-height:140%;  color:#ffffff; font-size:25px; z-index:1; }
		.productCategory .product { position:relative; width:100%; background-size:cover; background-position: center; text-align:center; padding-bottom:365px; box-sizing:border-box; }
		.productCategory .product .productContainer { position:relative; display:inline-block; margin-top:70px; box-shadow: 6px 6px 6px 0 rgba(0,0,0,.2);}
		.productCategory .product .productContainer .productTitle { position:relative; margin-top:20px; width:100%; text-align:center; line-height:140%;  color:#ffffff; font-size:38px;  }
		.productCategory .product .productContainer .productImage { position:relative; margin-top:40px; width:100%; text-align:center; }
		.productCategory .product .productContainer .productImage .productLabel { position:absolute; top:20px; left:20px; display:none; }
		.productCategory .product .productContainer .productImage .productLabel .productLabelDetail { display:inline-block; line-height:120%;  color:#ffffff; font-size:20px; margin-left:5px; padding:5px; box-sizing:border-box; min-width:70px; text-align:center; }
		.productCategory .product .productContainer .productImage .productLabel .productLabelDetail:first-child { margin-left:0; }
		
		.productCategory .product .productContainer .productDetail { position:absolute; bottom: -195px; left: 30px; width:500px; padding:0; box-sizing:border-box; background-color:rgba(255,255,255,0.9); }
		.productCategory .product .productContainer .productDetail .productSubTitle { position: relative; text-align: center; line-height: 120%; color: #000000; font-size: 26px; margin-top: 20px; }
		.productCategory .product .productContainer .productDetail .productDesc { position:relative; text-align:center; line-height:120%;  color:#5f5f5f; font-size:23px; margin-top:10px; }
		.productCategory .product .productContainer .productDetail .productPrice { display:none; position:relative; text-align:center; margin-top:20px; font-family:"NotoKrB", sans-serif; letter-spacing: -1px; }
		.productCategory .product .productContainer .productDetail .productPrice .prefix { line-height:120%;  color:#000000; font-size:30px; }
		.productCategory .product .productContainer .productDetail .productPrice .price { line-height:120%;  color:#ff3b85; font-size:33px; }
		.productCategory .product .productContainer .productDetail .productPrice .won { line-height:120%;  color:#000000; font-size:20px;  font-family:"NotoKrM", sans-serif; }
		.productCategory .product .productContainer .productBtn { position:relative; display:block; text-align:center; margin-top:20px; width:100%; height:50px; background-color:#282b5d; line-height:50px;  color:#ffffff; font-size:20px; text-decoration:none; }
		.productCategory .btn_prev { position:absolute; top:40%; left:50%; margin-left:-300px; z-index:1; }
		.productCategory .btn_next { position:absolute; top:40%; right:50%; margin-right:-300px; z-index:1; }
		.productCategory .swiper-pagination { position: absolute; width:auto; padding:5px 15px; left: 50%; bottom:110px; box-sizing:border-box; -webkit-transform: translateX(-50%);-ms-transform: translateX(-50%);transform: translateX(-50%); z-index: 1;}
		.productCategory .swiper-pagination .swiper-pagination-bullet {position: relative;display: inline-block; width:12px; height:12px; background:#fff; border-radius: 50%; margin-left:45px; opacity:.3;}
		.productCategory .swiper-pagination .swiper-pagination-bullet:first-child {margin-left: 0;}
		.productCategory .swiper-pagination .swiper-pagination-bullet-active { opacity:1; }
		.productCategory .productList { position:absolute; bottom:30px; left:50%; transform:translateX(-50%); display:block; width:230px; height:50px; line-height:50px; background-color:rgba(40,43,93,1); border-radius:25px;  color:#ffffff; font-size:20px; z-index:1; text-align:center; cursor:pointer; }
		
		.productListModal { position:absolute; top:0; left:0; width:100%; height:100%; background-color:rgba(0,0,0,.65); z-index:2; display:none; }
		.productListModal .productListContainer { position:absolute; top:50px; left:95px; width:450px; }
		.productListModal .productListContainer .productListTitle { color:#ffffff;  font-size:30px; letter-spacing: -2px; text-align:center; line-height:56px; }
		.productListModal .productListContainer .productListClose { position: absolute; top:0px; right: 30px; display: inline-block; padding: 0; width: 2px; height: 56px; background: #ffffff; transform: rotate(45deg); cursor:pointer; }
		.productListModal .productListContainer .productListClose:before { display: block; content: ""; position: absolute; top: 50%; left: -26px; width: 56px; height: 2px; margin-top: -1px; background: #ffffff; }
		.productListModal .productListContainer .productListClose a { display:block; width:56px; height: 56px; top: 0px; left: -26px; position: absolute; transform: rotate(45deg); }
		
		.event { position:relative; margin-bottom:30px; }
		.event .eventTitle { position:relative; margin-top:45px; width:100%; text-align:center; line-height:140%;  color:#000000; font-size:25px; letter-spacing: -1px;}
		.event .eventSubTitle { position:relative; margin-top:10px; width:100%; text-align:center; line-height:120%;  color:#000000; font-size:36px; letter-spacing: -1px;}
		.event .eventList { display:inline-block; }
		.event .eventList .eventRow { float:left; margin-top:25px; margin-left:25px; }
		.event .eventList .eventRow:first-child { margin-left:0; }

		.footer { position:relative; width:100%; }
		.footer .logo {  }
		.footer .links { background:#ffffff; padding:30px 30px 0 30px; box-sizing:border-box; }
		.footer .links a { line-height:normal;  color:#545454; font-size:20px; text-decoration:none; }
		.footer .links span { line-height:normal; font-size:18px; padding:0 10px; box-sizing:border-box; }
		
		.footer .info { line-height:normal; padding:20px 30px 30px 30px; text-align:left; }
		.footer .info span { height:normal; padding:0 5px; box-sizing:border-box;  color:#888888; font-size:14px;  }
		.footer .info span.txt { padding:0; }
		.footer .info .copyright { line-height:normal; padding:10px 0 0 0; box-sizing:border-box;  color:#888888; font-size:14px;  text-align:left; }
		
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
				jQuery("body").html('<div class="end"><img src="/common/images/fairimage/parking_mo.png"></div>')
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
			jQuery("body").html('<div class="end"><img src="/common/images/fairimage/parking_mo.png"></div>')
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
			
			jQuery(".pointOver").mouseleave(function(){
				jQuery(this).slideUp('fast');
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
					html = "<span class='prefix'>&nbsp;"+ input.INPUT[key].VALUE[0].replace("명", "인") +"</span>"+ html;
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
			<img src="/common/images/fairimage/main_top_title_m.png">
		</div>
		
		<c:if test="${fn:length(bannerList) > 0}">
			<div class="bannerList">
				<div class="swiper swiper-container">
					<ul class="swiper-wrapper">
						<c:forEach var="blist" items="${bannerList}">
							<li class="swiper-slide">
								<img src="/common/images/fairimage/${blist.fbtImageMSaveNm}" title="${blist.fbtImageMRealNm}">
							</li>
						</c:forEach>
					</ul>
					<a href="#" class="btn_prev"><img src="/common/images/fairimage/main_banner_arrow_left.png"></a>
					<a href="#" class="btn_next"><img src="/common/images/fairimage/main_banner_arrow_right.png"></a>
				</div>
				<c:if test="${config.fcfgStatus eq 'Y'}">
				<div class="dday">
					<div class="dday_container">
						<div class="day">
							<div id="dd">마감 D-DAY</div>
							<div class="time_container">
								<div class="time" id="hh0">0</div>
								<div class="time" id="hh1">0</div>
								<div class="comma"><span class="box"></span><span class="box bottom"></span></div>
								<div class="time" id="mm0">0</div>
								<div class="time" id="mm1">0</div>
								<div class="comma"><span class="box"></span><span class="box bottom"></span></div>
								<div class="time" id="ss0">0</div>
								<div class="time" id="ss1">0</div>
								<div style="clear:both;"></div>
							</div>
						</div>
						<div class="ddat_title">${config.fcfgDdayTitle}</div>
					</div>
				</div>
				</c:if>
			</div>
		</c:if>
		
		<c:if test="${point ne null && pointSubList ne null && fn:length(pointSubList) > 0}">
			<div class="point" style="background-image:url('/common/images/fairimage/${point.fmImageBgSaveNm}');">
				<div class="container">
					<div class="pointTitle"><img src="/common/images/fairimage/${point.fmImageTitleSaveNm}"></div>
					<c:forEach var="pointSub" items="${pointSubList}">
					<div class="pointSub">
						<div><img src="/common/images/fairimage/${pointSub.fmsImageMSaveNm}" title="${pointSub.fmsImageMRealNm}"></div>
						<div class="pointDesc">${pointSub.fmsDesc}</div>
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
							<div><img src="/common/images/fairimage/${cate.fcImageMSaveNm}" title="${cate.fcImageMRealNm}"></div>
							<div class="categoryTitle">${cate.fcTitle}</div>
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
										<div class="product" style="background-image:url('/common/images/fairimage/${product.fpMainImageBgSaveNm}');">
											<div class="container">
												<div class="productContainer">
													<div class="productTitle" <c:if test="${cate.fcCategoryTitleColor ne null}">style="color:${cate.fcCategoryTitleColor};"</c:if>>${product.fpMainTitle}</div>
													<div class="productImage">
														<img src="/common/images/fairimage/${product.fpMainImageMSaveNm}" title="${product.fpMainImageMRealNm}">
														<div class="productLabel">${product.fpLabel}</div>
													</div>
													
													<div class="productDetail">
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
						<a class="productList" onclick="javascript:jQuery(this).productListShow('${cate.fcSeq}', '1');">+전체상품보기</a>
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
								<li class="eventRow"><a href="${event.feLink1}" target="${event.feLink1Type}"><img src="/common/images/fairimage/${event.feImage1MSaveNm}"></a></li>
								<li class="eventRow"><a href="${event.feLink2}" target="${event.feLink2Type}"><img src="/common/images/fairimage/${event.feImage2MSaveNm}"></a></li>
							</c:if>
							<c:if test="${event.feType eq '2'}">
								<li class="eventRow"><a href="${event.feLink1}" target="${event.feLink1Type}"><img src="/common/images/fairimage/${event.feImage1MSaveNm}"></a></li>
							</c:if>
							<c:if test="${event.feType eq '1'}">
								<li class="eventRow"><a href="${event.feLink1}" target="${event.feLink1Type}"><img src="/common/images/fairimage/${event.feImage1MSaveNm}"></a></li>
							</c:if>
							<li style="clear:both;"></li>
						</ul>
						</c:forEach>
				</div>
			</div>
		</c:if>
		
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