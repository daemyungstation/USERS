<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

<form name="frm" method="POST" action="http://210.114.225.219/mobiledev/ceremonylist.php">
	<input type="hidden" name="empleNo" value="${empleNo}" />
	<input type="hidden" name="branchkind" value="${branchkind}" />
	<input type="hidden" name="empno" value="${empno}" />
	<input type="hidden" name="stdate" value="${stdate}" />
	<input type="hidden" name="chk_cp" value="${chkvalue}" />
	<input type="hidden" name="datepicker" value="${datepicker}" />
	<input type="hidden" name="datepicker2" value="${datepicker2}" />
</form>

<script>document.frm.submit();</script>