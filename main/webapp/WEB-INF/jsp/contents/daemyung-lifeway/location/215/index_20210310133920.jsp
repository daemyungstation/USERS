<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="location">
							<div class="map" id="map">
								
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
									서울지점(우편수신처) : 서울시 강남구 강남대로 624, 14층(신사동, 아이씨티타워)<p>
                                                                        본점 : 강원도 홍천군 서면 한치골길 262 (소노호텔앤리조트, 비발디파크)
								</p></dd>
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
									<a href="https://www.daemyungimready.com">https://www.daemyungimready.com</a>
								</dd>
							</dl>
							<dl>
								<dt class="fiv">오시는 방법</dt>
								<dd>
									<span class="type3">신사역 6번 출구</span>
									<span class="type3">70m 직진</span>
								</dd>
							</dl>
						</div>


<script type="text/javascript">
                var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                var options = { //지도를 생성할 때 필요한 기본 옵션
                        center: new daum.maps.LatLng(37.51741143740239, 127.0195633933628), //지도의 중심좌표.
                        level: 3 //지도의 레벨(확대, 축소 정도)
                };
                var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

                var marker = new daum.maps.Marker({
                    map: map,
                    position: new daum.maps.LatLng(37.51741143740239, 127.0195633933628)
                });
        </script>

