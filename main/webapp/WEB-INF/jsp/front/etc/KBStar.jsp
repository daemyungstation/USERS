<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%><%@include file="/WEB-INF/jsp/include/el.jspf"%>

<html>
<head>
    <title>대명아임레디 - KB국민카드</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
</head>
<style>
    body {
        margin: 0 auto;
        width: 100%;
    }
    .main_pr {
        display: flex;
        flex-direction: column;
        flex-wrap: nowrap;
        align-items: center;
        font-size: 0px;
    }
    .main_pr img { max-width: 870px; width: 98vw; }
</style>
<script>
    function changeSize(size) {
        document.querySelectorAll('.main_pr img').forEach( (i) => {  i.style.width = size ;  i.style.maxWidth = size;});
    }
    function Mobile() {return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);}
    function card_href() {
        if( Mobile() ) {
            location.href = 'https://m.kbcard.com/CRD/DVIEW/MCAMCXHIACRC0002?mainCC=b&allianceCode=04342&solicitorcode=7024342750';
        } else {
            location.href = 'https://card.kbcard.com/CRD/DVIEW/HCAMCXPRICAC0076?mainCC=a&cooperationcode=04342&solicitorcode=7024342750';
        }

    }
</script>
<body width="100%">
<div class="main_pr">
    <img src="/common/images/promotion/kbcard/main_01.png" alt="대명아임레디 - KB국민카드">
    <img src="/common/images/promotion/kbcard/main_02.png" onclick='card_href();' alt="대명아임레디 - KB국민카드">
    <img src="/common/images/promotion/kbcard/main_03.png" alt="대명아임레디 - KB국민카드">
    <img src="/common/images/promotion/kbcard/main_04.png" alt="대명아임레디 - KB국민카드">
</div>
</body>
</html>
