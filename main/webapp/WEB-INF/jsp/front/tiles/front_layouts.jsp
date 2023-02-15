<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertAttribute name="header"/>

<tiles:insertAttribute name="lnb"/>

<div id="subCon">
	<h2>
		${fn:replace(fn:replace(pageTitl, '@@', ''), '&lt;br&gt;', '')}
	</h2>
	<div class="path">
		<span class="home"><img src="/common/images/icon/path_home.gif" alt="" /></span>
		<c:forEach var="indicator" items="${parntMenuList}" varStatus="status">
			<span>${fn:replace(fn:replace(indicator.menuNm, '@@', ''), '&lt;br&gt;', '')}</span>
		</c:forEach>
	</div>
	<tiles:insertAttribute name="content"/> 
</div>

<tiles:insertAttribute name="footer"/>