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
<meta http-equiv='description' content='현장설비 이벤트 보고서' />
<title>본부별 전일대비 이벤트 현황</title>


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

</head>
<body class="pop">
<div id="wrap_pop">
    <!--++++++++++++++++++++++++++++++++++++++++Header++++++++++++++++++++++++++++++++++++++++-->
    <div id="hdPop">
        <div class="sect_hLft">
            <div class="txtTit">본부별 전일대비 이벤트 현황</div>
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
                본부별 전일대비 이벤트 현황 검색
            </div>
            
            <fieldset class="frm_src">
                <legend class="skip"><span></span></legend>
                <table summary="" class="frm_lst">
                <tbody>
                    <tr>                        
                        <th scope="row"></th>
                        <td>
                            <a style="color:#171a1f;"> 검색 </a>
                        </td>
                        <th scope="row"></th>
                        <td>
                           
                        </td>
                    </tr>
                </tbody>
                </table>
                <div class="frm_srcBtn" onclick="javascript:SearchQuery();" id="searchBtn"><span>검색</span></div>
            </fieldset>
            
            <fieldset class="frm_src" style="height:600px">
                <legend class="skip"><span>이벤트 현황</span></legend>
                <iframe  name="report_frame" width="100%" height="100%"> </iframe>

            </fieldset>
        </div>
    <!--++++++++++++++++++++++++++++++++++++++++Contents++++++++++++++++++++++++++++++++++++++++-->
</div>
</body>
<script>
SearchQuery = function() {
	var url = "http://" + location.host + "/MainFecEventReportHdqr.do";
	
    $.ajax(
    {
    	type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: {},
        cache: false,
        success: function(data){ 
        	var rexpert_data = {};
        	rexpert_data["rexpertCrf"] = "tic/fec_event_report_hdqr.crf";                         
        	rexpert_data["rexpertXml"] =  data.data;               
        	rexpert_data["iframeName"] = "report_frame";
        	iframeReport(rexpert_data);
        },
        error: function(req)
        {
           
        }
    });
};

var iframeReport  = function(_data)
{
	if(_data != null){			
		var $form = $('<form></form>');
		//$form.attr('action', 'http://172.16.90.118:8084/report/jsp/reportPopup.jsp');	//개발
	    $form.attr('action', 'http://dororeport.ex.co.kr:5002/report/jsp/reportPopup.jsp');	//운영
	    $form.attr('method', 'post');
	    $form.attr('target', _data["iframeName"]);
	    $form.appendTo('body');
		$.each(_data, function(key, value) { 
			$form.append($('<input name="'+key+'" type="hidden" value="'+encodeURIComponent(value)+'">'));
		});
		$form.append($('<input name="viewOption" type="hidden" value="N">'));
		
	    $form.submit();	
	}	
};
</script>
</html>					
