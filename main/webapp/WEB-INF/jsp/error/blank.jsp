<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><fmt:message key="Globals.SITENAME" /></title>
		<script type="text/javascript">
		//<![CDATA[
			function init()
			{
				<c:if test="${not empty msg}">
					alert("${msg}");
				</c:if>
				location.href = "${url}";
			}
		//]]>
		</script>
	</head>
	<body onload="init();">
	
	</body>
</html>