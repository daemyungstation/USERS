<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf"%>
<!-- 
	######################################################################
	파일명 		:	employeeListPop.jsp
	프로그램 명 : 	담당자 목록 조회
	설명		: 	목록
	작성자		: 	김필기
	작성일		:	2016.03.07
	수정일자	 			수정자				수정내용
	=====================================================================
	2016.03.07				김필기				최초작성
	######################################################################
-->
			<div id="popup">
				<div class="popHead">
					담당자 검색
					<a href="javascript:self.close();"><img src="/common/images/popup/popup_xbt.gif" alt=""></a>
				</div>
				
				<form name="frm" action ="./employeeList.do">
					<input type="hidden" name="pageIndex" value="${rtnMap.pageIndex}" />	
					<input type="hidden" name="target" value="${rtnMap.target}" />
					<input type="hidden" name="f" value="1" />
				<div class="popBody">
					<div class="memCardpop">
						<p class="tit">담당자가 조회가 안되실 경우,<br>컨택센터 (1588-8511)로 전화주시기 바랍니다.</p>
						<p class="txt"></p>
						<div class="listSrch mt30">
							<input type="text" name="q" value="${rtnMap.q}" class="" title="검색어입력" style="width:60%" placeholder="담당자 이름을 입력해주세요" />						
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
									<th>부서</th>
									<th>이름</th>
									<!--  <th>직위</th>-->
									<th>선택</th>
								</tr>
								<c:forEach var="list" items="${rtnMap.list}" varStatus="status">
								<tr>
									<td>${list.deptNm}</td>
									<td>${list.empleNm}(${list.lnum})</td>
									<td><input type="button" value="선택" class="btn btn-success btn-small regbtn" data-code="${list.empleNo}" onclick="reg('${rtnMap.target}',  '${list.empleNo}', '${list.empleNm}')" ></td>
								</tr>
								</c:forEach>
														
								<c:if test="${fn:length(rtnMap.list) == 0}">
								<tr>
									<td colspan="3" style="text-align:center;">
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
			openerTarget.find('.asgn_cd').val(code);
			openerTarget.find('.asgn_nm').val(name);
			openerTarget.find('#charge2').attr('checked',true);
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
	