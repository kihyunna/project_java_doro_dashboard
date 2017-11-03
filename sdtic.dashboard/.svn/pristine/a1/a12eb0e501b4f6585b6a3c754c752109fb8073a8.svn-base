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
<meta http-equiv='description' content='SELECT 테스트 화면' />
<title>SELECT 테스트 화면</title>

<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/main/default.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($){
    searchUpperhdqrtrs();
    function searchUpperhdqrtrs(){
        $.ajax({
            type: 'POST',
            url: "/main/selectMainInstt1lv.do",
            dataType: "json",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(data, responseText, statusText, textStatus){
                $("#select1lv").html("");
                $("#select2lv").html("");
                var contentStr  = "";
                contentStr += "<select id='upperhdqrtrs' onchange='searchBrffc();' style='width:150px;height: 30px;z-index:102;background-color:rgba(50,50,50,0.7);color:#eee;font-size:20px;'>";
                contentStr += "<option value=''> == 전체 ==</option>";
                for(var i=0; i<data.data.length; i++)
                {
                    contentStr += "    <option value=\'"+data.data[i].upperhdqrtrscode+"\'>"+data.data[i].upperhdqrtrsnm+"\</option>";
                }
                contentStr += "</select>";
                $("#select1lv").html(contentStr);
            }
            ,error : function(request, status, error){  alert("code : " +request.status + "\r\nmessage : " + request.reponseText); }
            ,beforeSend:function(){}
            ,complete :function(){}
        });
    }

    $("#CallBtn").click( function (){
        var brffcs_code =   $("#brffc").val();
        alert("선택한 코드값은 : " + brffcs_code);
    });

});

    function searchBrffc() {
        var upperhdqrtrscode = $("#upperhdqrtrs").val();
        $.ajax({
            type: 'POST',
            url: "/main/selectMainInstt2lv.do",
              data : {
                "upperhdqrtrscode" :upperhdqrtrscode
            },
            dataType: "json",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(data, responseText, statusText, textStatus){
                $("#select2lv").html("");
                var contentStr  = "";
                    contentStr += "<select id='brffc' style='width:150px;height: 30px;z-index:102;background-color:rgba(50,50,50,0.7);color:#eee;font-size:20px;'>";
                    contentStr += "<option value=''> == 전체 ==</option>";
                for(var i=0; i<data.data.length; i++)
                {
                    contentStr += "    <option value=\'"+data.data[i].brffccode+"\'>"+data.data[i].brffcnm+"\</option>";
                }
                    contentStr += "</select>";
                $("#select2lv").html(contentStr);
            }
            ,error : function(request, status, error){  alert("code : " +request.status + "\r\nmessage : " + request.reponseText); }
            ,beforeSend:function(){}
            ,complete :function(){}
        });
    }
</script>
</head>
<body class="pop">
<div id = "idDiv" style="top:30px; left : 50%; margin-left:-150px; width:100%;height: 30px;z-index:102;position: absolute;">
    <div id = "select1lv" style="float:left;"></div><div id = "select2lv" style="float:left;"></div>
</div>
    <div class="frm_btnSet" style="top:50px; left : 50%; margin-left:-150px; width:100%;height: 30px;z-index:102;position: absolute;">
        <span class="button h30 btnBasicPink bold"><a href="#" id="CallBtn" name="CallBtn">확인</a></span>
    </div>
</body>
</html>
