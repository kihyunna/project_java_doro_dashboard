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
<meta http-equiv='description' content='업무 추가' />
<title>업무 추가</title>

<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
<style>
.frm_srcBtn_r{position:relative;text-align:center;cursor:pointer;
display:-webkit-box; /* OLD: Safari, iOS 6 and earlier; Android browser, older WebKit */  
/*display:-moz-box;  OLD: Firefox (can be buggy) */  
/*display:-ms-flexbox;  OLD: IE 10 */  
/*display:-webkit-flex;  FINAL, PREFIXED, Chrome 21+ */  
/*display:flex;  FINAL: Opera 12.1+, Firefox 22+ */  
-webkit-box-align:center;  
/*-moz-box-align:center;*/
/*-ms-flex-align:center;*/
-webkit-align-items:center;  
/*align-items:center;*/
-webkit-box-pack:center;  
/*-moz-box-pack:center;*/
/*-ms-flex-pack:center;*/
-webkit-justify-content:center;  
/*justify-content:center;*/
background-color:#2e3641;
/*background-color:rgba(255,255,255,0.2);*/
border:1px solid rgba(255,255,255,0.2);
border-right-color:rgba(0,0,0,0.2);
border-bottom-color:rgba(0,0,0,0.2);
-webkit-border-radius:0.1em;
-moz-border-radius:0.1em;
-o-border-radius:0.1em;
border-radius:0.1em;
font-weight:bold;color:#fff;
align:center;
width:50px;
height:20px;
}
</style>

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/main/default.js"></script>
<script type="text/javascript">
	$(document).ready(function($){  
		$("#addBtn").click( function (){
	    	var unit = "${param.unit}";
	        var unit_name = "${param.unit_name}";
	        var unit_order = "${param.unit_order}";
	        var gubun_list = '${param.gubun_list}';
	        
	        var gubun = $("#gubun").val();
	        var gubun_name = $("#gubun_name").val();
	        var gubun_order = $("#gubun_order").val();
	        
	        var server_gubun = "";
	        var hostname = "";
	        var dual = "";
	        
	        for(var i=0;i<$("#server_table tr").length-1;i++){
	        	server_gubun = server_gubun + $('select[name="server_gubun"]').eq(i).val() + "|";
	        	hostname = hostname + $('input[name="hostname"]').eq(i).val() + "|";
	        	dual = dual + $('input[name="dual"]').eq(i).val() + "|";
	        }
	        
	        if(gubun == ""){
	            alert("업무코드를 입력하시기 바랍니다.");
	            return;
	        }
	
	        if(gubun_name == ""){
	            alert("업무명을 입력하시기 바랍니다.");
	            return;
	        }
	        
	        if(gubun_order == ""){
	            alert("정렬순서를 입력하시기 바랍니다.");
	            return;
	        }
	        
	        var server_gubun_arr = server_gubun.split("|");
	        var hostname_arr = hostname.split("|");
	        var dual_arr = dual.split("|");
	        
	        for(var i=0;i<server_gubun_arr.length-1;i++){
		        if(server_gubun_arr[i] == ""){
		        	alert("서버구분을 입력하시기 바랍니다.");
		            return;
		        }
		        if(hostname_arr[i] == ""){
		        	alert("호스트명을 입력하시기 바랍니다.");
		            return;
		        }
		        /*
		        if(dual_arr[i] == ""){
		        	alert("이중화서버 호스트명을 입력하시기 바랍니다.");
		            return;
		        }
		        */
	        }
	        
	        var gubun_arr = gubun_list.split("split");
	        for(var i=0;i<gubun_arr.length;i++){
		        if(gubun == gubun_arr[i]){
		        	alert("중복된 업무코드는 사용할 수 없습니다.");
		            return;
		        }
	        }
	        
	        if(!confirm("입력하시겠습니까?")){
	        	return faflse;
	        }

	        $.ajax({
	            type: 'POST',
	            url: "${pageContext.request.contextPath}/ifc/ifcUnitAddGrid2Ajax.do",
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
	                    opener.fn_reloadGrid2(unit, gubun);
	                    opener.fn_reloadGrid3("","");
	                    window.close();
	                    return false;
	            }
	            ,error : function(request, status, error){  
	            	alert("code : " +request.status + "\r\nmessage : " + request.reponseText);
	            	//alert("서버구분/호스트명이 중복되어 수정되지 않았습니다.");
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
	
	function fn_addTable(){
		// clone
		$.trClone = $("#server_table tr:last").clone().html();
		$.newTr = $("<tr>"+$.trClone+"</tr>"); 
		 
		// append
		$("#server_table").append($.newTr);  
		
		// delete Button 추가
		$.btnDelete = $(document.createElement("input"));
		$.btnDelete.attr({
			class : "frm_srcBtn_r",
		    name : "btnRemove",
		    type : "button" ,
		    value : "-"
		});
		
		$("#server_table tr:last td:last").html("");
		$("#server_table tr:last td:last").append($.btnDelete);  
		
		// 버튼에 클릭 이벤트 추가
		$("#server_table tr>td:last>input[type='button']").on('click', function(){
		    $(this).parent().parent().remove();
		}); 
    }
</script>
</head>
<body class="pop">
	<div id="wrap_pop">
	    <!--++++++++++++++++++++++++++++++++++++++++Header++++++++++++++++++++++++++++++++++++++++-->
	    <div id="hdPop">
	        <div class="sect_hLft">
	            <div class="txtTit">업무 추가</div>
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
	                업무 추가
	            </div>
	            <!--//Contents Title-->
	
	            <!--Form-->
	            <fieldset class="frm">
	                <legend class="skip"><span>업무 추가</span></legend>
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
	                        <td colspan="3">
	                        	${param.unit_name} (${param.unit})
	                        </td>
	                    </tr>
	                    <tr>
	                    	<th scope="row"><label for=""><span class="item">업무코드</span></label></th>
	                        <td>
	                            <input type="text" id="gubun" style="width:150pX" maxlength="10" />
	                        </td>
	                        <th scope="row"><label for=""><span class="item">업무명</span></label></th>
	                        <td>
	                            <input type="text" id="gubun_name" style="width:150pX" maxlength="30" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row"><label for=""><span class="item">정렬순서</span></label></th>
	                        <td colspan="3">
	                            <input type="text" id="gubun_order" style="width:150pX" maxlength="10" />
	                        </td>
	                    </tr>
	                </tbody>
	                </table>
	            </fieldset>
	            <br/>
	            <div class="frm_srcBtn" style="width:20px;height:20px;top:180px;left:720px;" onclick="fn_addTable();">+</div>
	            <br/>
	            <fieldset class="frm">
	                <legend class="skip"><span>서버 추가</span></legend> 
	                <table id="server_table" summary="" class="frm_lst">
	                <colgroup>
	                    <col width="15%" />
	                    <col width="35%" />
	                    <col width="30%" />
	                    <col width="10%" />
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th scope="row"><label for=""><span class="item">서버구분</span></label></th>
	                        <th scope="row"><label for=""><span class="item">호스트명</span></label></th>
	                        <th scope="row"><label for=""><span class="item">이중화서버 호스트명</span></label></th>
	                        <th scope="row"><label for=""><span class="item">삭제</span></label></th>
	                    </tr>
	                    <tr>
	                    	<td>
	                            <select id="server_gubun" name="server_gubun">
	                                <option value="CON">CON</option>
	                                <option value="WAS">WAS</option>
	                                <option value="WEB">WEB</option>
	                            </select>
	                        </td>
	                        <td>
	                            <input type="text" id="hostname" name="hostname" style="width:150pX" maxlength="30" />
	                        </td>
	                        <td>
	                            <input type="text" id="dual" name="dual" style="width:150pX" maxlength="30" />
	                        </td>
	                        <td align="center">
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
