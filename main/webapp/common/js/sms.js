$(function(){
	var url;
	var msg;
	
	// 웹 모바일 구분 - 카카오톡 링크공유버튼 모바일에서만
	var ua = window.navigator.userAgent.toLowerCase(); 
	
	if ( /iphone/.test(ua) || /android/.test(ua) || /opera/.test(ua) || /bada/.test(ua) ) 
	{ 
		$(".kakao").css('display', 'inline');
	}
	
	// 카카오톡 공유
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('b8e71a50ff56c7ca32980296eb8dc225');
	//Kakao.init('6aeada0241316bd6d8e3a64f49c9e611'); // 개발서버
 
	$(".kakao").click(function(e){
		e.preventDefault();
		var siteurl = $('body').attr('data-url');
		var url = location.href;
		var title = $('.head .tit').text();
		 
		var src = "/common/images/logo.gif";
		if($(this).data().idx != ""){
			src = '/cmm/fms/getImage.do?fileId=' + $(this).data().idx + '&fileSn=0';
		}
		
		Kakao.Link.sendTalkLink({			
			image: {
				src: siteurl + src,
				width: '210',
				height: '81'
			},
			label: title,
			webButton: {
				text: '대명라이프웨이',
				url: url
			}
		});		
	});
	
	// 블로그
	$(".blog").click(function(e){
		e.preventDefault();
		
		var title = $('.head .tit').text();
		
		url = location.href;
		var href = "http://blog.naver.com/openapi/share?url=" + encodeURIComponent(url) + "&title=" + title;
		var winProps = 'height=300, width=500, resizable=yes, scrollvars=yes';
		var newWin = open(href,'blog',winProps);

		if(newWin)
		{
			newWin.focus();
		}
		
		return false;
		
	});
	
	//페이스북
	$(".sns_facebook").click(function(){
		url = location.href;
		var href = "http://www.facebook.com/sharer.php?u=" + encodeURIComponent(url);
		var winProps = 'height=300, width=500, resizable=yes, scrollvars=yes';
		var newWin = open(href,'twitter',winProps);

		if(newWin)
		{
			newWin.focus();
		}
		
		return false;
	});

	//트위터
	$(".sns_twitter").click(function(){
		url = location.href;
		var title = $('.head .tit').text();
		var href = "https://twitter.com/intent/tweet?original_referer="+encodeURIComponent(url)+"&text=" + title + "&url=" + encodeURIComponent(url);
		var winProps = 'height=300, width=500, resizable=yes, scrollvars=yes';
		var newWin = open(href,'twitter',winProps);
		
		if(newWin)
		{
			newWin.focus();
		}
		
		return false;
	});

	//구글 플러스
	$(".sns_google").click(function(){
		url = location.href;
		window.open("https://plus.google.com/share?url="+url, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');
		return false;
	});
});