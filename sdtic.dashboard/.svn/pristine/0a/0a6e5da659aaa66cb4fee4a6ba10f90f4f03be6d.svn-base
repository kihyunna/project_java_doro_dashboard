//=================================================================================
// 작성자 : uramsol
// 작성일자 : 14/07/25
// 최근갱신일자 : 17/08/10
//=================================================================================

//<![CDATA[
//=================================================================================
//	Import common.js : 테스트용 임의 함수
//=================================================================================
function addJavascript(jsname) {
	var th = document.getElementsByTagName('head')[0];
	var s = document.createElement('script');

	s.setAttribute('type','text/javascript');
	s.setAttribute('src',jsname);
	th.appendChild(s);
}
addJavascript('../../js/main/common.js');

//=================================================================================
//	Height/width Control : 테스트용 임의 함수
//=================================================================================
$(window).ready(function(){
	crtlWnH();
});

$(window).resize(function(){
	crtlWnH();
});

function crtlWnH() {
	var h = $("body").height();
	var hHd = $("#header").height();
	var hFt = $("#footer").height();
	var hSnbT = $(".snb_tit").height();
	var hTit = $(".sect_tit").height();
	var hTab = $(".sect_tab").height();
	var hCnt = $(".sect_cnt").height();

	$(".titBox_cnt").each(function(){
		$(this).css({'height':( $(this).parents(".indCnt").height() - 41) + 'px'});
	}); //Title Box 내부 컨텐츠 영역 높이
	
	$(".col2nd").each(function(){	
		$(this).css({'width':( $(this).parents(".section").width() - $(this).parents(".section").children(".col1st").width() - 20) + 'px'}); 
		if($(this).hasClass('step') == true) {
			$(this).css({'width':( $(this).parents(".section").width() - $(this).parents(".section").children(".col1st").width() - 60) + 'px'});
		}
		/* box-sizing:border-box 을 적용하지 않았을 경우 활성
		if($(this).hasClass('padBox') == true) {
			$(this).css({'width':($(this).parents(".section").width() - $(this).parents(".section").children(".col1st").width() - 20 - 40) + 'px'});
			$(this).css({'height':( $(this).parents(".section").height() - 30) + 'px'});
		}
		*/
	}); //좌측 컨텐츠 너비 사이즈에 따른 우측 컨텐츠의 유동적 너비 사이즈

	$(".btnGrp_step").each(function(){
		$(this).css({'left':( $(this).parents(".section").children(".col1st").width() + 10) + 'px'});
		$(this).css({'top':( $(this).parents(".section").children(".col1st").height()/2 - 25) + 'px'});
	}); //Step 영역 위치 지정
}


//=================================================================================
//	Popup Layer ON/OFF : 테스트용 임의 함수
//=================================================================================
function pop_onoff(stg,layer) {
	var stg;
	if (stg == 'L1') {
		$('#cover_pop').show();
	} else if (stg == 'L2') {
		$('#cover_popLol').show();
	}
	$('#' + layer).show();
	$('#' + layer).css({'top':( ($('body').height() - $('#' + layer).height())/2 ) + 'px'});
	$('body').addClass('actPop'); //Fix size of main[body] and Remove main[scroll]
	crtlWnH(); //Pracice Function of Size-control 
	return false;
}

$(function(){
	$('.pop_header > .ico_close').click(function() {
		$('#cover_pop').hide();
		$('#wrap_pop').hide();
		$('body').removeClass('actPop');
		crtlWnH(); //Pracice Function of Size-control 
		return false;
	});
	$('.popLol_header > .ico_close').click(function() {
		$('#cover_popLol').hide();
		$('#wrap_popLol').hide();
		//$('body').removeClass('actPop');
		crtlWnH(); //Pracice Function of Size-control 
		return false;
	});
});
//]]>
