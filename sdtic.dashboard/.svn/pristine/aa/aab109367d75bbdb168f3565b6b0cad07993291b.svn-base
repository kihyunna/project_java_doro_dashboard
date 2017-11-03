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
<meta http-equiv='description' content='서버 추가' />
<title>서버 추가</title>

<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/main/default.js"></script>
<script type="text/javascript">
	$(document).ready(function($){    
	    $("#addBtn").click( function (){
	        var unit = "${param.unit}";
	        var unit_name = "${param.unit_name}";
	        var unit_order = "${param.unit_order}";
	        var gubun = "${param.gubun}";
	        var gubun_name = "${param.gubun_name}";
	        var gubun_order = "${param.gubun_order}";
	        
	        var server_gubun = $("#server_gubun").val();
	        var hostname = $("#hostname").val();
	        var dual = $("#dual").val();
	
	        if(server_gubun == ""){
	            alert("서버구분을 선택하시기 바랍니다.");
	            return;
	        }
	
	        if(hostname == ""){
	            alert("호스트명을 입력하시기 바랍니다.");
	            return;
	        }
	
	        $.ajax({
	            type: 'POST',
	            url: "${pageContext.request.contextPath}/ifc/ifcUnitAddGrid3Ajax.do",
	            data :
	            {
	            	"unit" 			: unit,
	                "unit_name" 	: unit_name,
	                "unit_order" 	: unit_order,
	                "gubun" 		: gubun,
	                "gubun_name" 	: gubun_name,
	                "gubun_order" 	: gubun_order,
	                "server_gubun" 	: server_gubun,
	                "hostname" 	: hostname,
	                "dual" 			: dual
	            },
	            dataType: "text",
	            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	            success: function(data, responseText, statusText, textStatus){
	                    alert("입력이 정상적으로 처리되었습니다.");
	                    opener.fn_reloadGrid3(unit, gubun);
	                    window.close();
	                    return false;
	            }
	            ,error : function(request, status, error){  
	            	//alert("code : " +request.status + "\r\nmessage : " + request.reponseText);
	            	alert("호스트명이 중복되어 입력되지 않았습니다.");
	            }
	            ,beforeSend:function(){}
	            ,complete :function(){}
	        });
	    });
	    
		$("#clsBtn").click( function (){
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
	            <div class="txtTit">서버구분 추가</div>
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
	                서버구분 추가
	            </div>
	            <!--//Contents Title-->
	
	            <!--Form-->
	            <fieldset class="frm">
	                <legend class="skip"><span>서버구분 추가</span></legend>
	                <table summary="" class="frm_lst">
	                <colgroup>
	                    <col width="20%" />
	                    <col width="30%" />
	                    <col width="20%" />
	                    <col width="30%" />
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th scope="row"><label for=""><span class="item">주제영역</span></label></th>
	                        <td>
	                        	${param.unit_name} (${param.unit})
	                        </td>
	                        <th scope="row"><label for=""><span class="item">업무</span></label></th>
	                        <td>
	                            ${param.gubun_name} (${param.gubun})
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row"><label for=""><span class="item">서버구분</span></label></th>
	                        <td>
	                            <select id="server_gubun">
	                                <option value="CON">CON</option>
	                                <option value="WAS">WAS</option>
	                                <option value="WEB">WEB</option>
	                            </select>
	                        </td>
	                        <th scope="row"><label for=""><span class="item">호스트명</span></label></th>
	                        <td>
	                            <input type="text" id="hostname" style="width:150pX" maxlength="30" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row"><label for=""><span class="item">이중화서버 호스트명</span></label></th>
	                        <td colspan="3">
	                            <input type="text" id="dual" style="width:150pX" maxlength="230" />
	                        </td>
	                    </tr>
	                </tbody>
	                </table>
	                <div class="frm_btnSet">
	                    <span class="button h30 btnBasicPink bold"><a href="#" id="addBtn">입력</a></span>
	                    <span class="button h30 btnBasicDblue bold"><a href="#"id="clsBtn">취소</a></span>
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
