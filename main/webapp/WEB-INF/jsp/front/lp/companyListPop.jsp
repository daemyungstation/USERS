<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf"%>
<!-- 
	######################################################################
	파일명 		:	companyListPop.jsp
	프로그램 명 : 	회사 목록 조회
	설명		: 	목록
	작성자		: 	김필기
	작성일		:	2016.03.11
	수정일자	 			수정자				수정내용
	=====================================================================
	2016.03.11				김필기				최초작성
	######################################################################
-->
			<div id="popup">
				<div class="popHead">
					회사명 검색
					<a href="javascript:self.close();"><img src="/common/images/popup/popup_xbt.gif" alt=""></a>
				</div>
				
				<form name="frm" action ="./companyList.do">
					<input type="hidden" name="pageIndex" value="${rtnMap.pageIndex}" />	
					<input type="hidden" name="target" value="${rtnMap.target}" />
					<input type="hidden" name="f" value="1" />
				<div class="popBody">
					<div class="memCardpop">
						<p class="tit">회사명이 조회가 안되실 경우,<br>컨택센터 (1588-8511)로 전화주시기 바랍니다.</p>
						<p class="txt"></p>
						<div class="listSrch mt30">
							<input type="text" name="q" value="${rtnMap.q}" class="" title="검색어입력" style="width:60%" placeholder="회사명을 입력해주세요" />						
							<a href="javascript:getPageList();" class="btn333" >검색</a>
						</div>
					</div>
					<div class="popBoard mt30">
						<table summary="">
							<caption></caption>
							<colgroup>
								<col width="34%">
								<col width="33%">
								<col width="33%">
							</colgroup>
							<tbody>
								<tr>
									<th>회사명</th>
									<th>선택</th>
								</tr>
								<c:forEach var="list" items="${rtnMap.list}" varStatus="status">
								<tr>
									<td>${list.coNm}</td>
									<td><input type="button" value="선택" class="btn btn-success btn-small regbtn" data-code="${list.coCd}" onclick="reg('${rtnMap.target}',  '${list.coCd}', '${list.coNm}')" ></td>
								</tr>
								</c:forEach>
														
								<c:if test="${fn:length(rtnMap.list) == 0}">
								<tr>
									<td colspan="2" style="text-align:center;">
										<fmt:message key="common.nodata.msg" />
									</td>
								</tr>
								</c:if>								
							</tbody>
						</table>
						
						<div class="paging mt30">
							<ul>
								<ui:pagination paginationInfo="${rtnMap.paginationInfo}" type="image" jsFunction="getPageList" />	
							</ul>
						</div>
						
					</div>
				</div>
				</form>
			</div>


<script type="text/javascript">
	function reg(target, code, name){
		
		$(opener.document).find('.productForm').each(function(){
			if($(this).attr('data-index') == target){
				openerTarget = $(this);
			}			
		});
		
		if(confirm("선택하시겠습니까?")){			
			openerTarget.find('.co_cd').val(code);
			openerTarget.find('.co_nm').val(name);
			window.close();
		}	
	}
	
	//페이지번호 클릭시
	function getPageList()
	{	
		var f = document.frm;
		
		if(arguments.length > 0)
		{
			f.pageIndex.value = arguments[0];
		}
		else
		{
			f.pageIndex.value = 1;
		}
		f.submit();
	}	
	</script>
	