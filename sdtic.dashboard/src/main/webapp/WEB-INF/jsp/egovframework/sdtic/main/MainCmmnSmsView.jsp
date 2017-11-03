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
<meta http-equiv='description' content='SMS 서비스 화면' />
<title>SMS 서비스 화면</title>


<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/main/default.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($){

    $("#smsCallBtn").click( function (){


        var msg        = $("#msg").val();
        var subject    = $("#subject").val();
        var callname   = $("#callname").val();
        var callphone  = $("#callphone").val();

        if(callname==""){
            alert("수신자를 적어주세요");
            return;
        }

        if(callphone==""){
            alert("수신 번호를 적어주세요");
            return;
        }

        if(msg==""){
            alert("SMS 메시지를 적어주세요");
            return;
        }
        var chk = $("#callphone").val();
        chk = chk.replace(/[^0-9]\^./g,"");
        if (isNaN(chk) == true) {
            alert ("숫자만 입력 가능합니다. 예) 01011112222")
            $("#callphone").focus();
            return;
        }
        
        $.ajax({
            type: 'POST',
            url: "/main/insertMainCmmnSms.do",
            data :
            {
                "msg"       : msg,
                "subject"   : subject,
                "callname"  : callname,
                "callphone" : callphone

            },
            dataType: "json",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(data, responseText, statusText, textStatus){
                    alert("SMS가 정상적으로 송신 되었습니다.");
            }
            ,error : function(request, status, error){  alert("code : " +request.status + "\r\nmessage : " + request.reponseText); }
            ,beforeSend:function(){}
            ,complete :function(){}
        });

    });

    // SMS 팝업창 취소버튼
    $("#smsCnsBtn").click( function (){
        //alert("취소버튼클릭");
        window.close();

        return false;
    });

});
</script>
</head>
<body class="pop">
<div id="wrap_pop">
    <!--++++++++++++++++++++++++++++++++++++++++Header++++++++++++++++++++++++++++++++++++++++-->
    <div id="hdPop">
        <div class="sect_hLft">
            <div class="txtTit">SMS 정보</div>
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
                SMS 전송
            </div>
            <!--//Contents Title-->

            <!--Form-->
            <fieldset class="frm">
                <legend class="skip"><span>SMS 전송</span></legend>
                <table summary="" class="frm_lst">
                <colgroup>
                    <col width="150" />
                    <col width="*" />
                    <col width="150" />
                    <col width="*" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><label for=""><span class="item">수신자</span></label></th>
                        <td>
                            <input type="text" id="callname" name="callname" maxlength="30"/>
                        </td>
                        <th scope="row"><label for=""><span class="item">전화번호</span></label></th>
                        <td>
                            <input type="text" id="callphone" name="callphone" maxlength="11"/>
                            <br /><span class="txt_ex tp02">&#42; '-' 빼고 입력하세요</span>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for=""><span class="item">제목</span></label></th>
                        <td colspan="3">
                            <input type="text" id="subject" name="subject" style="width:200pX" maxlength="100"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" colspan="4"><label for=""><span class="item">SMS 전송 문자</span></label></th>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <textarea id="msg" name="msg" style="height:100px;" maxlength="2000"></textarea>
                        </td>
                    </tr>
                </tbody>
                </table>
                <div class="frm_btnSet">
                    <span class="button h30 btnBasicPink bold"><a href="#" id="smsCallBtn" name="smsCallBtn">전송</a></span>
                    <span class="button h30 btnBasicDblue bold"><a href="#"id="smsCnsBtn">취소</a></span>
                </div>
            </fieldset>
            <!--//Form-->
        </div>
        <!--//Section of Indivisual Contents-->
    </div>
    <!--++++++++++++++++++++++++++++++++++++++++Contents++++++++++++++++++++++++++++++++++++++++-->
</div>
</body>
</html>
