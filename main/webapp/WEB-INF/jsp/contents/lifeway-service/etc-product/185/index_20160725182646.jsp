<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<p class="allyTxt">대명라이프웨이는 고객님께 더 많은 혜택을 돌려드리자는 생각에서 출발해, 국내 굴지의 기업들과 혁신적 제휴 모델을 선보입니다.<br>대명라이프웨이의 결합상품을 만나보세요.</p>
						<p class="allyTxt2 mt15">각 상품별로 제공 혜택과 가입 방법이 상이하니, 내용 확인 후 이용하시기 바랍니다.</p>

						<div class="medalDiv mt20">
							<p><img src="/common/images/icon/medal_icon.gif" alt=""></p>
							<div>
								<p><span class="red">업계 최초</span>, 결합상품 출시</p>
								<p>라이프서비스와 생활 / 가전 서비스 결합으로</p>
								<p>고객 여러분께 더 많은 혜택을 드립니다.</p>
								<!--<p><span class="red">업계 최다</span>, 제휴 상품 출시</p>
								<p><span class="red">업계 최장</span>, 노하우 보유</p>-->
							</div>
						</div>

						<div class="joinIntro mt20">
							<a href="javascript:" class="join1">
								<span class="logo"><img src="/common/images/icon/join_logo.png" alt="SAMSUNG"></span>
								<span class="tit">삼성 디지털 프라자</span>
								<span class="txt">삼성 디지털 프라자와<br>대명 라이프웨이가 만났다!</span>
								<span class="over">
									<span class="bg"></span>
									<span>전자제품 지원 혜택과 함께<br>필요한 서비스를 원하는 시점에 골라 쓰는<br>'대명 스마트라이프'</span>
									<span class="bottomTxt">대명 스마트라이프 429<br>대명 스마트라이프 297<br>대명 스마트라이프 Gold</span>
								</span>
							</a>
							
							<a href="javascript:" class="join2">
								<span class="logo"><img src="/common/images/icon/join_logo2.png" alt="LG"></span>
								<span class="tit">대명 L라이프</span>
								<span class="txt">대명라이프웨이와 LG 전자의 만남<br>'대명 L라이프'</span>
								<span class="over">
									<span>LG 가전제품 + 고품격 상조서비스<br>+ 대명라이프웨이 멤버십 서비스를<br>한번에 누리세요!</span>
									<span class="bottomTxt">대명 L 라이프</span>
								</span>
							</a>
							
							<!--<a href="javascript:" class="join3">
								<span class="logo"><img src="/common/images/icon/join_logo3.png" alt="U plus" /></span>
								<span class="tit">LG U+</span>
								<span class="txt">LG U+ 인터넷 / IPTV / 집전화 등 유선서비스부터<br />모바일까지 모든 통신 상품 요금 지원!</span>
								<span class="over">
									<span>오직 U+에서만!<br />대명 U라이프<br />399 탄생!</span>
									<span class="bottomTxt">대명 U라이프  399 (대명 U-Life 399)</span>
								</span>
							</a>-->
							
							<a href="javascript:" class="join4">
								<span class="logo"><img src="/common/images/icon/join_logo4.png" alt="GS 25"></span>
								<span class="tit">GS 25</span>
								<span class="txt">상조 ？ 레저 ？ 여행 ？ 웨딩 ？ 문화공연까지<br>한 번에 즐기는 멤버십 서비스!</span>
								<span class="over">
									<span>대명 프리미엄 라이프<br>G 499가입으로 LG 가전제품<br>특별 혜택 받자!</span>
									<span class="bottomTxt">대명 프리미엄 라이프 G 499</span>
								</span>
							</a>
						</div>

		<script>
			jQuery(document).ready(function(){
				var joinHeigh = jQuery(".joinIntro a > span.over").innerHeight();
				jQuery(".joinIntro a").each(function(e){
					jQuery(this).hover(function(){
						jQuery(this).children("span").not("span.over").stop().fadeOut(200);
						jQuery(this).children("span.over").stop().animate({top:0},300);
					},function(){
						jQuery(this).children("span").not("span.over").fadeIn(400);
						jQuery(this).children("span.over").stop().animate({top:joinHeigh},300);
					})
				})
			})
		</script>

