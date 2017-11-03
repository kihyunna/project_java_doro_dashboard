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

<%-- 자바스크립트  --%>  
<script src="<%=request.getContextPath()%>/js/fecrs/facilities/FecSptEqpOprCstsLv1.js" type="text/javascript"></script>
<%-- 이벤트  --%>
<!-- <link href='http://fonts.googleapis.com/css?family=Days+One' rel='stylesheet' type='text/css'> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fecrs/css/style.css">
    
</head>
<script>
$(function() {
    //위젯간 통신
    if(window.addEventListener) {
       window.addEventListener("message", uf_receiveMessage, false);
    }else if(window.attachEvent) {  //IE에서 이벤트 등록
       window.attachEvent("onmessage", uf_receiveMessage);
    }
});

//위젯간 통신
function uf_receiveMessage(e){	   
	  var command = e.data.command;
	  switch(command){
	        case 'Level1MapDeptCode' :    { //레벨2, 레벨1 : Level1MapDeptCode
	        	$( '.list' ).makisu( 'toggle' );
	        	setTimeout(function(){
	        		AjaxQuery(e.data.data.DeptCode);
	        	}, 500);
	        	
	           break;
	        }
	        
	        default : {
	           break;
	        } 
	     }
	}
	
</script>

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
			<dl id="dl_name" class="list maki">
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
			<dl id="dl_tunnel" class="list maki" >
				<dt>터널</dt>
				<dd><a >112 / 112</a></dd>
				<dd class="bgPrb">119 / 120</a></dd>
				<dd class="bgPrb">120 / 123</a></dd>
				<dd><a >92 / 92</a></dd>
				<dd class="bgPrb">110 / 112</a></dd>
				<dd><a >67 / 67</a></dd>
				<dd><a >21 / 21</a></dd>
				<dd><a ></a></dd>
			</dl>
		</li>
		 <li>
			<dl class="list maki">
				<dt class="tit2tab">전기</dt>
			</dl>
			<dl id="dl_elcts_tunnel" class="list maki wid_none">
				<dt class="he_25" style="width:103px">터널</dt>
				<dd  style="width:103px"><a >13 / 13</a></dd>
				<dd  style="width:103px"><a >6 /
				<dd style="width:103px"><a >10 / 10</a></dd>
				<dd class="bgPrb" style="width:103px">12 / 13</a></dd>
				<dd style="width:103px"><a >11 / 11</a></dd>
				<dd style="width:103px"><a >13 / 13</a></dd>
				<dd style="width:103px"><a >15 / 15</a></dd>
				<dd style="width:103px"><a ></a></dd>
			</dl>
			<dl id="dl_elcts_office" class="list maki wid_none" >
				<dt class="he_25" style="width:103px">영업소</dt>
				<dd class="bgPrb" style="width:103px">798 / 812</a></dd>
				<dd class="bgPrb" style="width:103px">211 / 212</a></dd>
				<dd style="width:103px"><a >329 / 329</a></dd>
				<dd style="width:103px"><a >112 / 112</a></dd>
				<dd class="bgPrb" style="width:103px">402 / 412</a></dd>
				<dd style="width:103px"><a >612 / 612</a></dd>
				<dd style="width:103px"><a >112 / 112</a></dd>
				<dd style="width:103px"><a ></a></dd>
			</dl>
			<dl id="dl_elcts_lamp" class="list maki wid_none">
				<dt class="he_25" style="width:103px">가로등/조명탑</dt>
				<dd style="width:103px"><a >89 / 89</a></dd>
				<dd style="width:103px"><a >43 / 43</a></dd>
				<dd class="bgPrb" style="width:103px">98 / 99</a></dd>
				<dd class="bgPrb" style="width:103px">85 / 89</a></dd>
				<dd style="width:103px"><a >43 / 43</a></dd>
				<dd style="width:103px"><a >72 / 72</a></dd>
				<dd style="width:103px"><a >21 / 21</a></dd>
				<dd style="width:103px"><a ></a></dd>
			</dl>
		</li>
		<li>
			<dl id="dl_slp" class="list maki" >
				<dt>사면</dt>
				<dd><a >112 / 112</a></dd>
				<dd><a >120 / 120</a></dd>
				<dd><a >123 / 123</a></dd>
				<dd><a >92 / 92</a></dd>
				<dd class="bgPrb">110 / 112</a></dd>
				<dd><a >67 / 67</a></dd>
				<dd><a >21 / 21</a></dd>
				<dd><a ></a></dd>
			</dl>
		</li>
		<li>
			<dl id="dl_svar" class="list maki" >
				<dt>오수</dt>
				<dd><a >13 / 13</a></dd>
				<dd><a >6 / 6</a></dd>
				<dd><a >10 / 10</a></dd>
				<dd class="bgPrb">12 / 13</a></dd>
				<dd><a >11 / 11</a></dd>
				<dd><a >13 / 13</a></dd>
				<dd><a >15 / 15</a></dd>
				<dd><a ></a></dd>
			</dl>
		</li>
		<li>
			<dl id="dl_cctv" class="list maki" >
				<dt>CCTV</dt>
				<dd><a >26 / 26</a></dd>
				<dd><a >52 / 52</a></dd>
				<dd><a >63 / 63</a></dd>
				<dd><a >51 / 51</a></dd>
				<dd class="bgPrb">34 / 35</a></dd>
				<dd><a >87 / 87</a></dd>
				<dd><a >65 / 65</a></dd>
				<dd><a ></a></dd>
			</dl>
		</li>
	</ul>
    </section>
	</div>
    
<!--     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script> -->
	<script src="<%=request.getContextPath()%>/js/fecrs/facilities/js/maki_jquery.js"></script>
    <script src="<%=request.getContextPath()%>/js/fecrs/facilities/js/makisu.js"></script>

    <script>
    
        // The `enabled` flag will be `false` if CSS 3D isn't available
        //var fnInterval = setInterval(function(){$( '.list' ).makisu( 'toggle' )}, 5000);

			
        if ( $.fn.makisu.enabled ) {

            var $maki = $( '.maki' );

            // Create Makisus
  
            $maki.makisu({
                selector: 'dd',
//                 overlap: 0.6,
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

    </script>

</body>
</html>