<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/WEB-INF/jsp/include/el.jspf"%>

<h2 style="font-size: 36px; color: #333; line-height: 36px; margin-bottom: 50px; font-family: 'NanumSquareB'; font-weight: normal;">쿠쿠-대명 제휴 상품 실적 조회 페이지</h2>

<form name="frm" method="post">
    <input type="hidden" name="checkAuth" id="checkAuth" value="N" />

    <div data-controller="CommonController OutsourcingController">
        <p class="titTxt mt40">판매사 정보 입력</p>
        <div class="boardType2 mt15" >
            <table summary="">
                <caption></caption>
                <colgroup>
                    <col width="20%" />
                    <col width="80%" />
                </colgroup>
                <tbody>

                    <tr>
                        <th scope="row">
                            <span class="essen" title="필수입력">판매사원 성명</span>
                        </th>
                        <td>
                            <input type="text" name="name" title="판매사원명" class="inputType1" maxlength="20" value="" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <span class="essen" title="필수입력">판매자 연락처</span>
                        </th>
                        <td>
                            <input type="text" name="phone" title="판매자 연락처" class="inputType1 phoneChk" maxlength="13" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <span class="essen" title="필수입력">생년월일</span>
                        </th>
                        <td>
                            <input type="text" name="birth" id="birthDay" title="생년월일" class="inputType1 numberChk" maxlength="8" value="" />
                            <span class="red"> * 생년월일은 8자리로 입력해주세요. ex)19580101</span>
                        </td>
                    </tr>

                </tbody>
            </table>

            <div style="width: 100%; text-align: center;">
                <span class="whtBt3" onclick="javascript:searchRecord();" style="margin: 20px auto 0; cursor: pointer" href="">확인</span>
            </div>

            <div class="accreditPop" style="display: none;">
                <div class="accreditCenter">
                    <h3>
                        <span>본인인증</span>
                        <img src="/common/images/btn/popupClose_btn.png" onclick="layerPopClose();" />
                    </h3>
                    <div class="accreditDiv">
                        <div class="accreditBts">
                            <p class="mobile">
                                <a href="#" class="whtBt" onclick="javascript:mobileAuth();">휴대폰 인증</a>
                            </p>
                            <p class="ipin">
                                <a href="javascript:ipinAuth();" class="whtBt">아이핀 인증</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</form>

<div class="scrollX mt20 boardType2">
    <table class="calendar-table hidden">
        <tr>
            <td>
                <div class="date">
                    <input type="text" id="startDate" name="telAbleDts" value="" title="날짜입력" class="inputType1 monthpicker_input" style="" readonly="readonly" />
                    <%--<a href="javascript:" onclick="jQuery(this).prev().focus();"><img alt="날짜" src="/common/images/icon/calendar_icon.gif" /></a>--%>
                </div>
                <span style="display: inline-block; float: left; height: 30px; width: 15px;">~</span>
                <div class="date">
                    <input type="text" id="endDate" name="telAbleDte" value="" title="날짜입력" class="inputType1 monthpicker_input" style="" readonly="readonly" />
                    <%--<a href="javascript:" onclick="jQuery(this).prev().focus();"><img alt="날짜" src="/common/images/icon/calendar_icon.gif" /></a>--%>
                </div>
                <span class="whtBt3" onclick="javascript:callApi(1);" style="margin: auto 0; cursor: pointer" href="">검색</span>
            </td>
        </tr>
    </table>
    <div id="record-area" class="boradType7 shrt"></div>
</div>



<form name="form1" action="/outsourcing/phoneAuthSMART.do" method="post">
    <input type="hidden" name="rqst_caus_cd" value="00" />
    <input type="hidden" name="rMsg" value="/outsourcing/checkAuthSMART.do" />
</form>

<form name="form2" action="/outsourcing/ipinAuthSMART.do" method="post">
    <input type="hidden" name="rMsg" value="/outsourcing/checkAuthSMART.do" />
</form>


<!-- 본인확인 처리결과 정보 -->
<form name="kcbResultForm" id="kcbResultForm">
    <input type="hidden" name="result_cd" value="" />
    <input type="hidden" name="result_msg" value="" />
    <input type="hidden" name="di" value="" />
    <input type="hidden" name="ci" value="" />
    <input type="hidden" name="name" value="" />
    <input type="hidden" name="birthday" value="" />
    <input type="hidden" name="sex" value="" />
    <input type="hidden" name="tel_com_cd" value="" />
    <input type="hidden" name="tel_no" value="" />
    <input type="hidden" name="return_msg" value="" />
</form>
<!-- 본인확인(아이핀) 처리결과 정보 -->
<form name="kcbOutForm" id="kcbOutForm">
    <input type="hidden" name="dupinfo" />
    <input type="hidden" name="realname" />
    <input type="hidden" name="sex" />
    <input type="hidden" name="birthdate" />
    <input type="hidden" name="coinfo1" />
    <input type="hidden" name="coinfo2" />
    <input type="hidden" name="return_msg" />
</form>

<link href="/common/css/MonthPicker.css" rel="stylesheet">
<script src="/common/js/MonthPicker.js"></script>

<script type="text/javascript">

    window.onload = function() {
        var endDt = new Date();
        var startDt = new Date();
        startDt = new Date(startDt.setMonth(startDt.getMonth()-1));

        console.log('시간이 설정되어유...');
        console.log(startDt.getMonth());
        console.log(endDt.getMonth());

        $('#startDate').MonthPicker({
            Button: function(opts) {
                return '<a href="javascript:" onclick="jQuery(this).prev().focus();"><img alt="날짜" src="/common/images/icon/calendar_icon.gif" /></a>';
            },
            MonthFormat: 'yy-mm',
            i18n: {
                months: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
            }
        });
        $('#endDate').MonthPicker({
            Button: function(opts) {
                return '<a href="javascript:" onclick="jQuery(this).prev().focus();"><img alt="날짜" src="/common/images/icon/calendar_icon.gif" /></a>';
            },
            MonthFormat: 'yy-mm',
            i18n: {
                months: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
            }
        });
        $('#startDate').MonthPicker({ SelectedMonth: startDt });
        $('#endDate').MonthPicker({ SelectedMonth: endDt });


        if (location.hostname == 'dev.daemyunglifeway.co.kr') {
            document.getElementsByName('name')[0].value = '한상민';
            document.getElementsByName('phone')[0].value = '010-9206-8504';
            document.getElementsByName('birth')[0].value = '19861106';
        }
    };

    function searchRecord() {
    	
        if (location.hostname == 'dev.daemyunglifeway.co.kr' || location.hostname == 'localhost') {
            // 테스트용
			document.frm.name.value = "신지훈";
			document.frm.phone.value = "010-4126-5827";
			document.frm.birth.value = "19830722";
            document.getElementById('checkAuth').value = 'Y';
            callApi(1);
        } else {
            // if (testValidate()) {
            //     document.getElementById('checkAuth').value = 'Y';
            //     callApi(1)
            // } else {
                document.getElementById('checkAuth').value = 'N';
                if(confirm("판매사원 인증이 필요합니다.\n인증하시겠습니까?")){
                    layerPopOpen();
                }
            // }

            // 테스트 확인용
            function testValidate() {
                var passFlag = false;

                var testInfoList = [{
                    name: '신지훈',
                    phone: '010-4126-5827',
                    birth: '19830722'
                }, {
                    name: '김영일',
                    phone: '010-9013-7567',
                    birth: '19780926'
                }];

                var name = document.getElementsByName('name')[0].value;
                var phone = document.getElementsByName('phone')[0].value;
                var birth = document.getElementsByName('birth')[0].value;

                for (var i = 0; i < testInfoList.length; i++) {
                    if (testInfoList[i].name == name && testInfoList[i].phone == phone && testInfoList[i].birth == birth) {
                        passFlag = true;
                        break;
                    }
                }
                console.log(passFlag);
                return passFlag;
            }
        }

    }


    function callApi(pageNum) {
    	
        if (document.getElementById('checkAuth').value == 'Y') {
            var startDate = document.getElementById('startDate').value.replaceAll('-', '');
            var endDate = document.getElementById('endDate').value.replaceAll('-', '');

            console.log('검색 날짜 여유...')
            console.log('시작일 : ' + startDate);
            console.log('종료일 : ' + endDate);
            console.log('성명 : ' + document.frm.name.value);
            console.log('연락처 : ' + document.frm.phone.value);
            console.log('생년월일 : ' + document.frm.birth.value);

            jQuery.ajax({
                url : "/Cuckoo-home/userRecord.ajax",
                type : "POST",
                data : {
                    "name" : document.frm.name.value,
                    "phone" : document.frm.phone.value,
                    "birth" : document.frm.birth.value,
                    "startDate": startDate,
                    "endDate": endDate,
                },
                success : function(result){
                    var calendarClassList = document.getElementsByClassName('calendar-table')[0].classList;

                    if (calendarClassList.contains('hidden')) {
                        calendarClassList.remove('hidden');
                    }
					
                    console.log(result);
                    
                    document.getElementById('record-area').innerHTML = result;
                }
            });
        }
    }

    function layerPopOpen() {
        $(".accreditPop").css("display","table");
    }
    function layerPopClose() {
        $(".accreditPop").css("display","none");
    }

    function mobileAuth(){	// 모바일, 아이핀 인증 팝업
        var formObj = document.form1;
        window.open('', 'auth_popup', 'width=520, height=640');
        formObj.target = "auth_popup";
        formObj.submit();
    }

    function ipinAuth(){	// 모바일, 아이핀 인증 팝업
        var formObj = document.form2;
        window.open('', 'auth_popup', 'width=520, height=640');
        formObj.target = "auth_popup";
        formObj.submit();
    }

    function returnMobileAuth(){
        $.ajax({
            type : 'POST',
            url : '/outsourcing/getPhoneAuthInfSMART.ajax',
            //data : $('#kcbResultForm').serialize(),
            success : function(r){
                if(r.authYn == "Y" || r.authYn == "R"){
                    alert("판매자정보가 인증되었습니다.");
                    $(".accreditPop").css("display","none");
                    $("#checkAuth").val("Y");
                    // document.frm.name.focus;
                    callApi(1);
                // } else if (r.authYn == "R"){
                //     alert("동일한 CI값이 존재합니다. \n인증이 실패하였습니다.");
                //     $("#checkAuth").val("N");
                //     layerPopClose();
                } else if (r.authYn == "H"){
                    alert("입력된 판매자 연락처와 인증된 연락처가 다릅니다. \n인증이 실패하였습니다.");
                    $("#checkAuth").val("N");
                    layerPopClose();
                }else {
                    alert("판매자정보 인증이 실패하였습니다.");
                    $("#checkAuth").val("N");
                    layerPopClose();
                }
            },
            error : function(){
                $("#checkAuth").val("N");
                layerPopClose();
            }
        });
    }

    function returnIpinAuth(){
        $.ajax({
            type : 'POST',
            url : '/outsourcing/getIpinAuthInfSMART.ajax',
            //data : $('#kcbResultForm').serialize(),
            success : function(r){
                if(r.authYn == "Y" || r.authYn == "R"){
                    alert("판매자정보가 인증되었습니다.");
                    $(".accreditPop").css("display","none");
                    $("#checkAuth").val("Y");
                    // document.frm.name.focus;
                    callApi(1);
                // } else if (r.authYn == "R"){
                //     alert("동일한 CI값이 존재합니다. \n인증이 실패하였습니다.");
                //     $("#checkAuth").val("N");
                //     layerPopClose();
                } else {
                    alert("판매자정보 인증이 실패하였습니다.");
                    $("#checkAuth").val("N");
                    layerPopClose();
                }
            },
            error : function(){
                $("#checkAuth").val("N");
                layerPopClose();
            }
        });
    }
</script>