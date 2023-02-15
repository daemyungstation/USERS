<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><%@include file="/WEB-INF/jsp/include/el.jspf" %>

<div data-controller="CommonController JoinController" data-gb="join"  class="wrap_integration_join">
    <!-- form name="frm" method="post" action="./insert.do" -->
    <form name="frm" method="post" action="./insert_sso.do">
        <h2>대명 아임레디 통합 회원가입</h2>
	<div class="join_desc">
		<p>보다 원활한 서비스 제공을 위해 대명 아임레디 홈페이지와 아임레디몰의 ID가 통합됩니다.<br>
		기존 아이디를 통합 아이디로 전환하시고, 하나의 아이디로 대명 아임레디 서비스를 편리하게 이용하세요.
		</p>
	</div>
	<p class="joinTxt taC">
		<img src="/common/images/txt/integration_join_txt3.png" alt="약관동의 및 본인인증 ">
		<img src="/common/images/txt/integration_join_txt3_m.png" alt="약관동의 및 본인인증 " class="img_sm">
	</p>
        <p class="titTxt mt40">회원정보</p>
        <div class="boardType2 mt15">
            <table summary="">
                <caption></caption>
                <colgroup>
                    <col width="20%">
                    <col width="30%">
					<col width="20%">
                    <col width="30%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row"><span>회원이름</span></th>
                    <td>
                        ${authInf.name}
                        <input type="hidden" name="name" value="${authInf.name}" />
                    </td>
                    <th scope="row"><span>생년월일</span></th>
                    <td>${egov:convertDate(authInf.birth, 'yyyyMMdd', 'yyyy년 MM월 dd일', '')}</td>
                </tr>
                <tr>

                </tr>
                <tr>
                    <th scope="row"><span class="essen" title="필수입력">아이디</span></th>
                    <td colspan="3">
                        ${integrationId}
                        <input type="hidden" name="integrationId" value="${integrationId}" />
                        <input type="hidden" name="homepageId" value="${authInf.id}" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="essen" title="필수입력">비밀번호</span></th>
                    <td colspan="3">
                        <input type="password" id="password" name="pwd" value="" title="비밀번호" class="inputType1 passChk" style="">&nbsp;&nbsp;&nbsp;
                        <span class="red">영문 대/소문자, 숫자, 특수문자중 두가지 혼합시 10자 이상, 세가지 혼합시 8자 이상으로 사용 가능합니다.</span>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="essen" title="필수입력">비밀번호 확인</span></th>
                    <td colspan="3">
                        <input type="password" id="passwordRepeat"  value="" title="비밀번호 확인" class="inputType1 passEqual" style="">&nbsp;&nbsp;&nbsp;
                        <span class="red">영문 대/소문자, 숫자, 특수문자중 두가지 혼합시 10자 이상, 세가지 혼합시 8자 이상으로 사용 가능합니다.</span>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="essen" title="필수입력">이메일</span></th>
                    <td colspan="3">
                        <input type="text" id="email" name="email" value="${authInf.email}" title="이메일계정" class="inputType1 emailChk" maxlength="40" data-state="true" />
                        <select id="maillist" class="notRequired" onchange="javascript:changeEmail(this);">
                            <option value="">[도메인 선택]</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="nate.com">nate.com</option>
                            <option value="gmail.com">gmail.com</option>
                        </select>
                        <a href="javascript:" class="btn333" id="customEmailOverapCheck">중복확인</a>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="essen" title="필수입력">휴대전화</span></th>
                   <td colspan="3">
                        <input type="text" name="hp" value="${authInf.hp}" title="휴대전화" class="inputType1 mobileChk" maxlength="13" id="hp"/>
                        &nbsp;<span class="red">※한번 더 확인해주십시오. 오기입으로 발생하는 문제는 이용자에게 있습니다.</span><!-- 번호 입력 문구 추가 2017-07-25 -->
                    </td>
                </tr>
                <%--<tr>--%>
                    <%--<th scope="row"><span>전화번호</span></th>--%>
                    <%--<td colspan="3">--%>
                        <%--<input type="text" name="tel" value="${authInf.tel}" title="전화번호" class="inputType1 phoneChk notRequired" maxlength="13" id="tel"/>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <tr>
                    <th scope="row"><span class="essen" title="필수입력">주소</span></th>
                    <td colspan="3">
                        <div class="">
                            <input type="text" id="zipcd" name="zipcd" value="${authInf.zipcd}" title="" class="inputType3 add1 notRequired" maxlength="7" readonly="readonly" />
                            <input type="text" id="adr" name="adr" value="${authInf.adr}" title="" class="inputType5" maxlength="100" readonly="readonly" />
                            <a href="javascript:" class="btn333" id="zipcode">우편번호 찾기</a>
                        </div>
                        <p class="mt10"><input type="text" id="adr_dtl" name="adr_dtl" value="${authInf.adrDtl}" title="상세주소" class="inputType4" maxlength="100" placeholder="상세주소" /></p>
                    </td>
                </tr>
                <%--
				<tr>
					<th scope="row" rowspan="3"><span class="essen" title="필수입력">관심분야</span></th>
					<td colspan="3">
						<span class="red">회원님의 요즘 관심 분야는 무엇입니까?.</span>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<span class="list">
							<input type="checkbox" id="chkTravel" name="intrField" value="여행&레저" title="관심정보" class="checkbox" <c:if test="${fn:contains(authInf.intrField, '여행&레저')}">checked</c:if> />
							<label for="chkTravel">여행&레저</label>
						</span>
						<span class="list">
							<input type="checkbox" id="chkBeauty" name="intrField" value="헬스&뷰티" title="관심정보" class="checkbox " <c:if test="${fn:contains(authInf.intrField, '헬스&뷰티')}">checked</c:if> />
							<label for="chkBeauty">헬스&뷰티</label>
						</span>
						<span class="list">
							<input type="checkbox" id="chkFurniture" name="intrField" value="가전/가구" title="관심정보" class="checkbox " <c:if test="${fn:contains(authInf.intrField, '가전/가구')}">checked</c:if> />
							<label for="chkFurniture">가전/가구</label>
						</span>
						<span class="list">
							<input type="checkbox" id="chkWedding" name="intrField" value="웨딩" title="관심정보" class="checkbox " <c:if test="${fn:contains(authInf.intrField, '웨딩')}">checked</c:if> />
							<label for="chkWedding">웨딩</label>
						</span>
					</td>
				</tr>

				<tr>
					<td colspan="3">
						<span class="list">
							<input type="checkbox" id="chkEdu" name="intrField" value="유아/교육" title="관심정보" class="checkbox " <c:if test="${fn:contains(authInf.intrField, '유아/교육')}">checked</c:if> />
							<label for="chkEdu">유아/교육</label>
						</span>
						<span class="list">
							<input type="checkbox" id="chkConsultant" name="intrField" value="심리상담" title="관심정보" class="checkbox " <c:if test="${fn:contains(authInf.intrField, '심리상담')}">checked</c:if> />
							<label for="chkConsultant">심리상담</label>
						</span>
						<span class="list">
							<input type="checkbox" id="chkParty" name="intrField" value="실버/장례" title="관심정보" class="checkbox " <c:if test="${fn:contains(authInf.intrField, '실버/장례')}">checked</c:if> />
							<label for="chkParty">실버/장례</label>
						</span>
					</td>
				</tr>
				--%>
                </tbody>
            </table>

            <p class="red mt5">※ 상품 가입이 되어있는 경우, 입력해주신 정보로 동일하게 업데이트 됩니다. (3영업일 소요) (확인) </p>
            <p class="red mt5">※ 휴대전화번호/주소 기입 잘못 등 이용자 본인의 과실 및 정보 관리 소홀로 발생하는 문제의 책임은 이용자에게 있습니다.</p>
        </div>

      
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
                    <li><input type="checkbox" name="telRcvYn" value="Y" class="checkbox notRequired" <c:if test="${authInf.marketingYn ne 'N' and (authInf.telRcvYn eq null or authInf.telRcvYn eq 'Y')}">checked</c:if> <c:if test="${authInf.marketingYn eq 'N'}">disabled</c:if> />전화</li>
                    <li><input type="checkbox" name="smsRcvYn" value="Y" class="checkbox notRequired" <c:if test="${authInf.marketingYn ne 'N' and (authInf.smsRcvYn eq 'Y' or authInf.smsRcvYn eq null)}">checked</c:if> <c:if test="${authInf.marketingYn eq 'N'}">disabled</c:if> />문자</li>
                    <li><input type="checkbox" name="emailRcvYn" value="Y" class="checkbox notRequired" <c:if test="${authInf.marketingYn ne 'N' and (authInf.emailRcvYn eq 'Y' or authInf.emailRcvYn eq null)}">checked</c:if> <c:if test="${authInf.marketingYn eq 'N'}">disabled</c:if> />이메일</li>
                    <li><input type="checkbox" name="ctlgRcvYn" value="Y" class="checkbox notRequired" <c:if test="${authInf.marketingYn ne 'N' and (authInf.ctlgRcvYn eq 'Y' or authInf.ctlgRcvYn eq null)}">checked</c:if> <c:if test="${authInf.marketingYn eq 'N'}">disabled</c:if> />우편물</li>
                </ul>
            </div>
            <p>※ 회원님은 동의를 거부할 수 있습니다. 동의 거부 시에는 해당 서비스를 이용하실 수 없습니다.</p>
            <dl class="selectPack selectPackBlock">
                <dd onclick="mktAgree(1)">
                    <input type="radio" id="mkInfo1" name="marketingYn" value="Y" title="마케팅 목적 수신동의" class="checkbox notRequired" style="" <c:if test="${authInf.marketingYn eq 'Y'}">checked</c:if> />
                    <label for="mkInfo1">예</label>
                </dd>
                <dd onclick="mktAgree(0)">
                    <input type="radio" id="mkInfo2" name="marketingYn" value="N" title="마케팅 목적 수신거절" class="checkbox notRequired" style="" <c:if test="${authInf.marketingYn eq 'N'}">checked</c:if> />
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
                    <td colspan="3">
                        <span class="list">
                            <input type="radio" id="marry1" name="mrrgYn" value="Y" title="결혼 유/무" class="checkbox notRequired" <c:if test="${authInf.mrrgYn eq 'Y' or authInf.mrrgYn eq null}">checked</c:if> />
                            <label for="marry1">유</label>
                        </span>
                        <span class="list">
                            <input type="radio" id="marry2" name="mrrgYn" value="N" title="결혼 유/무" class="checkbox notRequired" <c:if test="${authInf.mrrgYn eq 'N'}">checked</c:if> />
                            <label for="marry2">무</label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <th scope="row">자녀 여부</th>
                    <td colspan="3">
                        <span class="list">
                            <input type="radio" id="children1" name="chdrnGb" value="0" title="자녀 여부" class="checkbox notRequired" <c:if test="${authInf.chdrnGb eq '0' or authInf.mrrgYn eq null}">checked</c:if> />
                            <label for="children1">없음</label>
                        </span>
                        <span class="list">
                            <input type="radio" id="children2" name="chdrnGb" value="1" title="자녀 여부" class="checkbox notRequired" <c:if test="${authInf.chdrnGb eq '1'}">checked</c:if> />
                            <label for="children2">1</label>
                        </span>
                        <span class="list">
                            <input type="radio" id="children3" name="chdrnGb" value="2" title="자녀 여부" class="checkbox notRequired" <c:if test="${authInf.chdrnGb eq '2'}">checked</c:if> />
                            <label for="children3">2</label>
                        </span>
                        <span class="list">
                            <input type="radio" id="children4" name="chdrnGb" value="3" title="자녀 여부" class="checkbox notRequired" <c:if test="${authInf.chdrnGb eq '3'}">checked</c:if> />
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
                                <td colspan="3">
                            </c:when>
                            <c:otherwise>
                                <tr>
                                <td colspan="3">
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    <span class="list">
						<input type="checkbox" id="favorInfo${status.count}" name="intr_ptc" value="${list.cd}" title="관심정보" class="checkbox notRequired" <c:if test="${fn:contains(authInf.intrPtc, list.cd)}">checked</c:if> />
						<label for="favorInfo${status.count}">${list.cdNm}</label>
					</span>
                    <c:if test="${status.count % 5 eq 0}">
                        </tr>
                    </c:if>
                </c:forEach>

                <tr>
                    <td colspan="3">
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
                            <input type="checkbox" id="chkOptionGolf" name="OptionIntrField" value="골프" title="관심정보" class="checkbox notRequired" <c:if test="${fn:contains(authInf.etcIntrField, '골프')}">checked</c:if> />
                            <label for="chkOptionGolf">골프</label>
                        </span>
                        <span class="list">
                            <input type="checkbox" id="chkOptionWedding" name="OptionIntrField" value="웨딩" title="관심정보" class="checkbox notRequired" <c:if test="${fn:contains(authInf.etcIntrField, '웨딩')}">checked</c:if> />
                            <label for="chkOptionWedding">웨딩</label>
                        </span>
                        <span class="list">
                            <input type="checkbox" id="chkOptionCamp" name="OptionIntrField" value="해외여행캠프" title="관심정보" class="checkbox notRequired" <c:if test="${fn:contains(authInf.etcIntrField, '해외여행캠프')}">checked</c:if> />
                            <label for="chkOptionCamp">해외여행캠프</label>
                        </span>
                        <span class="list">
                            <input type="checkbox" id="chkOptionCruze" name="OptionIntrField" value="크루즈" title="관심정보" class="checkbox notRequired" <c:if test="${fn:contains(authInf.etcIntrField, '크루즈')}">checked</c:if> />
                            <label for="chkOptionCruze">크루즈</label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="list">
                            <input type="checkbox" id="chkOptionDeath" name="OptionIntrField" value="장례" title="관심정보" class="checkbox notRequired" <c:if test="${fn:contains(authInf.etcIntrField, '장례')}">checked</c:if> />
                            <label for="chkOptionDeath">장례</label>
                        </span>
                        <span class="list">
                            <input type="checkbox" id="chkOptionTravel" name="OptionIntrField" value="여행" title="관심정보" class="checkbox notRequired" <c:if test="${fn:contains(authInf.etcIntrField, '여행')}">checked</c:if> />
                            <label for="chkOptionTravel">여행</label>
                        </span>
                        <span class="list">
                            <input type="checkbox" id="chkOptionParty" name="OptionIntrField" value="칠순/돌잔치" title="관심정보" class="checkbox notRequired" <c:if test="${fn:contains(authInf.etcIntrField, '칠순/돌잔치')}">checked</c:if> />
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
                               <td colspan="3">
                            </c:when>
                            <c:otherwise>
                                <tr>
                                <td colspan="3">
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    <span class="list${egov:decode(list.cdNm, '기타', '2', '')}">
                        <input type="radio" id="joinway${status.count}" name="join_path" value="${list.cd}" title="가입경로" class="checkbox notRequired" <c:if test="${authInf.joinPath eq list.cd}">checked</c:if> />
                        <label for="joinway${status.count}">${list.cdNm}</label>
                        <c:if test="${list.cdNm eq '기타'}">
                            &nbsp;&nbsp;
                            <input type="text" name="join_path_etc" value="${authInf.joinPathEtc}" title="기타" class="lginInput inputType5 notRequired" maxlength="100" />
                        </c:if>
                    </span>
                    <c:if test="${status.count % 4 eq 0}">
                        </tr>
                    </c:if>
                </c:forEach>

                <tr>
                    <th scope="row">상품가입 시,<br>장 끌렸던 점은?<br>(2가지 선택)</th>
                    <td colspan="3">
                        <c:forEach var="list" items="${cdDtlList.pfrnGb}" varStatus="status">
                            <c:choose>
                                <c:when test="${status.first}">
                                    <p>
                                </c:when>
                                <c:otherwise>
                                    <p class="mt10">
                                </c:otherwise>
                            </c:choose>
                            <input type="checkbox" id="merit${status.count}" name="pfrn_ptc" value="${list.cd}" title="상품가입 시, 가장 끌렸던 점" class="checkbox notRequired" <c:if test="${fn:contains(authInf.pfrnPtc, list.cd)}">checked</c:if> />
                            <label for="merit${status.count}">${list.cdNm}</label>
                            <c:if test="${list.cdNm eq '기타'}">
                                &nbsp;&nbsp;
                                <input type="text" name="pfrn_etc" value="${authInf.pfrnEtc}" title="기타" class="lginInput inputType1 notRequired" maxlength="100" />
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
            <a href="" class="btnRed" id="reg">전환완료</a>
            <a onclick="javascript:onClickCancel();" class="btnRed2" id="">취소</a>
        </div>

        <input type="submit" style="display:none" />
    </form>
</div>


<script type="text/javascript">
    window.onload = function() {
        $('#email').change(function(e) {
            document.getElementById('email').setAttribute('data-state', false);
        });

        document.getElementById('customEmailOverapCheck').addEventListener('click', function(e) {
            console.log(e.currentTarget);
            $.ajax({
                type : 'POST',
                url : '/member/join/checkIntegrationEmail.ajax',
                data : {
                    email: document.frm.email.value,
                    id: document.frm.homepageId.value
                },
                success : function(success){
                    if (success.checkDuplicateEmailFlag) {
                        alert("사용가능한 이메일입니다.")
                        document.frm.email.dataset.state = "true";
                    } else {
                        alert("중복되는 이메일이있습니다.")
                        document.frm.email.dataset.state = "false";
                    }
                },
                error : function(){
                    alert('이메일 중복검사에 실패했습니다.');
                }
            });
        });
    };

    function changeEmail() {
        document.frm.email.dataset.state = "false";
    };

    function onClickCancel() {
        var confirmFlag = confirm('취소 시 기존 아이디로 대명 아임레디 사이트에 로그인 하실 수 없습니다. 그래도 취소 하시겠습니까?');
        if (confirmFlag) {
            location.replace("/main/index.do");
        }
    };

</script>