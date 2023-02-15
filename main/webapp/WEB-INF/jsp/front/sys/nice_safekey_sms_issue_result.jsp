<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf"%>
<!-- 
	######################################################################
	파일명 		:	nice_safekey_sms_issue_result.jsp.jsp
	프로그램 명 : 	나이스 평가정보 세이프키 발급 결과
	설명		: 	회원이 휴대폰에서 세이프키 발급을 위한 행위를 한 경우에 이에 대한 상태 통보
	작성자		: 	정출연
	작성일		:	2016.09.27
	수정일자	 			수정자				수정내용
	=====================================================================
	2016.09.27				정출연				최초작성
	######################################################################
-->
<style type="text/css">
#wrapper {
	margin: 0px;
	padding: 0px;
	background-color: #ffffff;
};

#popup {
	margin: 0px;
	padding: 0px;
	background-color: #ffffff;
};
</style>
				<div id="div_title" style="width: 99%; padding: 15px; text-align: center; background-color:#3366ff; color:#fff;">
			    	<strong>나이스 평가정보 세이프키 발급 결과</strong>
			    </div>
			    
			    <div id="div_message" style="width: 99%; margin: 10px; text-align: left; background-color:#fff;">
			
			<c:choose>
			    <c:when test="${result.success_yn eq 'Y'}">
			        <!-- <c:out value="${result.return_msg}"/> -->
			        세이프키가 정상적으로 발급되었습니다.  
			    </c:when>  
			    <c:when test="${result.success_yn eq 'N'}">
			        세이프키가 정상적으로 발급되지 않았습니다. (<c:out value="${result.error_msg}"/>)
			    </c:when>
			    <c:otherwise>  
			        <c:out value="${result.return_msg}"/>  
			    </c:otherwise>
			</c:choose>	
			
			    </div>
			    
			    <!--
			    <div id="div_button_bar" style="width: 99%; margin: 10px; text-align: center; background-color:#fff;">
			    <button type="button" name="btn_close" onclick="fn_close();">확인</button>
			    </div>
			    -->
			
<script language="javascript">
function fn_close() {
	/*
	window.open("about;blank", "_self");
	opener = window;
	window.close();
	*/
	
	window.close();
}
</script>