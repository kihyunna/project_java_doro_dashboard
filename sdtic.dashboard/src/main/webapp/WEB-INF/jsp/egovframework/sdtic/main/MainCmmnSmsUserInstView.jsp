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
<meta http-equiv='description' content='SMS 사용자 등록화면' />
<title>SMS 사용자 등록화면</title>

<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/main/default.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($){

    $("#smsUserInstBtn").click( function (){
        var manageseq = ${param.manageseq} ;
        var user_mbl_num     = $("#user_mbl_num").val();
        var user_nm        = $("#user_nm").val();

        //숫자만 넣는 체크란
        var chk = $("#user_mbl_num").val();
        chk = chk.replace(/[^0-9]\^./g,"");
        if (isNaN(chk) == true) {
            alert ("숫자만 입력 가능합니다. 예) 01011112222")
            $("#user_mbl_num").focus();
            return;
        }


        $.ajax({
            type: 'POST',
            url: "/main/mainCmmnSmsUserInst.do",
            data :
            {
                "user_mbl_num" : user_mbl_num,
                "user_nm"      : user_nm,
                "manageseq"    : manageseq
            },
            dataType: "text",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(data, responseText, statusText, textStatus){
                    alert("SMS 사용자가 등록 되었습니다. ");
                    opener.parent.location.reload();
                    window.close();
            }
            ,error : function(request, status, error){  alert("code : " +request.status + "\r\nmessage : " + request.reponseText); }
            ,beforeSend:function(){}
            ,complete :function(){}
        });

    });

    // 장애주기 팝업창 취소버튼
    $("#smsUserCnsBtn").click( function (){
        window.close();
        return false;
    });


});

</script>
</head>
<body class="pop">
<input type="hidden" id="user_seq" name="user_seq"       value="<c:out value='${data.user_seq       }' escapeXml='false'/>" /><!-- SMS 수신자 시퀀스      -->

<div id="wrap_pop">
    <!--++++++++++++++++++++++++++++++++++++++++Header++++++++++++++++++++++++++++++++++++++++-->
    <div id="hdPop">
        <div class="sect_hLft">
            <div class="txtTit">SMS 사용자 등록</div>
        </div>
        <div class="sect_hRgt"><img src="${contextPath}/images/main/ico_pop_close.png" onclick="window.close();" alt="close" class="ico_pop_close" /></div>
    </div>
    <!--++++++++++++++++++++++++++++++++++++++++//Header++++++++++++++++++++++++++++++++++++++++-->

    <!--++++++++++++++++++++++++++++++++++++++++Contents++++++++++++++++++++++++++++++++++++++++-->
    <div id="cntPop">
        <!--Section of Indivisual Contents-->
        <div class="sect_iCnt">

            <!--Form-->
            <fieldset class="frm">
                <legend class="skip"><span>SMS 사용자 등록</span></legend>
                <table summary="" class="frm_lst">
                <colgroup>
                    <col width="150" />
                    <col width="*" />
                </colgroup>
                    <tr>
                        <th scope="row"><label for=""><span class="item">사용자 명</span></label></th>
                        <td>
                            <input type="text" id="user_nm" name="user_nm" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for=""><span class="item">전화번호</span></label></th>
                        <td>
                            <input type="text" id="user_mbl_num" name="user_mbl_num" maxlength="11" />
                        </td>
                    </tr>
                </tbody>
                </table>
                <div class="frm_btnSet">
                        <span class="button h30 btnBasicPink bold"><a href="#" id="smsUserInstBtn" name="smsUserInstBtn">등록</a></span>
                        <span class="button h30 btnBasicDblue bold"><a href="#"id="smsUserCnsBtn" onclick="window.close();">취소</a></span>
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
