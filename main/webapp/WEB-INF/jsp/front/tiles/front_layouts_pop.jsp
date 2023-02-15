<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertAttribute name="header"/>

<div id="popup">
	<tiles:insertAttribute name="content"/>
</div>

<tiles:insertAttribute name="footer"/>