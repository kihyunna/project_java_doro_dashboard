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
<meta http-equiv='description' content='업무별 인프라 관제 설정' />
<title>업무별 인프라 관제 설정</title>

<!-- jQuery UI CSS -->
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/css/jQueryUI/jquery-ui-1.10.4.custom.css"/>
<!-- jQuery Grid CSS -->
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/css/jqGrid/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/css/jqGrid/grid.css" />

<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/main/default.js"></script>
<!-- jQuery 스크립트 -->
<!-- jQuery UI 스트립트 -->
<script type="text/javascript" src="${contextPath}/js/jQueryUI/jquery-ui-1.10.4.custom.js"></script>
<!-- jQuery 그리드 스트립트 -->
<script type="text/javascript" src="${contextPath}/js/jqGrid/jquery.jqGrid.min.js"></script>
<!-- jQuery 그리드 지역별 스트립트 -->
<script type="text/javascript" src="${contextPath}/js/jqGrid/i18n/grid.locale-ko_KR.js"></script>

<style>
/*
table{font-size:10px;}
.ui-jqgrid tr.jqgrow td {font-size:10px; color:#000; padding-top:5px!important; padding-bottom:5px!important;}
.ui-jqgrid tr.jqgrow td {font-weight: normal; overflow: hidden; white-space: pre; height: 20px;padding: 1px 2px 1px 2px;border-bottom-width: 1px; border-bottom-color: inherit; border-bottom-style: solid;}

input[type=text], input[type=password] {
    height: 20px;
}
*/

#gridTbl .jqgrow{
    cursor:pointer;
}
#gridTb2 .jqgrow{
    cursor:pointer;
}
#gridTb3 .jqgrow{
    cursor:pointer;
}

#grid1 {position:absolute;}
#grid2 {position:absolute;left:300px;}
#grid3 {position:absolute;left:675px;}
#button2 {position:absolute;top:65px;left:590px;}
#button3 {position:absolute;top:65px;left:915px;}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		fn_initGrid1();
		fn_initGrid2();
		fn_initGrid3();
	});
	
	var selectUnit = "";
	var selectUnitName = "";
	var selectUnitOrder = "";
	var selectGubun = "";
	var selectGubunName = "";
	var selectGubunOrder = "";
	var selectServerGubun = "";
	var selectHostName = "";
	
	function fn_initGrid1(){
		$("#gridTbl").jqGrid({
	        url : "${pageContext.request.contextPath}/ifc/ifcUnitGrid1.do",
	        datatype : "json",
	        mtype : "POST",
	        height : 440,
	        width : 250,
	        loadComplete : function() {
	        },
	        onSelectRow : function(rowid) {
	        	$("#gridTb3").jqGrid("clearGridData", true);
	        	selectUnit = $("#gridTbl").getCell(rowid, "unit");
	        	selectUnitName = $("#gridTbl").getCell(rowid, "unit_name");
	        	selectUnitOrder = $("#gridTbl").getCell(rowid, "unit_order");
	        	fn_reloadGrid2(selectUnit);
	        }, 
	        colNames : ['주제영역코드','주제영역','순서'],
	        colModel : [
	        	{name : 'unit', index : 'unit', width : 100, align : 'center', sortable : false},
                {name : 'unit_name', index : 'unit_name', width : 100, align : 'center', sortable : false},
                {name : 'unit_order', index : 'unit_order', width : 50, align : 'center', sortable : false}   
	        ]
	    });
	}
	
	function fn_initGrid2(val){
		$("#gridTb2").jqGrid({
	        url : "${pageContext.request.contextPath}/ifc/ifcUnitGrid2.do",
	        datatype : "json",
	        mtype : "POST",
	        postData: {
				unit : val
			},
			onSelectRow : function(rowid) {
				selectGubun = $("#gridTb2").getCell(rowid, "gubun");
				selectGubunName = $("#gridTb2").getCell(rowid, "gubun_name");
				selectGubunOrder = $("#gridTb2").getCell(rowid, "gubun_order");
	        	fn_reloadGrid3(selectUnit, selectGubun);
	        },
	        ondblClickRow : function(rowid) {
	        	selectGubun = $("#gridTb2").getCell(rowid, "gubun");
				fn_modGrid2();
	        },
	        height : 440,
	        width : 350,
	        colNames : ['업무코드','업무','순서'],
	        colModel : [
	        	{name : 'gubun', index : 'gubun', width : 100, align : 'center', sortable : false},
                {name : 'gubun_name', index : 'gubun_name', width : 200, align : 'center', sortable : false},
                {name : 'gubun_order', index : 'gubun_order', width : 50, align : 'center', sortable : false}   
	        ]
	    });
	}
	
	function fn_reloadGrid2(val) {
		$("#gridTb2").setGridParam({
			postData : {
				unit : val
			}
		}).trigger("reloadGrid");
	}
	
	function fn_addGrid2() {
		if(selectUnit == ""){
			alert("주제영역을 선택하시기 바랍니다.");
			return false;
		}
		
		var gubun_list = "";
		for(var i=0;i<$("#gridTb2 tr").length;i++){
			if(selectGubun != $("#gridTb2").getCell(i, "gubun")){
				gubun_list = gubun_list + $("#gridTb2").getCell(i, "gubun") + "split";
			}
		}
		
		var url = "${pageContext.request.contextPath}/ifc/ifcUnitAddGrid2View.do";
		var param = "?unit=" + selectUnit + "&unit_name=" + selectUnitName + "&unit_order=" + selectUnitOrder;
    	var name = "addGrid2";
    	var width = 800;
    	var height = 600;
    	var opt = "";
    	
    	WinPop(url + param, name, width, height, opt);
	}
	
	function fn_modGrid2() {
		if(selectUnit == ""){
			alert("주제영역을 선택하시기 바랍니다.");
			return false;
		}
		
		var gubun_list = "";
		for(var i=0;i<$("#gridTb2 tr").length;i++){
			if(selectGubun != $("#gridTb2").getCell(i, "gubun")){
				gubun_list = gubun_list + $("#gridTb2").getCell(i, "gubun") + "split";
			}
		}
		
		var url = "${pageContext.request.contextPath}/ifc/ifcUnitModGrid2View.do";
		var param = "?unit=" + selectUnit + "&gubun=" + selectGubun + "&gubun_list=" + gubun_list;
    	var name = "modGrid2";
    	var width = 800;
    	var height = 300;
    	var opt = "";
    	
    	WinPop(url + param, name, width, height, opt);
	}
	
	function fn_initGrid3(val1, val2){
		var editableCells = ['server_gubun', 'hostname'];

		$("#gridTb3").jqGrid({
	        url : "${pageContext.request.contextPath}/ifc/ifcUnitGrid3.do",
	        datatype : "json",
	        mtype : "POST",
	        postData: {
				unit : val1,
				gubun : val2
			},
			onSelectRow : function(rowid) {
				selectServerGubun = $("#gridTb3").getCell(rowid, "server_gubun");
				selectHostName = $("#gridTb3").getCell(rowid, "hostname");
	        },
	        ondblClickRow : function(rowid) {
				selectServerGubun = $("#gridTb3").getCell(rowid, "server_gubun");
				selectHostName = $("#gridTb3").getCell(rowid, "hostname");
				fn_modGrid3();
	        },
	        height : 440,
	        width : 300,
	        colNames : ['서버구분','호스트명'],
	        colModel : [
	        	{name : 'server_gubun', index : 'server_gubun', width : 100, align : 'center', sortable : false},
                {name : 'hostname', index : 'hostname', width : 200, align : 'center', sortable : false}   
	        ]
	    });
	}
	
	function fn_reloadGrid3(val1, val2) {
		$("#gridTb3").setGridParam({
			postData : {
				unit : val1,
				gubun : val2
			}
		}).trigger("reloadGrid");
	}
	
	function fn_addGrid3() {
		if(selectUnit == ""){
			alert("주제영역을 선택하시기 바랍니다.");
			return false;
		}
		
		if(selectGubun == ""){
			alert("업무를 선택하시기 바랍니다.");
			return false;
		}
		
		var url = "${pageContext.request.contextPath}/ifc/ifcUnitAddGrid3View.do";
		var param = "?unit=" + selectUnit + "&unit_name=" + selectUnitName + "&unit_order=" + selectUnitOrder + 
				    "&gubun=" + selectGubun + "&gubun_name=" + selectGubunName + "&gubun_order=" + selectGubunOrder;
    	var name = "addGrid3";
    	var width = 800;
    	var height = 300;
    	var opt = "";
    	
    	WinPop(url + param, name, width, height, opt);
	}
	
	function fn_modGrid3() {
		if(selectUnit == ""){
			alert("주제영역을 선택하시기 바랍니다.");
			return false;
		}
		
		if(selectGubun == ""){
			alert("업무를 선택하시기 바랍니다.");
			return false;
		}
		
		/*
		if(selectServerGubun == "" || selectHostName == ""){
			alert("서버를 선택하시기 바랍니다.");
			return false;
		}
		*/
		
		var url = "${pageContext.request.contextPath}/ifc/ifcUnitModGrid3View.do";
		var param = "?unit=" + selectUnit + "&gubun=" + selectGubun + "&server_gubun=" + selectServerGubun + "&hostname=" + selectHostName;
    	var name = "modGrid3";
    	var width = 800;
    	var height = 300;
    	var opt = "";
    	
    	WinPop(url + param, name, width, height, opt);
	}
</script>
</head>
<body class="pop">
<div id="wrap_pop">
    <!--++++++++++++++++++++++++++++++++++++++++Header++++++++++++++++++++++++++++++++++++++++-->
    <div id="hdPop">
        <div class="sect_hLft">
            <div class="txtTit">업무별 인프라 관제 설정</div>
        </div>
        <div class="sect_hRgt"><img src="${contextPath}/images/main/ico_pop_close.png" onclick="window.close();" alt="close" class="ico_pop_close" /></div>
    </div>
    <!--++++++++++++++++++++++++++++++++++++++++//Header++++++++++++++++++++++++++++++++++++++++-->

    <!--++++++++++++++++++++++++++++++++++++++++Contents++++++++++++++++++++++++++++++++++++++++-->
    <div id="cntPop">
        <!--Section of Indivisual Contents-->
        <div class="sect_iCnt">
            <div id="grid1">
				<div class="sect_titD1">주제영역</div>
		        <table id="gridTbl"></table>
			</div>
			<div id="grid2">
				<div class="sect_titD1" id="title">업무</div>
		        <table id="gridTb2"></table>
			</div>
			<div id="grid3">
				<div class="sect_titD1">서버</div>
				<table id="gridTb3"></table>
			</div>
      
        </div>
        <!--//Section of Indivisual Contents-->
    </div>
    
	<div id="button2" class="frm_srcBtn" style="width:30px;height:25px;" onclick="fn_addGrid2();"><span>추가</span></div>
	<div id="button3" class="frm_srcBtn" style="width:30px;height:25px;" onclick="fn_addGrid3();"><span>추가</span></div>

    <!--++++++++++++++++++++++++++++++++++++++++Contents++++++++++++++++++++++++++++++++++++++++-->
</div>
</body>
</html>
