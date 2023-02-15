jQuery(window).load(function(){
	jQuery('#popup img').preload();
	jQuery("#popup .homeImg").height(jQuery("#popup .homeImg .img").height()+65);
	jQuery("#popup .homeImg1").height(jQuery("#popup .homeImg1 .img").height()+65);
});

jQuery(document).ready(function(){
	//�� 濡ㅻ쭅
	var curPopimg = 0;
	var maxPopimg = jQuery("#popup .homeImg .img").size()-1;
	var isMove = false;
	jQuery("#popup .homeImg .left").click(function(){
		if(isMove === false){
			isMove = true;
			jQuery("#popup .homeImg .img").eq(curPopimg).stop().animate({left:'100%'}, 500, 'easeInOutCubic');
			jQuery("#popup .homeImg .rollIcon a").eq(curPopimg).find("img").attr("src", jQuery("#popup .homeImg .rollIcon a").eq(curPopimg).find("img").attr("src").replace("_on.gif", ".gif"));
			curPopimg--;
			if(curPopimg < 0) curPopimg = maxPopimg;
			jQuery("#popup .homeImg .rollIcon a").eq(curPopimg).find("img").attr("src", jQuery("#popup .homeImg .rollIcon a").eq(curPopimg).find("img").attr("src").replace(".gif", "_on.gif"));
			jQuery("#popup .homeImg .img").eq(curPopimg).stop().animate({left:'-100%'}, 0, '');
			jQuery("#popup .homeImg .img").eq(curPopimg).stop().animate({left:0}, 500, 'easeInOutCubic', function(){
				isMove = false;
			});
		}
	});

	jQuery("#popup .homeImg .right").click(function(){
		if(isMove === false){
			isMove = true;
			jQuery("#popup .homeImg .img").eq(curPopimg).stop().animate({left:'-100%'}, 500, 'easeInOutCubic');
			jQuery("#popup .homeImg .rollIcon a").eq(curPopimg).find("img").attr("src", jQuery("#popup .homeImg .rollIcon a").eq(curPopimg).find("img").attr("src").replace("_on.gif", ".gif"));
			curPopimg++;
			if(curPopimg > maxPopimg) curPopimg = 0;
			jQuery("#popup .homeImg .rollIcon a").eq(curPopimg).find("img").attr("src", jQuery("#popup .homeImg .rollIcon a").eq(curPopimg).find("img").attr("src").replace(".gif", "_on.gif"));
			jQuery("#popup .homeImg .img").eq(curPopimg).stop().animate({left:'100%'}, 0, '');
			jQuery("#popup .homeImg .img").eq(curPopimg).stop().animate({left:0}, 500, 'easeInOutCubic', function(){
				isMove = false;
			});
		}
	});

	jQuery("#popup .homeImg .rollIcon a").each(function(q){
		jQuery(this).click(function(){
			if(curPopimg != q){
				if(isMove == false){
					isMove = true;
					jQuery("#popup .homeImg .img").eq(curPopimg).stop().animate({left:'-100%'}, 500, 'easeInOutCubic');
					jQuery("#popup .homeImg .rollIcon a").eq(curPopimg).find("img").attr("src", jQuery("#popup .homeImg .rollIcon a").eq(curPopimg).find("img").attr("src").replace("_on.gif", ".gif"));
					curPopimg = q;
					jQuery("#popup .homeImg .rollIcon a").eq(curPopimg).find("img").attr("src", jQuery("#popup .homeImg .rollIcon a").eq(curPopimg).find("img").attr("src").replace(".gif", "_on.gif"));
					jQuery("#popup .homeImg .img").eq(curPopimg).stop().animate({left:'100%'}, 0, '');
					jQuery("#popup .homeImg .img").eq(curPopimg).stop().animate({left:0}, 500, 'easeInOutCubic', function(){
						isMove = false;
					});
				}
			}
		});
	});

	jQuery(window).resize(function(){
		jQuery("#popup .homeImg").height(jQuery("#popup .homeImg .img").height()+65);
		jQuery("#popup .homeImg1").height(jQuery("#popup .homeImg1 .img").height()+65);
		jQuery(".scrollX .widthScbg").each(function(r){
			jQuery(".scrollX .widthScbg").eq(r).height(jQuery(".scrollX").eq(r).height());
		});
	}); 
	
	jQuery(window).resize();
	
});

$.fn.preload = function() {
	$("#popup").find('img').each(function(){
		$(this).attr('src');
	});
}