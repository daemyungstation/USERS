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
	<div class="images__mapping">
        <img alt="골프서비스 개편 안내" src="/common/images/sub01/golfinfo-a.jpg">
	</div>
</div>
<script>
$(document).ready(function(){
	document.title = '골프서비스 개편 안내';
	$("#popup").css('background', 'none');
});

</script>
