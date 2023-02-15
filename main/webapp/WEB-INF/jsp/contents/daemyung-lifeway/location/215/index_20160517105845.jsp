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
									<a href="http://www.daemyunglifeway.com">www.daemyunglifeway.com</a>
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
						
						<script type="text/javascript">
							jQuery(document).ready(function(){
								var oPoint = new nhn.api.map.LatLng(37.4869999, 127.1183152);
								nhn.api.map.setDefaultPoint("LatLng");
								oMap = new nhn.api.map.Map("map", {
									point : oPoint,
									zoom : 12,
									enableWheelZoom : true,
									enableDragPan : true,
									enableDblClickZoom : false,
									mapMode : 0,
									activateTrafficMap : false,
									activateBicycleMap : false,
									minMaxLevel : [ 1, 14 ],
									size : new nhn.api.map.Size(948, 413)
								});

								var oSize = new nhn.api.map.Size(28, 37);
								var oOffset = new nhn.api.map.Size(14, 37);
								var oIcon = new nhn.api.map.Icon("//static.naver.com/maps2/icons/pin_spot2.png", oSize, oOffset);
								
								var oMarker = new nhn.api.map.Marker(oIcon, { title : "마커 : " + oPoint.toString() });
								oMarker.setPoint(oPoint);
								oMap.addOverlay(oMarker);

								jQuery(window).resize(function(){
									oMap.setSize(new nhn.api.map.Size(jQuery("#subCon").width(), 413));
								});
								
								jQuery(window).resize();
							});
						</script>

