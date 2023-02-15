<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf"%>
<!doctype html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<title><c:if test="${not empty pageTitl}">${fn:replace(fn:replace(pageTitl, '@@', ''), '&lt;br&gt;', '')}</c:if> | 대명아임레디</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,maximum-scale=1.0,minimum-scale=1.0,target-densitydpi=medium-dpi" />
		<meta name="author" content="<fmt:message key="Globals.httpUrl" />" />
		<meta name="keywords" content="" />
		<meta name="description" content="라이프케어, 상조/웨딩/여행, 업계 최초 멤버십/결합혜택, 회원가입, 고객센터" />
		<meta name="format-detection" content="telephone=no" />
		<meta property="og:type" content="article" />
		<meta property="og:site_name" content="대명라이프웨이" />
		<meta property="og:title" content="대명라이프웨이" />
		<meta property="og:description" content="라이프케어, 상조/웨딩/여행, 업계 최초 멤버십/결합혜택, 회원가입, 고객센터" />
		<meta property="og:image" content="<fmt:message key="Globals.httpUrl" />/common/images/logo.gif" />

		<link rel="shortcut icon" href="/common/images/favicon_16.ico" type="image/x-icon" />
		<link rel="icon" href="/common/images/favicon_16.ico" type="image/x-icon" />		

		<link rel="stylesheet" href="/common/css/lifeway_style.css" />
		<link rel="stylesheet" href="/common/css/jquery-ui-1.8.16.custom.css" />
		<script type="text/javascript" src="/common/js/jquery-1.8.2.min.js"></script>
		
		<script type="text/javascript">
		$(document).ready(function(){
			//2020.02.25 : 매니저님 요청으로 주석처리
			/*			
			console.log('header2');
			var localUrl = window.location.href;
			var value = ['COUNSEL','HOMEPLUS','LGB2B','LGU','SMART','TLIFE','DMPOINTLIFE','BPOINTLIFE','DAEKYO','GSSUPER','LIVART','CHANGE','SERVICE02','ABROAD','DMMALL','HANSSEM','ONLIFECC','UMOBI1','UMOBI2','EZWEL','UMOBI3','SYRUP','JAUTOUR','SMARTMOBILE','UPLUSSAVE1','UPLUSSAVE2','UPLUSSAVE3','DMTOUR','MODETOUR','THEONE']; 
			for (var i=0; i<value.length; i++) {
				if(value[i] == localUrl.substring(localUrl.indexOf(value[i]), localUrl.lastIndexOf("/"))){
					if(value[i] == 'COUNSEL'){$("#gaCode").val('UA-112324253-4');
					} else if(value[i] == 'HOMEPLUS'){$("#gaCode").val('UA-112324253-5');
					} else if(value[i] == 'LGB2B'){$("#gaCode").val('UA-112324253-6');
					//} else if(value[i] == 'LGU'){$("#gaCode").val('UA-112324253-2');
					} else if(value[i] == 'SMART'){$("#gaCode").val('UA-112324253-1');
					} else if(value[i] == 'TLIFE'){$("#gaCode").val('UA-112324253-7');
					} else if(value[i] == 'DMPOINTLIFE'){$("#gaCode").val('UA-112324253-8');
					} else if(value[i] == 'BPOINTLIFE'){$("#gaCode").val('UA-112324253-9');
					} else if(value[i] == 'DAEKYO'){$("#gaCode").val('UA-112324253-10');
					} else if(value[i] == 'GSSUPER'){$("#gaCode").val('UA-112324253-11');
					} else if(value[i] == 'LIVART'){$("#gaCode").val('UA-112324253-12');
					} else if(value[i] == 'CHANGE'){$("#gaCode").val('UA-112324253-3');
					} else if(value[i] == 'SERVICE02'){$("#gaCode").val('UA-112324253-13');
					} else if(value[i] == 'ABROAD'){$("#gaCode").val('UA-112324253-14');
					} else if(value[i] == 'DMMALL'){$("#gaCode").val('UA-112324253-15');
					} else if(value[i] == 'HANSSEM'){$("#gaCode").val('UA-112324253-16');
					} else if(value[i] == 'ONLIFECC'){$("#gaCode").val('UA-112324253-17');
					} else if(value[i] == 'UMOBI1'){$("#gaCode").val('UA-112324253-18');
					} else if(value[i] == 'UMOBI2'){$("#gaCode").val('UA-112324253-19');
					} else if(value[i] == 'EZWEL'){$("#gaCode").val('UA-112324253-20');
					//} else if(value[i] == 'UMOBI3'){$("#gaCode").val('UA-112324253-21');
					} else if(value[i] == 'SYRUP'){$("#gaCode").val('UA-112324253-22');
					} else if(value[i] == 'JAUTOUR'){$("#gaCode").val('UA-112324253-23');
					} else if(value[i] == 'SMARTMOBILE'){$("#gaCode").val('UA-112324253-24');
					//} else if(value[i] == 'UPLUSSAVE1'){$("#gaCode").val('UA-112324253-25');
					//} else if(value[i] == 'UPLUSSAVE2'){$("#gaCode").val('UA-112324253-26');
					//} else if(value[i] == 'UPLUSSAVE3'){$("#gaCode").val('UA-112324253-27');
					} else if(value[i] == 'DMTOUR'){$("#gaCode").val('UA-112324253-28');
					} else if(value[i] == 'MODETOUR'){$("#gaCode").val('UA-112324253-29');
					} else if(value[i] == 'THEONE'){$("#gaCode").val('UA-112324253-30');
					}
				}
			}
			
			if($("#gaCode").val() != null){
				window.dataLayer = window.dataLayer || [];
				function gtag(){dataLayer.push(arguments);}
				gtag('js', new Date());
				gtag('config', $("#gaCode").val());	
			}
			*/
		});
		</script>
		<script async src="https://www.googletagmanager.com/gtag/js?id="+$("#gaCode").val()></script>
		<script type="text/javascript">
		//<![CDATA[
			
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
		<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>		
		<script type="text/javascript" src="/common/js/common.js"></script>
		<script type="text/javascript" src="/common/js/fnc.js"></script>
		<script type="text/javascript" src="/common/js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="/common/js/juqery.ez.validation-1.3.0.js"></script>
		<script type="text/javascript" src="/common/js/jquery.ez.controller-0.2.0.js"></script>	
		<script type="text/javascript" src="/common/js/jquery-ui.js"></script>
		<script type="text/javascript" src="/common/js/jquery.ui.datepicker-ko.js"></script>
		<script type="text/javascript" src="/common/js/userController.js"></script>
		<!--[if lt IE 9]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<!--네이버 연관채널 소스 -->
		<span itemscope="" itemtype="http://schema.org/Organization">
			<link itemprop="url" href="https://www.daemyungimready.com">
			<a itemprop="sameAs" href="https://www.facebook.com/imreadyDM"></a>
			<a itemprop="sameAs" href="https://www.instagram.com/daemyungimready"></a>
			<a itemprop="sameAs" href="https://www.youtube.com/channel/UC7fsSmcs6_llD6Cwo5HipXg"></a>
		</span>
<!--네이버 연관채널 소스 -->
	</head>
	<body data-url="<fmt:message key="Globals.httpUrl" />">
	<input type="hidden" name="gaCode" id="gaCode"/>
 		<div id="wrapper">
			<div id="header">
				<div class="headDiv">
					<h1><a href="/main/index.do"><img src="/common/images/logo.gif" alt="" /></a></h1>
				</div>
			</div> <!--// header -->
			
			<div id="cBody">
				<div class="subBody">