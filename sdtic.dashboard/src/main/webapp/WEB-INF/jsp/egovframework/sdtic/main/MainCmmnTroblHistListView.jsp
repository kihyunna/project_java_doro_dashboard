<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"                   %>
<%@ taglib prefix="form"    uri="http://www.springframework.org/tags/form"              %>
<%@ taglib prefix="ui"      uri="http://egovframework.gov/ctl/ui"                       %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions"                %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name='author' content='ITF' />
<meta http-equiv='description' content='장애이력목록' />
<title>장애이력목록</title>


<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/common.css" />

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/jQueryUI/jquery-ui-1.12.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/main/default.js"></script>
<!-- jQuery UI CSS -->
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/css/jQueryUI/jquery-ui-1.10.4.custom.css"/>
<!-- jQuery 그리드 지역별 스트립트 -->
<script type="text/javascript" src="${contextPath}/js/jqGrid/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/jqGrid/i18n/grid.locale-ko_KR.js"></script>
<!-- jQuery Grid CSS -->
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/css/jqGrid/ui.jqgrid.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/css/jqGrid/grid.css"/>

<script type="text/javascript">
$(function(){
	$.datepicker.regional['ko'] = {
	closeText: '닫기',
	prevText: '이전달',
	nextText: '다음달',
	currentText: '오늘',
	monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
	'7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
	monthNamesShort: ['1월','2월','3월','4월','5월','6월',
	'7월','8월','9월','10월','11월','12월'],
	dayNames: ['일','월','화','수','목','금','토'],
	dayNamesShort: ['일','월','화','수','목','금','토'],
	dayNamesMin: ['일','월','화','수','목','금','토'],
	weekHeader: 'Wk',
	dateFormat: 'yy-mm-dd',
	firstDay: 0,
	isRTL: false,
	showMonthAfterYear: true,
	yearSuffix: ''};
	$.datepicker.setDefaults($.datepicker.regional['ko']);

 	$('#start_date').datepicker({ 
		showOn: 'button',
		buttonImage: '${contextPath}/images/main/cal.png', //이미지 url
		buttonImageOnly: true,
		buttonText: "달력",
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true
 	});
 	
 	$('#end_date').datepicker({ 
		showOn: 'button',
		buttonImage: '${contextPath}/images/main/cal.png', //이미지 url
		buttonImageOnly: true,
		buttonText: "달력",
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true
 	});
});

jQuery(document).ready(function($){
	var test = new Date();
    test = dateToYYYYMMDD(test);
    $("#start_date").val(test);
    $("#end_date").val(test);
    
    // 그리드 셋팅
    uf_initGridWidget();

    // 장애이력목록 팝업창 취소버튼
    $("#reportCnsBtn").click( function (){
        window.close();

        return false;
    });
});

function dateToYYYYMMDD(date){
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
}

function search(url){
    var reportUrl = url;
    var url = reportUrl;
    popup = WinPop(url,'reportPop','800','360');
}

/**********************************************************
내    용    : jQuery 그리드 로딩
파라미터    :
리 턴 값    :
참고사항    :
***********************************************************/
function uf_initGridWidget(){
    $("#gridTbl").jqGrid({
        url : "${contextPath}/main/mainCmmnTroblHistList.do",
        datatype : "json" ,
        height : 400,
        width : 860,
        viewrecords : true,
        rownumvers: true,
        rowNum : 10000,
        postData:
        {
        	start_date     : $("#start_date").val().replace(/-/gi,""),
        	end_date       : $("#end_date").val().replace(/-/gi,"")
        },
        loadComplete : function(data) {
            $.each(data, function(i, item){
                if( i== "rows"){
                    if(item <1){
                        alert("데이터가 없습니다");
                    }
                }
            });
        },
        ondblClickRow: function(rowid){
            reportId = $("#gridTbl").getCell(rowid, "troblseq");
            detailReport(reportId);
        },

        colNames : ['번호','분류','호스트명','장애등급','처리상태','장애내용','최초등록일시', '처리일시', '장애이력키값'],
        colModel : [

            {name: 'rowcnt',              index:'rowcnt',              width:50 ,  fixed:true, align: "center",  sortable : false},
            {name: 'detailclse',          index:'detailclse',          width:120,  fixed:true, align: "center",  sortable : false},
            {name: 'hostname',            index:'hostname',            width:80,  fixed:true, align: "center",  sortable : false},
            {name: 'troblgradse',         index:'troblgradse',         width:60,  fixed:true, align: "center",  sortable : false},
            {name: 'troblprocesssttus',   index:'troblprocesssttus',   width:70,  fixed:true, align: "center",  sortable : false},
            {name: 'troblcn',             index:'troblcn',             width:120,  fixed:true, align: "left",    sortable : false},
            {name: 'inst_date',           index:'inst_date',           width:150,  fixed:true, align: "center",  sortable : false},
            {name: 'cre_date',            index:'cre_date',            width:150,  fixed:true, align: "center",  sortable : false},
            {name: 'troblseq',            index:'troblseq',            width:"0",  key:true,   align: "center", hidden:true}
        ]
    });
}
/**********************************************************
내    용    : jQuery 그리드 검색
파라미터    :
리 턴 값    :
참고사항    :
***********************************************************/

function reportSearch(){

    	if($("#start_date").val() == null || $("#start_date").val().trim() == ""){
    		alert("시작일자를 입력하세요.");
    		return false;
    	}
    	if($("#end_date").val() == null || $("#end_date").val().trim() == ""){
    		alert("완료일자를 입력하세요.");
    		return false;
    	}
    	if($("#start_date").val() > $("#end_date").val()){
    		alert("입력형식이 올바르지 않습니다.");
    		return false;
    	}
    	$("#gridTbl").setGridParam({
            postData:
            {
            	start_date     : $("#start_date").val().replace(/-/gi,""),
            	end_date       : $("#end_date").val().replace(/-/gi,"")
            }
        }).trigger("reloadGrid");  // Postdata을 넘겨주고 url로 지정된 ajax 호출하고 Grid을 Reload 시킴.
        return false;
}


/**********************************************************
내    용    : 수정 팝업창 오픈
파라미터    :
리 턴 값    :
참고사항    :
***********************************************************/
function detailReport(reportId){
    var url = '${contextPath}/main/mainCmmnTroblDetailHistListView.do';
    url += '?troblseq='+reportId;
    popup = WinPop(url,'reportPop','800','615');
}

</script>
</head>
<body class="pop">
<div id="wrap_pop">
    <!--++++++++++++++++++++++++++++++++++++++++Header++++++++++++++++++++++++++++++++++++++++-->
    <div id="hdPop">
        <div class="sect_hLft">
            <div class="txtTit">장애이력목록 조회</div>
        </div>
        <div class="sect_hRgt"><img src="${contextPath}/images/main/ico_pop_close.png" onclick="window.close();" alt="close" class="ico_pop_close" /></div>
    </div>
    <!--++++++++++++++++++++++++++++++++++++++++//Header++++++++++++++++++++++++++++++++++++++++-->

    <!--++++++++++++++++++++++++++++++++++++++++Contents++++++++++++++++++++++++++++++++++++++++-->
    <div id="cntPop">
        <!--Section of Indivisual Contents-->
        <div class="sect_iCnt">
            <!--Contents Title-->
            <div class="sect_titD1">
                장애이력목록 검색
            </div>
            <!--//Contents Title-->
            <fieldset class="frm_src">
                <legend class="skip"><span>장애이력 분류</span></legend>
                <table summary="" class="frm_lst">
                <tbody>
                    <tr>                        
                        <th scope="row"><label for=""><span class="item">발생일자</span></label></th>
                        <td>
                            <input type="text" id="start_date" name="start_date" style="text-align:center;width:80px;"/>
                        </td>
                        <td>
                            ~
                        </td>
                        <td>
                            <input type="text" id="end_date" name="end_date" style="text-align:center;width:80px;"/>
                        </td>
                    </tr>
                </tbody>
                </table>
                <div class="frm_srcBtn" onclick="javascript:reportSearch();" id="searchBtn"><span>검색</span></div>
            </fieldset>

            <fieldset class="frm_src">
                <legend class="skip"><span>장애이력목록</span></legend>
                <table summary="" class="frm_lst">
                    <table id="gridTbl"></table>
                </table>
                <div class="frm_btnSet">
                    <span class="button h30 btnBasicDblue bold"><a href="#"id="reportCnsBtn" name="reportCnsBtn">닫기</a></span>
                </div>
            </fieldset>
        </div>
    <!--++++++++++++++++++++++++++++++++++++++++Contents++++++++++++++++++++++++++++++++++++++++-->
</div>
</body>
</html>
