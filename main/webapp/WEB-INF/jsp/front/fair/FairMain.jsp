<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/jsp/include/el.jspf" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>대박나라-대명아임레디 박람회 나를 위한 쇼핑</title>
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

.bannerList { position:relative; width:100%; height:750px; }
.bannerList .banner { width:100%; height:750px; background-size:cover; text-align:center; }
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
var dday = new Date("2020/01/31 23:59:59").getTime();
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
var dday = new Date("2020/01/31 23:59:59").getTime();
var nday = new Date().getTime();

ddayTime();
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
if (/bz_tracking_id/.test(location.search)) { localStorage.BuzzAd = location.search }</script>
<body>


<!--  PC 화면  -->
<div id="pc">
<div class="header">
<div class="container">
<div class="header_logo"><img src="/common/images/fairimage/main_top_title.png"></div>
</div>
</div>

<div class="bannerList">
<div class="swiper swiper-container">
<ul class="swiper-wrapper">
<li class="swiper-slide">
<a href="https://daemyungimready.com/fair/58/index.do"
target = "_self"
>
<div class="banner" style="background-image:url(/common/images/fairimage/1573793404408_8f780.jpg);">
<img src="/common/images/fairimage/1575421304946_1ba53.png" title="main_v2_new">
</div>
</a>
</li>
<li class="swiper-slide">
<div class="banner" style="background-image:url(/common/images/fairimage/1573793422527_24c00.jpg);">
<img src="/common/images/fairimage/1575422955225_17952.png" title="main_v2">
</div>
</li>
<li class="swiper-slide">
<div class="banner" style="background-image:url(/common/images/fairimage/1573793439215_dc941.jpg);">
<img src="/common/images/fairimage/1574305691231_44f17.png" title="main_banner_3">
</div>
</li>
</ul>
<a href="#" class="btn_prev"><img src="/common/images/fairimage/main_banner_arrow_left.png"></a>
<a href="#" class="btn_next"><img src="/common/images/fairimage/main_banner_arrow_right.png"></a>
</div>
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

<div class="ddat_title">나를 위한 라이프 쇼핑! 모든 라이프 특가상품을 한번에!</div>
</div>
</div>
</div>

<div class="point" style="height:700px; background-image:url('/common/images/fairimage/1573793626040_241f9.jpg');">
<div class="container">
<div class="pointTitle"><img src="/common/images/fairimage/1574814302168_f9e8c.png"></div>
<div class="pointSub">
<div><img src="/common/images/fairimage/1573793747420_79fc9.png" title="main_point_sub_1"></div>
<div class="pointOver" style="background-color:#712d95;">
<div class="pointOverContainer">
<div class="pointLine"></div>
<div class="pointDesc">대명아임레디에서만<br>제공하는 서비스는<br>합리적인 가격!</div>
</div>
</div>
</div>
<div class="pointSub">
<div><img src="/common/images/fairimage/1573793784503_beb0c.png" title="main_point_sub_2"></div>
<div class="pointOver" style="background-color:#712d95;">
<div class="pointOverContainer">
<div class="pointLine"></div>
<div class="pointDesc">서비스만 즐거운가요?<br>대명아임레디는 <br>더 즐거운 혜택을 드립니다.</div>
</div>
</div>
</div>
<div class="pointSub">
<div><img src="/common/images/fairimage/1573793814195_7ab4d.png" title="main_point_sub_3"></div>
<div class="pointOver" style="background-color:#712d95;">
<div class="pointOverContainer">
<div class="pointLine"></div>
<div class="pointDesc">여행가고 남는건 공허함뿐.<br>기쁨 채우기 위해서 준비했다!<br>서비스 즐기고<br>리조트/스키 타러 가자!</div>
</div>
</div>
</div>
</div>
</div>

<div class="category">
<div class="container">
<div class="categorySub" onclick="javascript:jQuery(this).categoryMove();">
<div><img src="/common/images/fairimage/1573795554748_930b3.png" title="category_1"></div>
<div class="categoryTitle">해외여행</div>
<div class="categorySubTitle" style="border-bottom:5px solid #f9ff85;">노팁 노쇼핑 노옵션<br>HOT PLACE</div>
</div>
<div class="categorySub" onclick="javascript:jQuery(this).categoryMove();">
<div><img src="/common/images/fairimage/1573795593545_c5e32.png" title="category_2"></div>
<div class="categoryTitle">크루즈</div>
<div class="categorySubTitle" style="border-bottom:5px solid #a4f1e7;">부모님 효도여행<br>NO.1 효자상품</div>
</div>
<div class="categorySub" onclick="javascript:jQuery(this).categoryMove();">
<div><img src="/common/images/fairimage/1573795673183_57839.png" title="category_3"></div>
<div class="categoryTitle">어학연수</div>
<div class="categorySubTitle" style="border-bottom:5px solid #9bebf6;">우리아이 명문대<br>보내기 프로젝트</div>
</div>
<div class="categorySub" onclick="javascript:jQuery(this).categoryMove();">
<div><img src="/common/images/fairimage/1573795718252_02a54.png" title="category_4"></div>
<div class="categoryTitle">웨딩</div>
<div class="categorySubTitle" style="border-bottom:5px solid #f3b3c8;">똑소리나는<br>신부님의 선택</div>
</div>
</div>
</div>

<div class="productCategory">
<div class="swiperProduct swiper-container">
<ul class="swiper-wrapper">
<li class="swiper-slide">
<div class="product" style="height:700px; background-image:url('/common/images/fairimage/1574256084296_8f64a.jpg');">
<div class="container">
<div class="productContainer">
<div><img src="/common/images/fairimage/1574256084313_8e964.png" title="보라카이"></div>
<div class="productTitle"style="color:#ffffff;">보라카이 3박 5일</div>
<div class="productDetail">
<div class="productLabel">[{"TITLE":"MD&#39;s PICK","BGCOLOR":"#ff3b85"},{"TITLE":"핫딜","BGCOLOR":"#ff3b85"}]</div>
<div class="productSubTitle">친구와 떠나는 우정여행<br>보라카이 3박 5일</div>
<div class="productDesc">천국의 섬, <br>보라카이로 떠나자!</div>
<div class="productPrice">{"INPUT_SEQ":"9","INPUT":[{"KEY":"TEXT","TITLE":"이름","VALUE":""},{"KEY":"HPHONE","TITLE":"연락처","VALUE":""},{"KEY":"SELECT","TITLE":"인원","VALUE":["2명","4명","기타"]},{"KEY":"SELECT","TITLE":"상담가능시간","VALUE":["09:00~11:00","11:00~13:00","13:00~15:00","15:00~17:00","17:00~18:00","기타문의"]},{"KEY":"DATE","TITLE":"출발일","VALUE":["2020-01-01~2020-03-31"]},{"KEY":"EMAIL","TITLE":"이메일","VALUE":""}],"PRICE":[{"KEY":"2","VALUE":"0","PRICE":"1960000"},{"KEY":"2","VALUE":"1","PRICE":"3920000"},{"KEY":"2","VALUE":"2","PRICE":" 자세한 내용은 상담문의를 통해 문의해주시기 바랍니다."}],"BENEFIT":[{"KEY":"2","VALUE":"0","BENEFIT":[{"fbSeq":11,"fbTitle":"몽블랑","fbSubtitle":"벨트 기프트 세트","fbModel":116853,"fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799618735_426ac.png","fbReal":"몽블랑-벨트기프트"},{"fbSeq":13,"fbTitle":"귀뚜라미","fbSubtitle":"쿠션 온수매트","fbModel":"EM-873","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799662588_15d29.png","fbReal":"귀뚜라미-온수매트"},{"fbSeq":14,"fbTitle":"공식수입원","fbSubtitle":"발뮤다 더 토스터","fbModel":"K01K-CW","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799681859_397ac.png","fbReal":"발뮤다-토스터"},{"fbSeq":12,"fbTitle":"티파티앤코","fbSubtitle":"더블라운드 목걸이","fbModel":36517204,"fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1576240304908_a1e4b.png","fbReal":"image08"}]},{"KEY":"2","VALUE":"1","BENEFIT":[{"fbSeq":5,"fbTitle":"PRADA","fbSubtitle":"비텔로무브 장지갑","fbModel":"1MH132 QWA F0016","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799355483_b7b7d.png","fbReal":"프라다-지갑"},{"fbSeq":6,"fbTitle":"SAMSUNG","fbSubtitle":"갤럭시 워치 액티브2","fbModel":"아쿠아블랙/핑크골드","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799379305_8a239.png","fbReal":"갤럭시-워치"},{"fbSeq":7,"fbTitle":"스마트카라","fbSubtitle":"음식물 처리기","fbModel":"PCS_350","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799405549_ae48e.png","fbReal":"스마트카라-음식물처리기"},{"fbSeq":8,"fbTitle":"SK매직","fbSubtitle":"12인용 식기세척기","fbModel":"DWA-7400D","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799512538_19e15.png","fbReal":"SK매직-식기세척기"}]},{"KEY":"2","VALUE":"2","BENEFIT":[]}]}</div>
<a class="productBtn" href="/fair/58/index.do">자세히보기</a>
</div>
</div>
</div>
</div>
</li>
<li class="swiper-slide">
<div class="product" style="height:700px; background-image:url('/common/images/fairimage/1574256529253_343d9.jpg');">
<div class="container">
<div class="productContainer">
<div><img src="/common/images/fairimage/1574256529265_4441d.png" title="발리"></div>
<div class="productTitle"style="color:#ffffff;">더 사카예 발리 6일</div>
<div class="productDetail">
<div class="productLabel">[{"TITLE":"마감임박","BGCOLOR":"#ff3b85"},{"TITLE":"마사지 제공","BGCOLOR":"#ff3b85"}]</div>
<div class="productSubTitle">몸도 마음도 지친 <br>우리에게 주는 선물!</div>
<div class="productDesc">지상 최고의 파라다이스,발리<br>신들의섬, 발리로 떠나자!</div>
<div class="productPrice">{"INPUT_SEQ":"9","INPUT":[{"KEY":"TEXT","TITLE":"이름","VALUE":""},{"KEY":"HPHONE","TITLE":"연락처","VALUE":""},{"KEY":"SELECT","TITLE":"인원","VALUE":["2명","4명","기타"]},{"KEY":"SELECT","TITLE":"상담가능시간","VALUE":["09:00~11:00","11:00~13:00","13:00~15:00","15:00~17:00","17:00~18:00","기타문의"]},{"KEY":"DATE","TITLE":"출발일","VALUE":["2020-01-01~2020-03-31"]},{"KEY":"EMAIL","TITLE":"이메일","VALUE":""}],"PRICE":[{"KEY":"2","VALUE":"0","PRICE":"4200000"},{"KEY":"2","VALUE":"1","PRICE":"8400000"},{"KEY":"2","VALUE":"2","PRICE":" 자세한 내용은 상담문의를 통해 문의해주시기 바랍니다."}],"BENEFIT":[{"KEY":"2","VALUE":"0","BENEFIT":[{"fbSeq":5,"fbTitle":"PRADA","fbSubtitle":"비텔로무브 장지갑","fbModel":"1MH132 QWA F0016","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799355483_b7b7d.png","fbReal":"프라다-지갑"},{"fbSeq":6,"fbTitle":"SAMSUNG","fbSubtitle":"갤럭시 워치 액티브2","fbModel":"아쿠아블랙/핑크골드","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799379305_8a239.png","fbReal":"갤럭시-워치"},{"fbSeq":7,"fbTitle":"스마트카라","fbSubtitle":"음식물 처리기","fbModel":"PCS_350","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799405549_ae48e.png","fbReal":"스마트카라-음식물처리기"},{"fbSeq":8,"fbTitle":"SK매직","fbSubtitle":"12인용 식기세척기","fbModel":"DWA-7400D","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799512538_19e15.png","fbReal":"SK매직-식기세척기"}]},{"KEY":"2","VALUE":"1","BENEFIT":[{"fbSeq":9,"fbTitle":"LG","fbSubtitle":"양문형냉장고","fbModel":"S631S32","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799555367_4f42b.png","fbReal":"엘지전자-양문형냉장고"},{"fbSeq":10,"fbTitle":"LG","fbSubtitle":"스탠드 김치냉장고","fbModel":"K334S11","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799574199_2c16e.png","fbReal":"엘지전자-김치냉장고"},{"fbSeq":15,"fbTitle":"LG","fbSubtitle":" Pra.L 4종 세트","fbModel":"BWJ1/BLJ1/BCJ1/BBJ1","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799817033_25367.png","fbReal":"엘지전자-프라엘"},{"fbSeq":16,"fbTitle":"SAMSUNG","fbSubtitle":" 55인치 UHD TV","fbModel":"UN55RU7190FXKR","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799850139_37b51.png","fbReal":"삼성-UHDTV"}]},{"KEY":"2","VALUE":"2","BENEFIT":[]}]}</div>
<a class="productBtn" href="/fair/59/index.do">자세히보기</a>
</div>
</div>
</div>
</div>
</li>
<li class="swiper-slide">
<div class="product" style="height:700px; background-image:url('/common/images/fairimage/1575521857886_7cba1.png');">
<div class="container">
<div class="productContainer">
<div><img src="/common/images/fairimage/1575521857902_e2410.png" title="하와이-컨텐츠"></div>
<div class="productTitle"style="color:#ffffff;">쇼어라인 호텔 하와이 6일</div>
<div class="productDetail">
<div class="productLabel">[{"TITLE":"HIT 상품","BGCOLOR":"#ff3b85"},{"TITLE":"파샬오션뷰","BGCOLOR":"#ff3b85"}]</div>
<div class="productSubTitle">가성비 갑! 알뜰살뜰 <br>지상낙원 패키지!</div>
<div class="productDesc">오션뷰로 즐기는 지상<br>최고의 낙원, 하와이</div>
<div class="productPrice">{"INPUT_SEQ":"9","INPUT":[{"KEY":"TEXT","TITLE":"이름","VALUE":""},{"KEY":"HPHONE","TITLE":"연락처","VALUE":""},{"KEY":"SELECT","TITLE":"인원","VALUE":["2명","4명","기타"]},{"KEY":"SELECT","TITLE":"상담가능시간","VALUE":["09:00~11:00","11:00~13:00","13:00~15:00","15:00~17:00","17:00~18:00","기타문의"]},{"KEY":"DATE","TITLE":"출발일","VALUE":["2020-01-01~2020-03-31"]},{"KEY":"EMAIL","TITLE":"이메일","VALUE":""}],"PRICE":[{"KEY":"2","VALUE":"0","PRICE":"4200000"},{"KEY":"2","VALUE":"1","PRICE":"8400000"},{"KEY":"2","VALUE":"2","PRICE":"자세한 내용은 상담문의를 통해 문의해주시기 바랍니다."}],"BENEFIT":[{"KEY":"2","VALUE":"0","BENEFIT":[{"fbSeq":5,"fbTitle":"PRADA","fbSubtitle":"비텔로무브 장지갑","fbModel":"1MH132 QWA F0016","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799355483_b7b7d.png","fbReal":"프라다-지갑"},{"fbSeq":6,"fbTitle":"SAMSUNG","fbSubtitle":"갤럭시 워치 액티브2","fbModel":"아쿠아블랙/핑크골드","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799379305_8a239.png","fbReal":"갤럭시-워치"},{"fbSeq":7,"fbTitle":"스마트카라","fbSubtitle":"음식물 처리기","fbModel":"PCS_350","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799405549_ae48e.png","fbReal":"스마트카라-음식물처리기"},{"fbSeq":8,"fbTitle":"SK매직","fbSubtitle":"12인용 식기세척기","fbModel":"DWA-7400D","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799512538_19e15.png","fbReal":"SK매직-식기세척기"}]},{"KEY":"2","VALUE":"1","BENEFIT":[{"fbSeq":9,"fbTitle":"LG","fbSubtitle":"양문형냉장고","fbModel":"S631S32","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799555367_4f42b.png","fbReal":"엘지전자-양문형냉장고"},{"fbSeq":10,"fbTitle":"LG","fbSubtitle":"스탠드 김치냉장고","fbModel":"K334S11","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799574199_2c16e.png","fbReal":"엘지전자-김치냉장고"},{"fbSeq":15,"fbTitle":"LG","fbSubtitle":" Pra.L 4종 세트","fbModel":"BWJ1/BLJ1/BCJ1/BBJ1","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799817033_25367.png","fbReal":"엘지전자-프라엘"},{"fbSeq":16,"fbTitle":"SAMSUNG","fbSubtitle":" 55인치 UHD TV","fbModel":"UN55RU7190FXKR","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799850139_37b51.png","fbReal":"삼성-UHDTV"}]},{"KEY":"2","VALUE":"2","BENEFIT":[]}]}</div>
<a class="productBtn" href="/fair/60/index.do">자세히보기</a>
</div>
</div>
</div>
</div>
</li>
</ul>
<a href="#" class="btn_prev"><img src="/common/images/fairimage/product_arrow_left.png"></a>
<a href="#" class="btn_next"><img src="/common/images/fairimage/product_arrow_right.png"></a>
<div class="swiper-pagination"></div>
</div>
<div class="productCategoryTitle"style="color:#ffffff;">해외여행 상품</div>
<a class="productList" onclick="javascript:jQuery(this).productListShow('3', '1');">+ 전체상품보기</a>
</div>
<div class="productCategory">
<div class="swiperProduct swiper-container">
<ul class="swiper-wrapper">
<li class="swiper-slide">
<div class="product" style="height:700px; background-image:url('/common/images/fairimage/1574258578120_e5663.jpg');">
<div class="container">
<div class="productContainer">
<div><img src="/common/images/fairimage/1574258578127_31feb.png" title="크루즈3월"></div>
<div class="productTitle"style="color:#000000;">코사무이-파타야! 동남아 크루즈 8일!</div>
<div class="productDetail">
<div class="productLabel">[{"TITLE":"BEST NO.1","BGCOLOR":"#ff3b85"},{"TITLE":"예약가능","BGCOLOR":"#ff3b85"}]</div>
<div class="productSubTitle">지상낙원 휴양지,<br>확실한 휴양과 편안한 여행</div>
<div class="productDesc">꿈꾸던 호화 크루즈 여행<br>3월 동남아 크루즈!</div>
<div class="productPrice">{"INPUT_SEQ":"10","INPUT":[{"KEY":"TEXT","TITLE":"이름","VALUE":""},{"KEY":"HPHONE","TITLE":"연락처","VALUE":""},{"KEY":"SELECT","TITLE":"인원","VALUE":["2명","4명","기타"]},{"KEY":"SELECT","TITLE":"상담가능시간","VALUE":["09:00~11:00","11:00~13:00","13:00~15:00","15:00~17:00","17:00~18:00","기타문의"]},{"KEY":"SELECT","TITLE":"출발일","VALUE":"2020년 3월 14일 출발"},{"KEY":"EMAIL","TITLE":"이메일","VALUE":""}],"PRICE":[{"KEY":"2","VALUE":"0","PRICE":"5840000"},{"KEY":"2","VALUE":"1","PRICE":"11680000"},{"KEY":"2","VALUE":"2","PRICE":"자세한 내용은 상담문의를 통해 문의해주시기 바랍니다."}],"BENEFIT":[{"KEY":"2","VALUE":"0","BENEFIT":[{"fbSeq":16,"fbTitle":"SAMSUNG","fbSubtitle":" 55인치 UHD TV","fbModel":"UN55RU7190FXKR","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799850139_37b51.png","fbReal":"삼성-UHDTV"},{"fbSeq":21,"fbTitle":"LG","fbSubtitle":"360도 공기청정기 화이트","fbModel":"AS181DAW","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573800567288_8bfee.png","fbReal":"LG전자-퓨리케어"},{"fbSeq":22,"fbTitle":"LG","fbSubtitle":"코드제로 A9","fbModel":"A938SA","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573800588131_09728.png","fbReal":"LG전자-코드제로"},{"fbSeq":23,"fbTitle":"SAMSUNG","fbSubtitle":"전기건조기 9KG","fbModel":"DV90M53B0QW","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573800623528_3b3c7.png","fbReal":"삼성전자-전기건조기"}]},{"KEY":"2","VALUE":"1","BENEFIT":[{"fbSeq":10,"fbTitle":"LG","fbSubtitle":"스탠드 김치냉장고","fbModel":"K334S11","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799574199_2c16e.png","fbReal":"엘지전자-김치냉장고"},{"fbSeq":27,"fbTitle":"LG","fbSubtitle":"스타일러 플러스","fbModel":"S5BB","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573800866023_c291e.png","fbReal":"엘지전자-스타일러플러스"},{"fbSeq":28,"fbTitle":"SAMSUNG","fbSubtitle":"65인치 UHD TV","fbModel":"UN65RU7190FXKR","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573800894708_2496f.png","fbReal":"삼성-65형티비"},{"fbSeq":26,"fbTitle":"코지마","fbSubtitle":"클라쎄 안마의자","fbModel":"CMC-3200","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1576240791697_50f2b.png","fbReal":"image09"}]},{"KEY":"2","VALUE":"2","BENEFIT":[]}]}</div>
<a class="productBtn" href="/fair/63/index.do">자세히보기</a>
</div>
</div>
</div>
</div>
</li>
</ul>
<a href="#" class="btn_prev"><img src="/common/images/fairimage/product_arrow_left.png"></a>
<a href="#" class="btn_next"><img src="/common/images/fairimage/product_arrow_right.png"></a>
<div class="swiper-pagination"></div>
</div>
<div class="productCategoryTitle"style="color:#000000;">크루즈 상품</div>
<a class="productList" onclick="javascript:jQuery(this).productListShow('4', '1');">+ 전체상품보기</a>
</div>
<div class="productCategory">
<div class="swiperProduct swiper-container">
<ul class="swiper-wrapper">
<li class="swiper-slide">
<div class="product" style="height:700px; background-image:url('/common/images/fairimage/1574254738545_cd65d.jpg');">
<div class="container">
<div class="productContainer">
<div><img src="/common/images/fairimage/1574254738553_51df0.png" title="뉴질랜드"></div>
<div class="productTitle"style="color:#000000;">뉴질랜드 영어캠프</div>
<div class="productDetail">
<div class="productLabel">[{"TITLE":"부모안전","BGCOLOR":"#ff3b85"},{"TITLE":"여학생 추천","BGCOLOR":"#ff3b85"}]</div>
<div class="productSubTitle">명문공립학교 ESOL수업<br>+ 로토루아 수학여행</div>
<div class="productDesc">아름답고 깨끗한 자연환경의<br>오클랜드 공립학교 ESOL 수업!</div>
<div class="productPrice">{"INPUT_SEQ":"11","INPUT":[{"KEY":"TEXT","TITLE":"이름","VALUE":""},{"KEY":"HPHONE","TITLE":"연락처","VALUE":""},{"KEY":"SELECT","TITLE":"자녀학년","VALUE":["초3","초4","초5","초6","중1","중2","중3","고1","고2","고3"]},{"KEY":"SELECT","TITLE":"상담가능시간","VALUE":["09:00~11:00","11:00~13:00","13:00~15:00","15:00~17:00","17:00~18:00","기타문의"]},{"KEY":"SELECT","TITLE":"출발일","VALUE":"2020년 1월 5일 출발"},{"KEY":"EMAIL","TITLE":"이메일","VALUE":""}],"PRICE": [{"KEY":"-1","VALUE":"-1","PRICE":"5500000"}],"BENEFIT": [{"KEY":"-1","VALUE":"-1","BENEFIT":[{"fbSeq":16,"fbTitle":"SAMSUNG","fbSubtitle":" 55인치 UHD TV","fbModel":"UN55RU7190FXKR","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799850139_37b51.png","fbReal":"삼성-UHDTV"},{"fbSeq":23,"fbTitle":"SAMSUNG","fbSubtitle":"전기건조기 9KG","fbModel":"DV90M53B0QW","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573800623528_3b3c7.png","fbReal":"삼성전자-전기건조기"},{"fbSeq":29,"fbTitle":"LG","fbSubtitle":"올뉴그램 노트북","fbModel":"13Z980-G.AR3MK","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573801103815_7f5f9.png","fbReal":"LG전자-올뉴그램-노트북"},{"fbSeq":30,"fbTitle":"SAMSUNG","fbSubtitle":"노트북9 ALWAYS","fbModel":"NT930XBE-K717A","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573801134191_42408.png","fbReal":"삼성노트북0"}]}]}</div>
<a class="productBtn" href="/fair/55/index.do">자세히보기</a>
</div>
</div>
</div>
</div>
</li>
<li class="swiper-slide">
<div class="product" style="height:700px; background-image:url('/common/images/fairimage/1574255103539_29bf0.jpg');">
<div class="container">
<div class="productContainer">
<div><img src="/common/images/fairimage/1574255103547_c75c6.png" title="미국서부"></div>
<div class="productTitle"style="color:#000000;">미국서부 영어캠프</div>
<div class="productDetail">
<div class="productLabel">[{"TITLE":"베스트 NO.1","BGCOLOR":"#ff3b85"},{"TITLE":"마감임박","BGCOLOR":"#ff3b85"}]</div>
<div class="productSubTitle">명문 사립학교 정규수업<br>+ 실리콘밸리 탐방!</div>
<div class="productDesc">미국 친구들과 함께하는<br>정규수업 스쿨링 캠프</div>
<div class="productPrice">{"INPUT_SEQ":"0","INPUT":[{"KEY":"TEXT","TITLE":"이름","VALUE":""},{"KEY":"HPHONE","TITLE":"연락처","VALUE":""},{"KEY":"SELECT","TITLE":"자녀학년","VALUE":["초3","초4","초5","초6","중1","중2","중3","고1","고2","고3"]},{"KEY":"SELECT","TITLE":"상담가능시간","VALUE":["09:00~11:00","11:00~13:00","13:00~15:00","15:00~17:00","17:00~18:00","기타문의"]},{"KEY":"SELECT","TITLE":"출발일","VALUE":"2020년 1월 3일 출발"},{"KEY":"EMAIL","TITLE":"이메일","VALUE":""}],"PRICE": [{"KEY":"-1","VALUE":"-1","PRICE":"6700000"}],"BENEFIT": [{"KEY":"-1","VALUE":"-1","BENEFIT":[{"fbSeq":16,"fbTitle":"SAMSUNG","fbSubtitle":" 55인치 UHD TV","fbModel":"UN55RU7190FXKR","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799850139_37b51.png","fbReal":"삼성-UHDTV"},{"fbSeq":23,"fbTitle":"SAMSUNG","fbSubtitle":"전기건조기 9KG","fbModel":"DV90M53B0QW","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573800623528_3b3c7.png","fbReal":"삼성전자-전기건조기"},{"fbSeq":29,"fbTitle":"LG","fbSubtitle":"올뉴그램 노트북","fbModel":"13Z980-G.AR3MK","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573801103815_7f5f9.png","fbReal":"LG전자-올뉴그램-노트북"},{"fbSeq":30,"fbTitle":"SAMSUNG","fbSubtitle":"노트북9 ALWAYS","fbModel":"NT930XBE-K717A","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573801134191_42408.png","fbReal":"삼성노트북0"}]}]}</div>
<a class="productBtn" href="/fair/57/index.do">자세히보기</a>
</div>
</div>
</div>
</div>
</li>
<li class="swiper-slide">
<div class="product" style="height:700px; background-image:url('/common/images/fairimage/1574255442766_1018d.jpg');">
<div class="container">
<div class="productContainer">
<div><img src="/common/images/fairimage/1574255442776_c3e56.png" title="미국동부"></div>
<div class="productTitle"style="color:#000000;">미국동부 영어캠프</div>
<div class="productDetail">
<div class="productLabel">[{"TITLE":"미국 유학생활","BGCOLOR":"#ff3b85"},{"TITLE":"필드트립","BGCOLOR":"#ff3b85"}]</div>
<div class="productSubTitle">세계1% 아이비리그 대학<br>탐방과 필드트립까지!</div>
<div class="productDesc">미국 교육의 시작<br>8학군 지역에서 배우는 영어!</div>
<div class="productPrice">{"INPUT_SEQ":"3","INPUT":[{"KEY":"TEXT","TITLE":"이름","VALUE":""},{"KEY":"HPHONE","TITLE":"연락처","VALUE":""},{"KEY":"SELECT","TITLE":"자녀학년","VALUE":["초3","초4","초5","초6","중1","중2","중3","고1","고2","고3"]},{"KEY":"SELECT","TITLE":"상담가능시간","VALUE":["09:00~11:00","11:00~13:00","13:00~15:00","15:00~17:00","17:00~18:00","기타문의"]},{"KEY":"SELECT","TITLE":"출발일","VALUE":"2020년 1월 3일 출발"},{"KEY":"EMAIL","TITLE":"이메일","VALUE":""}],"PRICE": [{"KEY":"-1","VALUE":"-1","PRICE":"6700000"}],"BENEFIT": [{"KEY":"-1","VALUE":"-1","BENEFIT":[{"fbSeq":16,"fbTitle":"SAMSUNG","fbSubtitle":" 55인치 UHD TV","fbModel":"UN55RU7190FXKR","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799850139_37b51.png","fbReal":"삼성-UHDTV"},{"fbSeq":23,"fbTitle":"SAMSUNG","fbSubtitle":"전기건조기 9KG","fbModel":"DV90M53B0QW","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573800623528_3b3c7.png","fbReal":"삼성전자-전기건조기"},{"fbSeq":29,"fbTitle":"LG","fbSubtitle":"올뉴그램 노트북","fbModel":"13Z980-G.AR3MK","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573801103815_7f5f9.png","fbReal":"LG전자-올뉴그램-노트북"},{"fbSeq":30,"fbTitle":"SAMSUNG","fbSubtitle":"노트북9 ALWAYS","fbModel":"NT930XBE-K717A","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573801134191_42408.png","fbReal":"삼성노트북0"}]}]}</div>
<a class="productBtn" href="/fair/56/index.do">자세히보기</a>
</div>
</div>
</div>
</div>
</li>
</ul>
<a href="#" class="btn_prev"><img src="/common/images/fairimage/product_arrow_left.png"></a>
<a href="#" class="btn_next"><img src="/common/images/fairimage/product_arrow_right.png"></a>
<div class="swiper-pagination"></div>
</div>
<div class="productCategoryTitle"style="color:#000000;">어학연수 상품</div>
<a class="productList" onclick="javascript:jQuery(this).productListShow('5', '1');">+ 전체상품보기</a>
</div>
<div class="productCategory">
<div class="swiperProduct swiper-container">
<ul class="swiper-wrapper">
<li class="swiper-slide">
<div class="product" style="height:700px; background-image:url('/common/images/fairimage/1574259189766_8f481.jpg');">
<div class="container">
<div class="productContainer">
<div><img src="/common/images/fairimage/1575420589716_4dc44.png" title="main_new"></div>
<div class="productTitle"style="color:#000000;">스드메+푸켓 허니문</div>
<div class="productDetail">
<div class="productLabel">[{"TITLE":"가성비 甲","BGCOLOR":"#ff3b85"},{"TITLE":"실속패키지","BGCOLOR":"#ff3b85"}]</div>
<div class="productSubTitle">푸켓으로 홀가분하게<br>신혼여행 떠나자!</div>
<div class="productDesc">가장 아름다운 그날,<br>당신을 위한 특별한 선택!</div>
<div class="productPrice">{"INPUT_SEQ":"12","INPUT":[{"KEY":"TEXT","TITLE":"이름","VALUE":""},{"KEY":"HPHONE","TITLE":"연락처","VALUE":""},{"KEY":"DATE","TITLE":"예식일","VALUE":[]},{"KEY":"SELECT","TITLE":"상담가능시간","VALUE":["09:00~11:00","11:00~13:00","13:00~15:00","15:00~17:00","17:00~18:00","기타문의"]},{"KEY":"EMAIL","TITLE":"이메일","VALUE":""}],"PRICE": [{"KEY":"-1","VALUE":"-1","PRICE":"4200000"}],"BENEFIT": [{"KEY":"-1","VALUE":"-1","BENEFIT":[{"fbSeq":5,"fbTitle":"PRADA","fbSubtitle":"비텔로무브 장지갑","fbModel":"1MH132 QWA F0016","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799355483_b7b7d.png","fbReal":"프라다-지갑"},{"fbSeq":6,"fbTitle":"SAMSUNG","fbSubtitle":"갤럭시 워치 액티브2","fbModel":"아쿠아블랙/핑크골드","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799379305_8a239.png","fbReal":"갤럭시-워치"},{"fbSeq":7,"fbTitle":"스마트카라","fbSubtitle":"음식물 처리기","fbModel":"PCS_350","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799405549_ae48e.png","fbReal":"스마트카라-음식물처리기"},{"fbSeq":8,"fbTitle":"SK매직","fbSubtitle":"12인용 식기세척기","fbModel":"DWA-7400D","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799512538_19e15.png","fbReal":"SK매직-식기세척기"}]}]}</div>
<a class="productBtn" href="/fair/64/index.do">자세히보기</a>
</div>
</div>
</div>
</div>
</li>
<li class="swiper-slide">
<div class="product" style="height:700px; background-image:url('/common/images/fairimage/1574259532176_a1624.jpg');">
<div class="container">
<div class="productContainer">
<div><img src="/common/images/fairimage/1574259532185_63507.png" title="코사무이"></div>
<div class="productTitle"style="color:#000000;">스드메+코사무이 허니문</div>
<div class="productDetail">
<div class="productLabel">[{"TITLE":"예신 추천","BGCOLOR":"#ff3b85"},{"TITLE":"프리미엄","BGCOLOR":"#ff3b85"}]</div>
<div class="productSubTitle">풀 패키지로 <br>결혼준비 완료!</div>
<div class="productDesc">태국의 낙원, 코사무이에서<br>럭셔리 허니문을 만끽하자!</div>
<div class="productPrice">{"INPUT_SEQ":"12","INPUT":[{"KEY":"TEXT","TITLE":"이름","VALUE":""},{"KEY":"HPHONE","TITLE":"연락처","VALUE":""},{"KEY":"DATE","TITLE":"예식일","VALUE":[]},{"KEY":"SELECT","TITLE":"상담가능시간","VALUE":["09:00~11:00","11:00~13:00","13:00~15:00","15:00~17:00","17:00~18:00","기타문의"]},{"KEY":"EMAIL","TITLE":"이메일","VALUE":""}],"PRICE": [{"KEY":"-1","VALUE":"-1","PRICE":"4900000"}],"BENEFIT": [{"KEY":"-1","VALUE":"-1","BENEFIT":[{"fbSeq":16,"fbTitle":"SAMSUNG","fbSubtitle":" 55인치 UHD TV","fbModel":"UN55RU7190FXKR","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799850139_37b51.png","fbReal":"삼성-UHDTV"},{"fbSeq":21,"fbTitle":"LG","fbSubtitle":"360도 공기청정기 화이트","fbModel":"AS181DAW","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573800567288_8bfee.png","fbReal":"LG전자-퓨리케어"},{"fbSeq":23,"fbTitle":"SAMSUNG","fbSubtitle":"전기건조기 9KG","fbModel":"DV90M53B0QW","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573800623528_3b3c7.png","fbReal":"삼성전자-전기건조기"},{"fbSeq":22,"fbTitle":"LG","fbSubtitle":"코드제로 A9","fbModel":"A938SA","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573800588131_09728.png","fbReal":"LG전자-코드제로"}]}]}</div>
<a class="productBtn" href="/fair/65/index.do">자세히보기</a>
</div>
</div>
</div>
</div>
</li>
<li class="swiper-slide">
<div class="product" style="height:700px; background-image:url('/common/images/fairimage/1574259826624_76fa3.jpg');">
<div class="container">
<div class="productContainer">
<div><img src="/common/images/fairimage/1575872117419_551f4.png" title="웨딩_02"></div>
<div class="productTitle"style="color:#000000;">스드메+발리 허니문</div>
<div class="productDetail">
<div class="productLabel">[{"TITLE":"만족도 100%","BGCOLOR":"#ff3b85"},{"TITLE":"최고급 패키지","BGCOLOR":"#ff3b85"}]</div>
<div class="productSubTitle">생애 가장 로맨틱한 영화<br>럭셔리 Wedding</div>
<div class="productDesc">세계적인 휴양 천국 발리에서<br>행복한 신혼 시작</div>
<div class="productPrice">{"INPUT_SEQ":"12","INPUT":[{"KEY":"TEXT","TITLE":"이름","VALUE":""},{"KEY":"HPHONE","TITLE":"연락처","VALUE":""},{"KEY":"DATE","TITLE":"예식일","VALUE":[]},{"KEY":"SELECT","TITLE":"상담가능시간","VALUE":["09:00~11:00","11:00~13:00","13:00~15:00","15:00~17:00","17:00~18:00","기타문의"]},{"KEY":"EMAIL","TITLE":"이메일","VALUE":""}],"PRICE": [{"KEY":"-1","VALUE":"-1","PRICE":"5280000"}],"BENEFIT": [{"KEY":"-1","VALUE":"-1","BENEFIT":[{"fbSeq":16,"fbTitle":"SAMSUNG","fbSubtitle":" 55인치 UHD TV","fbModel":"UN55RU7190FXKR","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573799850139_37b51.png","fbReal":"삼성-UHDTV"},{"fbSeq":21,"fbTitle":"LG","fbSubtitle":"360도 공기청정기 화이트","fbModel":"AS181DAW","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573800567288_8bfee.png","fbReal":"LG전자-퓨리케어"},{"fbSeq":23,"fbTitle":"SAMSUNG","fbSubtitle":"전기건조기 9KG","fbModel":"DV90M53B0QW","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1573800623528_3b3c7.png","fbReal":"삼성전자-전기건조기"},{"fbSeq":24,"fbTitle":"LG","fbSubtitle":"코드제로 A9","fbModel":"A958SA","fbPrice":"","fbPath":"/home/dmlifeweb/www/USERS/web/common/images/fairimage","fbSave":"1574212776825_7e7a1.png","fbReal":"LG전자-코드제로"}]}]}</div>
<a class="productBtn" href="/fair/66/index.do">자세히보기</a>
</div>
</div>
</div>
</div>
</li>
</ul>
<a href="#" class="btn_prev"><img src="/common/images/fairimage/product_arrow_left.png"></a>
<a href="#" class="btn_next"><img src="/common/images/fairimage/product_arrow_right.png"></a>
<div class="swiper-pagination"></div>
</div>
<div class="productCategoryTitle"style="color:#000000;">웨딩 상품</div>
<a class="productList" onclick="javascript:jQuery(this).productListShow('6', '1');">+ 전체상품보기</a>
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

<div class="productListModal">
<div class="productListContainer">
<div class="productListTitle" id="productListTitle">상품 전체보기</div>
<div class="productListClose"><a id="productListClose"></a></div>
<div id="productListHtml"></div>
</div>	
</div>
</div>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-154355799-1"></script>
<script>
window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}
gtag("js", new Date());
gtag("config", "UA-154355799-1");
</script>
</body>
</html>