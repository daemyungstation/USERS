<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/el.jspf"%>

<style>
.productAllNone { color:#ffffff;  font-size:20px; letter-spacing: -2px; text-align:center; line-height:56px; }
.productAllLi { position:relative; width:320px; margin-top:20px; margin-left:0px; }
.productAllLi .productAllImage { width:450px; height:350px; background-size:cover; }
.productAllLi .productAllImage .productAllLabel { position:relative; text-align:left; padding:10px; box-sizing:border-box; display:none; }
.productAllLi .productAllImage .productAllLabel .productAllLabelDetail { display:inline-block; line-height:120%;  color:#ffffff; font-size:22px; margin-left:5px; padding:5px; box-sizing:border-box; min-width:70px; text-align:center; }
.productAllLi .productAllImage .productAllLabel .productAllLabelDetail:first-child { margin-left:0; }
.productAllLi .productAllDetail { position:relative; width:450px; color:#101010; background-color:#ffffff; padding:25px 0 25px 0; text-align:center; box-sizing: border-box; }
.productAllLi .productAllDetail .productAllTitle { color:#101010;  font-size:25px; letter-spacing: -1px; text-align:center; line-height:normal; }
.productAllLi .productAllDetail .productAllSubTitle { color:#101010;  font-size:35px; letter-spacing: -1px; text-align:center; line-height:120%; }
.productAllLi .productAllDetail .productAllDesc { color:#101010;  font-size:23px; letter-spacing: -1px; text-align:center; line-height:normal; margin-top: 10px; font-family:"NotoKrL", sans-serif;}
.productAllLi .productAllDetail .productAllPrice { display:none; position: relative; text-align: center; width: 100%; padding-top:10px; }
.productAllLi .productAllDetail .productAllPrice .price { position: relative; line-height:120%;  color:#ff3b85; font-size:40px; font-family: "NotoKrB", sans-serif; letter-spacing:-2px; }
.productAllLi .productAllDetail .productAllPrice .won { line-height:120%;  color:#000000; font-size:23px; font-family:"NotoKrL", sans-serif;}
.productAllLi .productAllBtn { display:block; width:450px; height:50px; background-color:#1be8ce; line-height:50px;  color:#101010; font-size:25px; text-decoration:none; text-align:center; }
.productAllPaging { width:100%; margin-top:50px; text-align:center; }
.productAllPaging strong { display:inline-block; padding:0 10px; line-height:34px; height:34px;  color:#1be8ce; font-size:25px; text-decoration:none; text-align:center; }
.productAllPaging a { display:inline-block; padding:0 10px; line-height:34px; height:34px;  color:#ffffff; font-size:25px; text-decoration:none; text-align:center; }
</style>

<script>
jQuery(document).ready(function(){
	jQuery(".productAllLabel").each(function(){
		var label = JSON.parse(jQuery(this).text());
		if(label.length > 0) {
			var html = '';
			for(var i = 0; i < label.length; i++) {
				html += '<span class="productAllLabelDetail" style="background-color:'+ label[i].BGCOLOR +';">'+ label[i].TITLE +'</span>';
			}
			jQuery(this).html(html).show();
		}
	});
	jQuery(".productAllPrice").each(function(){
		var input = JSON.parse(jQuery(this).text());
		var key = input.PRICE[0].KEY;
		var html = "<span class='price'>"+ parseInt(input.PRICE[0].PRICE).format() +"</span><span class='won'>원~</span>";
		jQuery(this).html(html).show();
	});
});
</script>
<c:choose>
	<c:when test="${fn:length(rtnMap.list) eq 0 and fn:length(rtnMap.list) eq 0}">
		<div class="productAllNone">
			목록이 없습니다.
		</div>
	</c:when>
	<c:otherwise>
		<c:forEach var="row" items="${rtnMap.list}" varStatus="status">
			<li class="productAllLi<c:if test="${status.index % 3 eq 0}"> margin0</c:if>">
				<div class="productAllImage" style="background-image:url('/common/images/fairimage/${row.fpMainImageMSaveNm}');">
					<div class="productAllLabel">${row.fpLabel}</div>
				</div>
				<div class="productAllDetail">
					<div class="productAllTitle">[${row.fpMainTitle}]</div>
					<div class="productAllSubTitle">${row.fpMainSubtitle}</div>
					<div class="productAllDesc">${row.fpMainDesc}</div>
					<div class="productAllPrice">${row.fpInput}</div>
				</div>
				<a class="productAllBtn" href="/fair/${row.fpSeq}/index.do">자세히보기</a>
			</li>
		</c:forEach>
		<div style="clear:both;"></div>
	</c:otherwise>
</c:choose>

<div class="productAllPaging">
	<ui:pagination paginationInfo="${rtnMap.paginationInfo}" type="image" jsFunction="getPageList" />
</div>

<script type="text/javascript">
//<![CDATA[
	function getPageList(pageIndex)
	{
		$(document).productListShow('${rtnMap.fcseq}', pageIndex);
	}
//]]>
</script>
