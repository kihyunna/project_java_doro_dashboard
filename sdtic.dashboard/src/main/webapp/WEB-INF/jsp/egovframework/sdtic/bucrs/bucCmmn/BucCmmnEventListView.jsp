<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>이벤트발생현황</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="ECharts">
    
<%-- 차트 사용 jquery  --%>  
<script src="<%=request.getContextPath()%>/js/echarts/js/jquery.min.js"></script>

<%-- 차트   --%>  
<script src="<%=request.getContextPath()%>/js/echarts/dist/echarts.js" type="text/javascript"></script>


<%-- 이벤트  --%>
<!-- <link href='http://fonts.googleapis.com/css?family=Days+One' rel='stylesheet' type='text/css'> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fecrs/css/style.css">
    
</head>
<!-- <script> 
 $(function() {

<%-- 	AjaxQuery("1", "2", '<%=request.getContextPath()%>');  --%>

// });
</script> -->
<script type="text/javascript">
    $(window).load(function() 
    {
        $('html').css("overflow","hidden");  // 레이어 뜬상태에서 html 스크롤바 삭제

    });
</script>
<body>
<header class="header">

    </header>
	<div id="gangwon" style="top:5px;margin-left:50px">
    <section class="demo">      
	  <ul class="ul_table" style="text-align: center">
		<li>
			<dl class="list maki">
				<dt>본부명</dt>
				<dd><a >수도권 본부</a></dd>
				<dd><a >강원 본부</a></dd>
				<dd><a >충북 본부</a></dd>
				<dd><a >대전충남 본부</a></dd>
				<dd><a >전북 본부</a></dd>
				<dd><a >광주전남 본부</a></dd>
				<dd><a >대구경북 본부</a></dd>
				<dd><a >부산경남 본부</a></dd>
			</dl>
		</li>
        <li>
			<dl class="list maki" >
				<dt>지사</dt>
				<dd><a >수원지사</a></dd>
				<dd><a >대관령지사</a></dd>
				<dd><a >대관령지사</a></dd>
				<dd><a >대관령지사</a></dd>
				<dd><a >대관령지사</a></dd>
				<dd><a >대관령지사</a></dd>
				<dd><a >대관령지사</a></dd>
				<dd><a >대관령지사</a></dd>
			</dl>
		</li>
		<li>
			<dl class="list maki" >
				<dt>부서</dt>
				<dd><a >데이터 없음</a></dd>
				<dd><a >데이터 없음</a></dd>
				<dd><a >데이터 없음</a></dd>
				<dd><a >데이터 없음</a></dd>
				<dd><a >데이터 없음</a></dd>
				<dd><a >데이터 없음</a></dd>
				<dd><a >데이터 없음</a></dd>
				<dd><a >데이터 없음</a></dd>
			</dl>
		</li>
		<li>
			<dl class="list maki" >
				<dt>이벤트 내용</dt>
				<dd><a >이벤트 없음</a></dd>
				<dd><a >이벤트 없음</a></dd>
				<dd><a >이벤트 없음</a></dd>
				<dd><a >이벤트 없음</a></dd>
				<dd><a >이벤트 없음</a></dd>
				<dd><a >이벤트 없음</a></dd>
				<dd><a >이벤트 없음</a></dd>
				<dd><a >이벤트 없음</a></dd>
			</dl>
		</li>
		
	</ul>
    </section>
	</div>
 	<div class="warning">
        <div class="message">
            <h1>CSS 3D Not Detected :(</h1>
            <p>I couldn't detect your browser's CSS 3D capabilities. If I'm wrong, please <a href="https://github.com/soulwire/Makisu/issues" target="_blank">file an issue</a>, otherwise, try a <a href="http://www.google.com/chrome" target="_blank">sexier browser</a></p>
        </div>
    </div>
    
<!--     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script> -->
	<script src="<%=request.getContextPath()%>/js/fecrs/facilities/js/maki_jquery.js"></script>
    <script src="<%=request.getContextPath()%>/js/fecrs/facilities/js/makisu.js"></script>

    <script>
    
        // The `enabled` flag will be `false` if CSS 3D isn't available
        var fnInterval = setInterval(function(){$( '.list' ).makisu( 'open' )}, 5000);

			
        if ( $.fn.makisu.enabled ) {

            var $maki = $( '.maki' );

            // Create Makisus
  
            $maki.makisu({
                selector: 'dd',
//                 overlap: 0.6,
                overlap: 0.2,
                speed: 0.85,
 
            });

            // Open all
            
            $( '.list' ).makisu( 'open' );

            // Toggle on click

            $( '.toggle' ).on( 'click', function() {
                $( '.list' ).makisu( 'toggle' );
            });

            // Disable all links

            $( '.demo a' ).click( function( event ) {
                event.preventDefault();
            });

        } else {

            $( '.warning' ).show();
        }
        
        var fnTimeout = setTimeout(function(){$( '.list' ).makisu( 'toggle' )}, 10000);
        

    </script>
</body>
</html>