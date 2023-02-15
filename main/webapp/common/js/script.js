jQuery(document).ready(function() {
	jQuery('.subCon_tab_item').click(function() {
		jQuery('.subCon_tab_item').removeClass('on');
		jQuery(this).addClass('on');

		jQuery('.specificity_contents').hide();
		jQuery('.safety_contents').hide();
		jQuery('.reliabilityy_contents').hide();

		jQuery('.'+jQuery(this).data('id')+'_contents').show();
	});

	var curAcco = 0;
	//jQuery(".faqDiv .answer").eq(curAcco).slideDown(0);
	//jQuery(".faqDiv li").eq(curAcco).addClass("on");
	jQuery(".faqDiv li").each(function(q){
		jQuery(this).find("button").click(function(){
			if(curAcco != q)
			{
				jQuery(".faqDiv .answer").eq(curAcco).slideUp(250);
				jQuery(".faqDiv li").eq(curAcco).removeClass("on");
				curAcco = q;
				jQuery(".faqDiv .answer").eq(curAcco).slideDown(250);
				jQuery(".faqDiv li").eq(curAcco).addClass("on");
			}
			else if(curAcco == q)
			{
				jQuery(".faqDiv .answer").eq(curAcco).slideUp(250);
				jQuery(".faqDiv li").eq(curAcco).removeClass("on");
				curAcco = -1;
			}
		});
	});

	var curAcco2 = -1;
//	jQuery(".service_content .answer").eq(curAcco2).slideDown(0);
//	jQuery(".service_content .service_content_item").eq(curAcco2).addClass("on");
	jQuery(".service_content .service_content_item").each(function(q){
		jQuery(this).find("button").click(function(){
			console.log(q);
			if(curAcco2 != q)
			{
				jQuery(".service_content .answer").eq(curAcco2).slideUp(250);
				jQuery(".service_content .service_content_item").eq(curAcco2).removeClass("on");
				curAcco2 = q;
				jQuery(".service_content .answer").eq(curAcco2).slideDown(250);
				jQuery(".service_content .service_content_item").eq(curAcco2).addClass("on");
			}
			else if(curAcco2 == q)
			{
				jQuery(".service_content .answer").eq(curAcco2).slideUp(250);
				jQuery(".service_content .service_content_item").eq(curAcco2).removeClass("on");
				curAcco2 = -1;
			}
		});
	});

	jQuery(".lifemembership_open").css("cursor","pointer").click(function(){
		jQuery(".service_content .answer").slideDown(250);
		jQuery(".service_content .service_content_item").addClass("on");
	});
	jQuery(".lifemembership_close").css("cursor","pointer").click(function(){
		jQuery(".service_content .answer").slideUp(250);
		jQuery(".service_content .service_content_item").removeClass("on");
	});

	/* 상조 :: STR */
	jQuery(".premature_tab a").click(function(){
		var tab_number = jQuery(this).index() + 1;

		jQuery(".premature_tab a").removeClass("on");
		jQuery(this).addClass("on");

		jQuery(".premature_tab01, .premature_tab02, .premature_tab03, .premature_tab04, .premature_tab05").hide();
		jQuery(".premature_tab0"+tab_number).show();
	});

	//리스트 가져오기
	function getPageList()
	{
		var f = document.frm;
	
		if(arguments.length > 0)
		{
			f.pageIndex.value = arguments[0];
		}
		else
		{
			f.pageIndex.value= 1;
		}
		
		f.action = "./list.do";
		f.submit();
	}

	/* 탭버튼 */
	var index = 0;
	jQuery(".tab2 a").each(function(e){
		jQuery(this).click(function(){
			if(index != e){
				jQuery(".tab2 a").eq(index).removeClass("on");
				jQuery(".tabDiv").hide();
				index = e;
				jQuery(".tab2 a").eq(index).addClass("on");
				jQuery(".tabDiv").eq(index).show();
			}
		});
	});
	
	jQuery(".tab2 a").eq(4).click(function(){
	});

	/* 탭버튼2 */
	var i = 0;
	var pHeight = jQuery(".charTab .mannerTxt2").height();
	var aHeight = jQuery(".charTab .tabBtn2").height();
	
	jQuery(".tab2 a").click(function(){
		jQuery(".tabDiv2").hide();
		jQuery("a.tabBtn2").eq(i).removeClass("on");
		i = 0;
		jQuery("a.tabBtn2").eq(i).addClass("on");
	});

	jQuery(".tab2 a").eq(4).click(function(){
		jQuery(".tabDiv2").eq(0).show();
	});
	
	jQuery("a.tabBtn2").each(function(q){
		jQuery(this).click(function(){
			if(i != q){
				jQuery("a.tabBtn2").eq(i).removeClass("on");
				jQuery(".tabDiv2").eq(i).css('display', 'none');
				i = q;
				jQuery("a.tabBtn2").eq(i).addClass("on");
				jQuery(".tabDiv2").eq(i).css('display', 'block');
			}
		});
	});
	/* 상조 :: END */

    jQuery('.tab-header').each(function (element) {
        var slider_width,
            tab_width,
            left_position,
            $active,
            $content,
            $links = jQuery(this).find('.tab-list'),
            $currentTab = jQuery(this).find('a.on')

        $active = jQuery($links.filter('[href="' + location.hash + '"]')[0] || $links[0]);
        $active.addClass('on');
        $content = jQuery($active[0].hash);
        $links.not($active).each(function () {
            jQuery(this.hash).hide();
        });
        // Binds the click event handler
        jQuery(this).on('click', 'a', function (e) {
            $active.removeClass('on');
            $content.hide();
            $active = jQuery(this);
            $content = jQuery(this.hash);
            $active.addClass('on');
            $content.show();
            e.preventDefault();
        });
    });

								
	jQuery("a.allOpen").click(function(){
		jQuery(".accoBoard li a").addClass("on");
		jQuery(".accoBoard li div.accoBox").slideDown(300);
	});
	
	jQuery("a.allClose").click(function(){
		jQuery(".accoBoard li a").removeClass("on");
		jQuery(".accoBoard li div.accoBox").slideUp(300);
	});
	
	jQuery(".accoBoard li a").click(function(){
		if(jQuery(this).hasClass("on")){
			jQuery(this).removeClass("on");
			jQuery(this).siblings(".accoBox").slideUp(300);
		}else{
			jQuery(this).addClass("on");
			jQuery(this).siblings(".accoBox").slideDown(300);
		}
	});
	
});