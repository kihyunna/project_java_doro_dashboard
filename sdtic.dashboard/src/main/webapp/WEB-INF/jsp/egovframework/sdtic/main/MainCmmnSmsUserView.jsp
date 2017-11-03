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
<meta http-equiv='description' content='SMS 사용자 목록 관리' />
<title>SMS 사용자 목록</title>


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


    // SMS 사용자  팝업창 등록 버튼
    $("#smsUserInstBtn").click( function (){
        var manageseq = ${param.manageseq} ;
        var url = '${contextPath}/main/mainCmmnSmsUserInstView.do';
        url += '?manageseq=' +manageseq ;        
        popup = WinPop(url,'smsNumPop','420','265');
    });

    // SMS 사용자 목록 팝업창 취소버튼
    $("#smsUserCnsBtn").click( function (){
    	opener.document.location.reload();
        window.close();

        return false;
    });

    // SMS 사용자 목록 팝업창 취소버튼
    $("#smsUserCnsBtn1").click( function (){
    	opener.document.location.reload();
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
    var manageseq = ${param.manageseq} ;
    $("#gridTbl").jqGrid({

        url : "${contextPath}/main/mainCmmnSmsUserViewAjax.do",
        datatype : "json" ,
        height : 300,
        width : 400,
        postData:
        {
        	manageseq     : manageseq
        },
        data : manageseq,
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
            user_seq = $("#gridTbl").getCell(rowid, "user_seq");
            detailUser(user_seq);
        },

        colNames : ['사용자명','전화번호','관리키'],
        colModel : [
            {name: 'user_nm',       index:'user_nm',   width:75 ,  fixed:false, align: "center" , sortable : false },
            {name: 'user_mbl_num',  index:'user_mbl_num',  width:75 , fixed:false, align: "center" , sortable : false },
            {name: 'user_seq',      index:'user_seq',    width:"0", key:true, align:"center", hidden:true}
        ]

    });
}

function search(user_seq){

    var array_data = user_seq.split(",");

    var user_seq = array_data[0];
    var user_mbl_num = array_data[1];
    var user_nm = array_data[2];

    opener.fnSmsSeq(user_seq,user_mbl_num,user_nm);
    window.close();
//    opener.reloadPage(user_seq);




}

/**********************************************************
내    용    : 사용자 수정삭제 팝업창 오픈
파라미터    :
리 턴 값    :
참고사항    :
***********************************************************/
function detailUser(user_seq){
	var manageseq = ${param.manageseq}
    var url = '${contextPath}/main/mainCmmnSmsUserDelView.do';
    url += '?user_seq='+user_seq+ '&manageseq=' +manageseq ;
    popup = WinPop(url,'smsNumPop','420','265');
}

</script>
</head>
<body class="pop">
<div id="wrap_pop">
    <!--++++++++++++++++++++++++++++++++++++++++Header++++++++++++++++++++++++++++++++++++++++-->
    <div id="hdPop">
        <div class="sect_hLft">
            <div class="txtTit">SMS 사용자 목록 관리</div>
        </div>
        <div class="sect_hRgt"><img src="${contextPath}/images/main/ico_pop_close.png" id="smsUserCnsBtn1" alt="close" class="ico_pop_close" /></div>
    </div>
    <!--++++++++++++++++++++++++++++++++++++++++//Header++++++++++++++++++++++++++++++++++++++++-->

    <!--++++++++++++++++++++++++++++++++++++++++Contents++++++++++++++++++++++++++++++++++++++++-->
    <div id="cntPop">
        <!--Section of Indivisual Contents-->
        <div class="sect_iCnt">
            <!--Contents Title-->

            <fieldset class="frm_src">
                <legend class="skip"><span>SMS 사용자 목록 목록</span></legend>
                <table summary="" class="frm_lst">
                    <table id="gridTbl"></table>
                </table>
                <div class="frm_btnSet">
                    <span class="button h30 btnBasicPink bold"><a href="#" id="smsUserInstBtn" name="smsUserInstBtn">추가</a></span>
                    <span class="button h30 btnBasicDblue bold"><a href="#"id="smsUserCnsBtn" name="smsUserCnsBtn">닫기</a></span>
                </div>
            </fieldset>
        </div>
    <!--++++++++++++++++++++++++++++++++++++++++Contents++++++++++++++++++++++++++++++++++++++++-->
</div>
</body>
</html>
