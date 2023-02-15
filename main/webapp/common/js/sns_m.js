$(function(){
	var url;
	var msg;
	
	//페이스북
	$(".sns_facebook").click(function(){
		msg = jQuery(document).attr("title");
		url = location.href;
		
		var href = "http://www.facebook.com/sharer.php?u=" + encodeURIComponent(url) +  "&t=" + encodeURIComponent(msg);
		var winProps = 'height=300, width=500, resizable=yes, scrollvars=yes';
		var newWin = open(href,'twitter',winProps);

		if(newWin){
			newWin.focus();
		}
	});

	//트위터
	$(".sns_twitter").click(function(){
		msg = jQuery(document).attr("title");
		url = location.href;
		var href = "http://twitter.com/share?text=" + encodeURIComponent(msg) + "&url=" + encodeURIComponent(url);
		var winProps = 'height=300, width=500, resizable=yes, scrollvars=yes';
		var newWin = open(href,'twitter',winProps);

		if(newWin){
			newWin.focus();
		}
	});

	//구글 플러스
	$(".sns_google").click(function(){
		url = location.href;
		$(this).attr("href", "https://plus.google.com/share?url="+url);
		window.open(this.href,'', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;
	})

	//링크드인
	$(".sns_linked").click(function(){
		url = location.href;
		$(this).attr("href", "https://www.linkedin.com/shareArticle?url="+url);
		window.open(this.href,'', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;
	})

	//카카오톡
	/*
		1. https://developers.kakao.com/ 접속 후 앱 개발 시작하기 클릭
		2. 설정 - 일반 이동 후 플랫폼 추가하여 사이트 도메인에 대명라이프웨이 도메인 입력
		3. 앱을 새로 만든 후  JavaScript 키를 부여받습니다 (예:21979c515c03cd2f2689580b5535e59f)
	*/
	var kakaoKey = "21979c515c03cd2f2689580b5535e59f";		// JavaScript 키를 설정해 주세요.
	var kakaoTurl = location.href;
	kakaoTmsg = jQuery(document).attr("title");

	/*
	Kakao.init(kakaoKey);
	Kakao.Link.createTalkLinkButton({
		container: '#kakao-link-btn',
		label: '대명라이프웨이',
		image: {
			src: 'http://hyundai-recruit.easymedia.co.kr/common/images/logo.gif',			//카톡 채팅창에 노출되는 이미지입니다.
			width: '210',
			height: '50'
		},
		webButton: {
			text: kakaoTmsg,
			url: kakaoTurl 
		}
	});
	*/

	//카카오스토리
	window.kakaoAsyncInit = function () {
		Kakao.init('5e9ca787433a9b95faba1a5265916023');
		Kakao.Story.createShareButton({
			container: '#kakaostory-share-button'
		});
	};

	(function (d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = "//developers.kakao.com/sdk/js/kakao.story.min.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'kakao-js-sdk'));
});