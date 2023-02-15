<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="location">
							<div id="map" class="map">
								
							</div>

							<dl>
								<dt class="one">회사명</dt>
								<dd>
									(주)대명스테이션
								</dd>
							</dl>
							<dl>
								<dt class="two">주소</dt>
								<dd>
									05836 서울시 송파구 법원로 135 대명타워
								</dd>
							</dl>
							<dl>
								<dt class="thr">연락처</dt>
								<dd>
									<span class="type1">1588 - 8511</span>
									<span class="type2">02 - 2222 - 7699</span>
								</dd>
							</dl>
							<dl>
								<dt class="fou">홈페이지</dt>
								<dd>
									<a href="http://www.daemyungimready.com">www.daemyungimready.com</a>
								</dd>
							</dl>
							<dl>
								<dt class="fiv">오시는 방법</dt>
								<dd>
									<span class="type3">문정역 4번출구</span>
									<span class="type3">가락시장역 방향 250m 직진</span>
									<span>올림픽훼밀리타운 사거리 좌회전 약 300m 지점</span>
								</dd>
							</dl>
						</div>
						
<!--
	<script type="text/javascript">
		/*var map = new naver.maps.Map('map', {
			center: new naver.maps.LatLng(37.4869999, 127.1183152),
			zoom: 10,
			mapTypeId: naver.maps.MapTypeId.NORMAL
		});*/
		var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(37.4869999, 127.1183152),
		    zoom: 12
		});
		
		var marker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(37.4869999, 127.1183152),
		    map: map
		});
	</script>
-->
	<!-- script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14b5e80fd9d571a8850e60edb13f4e89"></script -->
	<script type="text/javascript">
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new daum.maps.LatLng(37.4869999, 127.1183152), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

		var marker = new daum.maps.Marker({
		    map: map,
		    position: new daum.maps.LatLng(37.4869999, 127.1183152)
		});
	</script>
