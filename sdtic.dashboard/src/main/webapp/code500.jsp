<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">-->
<!--<link rel="apple-touch-icon" href="이미지경로.png" />  아이폰에서 북마크 추가시 바탕화면 이미지 아이콘 -->
<meta name='author' content='ese, 이에스이' />
<meta http-equiv='description' content='rino' />
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/images/ituxp/favicon.ico" />
<title>rino 3.0 Web Style Guide - 404 Error</title>
<!--[if lt IE9]>
<script src="../../iLt/js/html5shiv.min.js"></script>
<![endif]-->
<style type="text/css">
@font-face {
	font-family:'nanum';
	src:url('${pageContext.request.contextPath }/fonts/NanumGothic.eot');
	src:url('${pageContext.request.contextPath }/fonts/NanumGothic.eot?#iefix') format('embedded-opentype'),
		url('${pageContext.request.contextPath }/fonts/NanumGothic.woff') format('woff');
}
@font-face {
	font-family:'nanumB';
	src:url('${pageContext.request.contextPath }/fonts/NanumGothicBold.eot');
	src:url('${pageContext.request.contextPath }/fonts/NanumGothicBold.eot?#iefix') format('embedded-opentype'),
  		url('${pageContext.request.contextPath }/fonts/NanumGothicBold.woff') format('woff');
}
@font-face {
	font-family:'nanumE';
	src:url('${pageContext.request.contextPath }/fonts/NanumGothicExtraBold.eot');
	src:url('${pageContext.request.contextPath }/fonts/NanumGothicExtraBold.eot?#iefix') format('embedded-opentype'),
		url('${pageContext.request.contextPath }/fonts/NanumGothicExtraBold.woff') format('woff');
}
*{padding:0;margin:0;}
body{font-family:"nanum", "Nanum Gothic", "나눔고딕", "돋움", "Dotum", Sans-Serif;font-size:15px;line-height:120%;color:#303030;}
#err404{height:76px;margin:200px auto 0 auto;padding-top:130px;text-align:center;background:url(${pageContext.request.contextPath }/images/ituxp/ico_errPage.png) no-repeat center top;}
.title{margin-bottom:24px;font-size:48px;font-family:"nanumB", "NanumGothicBold", "Nanum Gothic", "나눔고딕", "돋움", "Dotum";font-weight:bold;}
</style>
</head>
<body>
	<div id="err404">
		<div class="title">500 ERROR</div>
		웹사이트에서 페이지를 표시 할 수 없습니다.
	</div>
</body>
</html>