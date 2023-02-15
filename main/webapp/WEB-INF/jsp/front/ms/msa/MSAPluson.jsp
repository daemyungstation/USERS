<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
	
	<div class="view">
		<style type="text/css">
			#wrapper { margin:0 auto; }
			#popup{position:relative; width:100%; background:none;}
			.images__mapping { position:relative; width:100%; max-width: 1140px; margin: 0 auto; text-align:center;}
			.images__mapping img{ width: 100%;height: 100%;}
			.images__mapping a { display:block; } 
			.images__mapping a:hover { background:rgba(0,0,0,0.6); transition:0.2s ease; }
			.images__mapping a:hover:before { content:''; position:absolute; top:50%; left:50%; width:20%; height:3px; margin:-5% 0 0 -10%; background:#fff; }
			.images__mapping a:hover:after { content:''; position:absolute; top:50%; left:50%; width:20%; height:3px; margin:-5% 0 0 -10%; background:#fff; transform:rotate(90deg);  }
			
			.images__mapping a.link01 {position:absolute;z-index:100; top: 22.17%; left: 1.4%; width: 31.7%; height: 11.75%;}
			.images__mapping a.link02 {position:absolute;z-index:100; top: 22.17%; left: 34.3%; width: 31.7%; height: 11.75%;}
			.images__mapping a.link03 {position:absolute;z-index:100; top: 22.17%; left: 67%; width: 31.7%; height: 11.75%;}
			
			.images__mapping a.link04 {position:absolute;z-index:100; top: 34.4%; left: 1.4%; width: 31.7%; height: 11.75%;}
			.images__mapping a.link05 {position:absolute;z-index:100; top: 34.4%; left: 34.3%; width: 31.7%; height: 11.75%;}
			.images__mapping a.link06 {position:absolute;z-index:100; top: 34.4%; left: 67%; width: 31.7%; height: 11.75%;}
			
			.images__mapping a.link07 {position:absolute;z-index:100; top: 46.6%; left: 1.4%; width: 31.7%; height: 11.75%;}
			.images__mapping a.link08 {position:absolute;z-index:100; top: 46.6%; left: 34.3%; width: 31.7%; height: 11.75%;}
			.images__mapping a.link09 {position:absolute;z-index:100; top: 46.6%; left: 67%; width: 31.7%; height: 11.75%;}
			
			.images__mapping a.link10 {position:absolute;z-index:100; top: 58.8%; left: 1.4%; width: 31.7%; height: 11.75%;}
			.images__mapping a.link11 {position:absolute;z-index:100; top: 58.8%; left: 34.3%; width: 31.7%; height: 11.75%;}
			.images__mapping a.link12 {position:absolute;z-index:100; top: 58.8%; left: 67%; width: 31.7%; height: 11.75%;}
			
			.images__mapping a.link13 {position:absolute;z-index:100; top: 71.06%; left: 1.4%; width: 31.7%; height: 11.75%;}
			.images__mapping a.link14 {position:absolute;z-index:100; top: 71.06%; left: 34.3%; width: 31.7%; height: 11.75%;}
			.images__mapping a.link15 {position:absolute;z-index:100; top: 71.06%; left: 67%; width: 31.7%; height: 11.75%;}
				
		</style>
		<div class="images__mapping">
	        <img alt="[메인] 만기연장_가전_플러스온" src="/common/images/sub01/pluson_new.jpg?v1">
			<a title="1. 삼성 60인치 TV" class="link01" href="/common/images/sub01/pluson01_new.jpg" target="_blank"></a>
			<a title="2. LG 55인치 TV" class="link02" href="/common/images/sub01/pluson02_new.jpg" target="_blank"></a>
			<a title="3. 삼성 비스포크 에어드레서" class="link03" href="/common/images/sub01/pluson03_new.jpg" target="_blank"></a>
			<a title="4. LG 트롬세탁기" class="link04" href="/common/images/sub01/pluson04_new.jpg" target="_blank"></a>
			<a title="5. 삼성 전기건조기 블랙" class="link05" href="/common/images/sub01/pluson05_new.jpg" target="_blank"></a>
			<a title="6. 삼성 전기건조기 화이트" class="link06" href="/common/images/sub01/pluson06_new.jpg" target="_blank"></a>
			<a title="7.삼성 양문형 냉장고" class="link07" href="/common/images/sub01/pluson07_new.jpg" target="_blank"></a>
			<a title="8. 삼성 김치 냉장고" class="link08" href="/common/images/sub01/pluson08_new.jpg" target="_blank"></a>
			<a title="9. LG 양문형 냉장고" class="link09" href="/common/images/sub01/pluson09_new.jpg" target="_blank"></a>
			<a title="10. LG 오브제 냉장고" class="link10" href="/common/images/sub01/pluson10_new.jpg" target="_blank"></a>
			<a title="11. 삼성 제트 청소기" class="link11" href="/common/images/sub01/pluson11_new.jpg" target="_blank"></a>
			<a title="12. 삼성 노트북 플러스2" class="link12" href="/common/images/sub01/pluson12_new.jpg" target="_blank"></a>
			<a title="13. LG 14인치 그램" class="link13" href="/common/images/sub01/pluson13_new.jpg" target="_blank"></a>
			<a title="14. LG 벽걸이 에어컨" class="link14" href="/common/images/sub01/pluson14_new.jpg" target="_blank"></a>
			<a title="15. 삼성 벽걸리 에어컨" class="link15" href="/common/images/sub01/pluson15_new.jpg" target="_blank"></a>
		</div>
	</div>
