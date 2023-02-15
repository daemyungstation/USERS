<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0">
<title>대명 아임레디</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/common/js/netfunnel.js" charset="UTF-8"></script>
<script type="text/javascript" src="/common/js/dmskin.js" charset="UTF-8"></script>
<script>
		function goAction(aid){
			//Netfunnel 자원 사용 요청
			NetFunnel_Action({action_id:aid,skin_id:''}, function(ev, ret){
				window.location.href = "/membership-service/contentsid/369/index.do";
			});
		}
</script>
</head>
<body>
	page is loading...
</body>

<script type="text/javascript">
	$(document).ready(function(){
		goAction('event');
	})
</script>
</html>