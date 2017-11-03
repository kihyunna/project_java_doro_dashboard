//================================================================================
// 작성자 : ODRin
// 작성일자 : 06/09/27
// 최근갱신일자 : 16/09/30
//================================================================================
//<![CDATA[
//================================================================================
//	PNG타입 적용 관련 스크립트(for IE6이하) : 09/02/03
//================================================================================
function setPng24(obj) {
	obj.width = obj.height = 1;
	obj.className = obj.className.replace(/\bpng24\b/i, '');
	obj.style.filter =
	"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + obj.src + "', sizingMethod='image');"
	obj.src = '';
	return '';
}


//================================================================================
//	Height/width Control : 테스트용 임의 함수 : 16/04/08 : 16/07/01
//================================================================================
function crtlWnH() {
	var h = $("html").height();
	var hBd = $("body").height();
	var wBd = $("body").width();
	var hHd = $("#header").outerHeight(true);
	var hFt = $("#footer").outerHeight(true);
	var hCntt = $("#contents").height();//outer고려
	var wCntt = $("#contents").width();//outer고려.margin-left때문에 글쎄
	
	if ($(document).find(".indCntt.areaCntt").length > 0) {
		$(".indCntt.areaCntt").each(function () {
			$(this).css({'height': $(this).parent(".indCntt").outerHeight(true) - $(this).parent().children(".areaHd").outerHeight(true) + 'px'});
		}); //일반 컨텐츠[Headbar Box] 내부 컨텐츠 영역 높이
	}
		
	if ($(document).find(".boxBsc").length > 0 && $(".boxBsc").hasClass("noH") === false) {
		$(".boxBsc > .areaCntt").each(function () {
			$(this).css({'height': ($(this).parent(".boxBsc").height() - $(this).parent().children(".areaHd").outerHeight(true)) + 'px'});
		}); //Box[Basic] 컨텐츠 영역 높이
	}
	
	if ($(document).find(".col2nd").length > 0) {
		$(".col2nd").each(function () {
			$(this).css({'width': $(this).parent(".sectionRow").width() - $(this).parent(".sectionRow").children(".col1st").outerWidth(true) - 12 + 'px'});
			if ($(this).hasClass('step') === true) {
				$(this).css({'width': $(this).parent(".sectionRow").width() - $(this).parent(".sectionRow").children(".col1st").outerWidth(true) - 50 + 'px'});
			}//좌측 컨텐츠 너비 사이즈에 따른 우측 컨텐츠의 유동적 너비 사이즈
			
			if ($(this).children(".indCntt").hasClass('inW') !== true) {
				$(this).children(".indCntt").css({'height': $(this).parent(".sectionRow").children(".col1st").children(".indCntt").outerHeight(true) + 'px'});
			}//col2nd 내부 indCntt에 인라인으로 높이를 지정하지 않을 경우, 좌측 컨텐츠 높이 사이즈에 따른 우측 컨텐츠의 유동적 높이 사이즈
		});
	}
	
	if ($(document).find(".grpBtnStep").length > 0) {
		$(".grpBtnStep").each(function () {
			$(this).css({'left': ($(this).parent(".sectionRow").children(".col1st").width() + 12) + 'px'});
			$(this).css({'top': ($(this).parent(".sectionRow").children(".col1st").height() - $(this).height() + $(this).parent(".sectionRow").children(".col1st").children(".areaTitD2").outerHeight(true)) / 2 + 'px'});
		}); //일반 컨텐츠[Step] 영역 위치 지정
	}
	
	if ($(document).find(".wrapPopL").length > 0 && $(".wrapPopL").hasClass("clFree") === false) {	//존재하고+자유형이 아닌지 여부
		$(".wrapPopL").each(function() {
			var hPopL = $(this).outerHeight(true);
			var wPopL = $(this).outerWidth(true);
			
			if ($(this).css("display") === 'block') {
				if ($(this).hasClass("clGis") === true || $(this).hasClass("clAlnCntt") === true) { //콘텐츠 영역으로 중앙 정렬하는 타입인지 여부
					if (hCntt > $(this).height()) {
						$(this).css({'top': ((hCntt - hPopL) / 2) + 'px'});
					} else {
						$(this).css({'top': hHd + 'px'});
					}
					if (wCntt > $(this).width()) {
						$(this).css({'left': ((wCntt - wPopL) / 2) + 'px'});
					} else {
						$(this).css({'left': hHd + 'px'});
					}
				} else {
					if (hBd > $(this).height()) {
						$(this).css({'top': ((hBd - hPopL) / 2) + 'px'});
					} else {
						$(this).css({'top': hHd + 'px'});
					}
					if (wBd > $(this).width()) {
						$(this).css({'left': ((wBd - wPopL) / 2) + 'px'});
					} else {
						$(this).css({'left': hHd + 'px'});
					}
				}
			}
		}); //레이어팝업 가로/세로 위치(중앙) 지정	
	}
	
	if ($(document).find(".wrapPopLol").length > 0) {	
		$(".wrapPopLol").each(function () {
			var hPopLol = $(this).outerHeight(true);
			var wPopLol = $(this).outerWidth(true);
			
			if ($(this).css("display") === 'block') {
				if ($(this).hasClass("clGis") === true || $(this).hasClass("clAlnCntt") === true) { //콘텐츠 영역으로 중앙 정렬하는 타입인지 여부
					if (hCntt > $(this).height()) {
						$(this).css({'top': ((hCntt - hPopLol) / 2) + 'px'});
					} else {
						$(this).css({'top': hHd + 'px'});
					}
					if (wCntt > $(this).width()) {
						$(this).css({'left': ((wCntt - wPopLol) / 2) + 'px'});
					} else {
						$(this).css({'left': hHd + 'px'});
					}
				} else {
					if (hBd > $(this).height()) {
						$(this).css({'top': ((hBd - hPopLol) / 2) + 'px'});
					} else {
						$(this).css({'top': hHd + 'px'});
					}
					if (wBd > $(this).width()) {
						$(this).css({'left': ((wBd - wPopLol) / 2) + 'px'});
					} else {
						$(this).css({'left': hHd + 'px'});
					}
				}
			}
		}); //레이어팝업 가로/세로 중앙 지정	
	}
}


//================================================================================
//	Tab ON/OFF : 테스트용 임의 함수 : 16/05/20 : 16/06/01
//================================================================================
$(function () {
	$(".sctTab > ul > li > a").each(function () {
		if ($(this).parent("li").parent("ul").parent(".sctTab").hasClass("clPLnk") === false) {
			$(".sctTab > ul > li > a").click(function () {
				var tabIdNm = $(this).attr('id');
				var tabCnttNm = "#" + tabIdNm + "Cntt";

				if ($(this).hasClass("noAct") === false) {
					$(this).parent("li").parent("ul").children("li").children("a").removeClass("active");
					$(this).addClass("active");
				}
				$(this).parent().parent().parent().parent().children(".tabCntt").css({'display' : 'none'});
				$(tabCnttNm).css({'display' : 'block'});
				crtlWnH();
				if ($(document).find("#wrapGis").length > 0) {
					crtlWnHGis();
				}
				return false;
			});
		}
	});
});


//================================================================================
//	Popup[Layer] ON/OFF : 테스트용 임의 함수 : 16/03/16 : 16/06/01
//================================================================================
function pop_onoff(stg, lyrNm) {
	var stg;
	
	if (stg === 'L1') {
		$('#coverPop').show();
	} else if (stg === 'L2') {
		$("#coverPopLol").show();
	}
	$("#" + lyrNm).show();
	$("body").addClass("actPop"); //Fix size of main[body] and Remove main[scroll]
	crtlWnH(); //Function of Size-control 
	return false;
}//Open Popup[Layer]

$(function () {
	$(".btnCls").click(function () {
		var prt = $(this).parent().parent();
		if (prt.hasClass('wrapPopL') === true) {
			//console.log('레이어팝업');
			if (prt.parent("#coverPop").length > 0) {
				$('#coverPop').hide();	
			}
			//prt.hide();
			$(this).parent().parent('.wrapPopL').hide();
			$('body').removeClass('actPop');
			crtlWnH(); //Function of Size-control 
			return false;
		} else if (prt.hasClass('wrapPopLol') === true) {
			//console.log('LoL팝업');
			if (prt.parent("#coverPopLol").length > 0) {
				$('#coverPopLol').hide();
			}
			//prt.hide();
			$(this).parent().parent('.wrapPopLol').hide();
			crtlWnH(); //Function of Size-control 
			return false;
		} else if (prt.hasClass('wrapPopW') === true) {
			//console.log('윈도우팝업');
			window.close();
		}
	});
});//Close Popup[Layer/Window]


//================================================================================
//	Popup[Window] ON/OFF : 06/09/27 : 모든 팝업계열 함수를 Opt로 조절가능한 함수로 통합, 이미지팝업 별도 추가
//================================================================================

function WinPop(Url, Name, Pw, Ph, Opt) {
//스크린 중앙 위치 구하기
	PosLeft = (screen.width - Pw) / 2;
	PosTop = (screen.height - Ph) / 2;

	if (Opt === 'scroll') {var OptV = ',toolbar=no,location=no,directories=no,status=no,menuBar=no,scrollBars=yes,resizable=no'; //스크롤바만 가능
    } else if (Opt === 'full') {var OptV = ',toolbar=yes,location=yes,directories=yes,status=yes,menuBar=yes,scrollBars=yes,resizable=yes'; //풀옵
    } else if (Opt === 'none') {var OptV = ',toolbar=no,location=no,directories=no,status=no,menuBar=no,scrollBars=no,resizable=no'; //모든조건 no
    } else if (Opt === 'resize') {var OptV = ',toolbar=no,location=no,directories=no,status=no,menuBar=no,scrollBars=no,resizable=auto'; //사이즈조절만 가능
    } else {var OptV = ',top=' + PosTop + ',left=' + PosLeft + ',toolbar=no,location=no,directories=no,status=no,menuBar=no,scrollBars=yes,resizable=no'; //스크롤바만+스크린중앙
    }
	
	var Option = 'width=' + Pw + ',height=' + Ph + OptV;
	winup = window.open(Url, Name, Option);
//	if (!winup) {
//	for (i=0;i<11 ;i++ ) {setTimeout(WinPop(Url, Name, Pw, Ph, Opt),500);}
//		alert('팝업 차단을 허용해 주세요.');
//	}
//	else {winup.focus();}
}


//================================================================================
//	Define Size of Button in Image-Input : 16/06/21
//================================================================================
$(function () {
	if ($(document).find(".ipClImgBtn").length > 0) {
		$(".ipClImgBtn").each(function () {
			$(this).children(".btnIco").css({'height': $(this).height() + 'px'});
			$(this).children(".btnIco").css({'width': $(this).height() + 'px'});
			if ($(this).hasClass("clSrch") === true) {
				$(this).children(".btnIco").attr({'title': "검색"});
			} else if ($(this).hasClass("clCld") === true) {
				$(this).children(".btnIco").attr({'title': "일자선택"});
				//View/Hide Layer of Calendar
				$(this).children(".btnIco").click(function () {
					if ($(this).parent(".ipClImgBtn").children(".lyrClSmpl.clCld").css("display") === 'none') {
						$(this).parent(".ipClImgBtn").children(".lyrClSmpl.clCld").show();
					} else {
						$(this).parent(".ipClImgBtn").children(".lyrClSmpl.clCld").hide();
					}
				});
			}
		});
	}
});

//================================================================================
//	Change Image in Hover(MouseOver) and Click : 16/03/22 : 16/07/08
//  List[clSlct] 내부의 클릭 이미지의 경우 멀티 선택이 아닌 경우 추가
//================================================================================
$(function () {
	if ($(document).find(".hvImg").length > 0) {
		$("img.hvImg").each(function () {

			var imgLct = $(this).attr('src');
			var arr1 = imgLct.split("/");
			var fileNm = arr1[arr1.length - 1];
			var imgLctOnly = imgLct.substr(0, imgLct.length - fileNm.length);
			var arr2 = fileNm.split(".");
			var imgNm = arr2[arr2.length - 2];
			var imgFm = arr2[arr2.length - 1];
			var onYN = imgNm.indexOf('_on');
			if (onYN > 0) {
				var imgNm = imgNm.replace("_on","");
				$(this).addClass('fixOn');
			}
			//console.log("경로= "+imgLct);
			//console.log("경로만= "+imgLctOnly);
			//console.log("파일명= "+fileNm);
			//console.log("이미지명= "+imgNm);
			//console.log("확장자= "+imgFm);
			//console.log("_on여부= "+onYN);
			
			if ($(this).parent("a").length > 0) {
				$(this).parent("a").hover(function () {
					$(this).children(".hvImg").attr("src", imgLctOnly + imgNm + "_on" + "." + imgFm);
					$(this).click(function () {
						if ($(this).children(".hvImg").hasClass("clkImg") === true) {
							if ($(this).parent("li").parent("ul").hasClass("clSlct") === true && $(this).parent("li").parent("ul").hasClass("clMlt") === false) {
								$(this).parent("li").parent("ul").children("li").children("a").children(".clkImg").each(function () {
									var imgLct = $(this).attr('src');
									var arr1 = imgLct.split("/");
									var fileNm = arr1[arr1.length - 1];
									var imgLctOnly = imgLct.substr(0, imgLct.length - fileNm.length);
									var arr2 = fileNm.split(".");
									var imgNm = arr2[arr2.length - 2];
									var imgFm = arr2[arr2.length - 1];
									var onYN = imgNm.indexOf('_on');
									if (onYN > 0) {
										var imgNm = imgNm.replace("_on","");
									}
									$(this).attr("src", imgLctOnly + imgNm + "." + imgFm);
									$(this).removeClass("fixOn");
								});
							}
							$(this).children(".hvImg").attr("src", imgLctOnly + imgNm + "_on" + "." + imgFm);
							$(this).children(".hvImg").addClass('fixOn');
						}
					});
				},
				function () {
					if ($(this).children(".hvImg").hasClass('fixOn') === true) {
						$(this).children(".hvImg").attr("src", imgLctOnly + imgNm + "_on" + "." + imgFm);
					} else {
						$(this).children(".hvImg").attr("src", imgLctOnly + imgNm + "." + imgFm);
					}
				});
			} else {
				$(this).hover(function () {
					$(this).attr("src", imgLctOnly + imgNm + "_on" + "." + imgFm);

					$(this).click(function () {
						if ($(this).hasClass("clkImg") === true) {
							$(this).attr("src", imgLctOnly + imgNm + "_on" + "." + imgFm);
							$(this).addClass('fixOn');
						}
					});
				},
				function () {
					if ($(this).hasClass('fixOn') === true) {
						$(this).attr("src", imgLctOnly + imgNm + "_on" + "." + imgFm);
					} else {
						$(this).attr("src", imgLctOnly + imgNm + "." + imgFm);
					}
				});
			}
		}); 
	}
	
	if ($(document).find(".clkImg").length > 0) {
		$("img.clkImg").each(function () {
			if ($(this).hasClass("hvImg") === false) {
				var imgLct = $(this).attr('src');
				var arr1 = imgLct.split("/");
				var fileNm = arr1[arr1.length - 1];
				var imgLctOnly = imgLct.substr(0, imgLct.length - fileNm.length);
				var arr2 = fileNm.split(".");
				var imgNm = arr2[arr2.length - 2];
				var imgFm = arr2[arr2.length - 1];
				var onYN = imgNm.indexOf('_on');
				if (onYN > 0) var imgNm = imgNm.replace("_on","");
				
				if ($(this).parent("a").length > 0) {
					$(this).parent("a").click(function () {
						$(this).children(".clkImg").attr("src", imgLctOnly + imgNm + "_on" + "." + imgFm);
					});
				} else {//click이 수행되는 이미지라면 반드시 a 태그가 존재해야 하므로, 아래와 같은 경우는 없는 것이 접근성에 위배되지 않는다.
					$(this).click(function () {
						$(this).attr("src", imgLctOnly + imgNm + "_on" + "." + imgFm);
					});
				}
			}
		});
	}
});


//================================================================================
//	Selected List : 16/05/24 : 16/05/31
//================================================================================
$(function (){
	if ($(document).find("ul.clSlct").length > 0) {
		$("ul.clSlct > li").each(function () {
			if ($(this).children("a").length > 0) {
				$(this).children("a").click(function () {
					if ($(this).parent("li").parent(".clSlct").hasClass("clMlt") === true) {
						if ($(this).hasClass("active") === true) {
							$(this).removeClass("active");
							return false;
						} else {
							$(this).addClass("active");
							return false;
						}
					} else {
						$(this).parents(".clSlct").children("li").children("a").removeClass("active");
						$(this).addClass("active");
						return false;
					}
					
				});
			} else {//select 기능이 있다면 반드시 a 태그가 존재해야 하므로, 아래와 같은 경우는 없는 것이 접근성에 위배되지 않는다.
				$(this).click(function () {
					if ($(this).parent(".clSlct").hasClass("clMlt") === true) {
						if ($(this).hasClass("active") === true) {
							$(this).removeClass("active");
							return false;
						} else {
							$(this).addClass("active");
							return false;
						}
					} else { 
						$(this).parent(".clSlct").children("li").removeClass("active");
					}
					$(this).addClass("active");
					return false;
				});
			}	
		});	
	}
});


//================================================================================
//	Accordian Contents ON/OFF : 16/04/18 : 미완성
//================================================================================
$(function (){
	if ($(document).find(".sctAcdn").length > 0) {
		$(".sctAcdn > .areaTit").each(function () {
			if ($(this).parent(".sctAcdn").children(".areaCntt").css("display") === 'none') {
				$(this).children(".areaRgt").children(".btnAcdn_show").css({'display':'block'});
			} else {
				$(this).children(".areaRgt").children(".btnAcdn_hide").css({'display':'block'});
			}
	
			$(this).click(function () {
				if ($(this).parent(".sctAcdn").children(".areaCntt").css("display") === 'none') {
					$(this).parent(".sctAcdn").children(".areaCntt").slideDown('0');
					//$(this).parent(".sctAcdn").children(".areaCntt").css({'display':'block'});
					$(this).children(".areaRgt").children(".btnAcdn_show").css({'display':'none'});
					$(this).children(".areaRgt").children(".btnAcdn_hide").css({'display':'block'});
				} else {
					$(this).parent(".sctAcdn").children('.areaCntt').slideUp('0');
					//$(this).parent(".sctAcdn").children('.areaCntt').css({'display':'none'});
					$(this).children(".areaRgt").children(".btnAcdn_show").css({'display':'block'});
					$(this).children(".areaRgt").children(".btnAcdn_hide").css({'display':'none'});
				}
				ctrlAcdnHeight();
				if ($(document).find("#wrapGis").length > 0) {
					crtlWnHGis();
				}
				return false;
			});
		});
	}
});


function ctrlAcdnHeight(){
	console.log("#snbCntt 보다 전체 .sctAcdn 콘텐츠의 높이 합이 적을 경우, 일부 컨텐츠를 현재 높이 기준으로 꽉 차게 늘리기!!! 가능할까...\n그리고 다시 펼치면 원래 규정 높이대로...\n안 되겠다. 원래 쓰고 있는 소스도 있을꺼고..");
	/*	
	acdnNum = $(document).find(".sctAcdn").length;

	//console.log(acdnNum);
	
	$(".sctAcdn .areaCntt").each(function () {
		var cnttStt = $(this).height();
		//var cnttStt = $(this).css("display");
		console.log(cnttStt);
	});

	
	for (var i=0;i < acdnNum;i++) {
		
	}

	if ( acdnNum > cnttNum ) {
		console.log("하나 이상 닫혔어!!");
	} else {
		console.log("다 열렸어!!");
	}
	*/
}

if ($(document).find(".sctAcdn > .areaCntt  .treeBsc").length > 0) {
	$(".sctAcdn > .areaCntt .treeBsc").each(function () {
		$(this).css({'height': ($(this).parents(".areaCntt").height() - ($(this).parents(".areaCntt").children(".areaTreeTB").height() + 0)) + 'px'});
		$(this).css({'overflow':'auto'});//content 너비에 대한 계산 전에 css의 동 속성이 먼저 적용되어 스크롤을 발생시키지 않으므로, 재적용.
	}); //Accordion 내부 트리 영역[높이] 계산
}


//================================================================================
//	Function in Starting or Resizing  : 16/04/28
//================================================================================
$(document).ready(function () {
	crtlWnH();
});

$(window).resize(function () {
	crtlWnH();
});


//================================================================================
//	레이어 ON/OFF : 테스트용 임의 함수 : 14/05/XX
//================================================================================
function layer_onoff(layer) {
	//Tree Content
	if (layer === 3 ){
		document.getElementById('lv2_1').style.display = 'block';
		document.getElementById('lv2_2').style.display = 'block';
		document.getElementById('lv2_3').style.display = 'block';
		return false;
	} else if (layer === 4 ){
		document.getElementById('lv2_1').style.display = 'none';
		document.getElementById('lv2_2').style.display = 'none';
		document.getElementById('lv2_3').style.display = 'none';
		return false;
	//WFS
	} else if (layer === 5 ){
		document.getElementById('wf_exp').style.display = 'block';
		return false;
	} else if (layer === 6 ){
		document.getElementById('wf_exp').style.display = 'none';
		return false;
	//SNB Tree Type
	} else if (layer === 7 ){
		document.getElementById('lvS2_1').style.display = 'block';
		document.getElementById('lvS2_2').style.display = 'block';
		document.getElementById('lvS2_3').style.display = 'block';
		document.getElementById('lvS2_4').style.display = 'block';
		return false;
	} else if (layer === 8 ){
		document.getElementById('lvS2_1').style.display = 'none';
		document.getElementById('lvS2_2').style.display = 'none';
		document.getElementById('lvS2_3').style.display = 'none';
		document.getElementById('lvS2_4').style.display = 'none';
		return false;
	}
}
//]]>