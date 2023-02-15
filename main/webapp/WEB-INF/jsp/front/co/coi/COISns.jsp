<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/WEB-INF/jsp/include/el.jspf"%>

<link rel="stylesheet" href="/common/css/sub_style.css">

<div class="sns_title">소비자 공감 브랜드 <span>대명아임레디 공식 SNS</span></div>
<div class="sns_feat">대명아임레디 공식 SNS 채널과 함께 당신이 꿈꾸던 삶을 준비해보세요!</div>

<div class="sns_icon">
	<div class="sns_type01">
		<div class="sns_type01_img">
			<a href="https://www.facebook.com/imreadyDM/" target="_blank"><img src="/common/images/sns/icon_facebook.png" alt="페이스북"></a>
		</div>
		<div class="sns_type01_txts">
			<div class="sns_type01_title">대명아임레디 공식 페이스북</div>
			<div class="sns_type01_url"><a href="https://www.facebook.com/imreadyDM/" target="_blank">www.facebook.com/imreadyDM/</a></div>
		</div>
	</div>
	<div class="sns_type01">
		<div class="sns_type01_img">
			<a href="https://www.instagram.com/daemyungimready/" target="_blank"><img src="/common/images/sns/icon_instagram.png" alt="인스타그램"></a>
		</div>
		<div class="sns_type01_txts">
			<div class="sns_type01_title">대명아임레디 공식 인스타그램</div>
			<div class="sns_type01_url"><a href="https://www.instagram.com/daemyungimready/" target="_blank">www.instagram.com/daemyungimready/</a></div>
		</div>
	</div>
	<div style="clear:both;"></div>
	<div class="sns_type02">
		<div class="sns_type02_img">
			<img src="/common/images/sns/icon_kakaoplus.png" alt="카카오톡플러스">
		</div>
		<div class="sns_type02_txts">
			<div class="sns_type02_title">카카오톡에서 <span>‘대명아임레디’</span>를 검색해보세요!</div>
			<img class="sns_type02_icon" src="/common/images/sns/sns_search.png" alt="">
		</div>
	</div>
</div>

<div class="sns_icon_msg">
	<img src="/common/images/sns/tag01.png" alt="">
	<img src="/common/images/sns/tag02.png" alt="">
	<img src="/common/images/sns/tag03.png" alt="">
</div>

<div class="sns_contents">
	<c:choose>
		<c:when test="${fn:length(rtnMap.snsList) eq 0 and fn:length(rtnMap.list) eq 0}">
			<div class="noCpro mt30">
				목록이 없습니다.
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="snsList" items="${rtnMap.snsList}" varStatus="status">
				<c:if test="${snsList.type eq 'L'}">
					<div class="sns_container1">
						<div class="sns_container_img"><a href="${ snsList.link1 }" target="${ snsList.link1Type }"><img src="/common/images/sns/upload/${ snsList.img1SaveFileNm }"></a></div>
					</div>				
				</c:if>
				
				<c:if test="${snsList.type eq 'S'}">
					<div class="sns_container2">
						<div class="sns_contents2">
							<div class="sns_container2-1">
								<div class="sns_container_img"><a href="${ snsList.link1 }" target="${ snsList.link1Type }"><img src="/common/images/sns/upload/${ snsList.img1SaveFileNm }"></a></div>
							</div>
							<div class="sns_container2-1">
								<div class="sns_container_img"><a href="${ snsList.link2 }" target="${ snsList.link2Type }"><img src="/common/images/sns/upload/${ snsList.img2SaveFileNm }"></a></div>
							</div>
							<div class="sns_container2-1">
								<div class="sns_container_img"><a href="${ snsList.link3 }" target="${ snsList.link3Type }"><img src="/common/images/sns/upload/${ snsList.img3SaveFileNm }"></a></div>
							</div>
							<div class="sns_container2-1">
								<div class="sns_container_img"><a href="${ snsList.link4 }" target="${ snsList.link4Type }"><img src="/common/images/sns/upload/${ snsList.img4SaveFileNm }"></a></div>
							</div>
							<div class="clearB"></div>
						</div>
					</div>
				</c:if>
			</c:forEach>
			<div class="clearB"></div>
		</c:otherwise>
	</c:choose>
</div>

<div class="paging mt30">
	<ui:pagination paginationInfo="${rtnMap.paginationInfo}" type="image" jsFunction="getPageList" />
</div>
<div class="sns_bottom">
	<div class="sns_bottom_txts">
		<div class="sns_bottom_title1">대명아임레디 SNS 바로가기</div>
		<div class="sns_bottom_title2">꿈꾸던 삶, 이제 다양한 SNS에서도 만나보세요.</div>
	</div>
	<div class="sns_bottom_img">
		<a href="https://www.instagram.com/daemyungimready/" target="_blank"><img src="/common/images/sns/icon_instagram2.png" alt="인스타그램"></a>
		<a href="https://www.facebook.com/imreadyDM/" target="_blank"><img src="/common/images/sns/icon_facebook2.png" alt="페이스북"></a>
		<img src="/common/images/sns/icon_kakaoplus2.png" alt="카카오톡플러스">
	</div>
</div>

<form name="frm" action="${pageLink}">
<input type="hidden" name="pageIndex" value="${rtnMap.pageIndex}" />
</form>
<script type="text/javascript">
//<![CDATA[
           
	function getPageList()
	{
		var f = document.frm;

		if(arguments.length > 0)
		{
			f.pageIndex.value = arguments[0];
		}
		else
		{
			f.pageIndex.value= 1;
		}
		
		f.action = "./index.do";
		f.submit();
	}
	
//]]>
</script>