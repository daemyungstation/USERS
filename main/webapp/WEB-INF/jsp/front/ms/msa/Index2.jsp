<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
	
	<div class="view">
		<style type="text/css"> 
			#popup{position:relative; width:100%; repeat-x 0 0; background-size:0px 0px;}
			.images__mapping {position:relative;max-width: 1140px;}
			.images__mapping img{ width: 100%;height: 100%; padding: 0px 23.5%;}
			.images__mapping a { display:block; } 
			.images__mapping a:hover { background:rgba(0,0,0,0.6); transition:0.2s ease; }
			.images__mapping a:hover:before { content:''; position:absolute; top:50%; left:50%; width:20%; height:3px; margin:-5% 0 0 -10%; background:#fff; }
			.images__mapping a:hover:after { content:''; position:absolute; top:50%; left:50%; width:20%; height:3px; margin:-5% 0 0 -10%; background:#fff; transform:rotate(90deg);  }
			
			.images__mapping a.link01 {position:absolute;z-index:100; top: 20.55%; left: 26%; width: 95%; height: 9.45%;}
			.images__mapping a.link02 {position:absolute;z-index:100; top: 31.97%; left: 26%; width: 95%; height: 9.4%;}
			.images__mapping a.link03 {position:absolute;z-index:100; top: 43.55%; left: 26%; width: 95%; height: 8.8%;}
			.images__mapping a.link04 {position:absolute;z-index:100; top: 54.45%; left: 26%; width: 95%; height: 8.8%;}
			.images__mapping a.link05 {position:absolute;z-index:100; top: 65.33%; left: 26%; width: 95%; height: 8.8%;}
			.images__mapping a.link06 {position:absolute;z-index:100; top: 76.05%; left: 26%; width: 95%; height: 8.8%;}
			
			@media all and (max-width: 840px) {
				.images__mapping img {
				    padding: 0px;
				}
				
			.images__mapping a.link01 {position:absolute;z-index:100;top: 19.4%; left: 2.4%; width: 95%; height: 10.6%;}
			.images__mapping a.link02 {position:absolute;z-index:100;top: 30.8%; left: 2.4%; width: 95%; height: 10.6%;}
			.images__mapping a.link03 {position:absolute;z-index:100;top: 42.4%; left: 2.4%; width: 95%; height: 10%;}
			.images__mapping a.link04 {position:absolute;z-index:100;top: 53.3%; left: 2.4%; width: 95%; height: 10%;}
			.images__mapping a.link05 {position:absolute;z-index:100;top: 64.1%; left: 2.4%; width: 95%; height: 10%;}
			.images__mapping a.link06 {position:absolute;z-index:100;top: 74.9%; left: 2.4%; width: 95%; height: 10%;}
			}
		</style>
		<div class="images__mapping">
	        <img alt="대명아임레디 가전 하이브리드 서비스. 고객님께서 기존 가입하신 상조서비스 상품을 가전제품 패키지 상품으로 바꾸어 제공해드리는 서비스입니다." src="/editor/2020/9/EDITOR_202009150928490890.jpg">
			<a title="삼성 그랑데 세탁기/건조기세트 + 로봇/무선 청소기 세트" class="link01" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5f57098c-74dd-6b8b7509.jpg" target="_blank"></a>
			<a title="삼성 양문형 냉장고+LG 트롬 건조기 + 무선청소기" class="link02" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5f571430-4fa4-75e529b2.jpg" target="_blank"></a>
			<a title="LG 75인치TV(사운드바포함)+로봇/무선청소기" class="link03" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5f571573-d988-783a1d48.jpg" target="_blank"></a>
			<a title="LG 김치냉장고/냉장고 세트+무선청소기" class="link04" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5f57162c-7a61-6906b44e.jpg" target="_blank"></a>
			<a title="삼성 비스포크 냉장고+SK매직 건조기 +무선청소기" class="link05" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5f5716fd-f378-67ac2d7a.jpg" target="_blank"></a>
			<a title="삼성 비스포크 김치냉장고+공기청정기 +무선청소기" class="link06" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5f571782-f73c-ab20d1f2.jpg" target="_blank"></a>
		</div>
	</div>
