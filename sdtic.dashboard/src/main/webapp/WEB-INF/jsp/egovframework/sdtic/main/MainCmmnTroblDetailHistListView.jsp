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
<meta http-equiv='description' content='장애처리현황' />
<title>장애처리현황</title>


<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/common.css" />

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
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

jQuery(document).ready(function($){
    // 그리드 셋팅
    uf_initGridWidget();
    
    // 보고서 목록 팝업창 취소버튼
    $("#reportCnsBtn").click( function (){
        window.close();

        return false;
    });

});

/**********************************************************
내    용    : jQuery 그리드 로딩
파라미터    :
리 턴 값    :
참고사항    :
***********************************************************/
function uf_initGridWidget(){
    $("#gridTbl").jqGrid({
        url : "${contextPath}/main/mainCmmnTroblDetailHistList.do",
        datatype : "json" ,
        postData : {
        	troblseq: "${param.troblseq}"
		},
        height : 400,
        width : 727,
        viewrecords : true,
        rownumvers: true,
		rowNum: 10000,
        loadComplete : function(data) {
            $.each(data, function(i, item){
                if( i== "rows"){
                    if(item <1){
                        alert("데이터가 없습니다");
                    }
                }
            });
        },

        colNames : ['번호','처리상태','처리내용','최초등록일시','처리일시','장애이력키값'],
        colModel : [

            {name: 'rowcnt',              index:'rowcnt',               width:80 ,  fixed:true, align: "center",  sortable : false},
            {name: 'troblprocesssttus',   index:'troblprocesssttus',    width:100,  fixed:true, align: "center",  sortable : false},
            {name: 'actioncn',            index:'actioncn',             width:200,  fixed:true, align: "left",    sortable : false},
            {name: 'inst_date',           index:'inst_date',            width:142,  fixed:true, align: "center",  sortable : false},
            {name: 'cre_date',            index:'cre_date',             width:142,  fixed:true, align: "center",  sortable : false},
            {name: 'troblseq',            index:'troblseq',             width:"0",  key:true,   align:"center", hidden:true, }
        ]
    });
}
</script>
</head>
<body class="pop">
<input type="hidden" id="troblcnt" name="troblcnt"       value="<c:out value='${data.troblcnt       }' escapeXml='false'/>" /><!-- 보고서 번호       -->
<div id="wrap_pop">
    <!--++++++++++++++++++++++++++++++++++++++++Header++++++++++++++++++++++++++++++++++++++++-->
    <div id="hdPop">
        <div class="sect_hLft">
            <div class="txtTit">장애처리현황</div>
        </div>
        <div class="sect_hRgt"><img src="${contextPath}/images/main/ico_pop_close.png" onclick="window.close();" alt="close" class="ico_pop_close" /></div>
    </div>
    <!--++++++++++++++++++++++++++++++++++++++++//Header++++++++++++++++++++++++++++++++++++++++-->

    <!--++++++++++++++++++++++++++++++++++++++++Contents++++++++++++++++++++++++++++++++++++++++-->
    <div id="cntPop" style="height: 500px">
        <!--Section of Indivisual Contents-->
        <div class="sect_iCnt">
            <!--Contents Title-->
            <!--//Contents Title-->
            <fieldset class="frm_src">
                <legend class="skip"><span>장애처리현황</span></legend>
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
