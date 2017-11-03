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
<meta http-equiv='description' content='보고서 수정화면' />
<title>보고서 수정화면</title>

<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/main/default.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($){

    $("#reportupdtBtn").click( function (){

        var report_id     = $("#report_id").val();
        var clfy_typ      = $("select[id=clfy_typ]").val();
        var url           = $("#url").val();
        var report_desc   = $("#report_desc").val();
        var report_nm     = $("#report_nm").val();

        if(report_nm==""){
            alert("보고서 명을 적어주세요");
            return;
        }

        if(url==""){
            alert("보고서 주소를 적어주세요");
            return;
        }

        $.ajax({
            type: 'POST',
            url: "/main/mainCmmnReportUpdt.do",
            data :
            {
                "report_id"   : report_id,
                "clfy_typ"   : clfy_typ,
                "url"         : url,
                "report_desc" : report_desc,
                "report_nm"  : report_nm
            },
            dataType: "text",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(data, responseText, statusText, textStatus){
                    alert("보고서가 수정 되었습니다. ");
                    opener.parent.location.reload();
                    window.close();
            }
            ,error : function(request, status, error){  alert("code : " +request.status + "\r\nmessage : " + request.reponseText); }
            ,beforeSend:function(){}
            ,complete :function(){}
        });

    });


    $("#reportDelBtn").click( function (){
        var report_id     = $("#report_id").val();
    if(!confirm("해당 보고서 내용을 삭제 하시겠습니까? \n\n※ 보고내용을 바로삭제합니다.")){return;}
        $.ajax({
            type: 'POST',
            url: "/main/mainCmmnReportDel.do",
            data :
            {
                "report_id"   : report_id
            },
            dataType: "text",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(data, responseText, statusText, textStatus){
                    alert("보고서가 삭제 되었습니다. ");
                    opener.parent.location.reload();
                    window.close();
            }
            ,error : function(request, status, error){  alert("code : " +request.status + "\r\nmessage : " + request.reponseText); }
            ,beforeSend:function(){}
            ,complete :function(){}
        });

    });
    // 보고서 팝업창 취소버튼
    $("#reportCnsBtn").click( function (){
        //alert("취소버튼클릭");
        window.close();
        return false;
    });

});

</script>
</head>
<body class="pop">
<input type="hidden" id="report_id" name="report_id"       value="<c:out value='${data.report_id       }' escapeXml='false'/>" /><!-- 보고서 번호       -->

<div id="wrap_pop">
    <!--++++++++++++++++++++++++++++++++++++++++Header++++++++++++++++++++++++++++++++++++++++-->
    <div id="hdPop">
        <div class="sect_hLft">
            <div class="txtTit">보고서 수정</div>
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
                <legend class="skip"><span>보고서 수정</span></legend>
                <table summary="" class="frm_lst">
                <colgroup>
                    <col width="150" />
                    <col width="*" />
                    <col width="150" />
                    <col width="*" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><label for=""><span class="item">보고서 명</span></label></th>
                        <td>
                            <input type="text" id="report_nm" name="report_nm" maxlength="200" value="<c:out value='${data.report_nm}' escapeXml='false'/>" />
                        </td>
                        <th scope="row"><label for=""><span class="item">분류 타입</span></label></th>
                        <td>
                            <select  id="clfy_typ"  name ="clfy_typ">
                                <option value="001" <c:if test="${data.clfy_typ eq 1}">selected="selected"</c:if> > 메인</option>
                                <option value="002" <c:if test="${data.clfy_typ eq 2}">selected="selected"</c:if> > 인프라</option>
                                <option value="003" <c:if test="${data.clfy_typ eq 3}">selected="selected"</c:if> > 비즈니스</option>
                                <option value="004" <c:if test="${data.clfy_typ eq 4}">selected="selected"</c:if> > 현장설비</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for=""><span class="item">URL</span></label></th>
                        <td colspan="3">
                            <input type="text" id="url" name="url" style="width:400pX" maxlength="400" value="<c:out value='${data.url}' escapeXml='false'/>"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for=""><span class="item">보고서 설명</span></label></th>
                        <td colspan="3">
                            <textarea id="report_desc" name="report_desc" style="height:100px;"><c:out value='${data.report_desc}' escapeXml='false'/></textarea>
                        </td>
                    </tr>
                </tbody>
                </table>
                <div class="frm_btnSet">
                        <span class="button h30 btnBasicPink bold"><a href="#" id="reportupdtBtn" name="reportupdtBtn">수정</a></span>
                        <span class="button h30 btnBasicPink bold"><a href="#" id="reportDelBtn" name="reportDelBtn">삭제</a></span>
                        <span class="button h30 btnBasicDblue bold"><a href="#"id="reportCnsBtn" onclick="window.close();">취소</a></span>
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
