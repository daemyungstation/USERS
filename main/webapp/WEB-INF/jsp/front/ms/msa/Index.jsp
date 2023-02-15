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
			
			.images__mapping a.link01 {position:absolute;z-index:100;top: 13.2%;left: 26%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link02 {position:absolute;z-index:100;top: 13.2%;left: 73.8%;width:47.8%;height: 12.6%;}
			.images__mapping a.link03 {position:absolute;z-index:100;top: 25.77%;left: 26%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link04 {position:absolute;z-index:100;top: 25.77%;left: 73.8%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link05 {position:absolute;z-index:100;top: 38.35%;left: 26%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link06 {position:absolute;z-index:100;top: 38.35%;left: 73.8%;width:47.8%;height: 12.6%;}
			.images__mapping a.link07 {position:absolute;z-index:100;top: 50.97%;left: 26%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link08 {position:absolute;z-index:100;top: 50.97%;left: 73.8%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link09 {position:absolute;z-index:100;top: 63.51%;left: 26%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link10 {position:absolute;z-index:100;top: 63.51%;left: 73.8%;width:47.8%;height: 12.6%;}
			.images__mapping a.link11 {position:absolute;z-index:100;top: 76.11%;left: 26%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link12 {position:absolute;z-index:100;top: 76.11%;left: 73.8%;width: 47.8%;height: 12.6%;}
			
			@media all and (max-width: 840px) {
				.images__mapping img {
				    padding: 0px;
				}
				
			.images__mapping a.link01 {position:absolute;z-index:100;top: 13.2%;left: 2.4%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link02 {position:absolute;z-index:100;top: 13.2%;left: 50.2%;width:47.8%;height: 12.6%;}
			.images__mapping a.link03 {position:absolute;z-index:100;top: 25.77%;left: 2.4%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link04 {position:absolute;z-index:100;top: 25.77%;left: 50.2%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link05 {position:absolute;z-index:100;top: 38.35%;left: 2.4%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link06 {position:absolute;z-index:100;top: 38.35%;left: 50.2%;width:47.8%;height: 12.6%;}
			.images__mapping a.link07 {position:absolute;z-index:100;top: 50.97%;left: 2.4%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link08 {position:absolute;z-index:100;top: 50.97%;left: 50.2%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link09 {position:absolute;z-index:100;top: 63.51%;left: 2.4%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link10 {position:absolute;z-index:100;top: 63.51%;left: 50.2%;width:47.8%;height: 12.6%;}
			.images__mapping a.link11 {position:absolute;z-index:100;top: 76.11%;left: 2.4%;width: 47.8%;height: 12.6%;}
			.images__mapping a.link12 {position:absolute;z-index:100;top: 76.11%;left: 50.2%;width: 47.8%;height: 12.6%;}
			
			}
		</style>
		<div class="images__mapping">
	        <img alt="대명아임레디 가전전환 서비스. 고객님께서 기존 가입하신 상조서비스 상품을 가전제품으로 바꾸어 제공해드립니다." src="/editor/2020/6/lg.jpg">
			<a title="LG UHD TV + LG 통돌이" class="link01" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5eeb295c-b225-00f0176c.jpg" target="_blank"></a>
			<a title="LG UHD TV + LG 코드제로" class="link02" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5eec5f1a-0ac0-6bfd6e0c.jpg" target="_blank"></a>
			<a title="LG 에어콘 + LG 통돌이" class="link03" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5eec5f89-d9c9-4bcc2c99.jpg" target="_blank"></a>
			<a title="LG 얼음 정수기 + LG 통돌이" class="link04" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5eec60a5-76b3-58ee6995.jpg" target="_blank"></a>
			<a title="LG 얼음 정수기 + LG 코드제로" class="link05" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5eec6053-7804-eb6d96b0.jpg" target="_blank"></a>
			<a title="LG 에어콘 + LG 코드제로" class="link06" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5eec6000-149f-a8764495.jpg" target="_blank"></a>
			<a title="LG 양문형 냉장고, LG 김치냉장고 + LG 통돌이" class="link07" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5eec6119-725f-25e2fffb.jpg" target="_blank"></a>
			<a title="LG 양문형 냉장고, LG 김치냉장고 + LG 코드제로" class="link08" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5eec61a1-81de-34cf7929.jpg" target="_blank"></a>
			<a title="LG 트롬 스타일러 + LG 트롬 건조기" class="link09" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5eec6311-667f-66df2a27.jpg" target="_blank"></a>
			<a title="LG 트롬 스타일러 + LG 트윈워시" class="link10" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5eec638a-f064-e14dd548.jpg" target="_blank"></a>
			<a title="LG 17인치그램, LG 휴대공기청정기 + LG 통돌이" class="link11" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5eec6228-d47a-e3a0940f.jpg" target="_blank"></a>
			<a title="LG 17인치그램, LG 휴대공기청정기 + LG 코드제로" class="link12" href="http://image.imreadymall.com/data/dlwmall_data/images/upfile//0001-d3a931fd-5eec6282-fca0-6fe695fd.jpg" target="_blank"></a>
		</div>
	</div>