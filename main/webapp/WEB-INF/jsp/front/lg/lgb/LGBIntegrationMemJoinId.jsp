<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>
<div  class="wrap_integration_join">
	<h2>대명 아임레디 통합 회원가입</h2>
	<div class="join_desc">
		<p>보다 원활한 서비스 제공을 위해 대명 아임레디 홈페이지와 아임레디몰의 ID가 통합됩니다.<br>
		기존 아이디를 통합 아이디로 전환하시고, 하나의 아이디로 대명 아임레디 서비스를 편리하게 이용하세요.
		</p>
	</div>
	<p class="joinTxt taC">
	<img src="/common/images/txt/integration_join_txt2.png" alt="약관동의 및 본인인증 ">
	<img src="/common/images/txt/integration_join_txt2_m.png" alt="약관동의 및 본인인증 " class="img_sm">
	</p>

	<!--S 상조 서비스 가입이 안되 있을 경우 -->
	<c:if test="${unqNo eq null}">
		<p class="mt30  taC">
			상조 가입 회원이 아닌 경우 아임레디몰(회원몰)의 서비스 이용이 제한될 수 있습니다.<br>
			대명 상조회원이신 경우 <span class="red">고객센터(1588-8511)</span>으로 문의 주시기 바랍니다.
		</p>
	</c:if>
	<!--E 상조 서비스 가입이 안되 있을 경우 -->


	<div class="integration_desc">
		<p>통합 아이디는 회원님이 기존에 가입하신 서비스 별 아이디 중 선택하거나 신규 아이디를  생성·전환 하실 수 있습니다.</p>
		<p>통합 아이디로 전환이 완료되면, 기존 가입되었던 서비스 별 아이디는 더 이상 이용이 불가능합니다.</p>
	</div>

	<form name="tempFrm">
	<!--S 상조 서비스 가입이 안되 있을 경우 -->
	<p class="titTxt mt40">기존 아이디</p>

	<!--S 모바일 일 경우 -->
		<div class="boardType2 mt15 table_mobile">
			<p>
				<input type="radio" id="m2" name="integrationId" value="${availableAccount.HOMEPAGE.id}" title="1"
					   class="checkbox ${(availableAccount.HOMEPAGE.availableFlag) eq 'Y' ? '' : 'disabled'}" onclick="javascript:selectIntegrationId(this);" />
				<label for="m2">대명아임레디 공식홈페이지</label>
			</p>
			<table summary="">
			<caption></caption>
				<colgroup>
					<col width="*">
					<col width="30%">
					<col width="30%">
				</colgroup>
				<thead>
					<tr>
						<th scope="row">아이디</th>
						<th scope="row">가입일자</th>
						<th scope="row">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<span>${availableAccount.HOMEPAGE.id}</span>
						</td>
						<td>
							<span>${egov:convertDate(availableAccount.HOMEPAGE.homepageJoinDate, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</span>
						</td>
						<td class="${(availableAccount.HOMEPAGE.availableFlag) eq 'Y' ? '' : 'disabled'}">
							<span>${(availableAccount.HOMEPAGE.availableFlag eq 'Y') ? '사용가능' : '사용불가'}</span>
						</td>

					</tr>
				</tbody>
			</table>

			<c:if test="${unqNo ne null and availableAccount.MALL ne null}">
				<p>
					<input type="radio" id="m1" name="integrationId" value="${availableAccount.MALL.id}" title="1"
						   class="checkbox mallChkbox" onclick="javascript:selectIntegrationId(this);"
							${(availableAccount.MALL.availableFlag) eq 'Y' ? '' : 'disabled'}/>
					<label for="m1">아임레디몰(회원몰)</label>
				</p>
				<table summary="">
				<caption></caption>
					<colgroup>
						<col width="*">
						<col width="30%">
						<col width="30%">
					</colgroup>
					<thead>
						<tr>
							<th scope="row">아이디</th>
							<th scope="row">가입일자</th>
							<th scope="row">사용여부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<span>${availableAccount.MALL.id}</span>
							</td>
							<td>
								<span>${egov:convertDate(availableAccount.MALL.mallJoinDate, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</span>
							</td>
							<td class="${(availableAccount.MALL.availableFlag) eq 'Y' ? '' : 'disabled'}">
								<span>${(availableAccount.MALL.availableFlag) eq 'Y' ? '사용가능' : '사용불가'}</span>
							</td>

						</tr>
					</tbody>
				</table>
			</c:if>
		</div>
	<!--E 모바일 일 경우 -->

	<!--S PC 일 경우 -->
		<div class="boardType2 mt15 table_col_5 table_pc">
			<table summary="" >
				<caption></caption>
				<colgroup>
					<col width="60px">
					<col width="224px">
					<col width="224px">
					<col width="224px">
					<col width="224px">
				</colgroup>
				<thead>
					<tr>
						<th scope="row"></th>
						<th scope="row">가입 서비스 명</th>
						<th scope="row">아이디</th>
						<th scope="row">가입일자</th>
						<th scope="row">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<input type="radio" id="chkHome" name="integrationId" value="${availableAccount.HOMEPAGE.id}" title="대명아임레디"
								   class="checkbox" ${availableAccount.HOMEPAGE.availableFlag eq 'Y' ? '' : 'disabled'} onclick="javascript:selectIntegrationId(this);" />
								<label for="chkHome"></label>
						</td>
						<td>
							<span>대명아임레디 공식홈페이지</span>
						</td>
						<td>
							<span>${availableAccount.HOMEPAGE.id}</span>
						</td>
						<td>
							<span>${egov:convertDate(availableAccount.HOMEPAGE.homepageJoinDate, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</span>
						</td>
						<td class="${(availableAccount.HOMEPAGE.availableFlag eq 'Y') ? '' : 'disabled'}">
							<span>${(availableAccount.HOMEPAGE.availableFlag eq 'Y') ? '사용가능' : '사용불가'}</span>
						</td>
					</tr>

					<c:if test="${unqNo ne null and availableAccount.MALL ne null}">
						<tr>
							<td>
								<input type="radio" id="chkMall" name="integrationId" value="${availableAccount.MALL.id}"
									   title="아임레디몰(회원몰)" class="checkbox mallChkbox" ${(availableAccount.MALL.availableFlag) eq 'Y' ? '' : 'disabled'} onclick="javascript:selectIntegrationId(this);" />
									<label for="chkMall"></label>
							</td>
							<td>
								<span>아임레디몰(회원몰)</span>
							</td>
							<td>
								<span>${availableAccount.MALL.id}</span>
							</td>
							<td>
								<span>${egov:convertDate(availableAccount.MALL.mallJoinDate, 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-dd', '')}</span>
							</td>
							<td class="${(availableAccount.MALL.availableFlag) eq 'Y' ? '' : 'disabled'}">
								<span>${(availableAccount.MALL.availableFlag) eq 'Y' ? '사용가능' : '사용불가'}</span>
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>

		</div>
		<!--E PC 일 경우 -->

		<c:if test="${availableAccount.HOMEPAGE.availableFlag eq 'N' and
		((unqNo ne null and availableAccount.MALL ne null and availableAccount.MALL.availableFlag eq 'N') or unqNo eq null)}">
			<p class="titTxt mt60">신규 아이디</p>
			<div class="boardType2 mt15">
				<table summary="">
					<caption></caption>
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><span class="essen" title="필수입력">통합 아이디</span></th>
							<td>
								<input type="text" id="newIntegrationId" name="newIntegrationId" value="" title="아이디" class="inputType6 idChk" style="" maxlength="20" data-state="false">
								<a href="javascript:" class="btn333" id="idOverapCheck" onClick="javascript:checkDuplicatedId();">아이디 중복확인</a>&nbsp;&nbsp;&nbsp;
								<span class="red">영문 소문자, 숫자 조합하여 4~20자 사용 가능합니다.</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</c:if>
		<!--E 상조 서비스 가입이 안되 있을 경우 -->

		<!--S 상조 서비스 가입이 되 있을 경우 -->
		<%--<div style="display:none">
			<p class="titTxt mt40">기존 아이디</p>
		<div class="boardType2 mt15 table_col_5">
			<table summary="">
				<caption></caption>
				<colgroup>
					<col width="60px">
					<col width="224px">
					<col width="224px">
					<col width="224px">
					<col width="224px">
				</colgroup>
				<thead>
					<tr>
						<th scope="row"></th>
						<th scope="row">가입 서비스 명</th>
						<th scope="row">아이디</th>
						<th scope="row">가입일자</th>
						<th scope="row">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<input type="radio" id="a1" name="" value="" title="1" class="checkbox " />
								<label for="a1"></label>
						</td>
						<td>
							<span>대명아임레디</span>
						</td>
						<td>
							<span>forbiz1234</span>
						</td>
						<td>
							<span>2017-01-01</span>
						</td>
						<td>
							<span>사용가능</span>
						</td>

					</tr>
				</tbody>
			</table>

		</div>
		</div>--%>

		<!--E 상조 서비스 가입이 되 있을 경우 -->

	</form>
	<div class="mt30 taC">				
		<a href="javascript:" class="btnRed" id="reg" onclick="javascript:setIntegrationid();">다음</a>
		<a href="/main/index.do" class="btnRed2" id="cancel">취소</a>
	</div>

	<input type="hidden" id="homepageAvailableFlag" value="${availableAccount.HOMEPAGE.availableFlag}" />
	<input type="hidden" id="mallAvailableFlag" value="${(unqNo ne null and availableAccount.MALL ne null) ? availableAccount.MALL.availableFlag : 'N'}" />

	<form action="/member/join/integration/write.do" name="form">
		<input type="hidden" name="integrationId" value="" />
		<input type="hidden" name="homepageId" value="${availableAccount.HOMEPAGE.id}" />
		<%--<input type="hidden" name="ci" value="${ci}" />--%>
		<input type="hidden" name="idCheck" value="N" />
	</form>
</div>

<script type="text/javascript">
	window.onload = function() {
	    if(document.getElementById('newIntegrationId') != null) {
            document.getElementById('newIntegrationId').addEventListener('input', function() {
                document.form.idCheck.value = 'N';
            });
		}
	};

	function checkDuplicatedId() {
		var integrationId = document.getElementById('newIntegrationId').value.trim().replace(/\s/gi, "");
        document.getElementById('newIntegrationId').value = integrationId;
        var idReg = /^[a-z]+[a-z0-9]{3,19}$/g;
		if (!idReg.test(integrationId)) {
		    alert("영문 소문자, 숫자 조합하여 4~20자만 사용 가능합니다");
		    return false;
		}

		var loginId = $('input[name="homepageId"]').val(); 
		jQuery.ajax({
            //url : "/member/join/integration/checkDuplicateId.ajax",
            url : "/member/join/integration/checkDuplicateId_sso.ajax",
            type : "post",
            data : {
                "integrationId" : integrationId
                , "loginId" : loginId
            },
            success : function(data){
                console.log(data);
                if (data.availableFlag == 'Y') {
                    document.form.idCheck.value = 'Y';
                    document.form.integrationId.value = integrationId;
                    alert("사용가능한 아이디 입니다.");
				} else {
                    document.form.idCheck.value = 'N';
                    alert("중복되는 아이디가 있습니다.");
				}
            }
        });
	}

    function selectIntegrationId(e) {
	    document.form.integrationId.value = e.value;
	}

	function setIntegrationid() {
	    if (document.getElementById('homepageAvailableFlag').value == 'N' && document.getElementById('mallAvailableFlag').value == 'N') {
	        if (document.form.idCheck.value == 'N') {
	            alert("통합 아이디 중복 체크를 해주세요.");
	            return false;
			}
		} else {
	        if (document.tempFrm.integrationId.value == '') {
	            alert("아이디를 선택해 주세요.");
				return false;
			}
		}
	    document.form.submit();
	}

</script>