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
<meta http-equiv='description' content='장애수집설정 관리' />
<title>장애수집설정 관리</title>


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

    // 장애주기 입력창 호출
    $("#reportAddBtn").click( function (){

    var url = '${contextPath}/main/mainCmmnReportInstView.do';
    popup = WinPop(url,'reportPop','800','360');

    });

    // 장애주기 목록 팝업창 취소버튼
    $("#colctcycleCnsBtn").click( function (){
        window.close();

        return false;
    });

});

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
        url : "${contextPath}/main/mainCmmnCycleManageAjax.do",
        datatype : "json" ,
        height : 400,
        width : 400,
        viewrecords : true,
        rownumvers: true,
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
            manageseq = $("#gridTbl").getCell(rowid, "manageseq");
            detailReport(manageseq);
        },

        colNames : ['이벤트분류','장애등급','임계치','수집그룹','수집주기','사용여부','관리키'],
        colModel : [
            {name: 'detailclse',    index:'detailclse',   width:50 ,  fixed:false, align: "center" , sortable : false },
            {name: 'troblgradse',   index:'troblgradse',  width:50 , fixed:false, align: "center" , sortable : false },
            {name: 'thrhld',        index:'thrhld',       width:50 , fixed:false, align: "center" , sortable : false },
            {name: 'troblcolctse',  index:'troblcolctse', width:50 , fixed:false, align: "center" , sortable : false },
            {name: 'colctcycle',    index:'colctcycle',   width:50 , fixed:false, align: "center" , sortable : false },
            {name: 'use_yn',        index:'use_yn',       width:50,   fixed:false, align: "center" , sortable : false },
            {name: 'manageseq',     index:'manageseq',    width:"0", key:true, align:"center", hidden:true}
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

    $("#searchBtn").click(function () {
        $("#gridTbl").setGridParam({
            postData:
            {
                 clfy_typ : $("#clfy_typ").val()
                ,report_nm     : $("#report_nm").val()
            }
        }).trigger("reloadGrid");  // Postdata을 넘겨주고 url로 지정된 ajax 호출하고 Grid을 Reload 시킴.
        return false;
    });
}


/**********************************************************
내    용    : 수정 팝업창 오픈
파라미터    :
리 턴 값    :
참고사항    :
***********************************************************/
function detailReport(manageseq){
    var url = '${contextPath}/main/mainCmmnCycleManageDetailView.do';
    url += '?manageseq='+manageseq;
    popup = WinPop(url,'reportPop','800','350');
}

</script>
</head>
<body class="pop">
<div id="wrap_pop">
    <!--++++++++++++++++++++++++++++++++++++++++Header++++++++++++++++++++++++++++++++++++++++-->
    <div id="hdPop">
        <div class="sect_hLft">
            <div class="txtTit">장애수집설정 관리</div>
        </div>
        <div class="sect_hRgt"><img src="${contextPath}/images/main/ico_pop_close.png" onclick="window.close();" alt="close" class="ico_pop_close" /></div>
    </div>
    <!--++++++++++++++++++++++++++++++++++++++++//Header++++++++++++++++++++++++++++++++++++++++-->

    <!--++++++++++++++++++++++++++++++++++++++++Contents++++++++++++++++++++++++++++++++++++++++-->
    <div id="cntPop">
        <!--Section of Indivisual Contents-->
        <div class="sect_iCnt">
            <!--Contents Title-->
            <fieldset class="frm_src">
                <legend class="skip"><span>장애수집설정 목록</span></legend>
                <table summary="" class="frm_lst">
                    <table id="gridTbl"></table>
                </table>
                <div class="frm_btnSet">
                    <span class="button h30 btnBasicDblue bold"><a href="#"id="colctcycleCnsBtn" name="colctcycleCnsBtn">닫기</a></span>
                </div>
            </fieldset>
        </div>
    <!--++++++++++++++++++++++++++++++++++++++++Contents++++++++++++++++++++++++++++++++++++++++-->
</div>
</body>
</html>
