<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf"%>
				<c:set var="agreementForThirdParty" value="${agreementForThirdParty}" /><!-- 리조트예약 버튼 동의필요시 -->
				</div> <!--// subBody -->
			</div> <!--// cBody -->
			
			
			
			<!-- FOOTER HTML START -->
			<style>
			/* FOOTER CSS START */
			#footer { width: 100%; height: auto; border-top: 1px solid #ddd; background: #f7f7f7; z-index: 800; }
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
				#footer { height:auto; }
				#footer .footDiv { width:94%; margin: 0 auto; height:auto; }
				#footer .footDiv .fUtil { width:calc(100% - 400px); }
				#footer .footDiv .fUtil.fbtns { width:400px; }
				#footer .footDiv .fUtil a { height:auto; line-height:160%; }
				#footer .footDiv .awardMark { width:300px; }
				#footer .footDiv .copyRight { width:calc(100% - 310px); line-height: 160%; }
			}
			@media (max-width: 980px){
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
				#footer .footDiv { padding:20px 0; }
				#footer .footDiv .fUtil { float:none; margin:0; }
				#footer .footDiv .fUtil.fbtns { float:none; display:none; }
				#footer .footDiv .fUtil select { display:inline-block; }
				#footer .footDiv .awardMark { float:none; margin:10px auto; border:none; }
				#footer .footDiv .awardMark img:first-child { margin-left:0; }
				#footer .footDiv .awardMark a.webaward img { margin-left:10px; }
				footer .footDiv .copyRight { float:none; width:97%; margin-top:10px; }
			}
			/* FOOTER CSS END */
			</style>
			
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
			<!-- FOOTER HTML END -->
			
			
			
		</div> <!--// wrapper -->
		<div id="indi" style="display:none;">
   			<img src="/common/images/icon/ajax-loader2.gif" style="position:fixed; top:400px;">	
		</div>
		
		<c:choose>
			<c:when test="${fn:startsWith(currentUri, '/lifeway-service/')}">
				<div class="quick">
					<a href="/customer-center/personal-counseling/index.do" class="btnGry wide">1:1 상담신청</a>
<%--
					<c:if test="${fn:contains(currentUri, '/product-character/') or fn:contains(currentUri, '/normal-product/')}">
					<a href="/customer-center/join-counseling/index.do" class="btnGry wide">가입상담신청</a>
					</c:if>
					<c:if test="${fn:contains(currentUri, '/product-character/') or fn:contains(currentUri, '/normal-product/')}">
						<a href="/onlineproduct/normal/agree.do" class="btnRed">상품가입</a>					
					</c:if>
--%>
				</div>
			</c:when>
			<c:when test="${fn:startsWith(currentUri, '/membership-service/mobile-card/')}">
				<div class="quick" style="position:fixed; bottom:0px;">
					<a class="fr btnRed appli" href="/my-lifeway/membership-card/index.do">멤버십 카드 확인</a>
				</div>
			</c:when>
			<c:when test="${fn:startsWith(currentUri, '/change-service/')}">
				<div class="quick">
					<a class="fr btnRed appli" href="/my-lifeway/chage-service/request/index.do">하이브리드 서비스 신청</a>
				</div>
			</c:when>
			<c:when test="${fn:startsWith(currentUri, '/membership-service/resort/')}">
				<div class="quick" style="position:fixed; bottom:0px;">
					<a class="fr btnRed appli" href="/my-lifeway/member/resortagree/index.do">리조트 예약하기</a>
				</div>
			</c:when>
			<c:otherwise>
					
			</c:otherwise>
		</c:choose>
		
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
		jQuery(document).ready(function(){
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
		});
		//]]>
		</script>
	</body>
</html>