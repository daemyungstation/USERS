<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf"%>
<!doctype html>
<html lang="ko">
	<head>		
		<meta charset="utf-8" />
		<title><c:if test="${not empty pageTitl}">${fn:replace(fn:replace(pageTitl, '@@', ''), '&lt;br&gt;', '')}</c:if> | 대명아임레디</title>
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
		<link rel="stylesheet" href="/common/css/jquery-ui-1.8.16.custom.css" />
		<script type="text/javascript" src="/common/js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="https://sso.daemyungimready.com/api/sso"></script>

		<script type="text/javascript">
			console.log('header1');
			if (document.location.hostname == 'www.daemyunglifeway.com') {
				document.location.href = "https://www.daemyungimready.com" + document.location.pathname;
			}

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
		<!-- script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ERHdYJ8MMP9mV7JNRDm9&submodules=geocoder"></script -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14b5e80fd9d571a8850e60edb13f4e89"></script>
		<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script type="text/javascript" src="/common/js/common.js"></script>
		<script type="text/javascript" src="/common/js/fnc.js"></script>
		<script type="text/javascript" src="/common/js/jquery-barcode.js"></script>
		<script type="text/javascript" src="/common/js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="/common/js/juqery.ez.validation-1.3.0.js"></script>
		<script type="text/javascript" src="/common/js/jquery.ez.controller-0.2.0.js"></script>	
		<script type="text/javascript" src="/common/js/jquery-ui.js"></script>
		<script type="text/javascript" src="/common/js/jquery.ui.datepicker-ko.js"></script>
		<script type="text/javascript" src="/common/js/userController.js?v1"></script>
		<script type="text/javascript" src="/common/js/sms.js"></script>
		<!--  20200701 넷퍼넬 삭제요청 -->
		<!--  <script type="text/javascript" src="/common/js/netfunnel.js"></script> -->
		<!--  <script type="text/javascript" src="/common/js/dmskin.js"></script> -->
		<script type="text/javascript">
		//<![CDATA[
			
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
		//]]>

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
		<!-- A Square|Site Analyst WebLog for Emission Script v1.1 2017-0630 수정
		<script type="text/javascript" src="/common/js/logAnalysis.js"></script>
		<noscript><img src="//ngc17.nsm-corp.com/?uid=CS2B40401917456&je=n&" border=0 width=0 height=0></noscript>
		//A Square|Site Analyst WebLog for Emission Script v1.1 2017-0630 수정-->
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
		<c:set var="agreementForThirdParty" value="${agreementForThirdParty}" /><!-- 리조트예약 버튼 동의필요시 -->
 		<div id="wrapper">
			<div id="header">
				<div class="headDiv">
					<h1><img id = netFunnel src="/common/images/logo.gif" alt="" style="cursor:pointer"/></h1>
 					<script type="text/javascript">
						function goAction(aid){
							//Netfunnel 자원 사용 요청
							//20200701 넷퍼넬 삭제요청
						  	//NetFunnel_Action({action_id:aid,skin_id:''}, function(ev, ret){
							window.location.href = "/main/index.do";
							//});
						}
						$("#netFunnel").click(function() {
							goAction('main');
						});
					</script>

					<div class="util">
						<!-- a href="/my-lifeway/membership-card/index.do" class="mbcardBtn">멤버십</a -->
						<c:choose>
							<c:when test="${agreementForThirdParty eq 'Y'}">
								<a href="https://www.bucketmarket.co.kr/?&utm_source=iamready_hp&utm_medium=display&utm_campaign=iamready&utm_term=June&utm_content=direct_banner" class="mbcardBtn mbResortBtn2 btnResortN" target="_blank">다이렉트 가입</a>
							</c:when>
							<c:otherwise>
								<a href="https://www.bucketmarket.co.kr/?&utm_source=iamready_hp&utm_medium=display&utm_campaign=iamready&utm_term=June&utm_content=direct_banner" class="mbcardBtn mbResortBtn2 btnResortN" target="_blank">다이렉트 가입</a>
							</c:otherwise>
						</c:choose>
						<a href="javascript:goShop();" class="mbcardBtn">회원몰</a>
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
									<a href="${egov:nvl(gnb.userLink, 'javascript:')}" target="${egov:decode(gnb.userWndYn, 'Y', '_blank', '_self')}" class="oneD">${fn:replace(gnb.menuNm, '&lt;br&gt;', '<br>')}</a>
									<div class="twoD ${fn:split(cdnlNo, ',')[gnbNo]}">
								</c:if>
								
								<c:if test="${gnb.dpth eq 3}">
									<a href="${egov:nvl(gnb.userLink, 'javascript:')}" target="${egov:decode(gnb.userWndYn, 'Y', '_blank', '_self')}">${fn:replace(gnb.menuNm, '&lt;br&gt;', '<br>')}</a>
								</c:if>
							</c:if>
						</c:forEach>
						</div>
					</div>
					
					<div class="mbBtns">
						<c:choose>
							<c:when test="${agreementForThirdParty eq 'Y'}">
								<a href="https://www.bucketmarket.co.kr/?&utm_source=iamready_hp&utm_medium=display&utm_campaign=iamready&utm_term=June&utm_content=direct_banner" class="mbcardBtn2 mbResortBtn2 btnResortN" target="_blank">다이렉트 가입</a>
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
			</div> <!--// header -->
			
			<p class="dimdBg"></p>
			
			<!-- 모바일 gnb -->
			<div id="gnbM">
				<div class="mUtil">
					<c:choose>
						<c:when test="${not empty sessionScope.userLgnMap}">
							<a href="/my-lifeway/join-product-information/join-details/index.do" class="myInfo">나의 FFFFFFFFFFFFFFF아임레디</a>
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
					<c:set var="mGnbCnt" value="${fn:length(menuList)}" />
					
					<c:forEach var="mGnb" items="${menuList}" varStatus="status">
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
			<div id="cBody">
				<!-- 테블릿 인디케이터 2016-03-17 -->
				<div id="mobileLnb">
					<div class="mLnbDiv">
						<a href="/" class="home"><img src="/common/images/icon/path_home.gif" alt="" /></a>
						<c:forEach var="tIndicator" items="${parntMenuList}" varStatus="status1">
							<a href="javascript:" class="lnbOne<c:if test="${status1.last}"> cur</c:if>">
								${fn:replace(fn:replace(tIndicator.menuNm, '@@', ''), '&lt;br&gt;', '')}
								<img src="/common/images/icon/m_lnb_icon.gif" alt="" />
							</a>
							<div class="lnbTwo" style="left:${49 + (199 * status1.index)}px;">
								<c:forEach var="dpthList" items="${tIndicator.dpthList}" varStatus="status2">
									<a href="${egov:nvl(dpthList.userLink, 'javascript:')}" target="${egov:decode(dpthList.userWndYn, 'Y', '_blank', '_self')}">${fn:replace(fn:replace(dpthList.menuNm, '@@', ''), '&lt;br&gt;', '')}</a>			
								</c:forEach>
							</div> 
						</c:forEach>
						<p class="clearB"></p>
					</div>
				</div>
				<!-- //테블릿 인디케이터 2016-03-17 -->
				
				<!-- 모바일 서브타이틀 -->
				<div id="mobileSub">
					<a href="javascript:history.back();" class="mPrv"><img src="/common/images/btn/mobile_prepage.gif" alt="" /></a>
					<h2>${fn:replace(fn:replace(pageTitl, '@@', ''), '&lt;br&gt;', '')}</h2>
					<a href="javascript:" class="mNxt"><img src="/common/images/btn/mobile_nxtpage.gif" alt="" /></a>
				</div>
				<!-- //모바일 서브타이틀 -->

				<!-- 모바일 서브메뉴 2016-03-22 -->
				<div class="mobileSubmenu">
					<c:forEach var="mLnb" items="${lnbMenuList}" begin="1" varStatus="status">
						<c:if test="${pageParntSeq eq mLnb.parntSeq}">
							<a href="${egov:nvl(mLnb.userLink, 'javascript:')}" target="${egov:decode(mLnb.userWndYn, 'Y', '_blank', '_self')}">
								${fn:replace(fn:replace(mLnb.menuNm, '@@', ''), '&lt;br&gt;', '<br />')}
								<c:if test="${mLnb.kwrd eq 'NEW'}">
							  		<span class="newIcon"><img src="/common/images/icon/m_lnb_new_icon.gif" width="36px" height="16px" alt="NEW" /></span>
							  	</c:if>
								<c:if test="${mLnb.kwrd eq 'RENEWAL'}">
									<span class="newIcon"><img src="/common/images/icon/lnb_renewal_icon.gif" width="45px" height="16px" alt="RENEWAL" /></span>
								</c:if>
							</a>
						</c:if>
					</c:forEach>
				</div>
				<!-- //모바일 서브메뉴 2016-03-22 -->
				
				<div class="subBody">