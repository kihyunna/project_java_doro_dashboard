<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"                   %>
<%@ taglib prefix="form"    uri="http://www.springframework.org/tags/form"              %>
<%@ taglib prefix="ui"      uri="http://egovframework.gov/ctl/ui"                       %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions"                %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="author" content="ITF">
<meta http-equiv="description" content="보고서 관리">
<title>보고서 관리</title>


<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/common.css">

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/main/default.js"></script>
<!-- jQuery UI CSS -->
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/css/jQueryUI/jquery-ui-1.10.4.custom.css">
<!-- jQuery 그리드 지역별 스트립트 -->
<script type="text/javascript" src="${contextPath}/js/jqGrid/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/jqGrid/i18n/grid.locale-ko_KR.js"></script>
<!-- jQuery Grid CSS -->
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/css/jqGrid/ui.jqgrid.css">
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/css/jqGrid/grid.css">

<script type="text/javascript">

jQuery(document).ready(function($){
    // 그리드 셋팅
    uf_initGridWidget();

    // 보고서 입력창 호출
    $("#reportAddBtn").click( function (){

    var url = '${contextPath}/main/mainCmmnReportInstView.do';
    popup = WinPop(url,'reportPop','800','360');

    });

    // 보고서 목록 팝업창 취소버튼
    $("#reportCnsBtn").click( function (){
        //alert("취소버튼클릭");
        window.close();

        return false;
    });

});

function search(url){
    var reportUrl = url; 
    var url = reportUrl;
    popup = WinPop(url,'reportPop','930','650');
}

/**********************************************************
내    용    : jQuery 그리드 로딩
파라미터    :
리 턴 값    :
참고사항    :
***********************************************************/
function uf_initGridWidget(){
    $("#gridTbl").jqGrid({
        url : "${contextPath}/main/mainCmmnReportListAjax.do",
        datatype : "json" ,
        height : 400,
        width : 800,
        viewrecords : true,
        rownumvers: true,
        sortable: false,
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
            reportId = $("#gridTbl").getCell(rowid, "report_id");
            detailReport(reportId);
        },

        colNames : ['번호','분류','주소','보고서 설명','보고서 명','조회','보고서키값'],
        colModel : [

            {name: 'rowcnt',        index:'rowcnt',      width:80 ,  fixed:true, align: "center" , sortable : false },
            {name: 'clfy_typ',      index:'clfy_typ',    width:70 , fixed:true, align: "center" , sortable : false},
            {name: 'url',           index:'url',         width:250 , fixed:true, align: "center" , sortable : false},
            {name: 'report_desc',   index:'report_desc', width:150 , fixed:true, align: "center" , sortable : false},
            {name: 'report_nm',     index:'report_nm',   width:127 , fixed:true, align: "center" , sortable : false},
            {name: 'searchBtn',     index:'searchBtn',   width:55,   fixed:true, align:"center" , sortable : false},
            {name: 'report_id',     index:'report_id',   width:"0", key:true, align:"center", hidden:true}
        ],
                afterInsertRow  :function(rowid, rowdata, rowelem) {
                var searchBtn = "" +
                    '<input type="button" onclick="search(\''+rowdata.url+'\')" value="조회"/>' ;
                $("#gridTbl").setCell(rowid, "searchBtn", searchBtn, "");
        }


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
function detailReport(reportId){
    var url = '${contextPath}/main/mainCmmnReportUpdtView.do';
    url += '?report_id='+reportId;
    popup = WinPop(url,'reportPop','800','385');
}

</script>
</head>
<body class="pop">
<div id="wrap_pop">
    <!--++++++++++++++++++++++++++++++++++++++++Header++++++++++++++++++++++++++++++++++++++++-->
    <div id="hdPop">
        <div class="sect_hLft">
            <div class="txtTit">보고서 관리</div>
        </div>
        <div class="sect_hRgt"><img src="${contextPath}/images/main/ico_pop_close.png" onclick="window.close();" alt="close" class="ico_pop_close"></div>
    </div>
    <!--++++++++++++++++++++++++++++++++++++++++//Header++++++++++++++++++++++++++++++++++++++++-->

    <!--++++++++++++++++++++++++++++++++++++++++Contents++++++++++++++++++++++++++++++++++++++++-->
    <div id="cntPop">
        <!--Section of Indivisual Contents-->
        <div class="sect_iCnt">
            <!--Contents Title-->
            <div class="sect_titD1">
                보고서 검색
            </div>
            <!--//Contents Title-->
            <fieldset class="frm_src">
                <legend class="skip"><span>보고서 분류</span></legend>
                <table summary="" class="frm_lst">
                <tbody>
                    <tr>
                        <th scope="row"><label for=""><span class="item">분류</span></label></th>
                        <td>
                            <select id="clfy_typ">
                                <option value="">== 전체 ==</option>
                                <option value="001">메인</option>
                                <option value="002">인프라</option>
                                <option value="003">비즈니스</option>
                                <option value="004">현장설비</option>
                            </select>
                        </td>
                        <th scope="row"><label for=""><span class="item">보고서 명</span></label></th>
                        <td>
                            <input type="text" id="report_nm" name="report_nm">
                        </td>
                    </tr>
                </tbody>
                </table>
                <div class="frm_srcBtn" onclick="javascript:reportSearch();" id="searchBtn"><span>검색</span></div>
            </fieldset>

            <fieldset class="frm_src">
                <legend class="skip"><span>보고서 목록</span></legend>
                <table summary="" class="frm_lst">
                    <table id="gridTbl"></table>
                </table>
                <div class="frm_btnSet">
                    <span class="button h30 btnBasicPink bold" style="align:right"><a href="#" id="reportAddBtn" name="reportAddBtn">보고서 추가</a></span>
                    <span class="button h30 btnBasicDblue bold"><a href="#" id="reportCnsBtn" name="reportCnsBtn">닫기</a></span>
                </div>
            </fieldset>
        </div>
    <!--++++++++++++++++++++++++++++++++++++++++Contents++++++++++++++++++++++++++++++++++++++++-->
</div>
</div></body>
</html>
