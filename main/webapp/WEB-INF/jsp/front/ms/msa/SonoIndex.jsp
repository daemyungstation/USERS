<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
	
<div class="view">
	<style type="text/css"> 
			#popup{position:relative; width:100%; repeat-x 0 0; background-size:0px 0px;}
			.images__mapping {position:relative;max-width: 1140px;}
			.images__mapping img{ width: 100%;height: 100%; padding: 0px 32.5%;}
			.images__mapping a { display:block; } 
			.images__mapping a:hover { background:rgba(0,0,0,0.6); transition:0.2s ease; }
			.images__mapping a:hover:before { content:''; position:absolute; top:50%; left:50%; width:20%; height:3px; margin:-5% 0 0 -10%; background:#fff; }
			.images__mapping a:hover:after { content:''; position:absolute; top:50%; left:50%; width:20%; height:3px; margin:-5% 0 0 -10%; background:#fff; transform:rotate(90deg);  }
			
			.images__mapping a.link01 {position:absolute;z-index:100;top: 27.5%;left: 35.8%;width: 45.53%;height: 19.5%;}
			.images__mapping a.link02 {position:absolute;z-index:100;top: 27.5%;left: 84%;width: 45.53%;height: 19.5%;}
			.images__mapping a.link03 {position:absolute;z-index:100;top: 48.15%;left: 35.8%;width: 45.53%;height: 19.5%;}
			.images__mapping a.link04 {position:absolute;z-index:100;top: 48.15%;left: 84%;width: 45.53%;height: 19.5%;}
			
			@media all and (max-width: 840px) {
				.images__mapping img {
				    padding: 0px;
				}
				.images__mapping a.link01 {position:absolute;z-index:100;top: 27.6%;left: 3.2%;width: 45.52%;height: 19.45%;}
				.images__mapping a.link02 {position:absolute;z-index:100;top: 27.6%;left: 51.6%;width: 45.52%;height: 19.45%;}
				.images__mapping a.link03 {position:absolute;z-index:100;top: 48.17%;left: 3.2%;width: 45.52%;height: 19.45%;}
				.images__mapping a.link04 {position:absolute;z-index:100;top: 48.17%;left: 51.6%;width: 45.52%;height: 19.45%;}
			}
		</style>

	<div class="images__mapping">
        <img alt="" src="/common/images/sub01/sonoGuide_02.jpg">
        <a title="" class="link01" href="/common/images/sub01/sonoGuideDetail01.jpg" target="_blank"></a>
        <a title="" class="link02" href="/common/images/sub01/sonoGuideDetail02.jpg" target="_blank"></a>
        <a title="" class="link03" href="/common/images/sub01/sonoGuideDetail03.jpg" target="_blank"></a>
        <a title="" class="link04" href="/common/images/sub01/sonoGuideDetail04.jpg" target="_blank"></a>
	</div>
</div>




<script>
$(document).ready(function(){
	document.title = '소노이벤트 안내';
	$("#popup").css('background', 'none');
});

</script>
