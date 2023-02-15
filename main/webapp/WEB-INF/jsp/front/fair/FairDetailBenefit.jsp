<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/jsp/include/el.jspf" %>
<c:if test="${fn:length(list) > 0}">
<div class="benefitTitle">결합혜택 선택</div>
<div class="benefitClose"><a href="#" id="benefitClose"></a></div>
<ul class="benefitContainer">
<c:forEach var="row" items="${list}" varStatus="status">
	<c:if test="${status.index % 2 ne 0}">
	<li class="benefitList left" data-seq="${row.fbSeq}" data-title="${row.fbTitle}" data-subtitle="${row.fbSubtitle}" data-model="${row.fbModel}" data-price="${row.fbPrice}" data-path="${row.fbImageWPath}" data-save="${row.fbImageWSaveNm}" data-real="${row.fbImageWRealNm}" onclick="javascript:jQuery(this).benefit_select();">
	</c:if>
	<c:if test="${status.index % 2 eq 0}">
	<li class="benefitList" data-seq="${row.fbSeq}" data-title="${row.fbTitle}" data-subtitle="${row.fbSubtitle}" data-model="${row.fbModel}" data-price="${row.fbPrice}" data-path="${row.fbImageWPath}" data-save="${row.fbImageWSaveNm}" data-real="${row.fbImageWRealNm}" onclick="javascript:jQuery(this).benefit_select();">
	</c:if>
	<div class="benefitLi">
	<div class="benefitList_img"><img src="/common/images/fairimage/${row.fbImageWSaveNm}" title="${row.fbImageWRealNm}"></div>
	<div class="benefitList_title">${row.fbTitle}</div>
	<div class="benefitList_subtitle">${row.fbSubtitle}</div>
	<div class="benefitList_desc">${row.fbModel}</div>
	</div>
	</li>
</c:forEach>
<li style="clear:both;"></li>
</ul>
</c:if>