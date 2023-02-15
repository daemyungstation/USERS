<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
	
<div class="view">
	<style type="text/css"> 
		.images__mapping {position:relative; width:750px; margin:0 auto;}
		.images__mapping img{ width: 100%;}
		@media all and (max-width: 750px) {
			.images__mapping {position:relative; width:100%;}
			    padding: 0px;
			}
		}
	</style>
	<div>
        <div class="images__mapping"><img src="/common/images/sub01/golfGuide_01.jpg"></div>
        <div class="images__mapping"><a href="/common/images/sub01/golfGuideDetail01.jpg" target="_blank"><img src="/common/images/sub01/golfGuide_02.jpg"></a></div>
        <div class="images__mapping"><a href="/common/images/sub01/golfGuideDetail02.jpg" target="_blank"><img src="/common/images/sub01/golfGuide_03.jpg"></a></div>
        <div class="images__mapping"><a href="/common/images/sub01/golfGuideDetail03.jpg" target="_blank"><img src="/common/images/sub01/golfGuide_04.jpg"></a></div>
        <div class="images__mapping"><a href="tel:1833-6093"><img src="/common/images/sub01/golfGuide_05.jpg"></a></div>
        <div class="images__mapping"><img src="/common/images/sub01/golfGuide_06.jpg?v1"></div>
	</div>
</div>
<script>
$(document).ready(function(){
	document.title = '골프서비스 개편 안내';
	$("#popup").css('background', 'none');
});

</script>
