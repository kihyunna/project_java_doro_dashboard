//========================================================================================
// 작성자 : uramsol
// 작성일자 : 06/09/27
// 최근갱신일자 : 14/07/25
//========================================================================================

//<![CDATA[
//========================================================================================
//	Popup : 06/09/27 : 모든 팝업계열 함수를 Opt로 조절가능한 함수로 통합, 이미지팝업 별도 추가
//========================================================================================
function WinPop(Url, Name, Pw, Ph, Opt)
{
	//스크린 중앙 위치 구하기
	PosLeft = (screen.width - Pw)/2;
	PosTop = (screen.height - Ph)/2;

	if (Opt == 'scroll'){var OptV=',toolbar=no,location=no,directories=no,status=no,menuBar=no,scrollBars=yes,resizable=no';} //스크롤바만 가능
	else if (Opt == 'full'){var OptV=',toolbar=yes,location=yes,directories=yes,status=yes,menuBar=yes,scrollBars=yes,resizable=yes';} //풀옵
	else if (Opt == 'none') {var OptV=',toolbar=no,location=no,directories=no,status=no,menuBar=no,scrollBars=no,resizable=no';} //모든조건 no
	else if (Opt == 'resize'){var OptV=',toolbar=no,location=no,directories=no,status=no,menuBar=no,scrollBars=no,resizable=auto';} //사이즈조절만 가능
	else {var OptV=',top='+PosTop+',left='+PosLeft+',toolbar=no,location=no,directories=no,status=no,menuBar=no,scrollBars=yes,resizable=no';} //스크롤바만+스크린중앙
	
	var Option='width=' + Pw + ',height=' + Ph + OptV;
	winup = window.open(Url, Name, Option);
//	if (!winup) {
//	for (i=0;i<11 ;i++ ) {setTimeout(WinPop(Url, Name, Pw, Ph, Opt),500);}
//		alert('팝업 차단을 허용해 주세요.');
//	}
//	else {winup.focus();}
}

function setDateFormat(val) {
	var rtn = val;
	if(val.length == 14){
		rtn = val.substring(0,4) + "." + val.substring(4,6) + "." + val.substring(6,8) + " " + val.substring(8,10) + ":" + val.substring(10,12) + ":" + val.substring(12,14);
	}else if(val.length == 12){
		rtn = val.substring(0,4) + "." + val.substring(4,6) + "." + val.substring(6,8) + " " + val.substring(8,10) + ":" + val.substring(10,12);
	}else if(val.length == 8){
		rtn = val.substring(0,4) + "." + val.substring(4,6) + "." + val.substring(6,8);
	}
	return rtn;
}


//========================================================================================
//	PNG타입 적용 관련 스크립트(for IE6이하) : 09/02/03
//========================================================================================
function setPng24(obj) {
	obj.width=obj.height=1;
	obj.className=obj.className.replace(/\bpng24\b/i,'');
	obj.style.filter =
	"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+ obj.src +"',sizingMethod='image');"
	obj.src='';
	return '';
}

//========================================================================================
//	CSS Button Hover BG Change : 테스트용 임의 함수 : 14/05/XX
//========================================================================================
$(function(){
	$('.Basic').find('a').hover(function() {
		$(this).parents('.button').removeClass('Basic').addClass('Selected');
	},
	function(){
		$(this).parents('.button').removeClass('Selected').addClass('Basic');
	});
	$('Black').find('a').hover(function() {
		$(this).parents('.button').removeClass('Black').addClass('Selected');
	},
	function(){
		$(this).parents('.button').removeClass('Selected').addClass('Black');
	});
	$('Gray').find('a').hover(function() {
		$(this).parents('.button').removeClass('Black').addClass('Selected');
	},
	function(){
		$(this).parents('.button').removeClass('Selected').addClass('Black');
	});
});

//========================================================================================
//	Layer On/Off : 테스트용 임의 함수 : 13/09/26 추가 : Frame간 적용
//========================================================================================
var target = "";
var dp_type = "";
var frameid = "";
var layerid = "";
var evt = 0;
function layer_onoff(target,dp_type,frameid,layerid,evt) {	
	if(target == "frame") {
		if(dp_type == "on") {
			parent.frames[frameid].document.getElementById(layerid).style.display = 'block';
		} else if(dp_type == "off") {
			parent.frames[frameid].document.getElementById(layerid).style.display = 'none';
		}
	} else if(target == "frame2") {
		if(dp_type == "on") {
			parent.parent.frames[frameid].document.getElementById(layerid).style.display = 'block';
		} else if(dp_type == "off") {
			parent.parent.frames[frameid].document.getElementById(layerid).style.display = 'none';
		}
	} else if(target == "iframe") {
		if(dp_type == "on") {
			parent.document.getElementById(layerid).style.display = 'block';
		} else if(dp_type == "off") {
			parent.document.getElementById(layerid).style.display = 'none';
		}
	} else {
		if (dp_type == "on") {
			document.getElementById(layerid).style.display = "block";
		} else if(dp_type == "off") {
			document.getElementById(layerid).style.display = "none";
		}
	}
}

//========================================================================================
//	레이어 ON/OFF : 테스트용 임의 함수 : 14/05/XX
//===================================================================용====================
var layer = "";
function layer_onoff(layer) {
	if (layer == 3 ){
		document.getElementById('lv2_1').style.display = 'block';
		document.getElementById('lv2_2').style.display = 'block';
		document.getElementById('lv2_3').style.display = 'block';
		return false;
	} else if (layer == 4 ){
		document.getElementById('lv2_1').style.display = 'none';
		document.getElementById('lv2_2').style.display = 'none';
		document.getElementById('lv2_3').style.display = 'none';
		return false;
	} else if (layer == 5 ){
		document.getElementById('wf_exp').style.display = 'block';
		return false;
	} else if (layer == 6 ){
		document.getElementById('wf_exp').style.display = 'none';
		return false;
	} else if (layer == 7 ){
		document.getElementById('lvS2_1').style.display = 'block';
		document.getElementById('lvS2_2').style.display = 'block';
		document.getElementById('lvS2_3').style.display = 'block';
		document.getElementById('lvS2_4').style.display = 'block';
		return false;
	} else if (layer == 8 ){
		document.getElementById('lvS2_1').style.display = 'none';
		document.getElementById('lvS2_2').style.display = 'none';
		document.getElementById('lvS2_3').style.display = 'none';
		document.getElementById('lvS2_4').style.display = 'none';
		return false;
	}
}

//========================================================================================
//	Slide System Select : 테스트용 임의 함수 : 14/08/13
//========================================================================================
$(function(){
	$('#ico_sysSlt_dw').click(function() {
		if($('.lst_sysSlt').css("display") == 'none') {
			$('.lst_sysSlt').slideDown('0');
			$(this).css({'display':'none'});
			$('#ico_sysSlt_up').css({'display':'inline'});
			return false;
		}
	});
});
$(function(){
	$('#ico_sysSlt_up').click(function() {
		if($('.lst_sysSlt').css("display") == 'block') {
			$('.lst_sysSlt').slideUp('0');
			$(this).css({'display':'none'});
			$('#ico_sysSlt_dw').css({'display':'inline'});
			return false;
		}
	});
});
//]]>
