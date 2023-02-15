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
			<span class="headTxt">개인정보 변경</span>
		</h1>
	</div>
</div> <!--// header -->

<div id="cBody">
	<div class="subBody">
		<c:set var="memInfo" value="${rtnMap.memInfo}" />
		<c:set var="memInfo2" value="${rtnMap.memInfo2}" />

		<div data-controller="CommonController JoinController" data-gb="modify">
			<form name="frm" method="post" action="./info_update.do">
				<input type="hidden" name="marketing_yn" value="${memInfo.marketingYn }" class="notRequired">
				<p class="titTxt mt40">회원정보</p>
				<div class="boardType2 mt15">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
<%--							<tr>	--%>
<%--								<th scope="row"><span>회원이름</span></th>--%>
<%--								<td>--%>
<%--									${memInfo.name}--%>
<%--								</td>--%>
<%--							</tr>--%>
<%--							<tr>	--%>
<%--								<th scope="row"><span>생년월일</span></th>--%>
<%--								<td>${egov:convertDate(memInfo.birth, 'yyyyMMdd', 'yyyy년 MM월 dd일', '')}</td>--%>
<%--							</tr>--%>
							<tr>	
								<th scope="row"><span>아이디</span></th>
								<td>${rtnMap.integrationId}</td>
							</tr>
							<tr>	
							<th scope="row"><span class="essen" title="필수입력">이메일</span></th>
								<td>
									<input type="text" id="email" name="email" value="${memInfo.email}" title="이메일계정" class="inputType1 emailChk" maxlength="40" data-state="false">
									
									<select id="maillist" class="notRequired">
										<option value="">[도메인 선택]</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="nate.com">nate.com</option>												
										<option value="gmail.com">gmail.com</option>
									</select>
									<a href="javascript:" class="btn333" id="emailOverapCheck" >중복확인</a>
								</td>
							</tr>
							<tr>	
								<th scope="row"><span class="essen" title="필수입력">휴대전화</span></th>
								<td>
									<input type="text" name="hp" value="${memInfo.cellPhone}" title="휴대전화" class="inputType1 mobileChk" maxlength="13" id="hp" />
								</td>
							</tr>
							
<%--							<tr>	--%>
<%--								<th scope="row"><span class="essen" title="필수입력">주소</span></th>--%>
<%--								<td>--%>
<%--									<div class="">--%>
<%--										<input type="text" name="zipcd" value="${memInfo.zipCode}" title="우편번호" class="inputType3 add1 notRequired" maxlength="7" readonly="readonly" />--%>
<%--										<input type="text" name="adr" value="${memInfo.address}" title="주소" class="inputType5" maxlength="100" readonly="readonly" />--%>
<%--										<a href="javascript:" id="zipcode_iframe" class="btn333">우편번호 찾기</a>--%>
<%--									</div>--%>
<%--									<p class="mt10"><input type="text" name="adr_dtl" value="${memInfo.addressDetail}" title="상세주소" class="inputType4" maxlength="100" placeholder="상세주소" /></p>--%>
<%--								</td>--%>
<%--							</tr>--%>
						</tbody>
					</table>
					<div class="" style="width: 99%">
						<div id="daum_zipcode_wrap" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative; margin-top:30px;">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:-1px;top:-20px;z-index:1" onclick="javascript:jQuery('#daum_zipcode_wrap').hide();" alt="접기 버튼">
						</div>
					</div>
					<p class="red mt5">※ 개인정보 오기입으로 인한 문제발생 시 이용자에게 책임이 있습니다.</p>
				</div>
				

				<div class="mt30" style="position:relative; text-align:center;">
					<a href="javscript:" id="reg" class="btnRed">확인</a>
					<input type="submit" style="display:none" />
				</div>
			</form>
		</div>
		<div style="height:100px">
	</div>
</div>

