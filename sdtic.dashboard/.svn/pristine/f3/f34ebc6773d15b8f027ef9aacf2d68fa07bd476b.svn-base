<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="ECharts">
    
<%-- 차트 사용 jquery  --%>  
<script src="<%=request.getContextPath()%>/js/echarts/js/jquery.min.js"></script>

<%-- 차트   --%>  
<script src="<%=request.getContextPath()%>/js/echarts/dist/echarts.js" type="text/javascript"></script>

<%-- 자바스크립트  --%>  
<script src="<%=request.getContextPath()%>/js/fecrs/facilities/FecSptEqpOprCstsMain.js" type="text/javascript"></script>
<%-- 이벤트  --%>
<!-- <link href='http://fonts.googleapis.com/css?family=Days+One' rel='stylesheet' type='text/css'> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fecrs/css/style1.css">
    
</head>
<%-- <script>
$(function() {

	AjaxQuery("1", "2", '<%=request.getContextPath()%>'); 

});
</script> --%>
<script type="text/javascript">
    $(window).load(function() 
    {
        $('html').css("overflow","hidden");  // 레이어 뜬상태에서 html 스크롤바 삭제

    });
</script>
<body>
<header class="header">

    </header>
	<div id="gangwon">
    <section class="demo">      
	  <ul class="ul_table" style="text-align: center">
		<li>
			<dl class="list maki">
				<dt>지사명</dt>
				<dd><a >원주</a></dd>
				<dd><a >대관령</a></dd>
				<dd><a >홍천</a></dd>
				<dd><a >충주</a></dd>
				<dd><a >춘천</a></dd>
				<dd><a >강릉</a></dd>
				<dd><a >제천</a></dd>
				<dd><a ></a></dd>
			</dl>
		</li>
        <li>
			<dl class="list maki" >
				<dt>터널</dt>
				<dd><a >112 / 112</a></dd>
				<dd><a ><font>119 </font>/ 120</a></dd>
				<dd><a ><font>120 </font>/ 123</a></dd>
				<dd><a >92 / 92</a></dd>
				<dd><a ><font>110 </font>/ 112</a></dd>
				<dd><a >67 / 67</a></dd>
				<dd><a >21 / 21</a></dd>
				<dd><a ></a></dd>
			</dl>
		</li>
		 <li>
			<dl class="list maki">
				<dt class="tit2tab">전기</dt>
				<dd class="tit0tab"></dd>
			</dl>
			<dl class="list maki wid_none">
				<dt class="he_25">영업소</dt>
				<dd><a >13 / 13</a></dd>
				<dd><a >6 / 6</a></dd>
				<dd><a >10 / 10</a></dd>
				<dd><a ><font>12 </font>/ 13</a></dd>
				<dd><a >11 / 11</a></dd>
				<dd><a >13 / 13</a></dd>
				<dd><a >15 / 15</a></dd>
				<dd><a ></a></dd>
			</dl>
			<dl class="list maki wid_none">
				<dt class="he_25">가로등</dt>
				<dd><a ><font>798 </font>/ 812</a></dd>
				<dd><a ><font>211 </font>/ 212</a></dd>
				<dd><a >329 / 329</a></dd>
				<dd><a >112 / 112</a></dd>
				<dd><a ><font>402 </font>/ 412</a></dd>
				<dd><a >612 / 612</a></dd>
				<dd><a >112 / 112</a></dd>
				<dd><a ></a></dd>
			</dl>
			<!-- <dl class="list maki wid_none" >
				<dt class="he_25">조명탑</dt>
				<dd><a >89 / 89</a></dd>
				<dd><a >43 / 43</a></dd>
				<dd><a ><font>98 </font>/ 99</a></dd>
				<dd><a ><font>85 </font>/ 89</a></dd>
				<dd><a >43 / 43</a></dd>
				<dd><a >72 / 72</a></dd>
				<dd><a >21 / 21</a></dd>
				<dd><a ></a></dd>
			</dl> -->
		</li>
		<li>
			<dl class="list maki" >
				<dt>오수</dt>
				<dd><a >112 / 112</a></dd>
				<dd><a >120 / 120</a></dd>
				<dd><a >123 / 123</a></dd>
				<dd><a >92 / 92</a></dd>
				<dd><a ><font>110 </font>/ 112</a></dd>
				<dd><a >67 / 67</a></dd>
				<dd><a >21 / 21</a></dd>
				<dd><a ></a></dd>
			</dl>
		</li>
		<!-- <li>
			<dl class="list maki" >
				<dt>염수분사</dt>
				<dd><a >13 / 13</a></dd>
				<dd><a >6 / 6</a></dd>
				<dd><a >10 / 10</a></dd>
				<dd><a ><font>12 </font>/ 13</a></dd>
				<dd><a >11 / 11</a></dd>
				<dd><a >13 / 13</a></dd>
				<dd><a >15 / 15</a></dd>
				<dd><a ></a></dd>
			</dl>
		</li> -->
		<li>
			<dl class="list maki" >
				<dt>사면</dt>
				<dd><a >26 / 26</a></dd>
				<dd><a >52 / 52</a></dd>
				<dd><a >63 / 63</a></dd>
				<dd><a >51 / 51</a></dd>
				<dd><a ><font>34 </font>/ 35</a></dd>
				<dd><a >87 / 87</a></dd>
				<dd><a >65 / 65</a></dd>
				<dd><a ></a></dd>
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
    <script src="<%=request.getContextPath()%>/js/fecrs/facilities/js/makisu1.js"></script>

    <script>
    
        // The `enabled` flag will be `false` if CSS 3D isn't available
       // var fnInterval = setInterval(function(){$( '.list' ).makisu( 'toggle' )}, 5000);

			
        if ( $.fn.makisu.enabled ) {

            var $maki = $( '.maki' );

            // Create Makisus
  
            $maki.makisu({
                selector: 'dd',
                overlap: 0.6,
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
        
        //var fnTimeout = setTimeout(function(){$( '.list' ).makisu( 'toggle' )}, 10000);
        

    </script>
    <script>
    	var bonbu=1;
		$(function() {
			AjaxQuery(1, "2", '<%=request.getContextPath()%>');
			
			setInterval(function()
				{
					if (bonbu == 1){
					bonbu++;
				}else
					bonbu = 1;
				AjaxQuery(bonbu, "2", '<%=request.getContextPath()%>');
				}
			, 10000);
		
		});
	</script>

    

</body>
</html>