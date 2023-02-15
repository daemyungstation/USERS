<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

<div data-controller="CommonController JoinController" data-gb="join">
	<!-- form name="frm" method="post" action="./insert.do" -->
	<form name="frm" method="post" action="./insert_sso.do">
		<p class="joinTxt taC"><img src="/common/images/txt/join_txt2.png" alt="회원정보 입력"></p>
			<div class="join_desc">
				<p>통합회원이 되시면 하나의 아이디로 대명 아임레디 홈페이지와 <br>아임레디몰의 서비스를 이용하실 수 있습니다.
				</p>
			</div>
		<p class="titTxt mt40">회원정보</p>
		<c:if test="${sessionScope.loginType eq 'REGISTER_MEMBER_WITHOUT_MEMBER_MALL'}">
			<p class="red mt5">상조 가입 회원이 아닌 경우 아임레디몰(회원몰)의 서비스 이용이 제한될 수 있습니다.<br>
			대명 상조회원이신 경우 고객센터(1588-8511)으로 문의 주시기 바랍니다.
			</p>
		</c:if>

		<div class="boardType2 board_join mt15">
			<table summary="">
				<caption></caption>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
<%--					<tr>--%>
<%--						<th scope="row"><span>회원이름</span></th>--%>
<%--						<td>${authInf.name}</td>--%>
<%--					</tr>--%>
<%--					<tr>--%>
<%--						<th scope="row"><span>생년월일</span></th>--%>
<%--						<td>${egov:convertDate(authInf.birth, 'yyyyMMdd', 'yyyy년 MM월 dd일', '')}</td>--%>
<%--					</tr>--%>
<%--					<tr>--%>
<%--						<th scope="row"><span>성별</span></th>--%>
<%--						<td>--%>
<%--							<span class="list">--%>
<%--								<input type="radio" id="sex1" name="sex" value="1" title="남성" class="checkbox" ${authInf.sex == 1 ? 'checked' : ''} disabled />--%>
<%--								<label for="sex1">남성</label>--%>
<%--							</span>--%>
<%--							<span class="list">--%>
<%--								<input type="radio" id="sex2" name="sex" value="0" title="여성" class="checkbox" ${authInf.sex == 0 ? 'checked' : ''} disabled />--%>
<%--								<label for="sex2">여성</label>--%>
<%--							</span>--%>
<%--						</td>--%>
<%--					</tr>--%>
					<tr>
						<th scope="row"><span class="essen" title="필수입력">아이디</span></th>
						<td>
							<input type="text" id="newIntegrationId" name="id" value="" title="아이디" class="inputType1 idChk" style="" maxlength="20" data-state="false">
							<a href="javascript:" class="btn333" id="idCheck" onclick="javascript:checkDuplicatedId();">중복확인</a>&nbsp;&nbsp;&nbsp;
							<span class="red">영문 소문자, 숫자 조합 4~20자 사용 가능</span>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="essen" title="필수입력">비밀번호</span></th>
						<td>
							<input type="password" id="pwd" name="pwd" value="" title="비밀번호" class="inputType1 passChk" style="">&nbsp;&nbsp;&nbsp;
							<span class="red">영문 대/소문자, 숫자, 특수문자중 두가지 혼합시 10자 이상, 세가지 혼합시 8자 이상으로 사용 가능합니다.</span>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="essen" title="필수입력">비밀번호 확인</span></th>
						<td>
							<input type="password" id="passwordRepeat"  value="" title="비밀번호 확인" class="inputType1 passEqual" style="">&nbsp;&nbsp;&nbsp;
							<span class="red">비밀번호 확인을 위해 다시 한번 입력해 주세요.</span>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="essen" title="필수입력">이메일</span></th>
						<td>
							<input type="text" id="email" name="email" value="" title="이메일계정" class="inputType1 emailChk" maxlength="40" data-state="false" />

							<select id="maillist" class="notRequired">
								<option value="">[직접 입력]</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
								<option value="gmail.com">gmail.com</option>
							</select>
							<a href="javascript:" class="btn333" id="emailOverapCheck" >이메일 중복확인</a>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="essen" title="필수입력">휴대전화</span></th>
						<td>
							<input type="text" name="hp" value="" title="휴대전화" class="inputType1 mobileChk" maxlength="13" id="hp"/>
							&nbsp;<span class="red">※한번 더 확인해주십시오. 오기입으로 발생하는 문제는 이용자에게 있습니다.</span><!-- 번호 입력 문구 추가 2017-07-25 -->
						</td>
					</tr>
					<%--<tr>--%>
						<%--<th scope="row"><span>전화번호</span></th>--%>
						<%--<td>--%>
							<%--<input type="text" name="tel" value="" title="전화번호" class="inputType1 phoneChk notRequired" maxlength="13" id="tel"/>--%>
						<%--</td>--%>
					<%--</tr>--%>
<%--					<tr>--%>
<%--						<th scope="row"><span class="essen" title="필수입력">주소</span></th>--%>
<%--						<td>--%>
<%--							<div class="">--%>
<%--								<input type="text" id="zipcd" name="zipcd" value="" title="" class="inputType3 add1" maxlength="7" readonly="readonly" />--%>
<%--								<input type="text" id="adr" name="adr" value="" title="" class="inputType5" maxlength="100" readonly="readonly" />--%>
<%--								<a href="javascript:" class="btn333" id="zipcode_iframe">우편번호 찾기</a>--%>
<%--							</div>--%>
<%--							<p class="mt10"><input type="text" id="adr_dtl" name="adr_dtl" value="" title="상세주소" class="inputType4" maxlength="100" placeholder="상세주소" /></p>--%>
<%--						</td>--%>
<%--					</tr>--%>
					<%--
					<tr>
						<th scope="row" rowspan="3"><span class="essen" title="필수입력">관심분야</span></th>
						<td>
							<span class="red">회원님의 요즘 관심 분야는 무엇입니까?.</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="list">
								<input type="checkbox" id="chkTravel" name="intrField" value="여행&레저" title="관심정보" class="checkbox " />
								<label for="chkTravel">여행&레저</label>
							</span>
							<span class="list">
								<input type="checkbox" id="chkBeauty" name="intrField" value="헬스&뷰티" title="관심정보" class="checkbox " />
								<label for="chkBeauty">헬스&뷰티</label>
							</span>
							<span class="list">
								<input type="checkbox" id="chkFurniture" name="intrField" value="가전/가구" title="관심정보" class="checkbox " />
								<label for="chkFurniture">가전/가구</label>
							</span>
							<span class="list">
								<input type="checkbox" id="chkWedding" name="intrField" value="웨딩" title="관심정보" class="checkbox " />
								<label for="chkWedding">웨딩</label>
							</span>
						</td>
					</tr>

					<tr>
						<td>
							<span class="list">
								<input type="checkbox" id="chkEdu" name="intrField" value="유아/교육" title="관심정보" class="checkbox " />
								<label for="chkEdu">유아/교육</label>
							</span>
							<span class="list">
								<input type="checkbox" id="chkConsultant" name="intrField" value="심리상담" title="관심정보" class="checkbox " />
								<label for="chkConsultant">심리상담</label>
							</span>
							<span class="list">
								<input type="checkbox" id="chkParty" name="intrField" value="실버/장례" title="관심정보" class="checkbox " />
								<label for="chkParty">실버/장례</label>
							</span>
						</td>
					</tr>
				--%>
				</tbody>
			</table>
			<div class="" style="width: 99%">
				<div id="daum_zipcode_wrap" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative; margin-top:30px;">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:-1px;top:-20px;z-index:1" onclick="javascript:jQuery('#daum_zipcode_wrap').hide();" alt="접기 버튼">
				</div>
			</div>

			<p class="red mt5">※ 상품 가입이 되어있는 경우, 입력해주신 정보로 동일하게 업데이트 됩니다. (3영업일 소요) (확인) </p>
			<p class="red mt5">※ 휴대전화번호/이메일 주소 기입 잘못 등 이용자 본인의 과실 및 정보 관리 소홀로 발생하는 문제의 책임은 이용자에게 있습니다.</p>
		</div>

		<!-- 2017-07-06 수정 -->
		<!--
		<p class="titTxt mt55">개인정보 제 3자 제공 동의 (<span class="titCol">필수사항</span>)</p>
		<div class="boardType2 mt15">
			<table summary="">
				<caption></caption>
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="taC">제공받는자</th>
						<th scope="row" class="taC">제공정보</th>
						<th scope="row" class="taC">이용목적</th>
						<th scope="row" class="taC">이용기간</th>
					</tr>
					<tr class="colTdc">
						<td>㈜대명레저산업</td>
						<td>암호화된 동일인 식별정보(CI)</td>
						<td>멤버십서비스 중 대명리조트 주요 시설의 예약 및 확인</td>
						<td>제공 목적 달성시 또는 대명라이프웨이 웹회원 탈퇴 시까지</td>
					</tr>
				</tbody>
			</table>
			<div class="radioChk">
				<span class="list">
					<input type="radio" id="children1" name="agreementForThirdParty" value="Y" title="예" class="checkbox notRequired" />
					<label for="children1">예</label>
				</span>
				<span class="list">
					<input type="radio" id="children2" name="agreementForThirdParty" value="N" title="아니오" class="checkbox notRequired" />
					<label for="children2">아니오</label>
				</span>
			</div>
			<p class="mt5">※ 위 제공받는 자는 해당 법인의 법인명이 변경되어도 동일하게 적용됩니다.</p>
			<p class="red mt5">※ 고객님은 개인정보 제3자 제공에 대한 동의를 거부할 권리가 있으며, 미동의 시 리조트 서비스 이용에 제한이 있을 수 있습니다.</p>
			<p class="mt5">※ 대명라이프웨이 상품 가입 회원 일 경우에만, 상기 정보가 제공됩니다.</p>
		</div>
		 -->

		<!-- 2017-09-18 추가 -->
		<p class="titTxt mt55">마케팅 목적의 개인정보 이용에 관한 사항 (선택사항)</p>
		<div class="memDesc">
			<div class="marketingAgree">
				<p>㈜대명스테이션이 다양한 신규서비스 및 이벤트 안내 등의 마케팅 목적을 위하여 아래에 기재된 내용대로 개인정보를 이용합니다.</p>
				<ul class="notice_list">
					<li>- 이용기간 : 목적 달성 시까지 또는 회원탈퇴 시까지</li>
					<li>- 전송방법 : 아래에 동의한 항목으로만</li>
				</ul>
				<ul class="check_list">
					<li><input type="checkbox" name="telRcvYn" value="Y" class="checkbox notRequired" <c:if test="${memInfo.telRcvYn eq 'Y'}">checked</c:if> />전화</li>
					<li><input type="checkbox" name="smsRcvYn" value="Y" class="checkbox notRequired" <c:if test="${memInfo.smsRcvYn eq 'Y'}">checked</c:if> />문자</li>
					<li><input type="checkbox" name="emailRcvYn" value="Y" class="checkbox notRequired" <c:if test="${memInfo.emailRcvYn eq 'Y'}">checked</c:if> />이메일</li>
					<li><input type="checkbox" name="ctlgRcvYn" value="Y" class="checkbox notRequired" <c:if test="${memInfo.ctlgRcvYn eq 'Y'}">checked</c:if> />우편물</li>
				</ul>
			</div>
			<p>※ 회원님은 동의를 거부할 수 있습니다. 동의 거부 시에는 해당 서비스를 이용하실 수 없습니다.</p>
			<dl class="selectPack selectPackBlock">
				<dd onclick="mktAgree(1)">
					<input type="radio" id="mkInfo1" name="marketingYn" value="Y" title="마케팅 목적 수신동의" class="checkbox notRequired" style="" <c:if test="${memInfo.marketingYn eq 'Y'}">checked</c:if> /><!-- notRequired 필수 값이 아닌 경우 -->
					<label for="mkInfo1">예</label>
				</dd>
				<dd onclick="mktAgree(0)">
					<input type="radio" id="mkInfo2" name="marketingYn" value="N" title="마케팅 목적 수신동의" class="checkbox notRequired" style="" <c:if test="${memInfo.marketingYn eq 'N'}">checked</c:if> /><!-- notRequired 필수 값이 아닌 경우 -->
					<label for="mkInfo2">아니오</label>
				</dd>
			</dl>
		</div>


		<p class="titTxt mt55">추가정보 (선택사항)</p>
		<div class="boardType2 mt15">
			<table summary="">
				<caption></caption>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">결혼 유/무</th>
						<td>
							<span class="list">
								<input type="radio" id="marry1" name="mrrgYn" value="Y" title="결혼 유/무" class="checkbox notRequired" />
								<label for="marry1">유</label>
							</span>
							<span class="list">
								<input type="radio" id="marry2" name="mrrgYn" value="N" title="결혼 유/무" class="checkbox notRequired" />
								<label for="marry2">무</label>
							</span>
						</td>
					</tr>
					<tr>
						<th scope="row">자녀 여부</th>
						<td>
							<span class="list">
								<input type="radio" id="children1" name="chdrnGb" value="0" title="자녀 여부" class="checkbox notRequired" />
								<label for="children1">없음</label>
							</span>
							<span class="list">
								<input type="radio" id="children2" name="chdrnGb" value="1" title="자녀 여부" class="checkbox notRequired" />
								<label for="children2">1</label>
							</span>
							<span class="list">
								<input type="radio" id="children3" name="chdrnGb" value="2" title="자녀 여부" class="checkbox notRequired" />
								<label for="children3">2</label>
							</span>
							<span class="list">
								<input type="radio" id="children4" name="chdrnGb" value="3" title="자녀 여부" class="checkbox notRequired" />
								<label for="children4">3이상</label>
							</span>
						</td>
					</tr>

					<%--
					<c:forEach var="list" items="${cdDtlList.intrGb}" varStatus="status">
						<c:if test="${status.index % 5 eq 0}">
							<c:choose>
								<c:when test="${status.first}">
									<tr>
										<th scope="row" rowspan="3">관심정보<br />(3가지 선택)</th>
										<td>
								</c:when>
								<c:otherwise>
									<tr>
										<td>
								</c:otherwise>
							</c:choose>
						</c:if>
						<span class="list">
							<input type="checkbox" id="favorInfo${status.count}" name="intr_ptc" value="${list.cd}" title="관심정보" class="checkbox notRequired" />
							<label for="favorInfo${status.count}">${list.cdNm}</label>
						</span>
						<c:if test="${status.count % 5 eq 0}">
							</tr>
						</c:if>
					</c:forEach>
					<tr>
						<td>
							<span class="red">※ 정보를 입력하시면 각종 이벤트 /쿠폰 등 다양한 혜택을 안내받으실 수 있습니다 .</span>
						</td>
					</tr>
					<tr>
						<th scope="row" rowspan="3">관심분야</th>
						<td>
							<span class="red">회원님의 요즘 관심 분야는 무엇입니까?.</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="list">
								<input type="checkbox" id="chkOptionGolf" name="OptionIntrField" value="골프" title="관심정보" class="checkbox notRequired" />
								<label for="chkOptionGolf">골프</label>
							</span>
							<span class="list">
								<input type="checkbox" id="chkOptionWedding" name="OptionIntrField" value="웨딩" title="관심정보" class="checkbox notRequired" />
								<label for="chkOptionWedding">웨딩</label>
							</span>
							<span class="list">
								<input type="checkbox" id="chkOptionCamp" name="OptionIntrField" value="해외여행캠프" title="관심정보" class="checkbox notRequired" />
								<label for="chkOptionCamp">해외여행캠프</label>
							</span>
							<span class="list">
								<input type="checkbox" id="chkOptionCruze" name="OptionIntrField" value="크루즈" title="관심정보" class="checkbox notRequired" />
								<label for="chkOptionCruze">크루즈</label>
							</span>
						</td>
					</tr>

					<tr>
						<td>
							<span class="list">
								<input type="checkbox" id="chkOptionDeath" name="OptionIntrField" value="장례" title="관심정보" class="checkbox notRequired" />
								<label for="chkOptionDeath">장례</label>
							</span>
							<span class="list">
								<input type="checkbox" id="chkOptionTravel" name="OptionIntrField" value="여행" title="관심정보" class="checkbox notRequired" />
								<label for="chkOptionTravel">여행</label>
							</span>
							<span class="list">
								<input type="checkbox" id="chkOptionParty" name="OptionIntrField" value="칠순/돌잔치" title="관심정보" class="checkbox notRequired" />
								<label for="chkOptionParty">칠순/돌잔치</label>
							</span>
						</td>
					</tr>
					<c:forEach var="list" items="${cdDtlList.joinPathGb}" varStatus="status">
						<c:if test="${status.index % 4 eq 0}">
							<c:choose>
								<c:when test="${status.first}">
									<tr>
										<th scope="row" rowspan="2">가입경로</th>
										<td>
								</c:when>
								<c:otherwise>
									<tr>
										<td>
								</c:otherwise>
							</c:choose>
						</c:if>
						<span class="list${egov:decode(list.cdNm, '기타', '2', '')}">
							<input type="radio" id="joinway${status.count}" name="join_path" value="${list.cd}" title="가입경로" class="checkbox notRequired" />
							<label for="joinway${status.count}">${list.cdNm}</label>
							<c:if test="${list.cdNm eq '기타'}">
								&nbsp;&nbsp;
								<input type="text" name="join_path_etc" value="" title="기타" class="lginInput inputType5 notRequired" maxlength="100" />
							</c:if>
						</span>
						<c:if test="${status.count % 4 eq 0}">
							</tr>
						</c:if>
					</c:forEach>
					<tr>
						<th scope="row">상품가입 시,<br>장 끌렸던 점은?<br>(2가지 선택)</th>
						<td>
							<c:forEach var="list" items="${cdDtlList.pfrnGb}" varStatus="status">
								<c:choose>
									<c:when test="${status.first}">
										<p>
									</c:when>
									<c:otherwise>
										<p class="mt10">
									</c:otherwise>
								</c:choose>
								<input type="checkbox" id="merit${status.count}" name="pfrn_ptc" value="${list.cd}" title="상품가입 시, 가장 끌렸던 점" class="checkbox notRequired" />
								<label for="merit${status.count}">${list.cdNm}</label>
								<c:if test="${list.cdNm eq '기타'}">
									&nbsp;&nbsp;
									<input type="text" name="pfrn_etc" value="" title="기타" class="lginInput inputType1 notRequired" maxlength="100" />
								</c:if>
								</p>
							</c:forEach>
						</td>
					</tr>
					--%>
				</tbody>
			</table>
		</div>


		<div class="mt30 taR">

			<a href="./agree.do" class="btnRed2" id="cancel">취소</a>
			<a href="" class="btnRed" id="reg">회원가입</a>
		</div>

		<input type="submit" style="display:none" />
		<input type="hidden" name="idCheck" value="N" />
	</form>
</div>
					
					
<script type="text/javascript">

    function checkDuplicatedId() {
        var integrationId = document.getElementById('newIntegrationId').value.trim().replace(/\s/gi, "");
        document.getElementById('newIntegrationId').value = integrationId;
        var idReg = /^[a-z]+[a-z0-9]{3,19}$/g;
        if (!idReg.test(integrationId)) {
            alert("영문 소문자, 숫자 조합하여 4~20자만 사용 가능합니다");
            return false;
        }

        jQuery.ajax({
            //url : "/member/join/integration/checkDuplicateId.ajax",
            url : "/member/join/integration/checkDuplicateId_sso.ajax",
            type : "post",
            data : {
                "integrationId" : integrationId
            },
            success : function(data){
                console.log(data);
                if (data.availableFlag == 'Y') {
                    document.frm.idCheck.value = 'Y';
                    alert("사용가능한 아이디 입니다.");
                } else {
                    document.frm.idCheck.value = 'N';
                    alert("중복되는 아이디가 있습니다.");
                }
            }
        });
    }

    function getCookieValue(a) {
        var b = document.cookie.match('(^|;)\\s*' + a + '\\s*=\\s*([^;]+)');
        return b ? b.pop() : '';
    }

	$(document).ready(function() {
	    document.getElementById('newIntegrationId').addEventListener('input', function(e) {
            document.frm.idCheck.value = 'N';
		});

		var marketingYn = getCookieValue('marketingYn');
		
		var $marketingYnRadios = $('input:radio[name=marketingYn]');
		if(marketingYn == 'Y'){
			$marketingYnRadios.filter('[value=Y]').prop('checked', true);			
		} else {
			$marketingYnRadios.filter('[value=N]').prop('checked', true);
		}
	})
</script>