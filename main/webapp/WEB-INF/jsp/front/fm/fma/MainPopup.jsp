<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>

<style type="text/css">

   body,div,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,p,form,fieldset,input,table,tr,th,td{margin:0; padding:0}
	ul,ol,li{list-style:none;padding:0}
	img, fieldset{border:none; vertical-align:top}
	a{text-decoration:none; color:#777}
	a:hover, a:focus, a:active{text-decoration:none;}
	input, select{height:24px; vertical-align:middle; background:#fff; border:1px solid #e3e3e3; font-family:'NanumSquareR', dotum,"�뗭�",sans-serif; color:#777;}
	input,option{padding:3px}
   
	.btn_popup_close{
		display: block;
		height: 40px;
	    line-height: 40px;
	    overflow: hidden;
	}
	
	.btn_popup_close li{
		float:left; width: 50%;;
		text-align: center;
		box-sizing:border-box;
	
	}
	.btn_popup_close li a{ 
		display: block;
	}
	.btn_popup_close li + li{
		border-left:1px solid #eee
	}
	.btn_popup_close.btn_popup_close_alone li{
	width: 100%;	
}
	
	.btn_popup_close.btn_popup_close_alone li.today_close{
	display:none
}

	.btn_popup_close li img{
		vertical-align: middle;
		margin-left: 10px;

	}
   .layer_pop .btn_popup_close.btn_popup_close_alone li {
       width: 100%;
   }
    .popup_wrap img{
        max-width:100%;
        height: auto;
    }
</style>

<script type="text/javascript" src="/common/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="/common/js/fnc.js"></script>
<script type="text/javascript">
    var winResizeW = 0;
    var winResizeH = 0;

    window.onload = function() {
        document.getElementsByClassName("popup_wrap")[0].innerHTML = window.opener.document.getElementById('popupCntn').value;
        if (window.opener.document.getElementById('todayYn').value == 'N') {
            document.getElementsByClassName('btn_popup_close')[0].classList.add('btn_popup_close_alone');
        }

        //크롬, 사파리일때
        setTimeout(function() {
            if (navigator.userAgent.indexOf('Chrome') > -1 || navigator.userAgent.indexOf('Safari') > -1) {
                resizeWin();
            } else {
                resizeWin();
            }
        }, 100);
    }

    function resizeWin() {
        var conW = $(".wrapper").innerWidth(); //컨텐트 사이즈
        var conH = $(".wrapper").innerHeight();

        var winOuterW = window.outerWidth; //브라우저 전체 사이즈
        var winOuterH = window.outerHeight;

        var winInnerW = window.innerWidth; //스크롤 포함한 body영역
        var winInnerH = window.innerHeight;

        var winOffSetW = window.document.body.offsetWidth; //스크롤 제외한 body영역
        var winOffSetH = window.document.body.offsetHeight;

        var borderW = winOuterW - winInnerW;
        var borderH = winOuterH - winInnerH;

        //var scrollW = winInnerW - winOffSetW;
        //var scrollH = winInnerH - winOffSetH;

        winResizeW = conW + borderW;
        winResizeH = conH + borderH;

        window.resizeTo(winResizeW, winResizeH);
    }

    function closePopup() {
        if (document.getElementById('todayNot').checked) {
            setCookie("todayNotMainPopup", true, 1);
        }
        window.close();
    }
</script>

<body>

    <div class="wrapper" style="display: table;">
        <div class="popup_wrap">
        </div>
        <div class="winPop">
            <div class="popDiv">

                <ul class="btn_popup_close">
                    <li class="today_close">
                        <input type="checkbox" id="todayNot" title="오늘 그만 보기" style="height: 13px;"/>
                        <label for="todayNot">오늘 그만 보기</label>
                    </li>
                    <li>
                        <a href="javascript:" onclick="javascript:closePopup();">닫기</a>
                    </li>
                </ul>

            </div>
        </div>
    </div>

</body>
</html>