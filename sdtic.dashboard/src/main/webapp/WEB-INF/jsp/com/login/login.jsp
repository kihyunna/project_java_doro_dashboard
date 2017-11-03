<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>RINO - Smart Operations Solution(스마트통합관제솔루션)</title>
<link rel="stylesheet" href="<c:url value='/Tmplt/eLflat/basic/default.css'/>" type="text/css" />
<%-- <link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css'/>" type="text/css" /> --%>
<%-- <link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css'/>" type="text/css" /> --%>
<%-- <link rel="stylesheet" href="<c:url value='/css/egovframework/com/common.css'/>" type="text/css" /> --%>
<jsp:include page="/WEB-INF/jsp/com/include/basic.jsp"/>
<!-- Script needed basis -->
<script type="text/javaScript" language="javascript" src="<c:url value='/js/egovframework/com/uat/uia/EgovGpkiVariables.js'/>"></script>
<script type="text/javaScript" language="javascript" src="<c:url value='/js/egovframework/com/uat/uia/EgovGpkiInstall.js'/>"></script>
<script type="text/javaScript" language="javascript" src="<c:url value='/js/egovframework/com/uat/uia/EgovGpkiFunction.js'/>"></script>
<script type="text/javaScript" language="javascript" src="<c:url value='${pageContext.request.contextPath }/js/ituxp/jquery-1.9.0-min.js'/>"></script>
<script type="text/javaScript" language="javascript" src="<c:url value='${pageContext.request.contextPath }/Tmplt/eLflat/default.js'/>"></script>
<OBJECT ID="GPKISecureWeb" CLASSID = "CLSID:C8223F3A-1420-4245-88F2-D874FC081572" ></OBJECT>

<title>MOPAS 로그인</title> 
<script type="text/javaScript" language="javascript">

function acePopupBtn() {
	var url = "/ace/aceInc.do";
    cmm_popup_windowOpenResize_title(url, 1400, 640, 'acePopupView', 20, 20);
}
function cmm_popup_windowOpenResize_title(url, popupwidth, popupheight, popup_title)
{
	Top = (window.screen.height - popupheight) / 3;
	Left = (window.screen.width - popupwidth) / 2;
	if (Top < 0) Top = 0;
	if (Left < 0) Left = 0;
	Future = "fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,left=" + Left + ",top=" + Top + ",width=" + popupwidth + ",height=" + popupheight;
	PopUpWindow = window.open(url, popup_title, Future)
	PopUpWindow.focus();
}

function actionLogin() {

    if (document.loginForm.userid.value =="") {
        alert("아이디를 입력하세요");
    } else if (document.loginForm.userPwd.value =="") {
        alert("비밀번호를 입력하세요");
    } else {
        document.loginForm.userSe.value = "GNR";
        document.loginForm.action="<c:url value='/wjitsCtrl/actionLogin.do'/>";
        //document.loginForm.j_username.value = document.loginForm.userSe.value + document.loginForm.username.value;
        //document.loginForm.action="<c:url value='/j_spring_security_check'/>";
        document.loginForm.submit();
    }
}

function setCookie (name, value, expires) {
    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
    var search = Name + "=";
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search);
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length;
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset);
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length;
            return unescape(document.cookie.substring(offset, end));
        }
    }
    return "";
}

/* function getid(form) {
    form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
} */

function fnInit() {	
    getid(document.loginForm);    
}

</script>
</head>

<body onLoad="fnInit();">
<form name="loginForm" action ="<c:url value='/uat/uia/actionLogin.do'/>" method="post">
	<div id="wrap">
		<div id="container">
			<h1 class="logo">
				<%-- <img src="<c:url value='/images/ituxp/logo_cmpL.png'/>"  alt="LS" />
				<img src="<c:url value='/images/ituxp/logo_sysL.png'/>" alt="R.IOC-RINO INTELLIGENT OPERATIONS SYSTEM" /> --%>
			</h1>
			<div class="box_login">
		          <label for=""><input type="text" name="userid" id="userid" value="USER" /></label>
				  <label for=""><input type="password" id="userPwd" name = "userPwd" value="rhdxhd12" onkeydown="javascript:if(event.keyCode==13) {actionLogin(); return false;}"/></label>
				  
				   

				  <a href="#LINK" onClick="actionLogin()" tabindex="7" class="button bgDG login">Login</a>
				  
				  <!-- <div class="copyright">
						 <p>COPYRIGHT ⓒ ESE CO., LTD. ALL RIGHTS RESERVED.  POWERED BY ESE CO., LTD.</p>
				  </div> -->
				<input name="userSe" type="hidden" value="GNR"/>
		        <input name="j_username" type="hidden"/>
				
			</div>
		</div>
	</div>
</form>
</body>
</html>