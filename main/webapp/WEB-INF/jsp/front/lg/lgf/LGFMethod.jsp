<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
<%@ page session="true" %>

<style>
#popup { background:none; }
.headDiv h1 {display:flex; align-items: center; color: #333; font-size: 20px;}
.headDiv h1 img { margin-left:10px; }
.headDiv h1 .headTxt { margin-left:10px; }
.my-back { position: relative; width: 20px; height: 20px; }
.my-back span { width: 20px; height: 20px; border-top: 2px solid #121212; border-right: 2px solid #121212; display: inline-block; transform: rotate(225deg); position: absolute; top: 0px; }
.my-mus { display:flex; justify-content: center; }
.my-mus .my-menu { display:flex; justify-content: center; align-items: center; width:20%; margin:50px 0 0 50px; background:#f7f7f7; border:1px solid #e5e5e5;padding: 50px 0; cursor:pointer; }
.my-mus .my-menu:first-child { margin-left:0; }
.my-mus .my-menu .my-icon img { width:60px; }
.my-mus .my-menu .my-txt { width:100px; text-align:center; font-size: 20px; color: #333; font-weight:bold; }
</style>
<div id="header">
	<div class="headDiv">
		<h1>
			<a href="/member/my/dashboard.do" class="my-back"><span></span></a>
			<img src="/common/images/my/logo.png"/>
			<span class="headTxt">결제정보 변경</span>
		</h1>
	</div>
</div> <!--// header -->

<div id="cBody">
	<div class="subBody">
		<div class="listSrch">
			<strong>가입상품</strong>
			<select class="type2" id="accntNo" title="상품선택">
				<option value="">가입하신 상품을 선택해 주세요</option>
				<c:forEach var="list" items="${joinPrdctList}" varStatus="status">
					<option value="${list.accntNo}">${list.prodNm}</option>
				</c:forEach>
			</select>
			<a href="javascript:" id="btnSearch" class="srchBt"><span>검색</span></a>
		</div>
		
		<script type="text/javascript">
		//<![CDATA[
			jQuery(document).ready(function(){
				//검색
				jQuery("#btnSearch").on("click", function(e){
					var srchObj = jQuery("#accntNo");
					
					if(!jQuery(srchObj).val())
					{
						alert("가입상품을 선택해 주세요.");
						jQuery(srchObj).focus();
						return;
					}
					
					jQuery.post("./method_search.ajax",
						{
							"accntNo" : jQuery(srchObj).val()
						},
						function(text) 
						{
							jQuery(".listSrch").next().remove();
							jQuery(".listSrch").after(text);
						},
						"text"
					).fail(function () {
						alert("예기치 않은 오류입니다.");
					});
				});
			});
			
		//]]>
		</script>
		<div style="height:100px">
	</div>
</div>

