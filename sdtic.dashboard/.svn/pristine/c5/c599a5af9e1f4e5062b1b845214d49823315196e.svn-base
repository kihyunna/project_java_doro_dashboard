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
<meta http-equiv='description' content='장애수집설정 수정화면' />
<title>장애수집설정 수정화면</title>

<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/main/default.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($){

    $("#colctcycleUpdtBtn").click( function (){

        var manageseq     = $("#manageseq").val();
        var thrhld        = $("#thrhld").val();
        var colctcycle    = $("#colctcycle").val();
        var use_yn        = $("#use_yn").val();
        var user_seq      = $("#user_seq").val();

        $.ajax({
            type: 'POST',
            url: "/main/mainCmmnCycleManageUpdtAjax.do",
            data :
            {
                "manageseq"   : manageseq,
                "thrhld"      : thrhld,
                "colctcycle"  : colctcycle,
                "use_yn"      : use_yn,
                "user_seq"    : user_seq
            },
            dataType: "text",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(data, responseText, statusText, textStatus){
                    alert("장애수집설정이 수정 되었습니다. ");
                    opener.parent.location.reload();
                    window.close();
            }
            ,error : function(request, status, error){  alert("code : " +request.status + "\r\nmessage : " + request.reponseText); }
            ,beforeSend:function(){}
            ,complete :function(){}
        });

    });

    // 장애주기 팝업창 취소버튼
    $("#colctcycleCnsBtn").click( function (){
        window.close();
        return false;
    });


});

var selectUser_seq = null;
var selectUser_mbl_num  = null;
var selectUser_nm  = null;


//차량선택 적용 set
function fnSmsSeq(user_seq,user_mbl_num,user_nm)
{
    $("#user_seq").val(user_seq);
    $("#user_mbl_num").val(user_mbl_num);
    $("#user_nm").val(user_nm);
}

function fnSmsNum(manageseq){

        fnSelectSmsNumList( manageseq);

    }

    function fnSelectSmsNumList(manageseq){
    var url = '${contextPath}/main/mainCmmnSmsUserView.do?manageseq='+ manageseq ;
    popup = WinPop(url,'smsPop','500','540');

    }

//    function fnSelectsmsNumList( hcs_driver_seq) {
//        var vfrm = document.createElement("form");
//        vfrm.method = "post";
//        vfrm.action = "/mws/mwsp/cvyBserChrrNmInfoPop.do";
//        var vipinput1 = document.createElement("input");
//        vipinput1.setAttribute("type" , "hidden");
//        vipinput1.setAttribute("name" , "bzntNum");
//        vipinput1.setAttribute("id"   , "bzntNum");
//        vipinput1.setAttribute("value", bzntNum);
//        vfrm.appendChild(vipinput1);
//        var vipinput2 = document.createElement("input");
//        vipinput2.setAttribute("type" , "hidden");
//        vipinput2.setAttribute("name" , "hcs_driver_seq");
//        vipinput2.setAttribute("id"   , "hcs_driver_seq");
//        vipinput2.setAttribute("value", hcs_driver_seq);
//        vfrm.appendChild(vipinput2);
//        vfrm.target = "popupSvcrScreen";
//        document.body.appendChild(vfrm);
//        var popup = window.open('', 'popupSvcrScreen','width=865,height=625,'+openOption);
//        popup.focus();
//        vfrm.submit();
//    }



</script>
</head>
<body class="pop">
<input type="hidden" id="manageseq" name="manageseq"       value="<c:out value='${data.manageseq       }' escapeXml='false'/>" /><!-- 장애주기 번호       -->
<input type="hidden" id="user_seq" name="user_seq"       value="<c:out value='${data.user_seq       }' escapeXml='false'/>" /><!-- SMS 수신자 시퀀스      -->

<div id="wrap_pop">
    <!--++++++++++++++++++++++++++++++++++++++++Header++++++++++++++++++++++++++++++++++++++++-->
    <div id="hdPop">
        <div class="sect_hLft">
            <div class="txtTit">장애수집설정 수정</div>
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
                <legend class="skip"><span>장애주기 수정</span></legend>
                <table summary="" class="frm_lst">
                <colgroup>
                    <col width="150" />
                    <col width="*" />
                    <col width="150" />
                    <col width="*" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><label for=""><span class="item">이벤트 분류</span></label></th>
                        <td>
                            <input type="text" id="detailclse" name="detailclse" maxlength="200" value="<c:out value='${data.detailclse}' escapeXml='false'/>" style="background-color: #6C7B8B"  readonly/>
                        </td>
                        <th scope="row"><label for=""><span class="item">장애 등급</span></label></th>
                        <td>
                            <input type="text" id="troblgradse" name="troblgradse" maxlength="200" value="<c:out value='${data.troblgradse}' escapeXml='false'/> 등급"  style="background-color: #6C7B8B" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for=""><span class="item">임계치</span></label></th>
                        <td>
                            <input type="text" id="thrhld" name="thrhld" maxlength="3" value="<c:out value='${data.thrhld}' escapeXml='false'/>" />
                        </td>
                        <th scope="row"><label for=""><span class="item">수집주기</span></label></th>
                        <td>
                            <select  id="colctcycle"  name ="colctcycle">
                                <option value="60"  <c:if test="${data.colctcycle eq 1}">selected="selected"</c:if> >  1분</option>
                                <option value="300" <c:if test="${data.colctcycle eq 2}">selected="selected"</c:if> >  5분</option>
                                <option value="600" <c:if test="${data.colctcycle eq 3}">selected="selected"</c:if> >  10분</option>
                                <option value="900" <c:if test="${data.colctcycle eq 4}">selected="selected"</c:if> >  15분</option>
                                <option value="3000"<c:if test="${data.colctcycle eq 5}">selected="selected"</c:if> >  30분</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for=""><span class="item">수집 그룹</span></label></th>
                        <td>
                            <input type="text" id="troblcolctse" name="troblcolctse" maxlength="200" value="<c:out value='${data.troblcolctse}' escapeXml='false'/>" style="background-color: #6C7B8B" readonly/>
                        </td>
                        <th scope="row"><label for=""><span class="item">사용 여부</span></label></th>
                        <td>
                            <select  id="use_yn"  name ="use_yn">
                                <option value="Y"  <c:if test="${data.use_yn eq Y}">selected="selected"</c:if> >  사용</option>
                                <option value="N"  <c:if test="${data.use_yn eq N}">selected="selected"</c:if> >  미사용</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for=""><span class="item">SMS 수신번호</span></label>&nbsp&nbsp<a href=" javascript:void(0);" onClick="fnSmsNum(${data.manageseq});"><img src="${contextPath}/images/main/btn_icoSch.png"></a></th>
                        <td>
                            <c:forEach items="${sms}" var="sms">
                        		<c:out value="${fn:substring(sms.user_mbl_num,0,3)}"/> - <c:out value="${fn:substring(sms.user_mbl_num ,3,7)}"/> - <c:out value="${fn:substring(sms.user_mbl_num ,7,11)}"/><br>
                        	</c:forEach>
<!--                            <input type="hidden" id="user_seq" name="user_seq"   /> SMS 수신자 시퀀스       -->
<!--                             <input type="text" id="user_mbl_num" name="user_mbl_num" maxlength="11" value="<c:out value='${data.user_mbl_num}' escapeXml='false'/>" /> //-->
                        </td>
                        
                    </tr>                    
                </tbody>
                </table>
                <div class="frm_btnSet">
                        <span class="button h30 btnBasicPink bold"><a href="#" id="colctcycleUpdtBtn" name="colctcycleUpdtBtn">수정</a></span>
                        <span class="button h30 btnBasicDblue bold"><a href="#"id="colctcycleCnsBtn" onclick="window.close();">취소</a></span>
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
