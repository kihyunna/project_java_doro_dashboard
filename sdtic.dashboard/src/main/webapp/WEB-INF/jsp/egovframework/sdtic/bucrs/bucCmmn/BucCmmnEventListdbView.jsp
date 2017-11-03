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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bucrs/event_style.css">
    
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
				<dt style="width: 80px;">본부명</dt>
				<dd style="width: 80px;"><a id="bonbu1"></a></dd>
				<dd style="width: 80px;"><a id="bonbu2"></a></dd>
				<dd style="width: 80px;"><a id="bonbu3"></a></dd>
				<dd style="width: 80px;"><a id="bonbu4"></a></dd>
				<dd style="width: 80px;"><a id="bonbu5"></a></dd>
				<dd style="width: 80px;"><a id="bonbu6"></a></dd>
				<dd style="width: 80px;"><a id="bonbu7"></a></dd>
				<dd style="width: 80px;"><a id="bonbu8"></a></dd>
				<dd style="width: 80px;"><a id="bonbu9"></a></dd>
				<dd style="width: 80px;"><a id="bonbu10"></a></dd>
			</dl>
		</li>
        <li>
			<dl class="list maki" >
				<dt style="width: 80px;">지사</dt>
				<dd style="width: 80px;"><a id="jisa1"></a></dd>
				<dd style="width: 80px;"><a id="jisa2"></a></dd>
				<dd style="width: 80px;"><a id="jisa3"></a></dd>
				<dd style="width: 80px;"><a id="jisa4"></a></dd>
				<dd style="width: 80px;"><a id="jisa5"></a></dd>
				<dd style="width: 80px;"><a id="jisa6"></a></dd>
				<dd style="width: 80px;"><a id="jisa7"></a></dd>
				<dd style="width: 80px;"><a id="jisa8"></a></dd>
				<dd style="width: 80px;"><a id="jisa9"></a></dd>
				<dd style="width: 80px;"><a id="jisa10"></a></dd>				
			</dl>
		</li>
		<li>
			<dl class="list maki" >
				<dt style="width: 80px;">만료일</dt>
				<dd style="width: 80px;"><a id="expiredate1"></a></dd>
				<dd style="width: 80px;"><a id="expiredate2"></a></dd>
				<dd style="width: 80px;"><a id="expiredate3"></a></dd>
				<dd style="width: 80px;"><a id="expiredate4"></a></dd>
				<dd style="width: 80px;"><a id="expiredate5"></a></dd>
				<dd style="width: 80px;"><a id="expiredate6"></a></dd>
				<dd style="width: 80px;"><a id="expiredate7"></a></dd>
				<dd style="width: 80px;"><a id="expiredate8"></a></dd>
				<dd style="width: 80px;"><a id="expiredate9"></a></dd>
				<dd style="width: 80px;"><a id="expiredate10"></a></dd>
			</dl>
		</li>
		<li>
			<dl class="list maki">
				<dt style="width: 200px;">허가 번호</dt>
				<dd style="width: 200px; text-align:left;"><a id="permitno1"></a></dd>
				<dd style="width: 200px; text-align:left;"><a id="permitno2"></a></dd>
				<dd style="width: 200px; text-align:left;"><a id="permitno3"></a></dd>
				<dd style="width: 200px; text-align:left;"><a id="permitno4"></a></dd>
				<dd style="width: 200px; text-align:left;"><a id="permitno5"></a></dd>
				<dd style="width: 200px; text-align:left;"><a id="permitno6"></a></dd>
				<dd style="width: 200px; text-align:left;"><a id="permitno7"></a></dd>
				<dd style="width: 200px; text-align:left;"><a id="permitno8"></a></dd>
				<dd style="width: 200px; text-align:left;"><a id="permitno9"></a></dd>
				<dd style="width: 200px; text-align:left;"><a id="permitno10"></a></dd>
			</dl>
		</li>
		<li>
			<dl class="list maki" >
				<dt style="width: 300px;">이벤트 내용</dt>
				<dd style="width: 300px; text-align:left;"><a id="event1"></a></dd>
				<dd style="width: 300px; text-align:left;"><a id="event2"></a></dd>
				<dd style="width: 300px; text-align:left;"><a id="event3"></a></dd>
				<dd style="width: 300px; text-align:left;"><a id="event4"></a></dd>
				<dd style="width: 300px; text-align:left;"><a id="event5"></a></dd>
				<dd style="width: 300px; text-align:left;"><a id="event6"></a></dd>
				<dd style="width: 300px; text-align:left;"><a id="event7"></a></dd>
				<dd style="width: 300px; text-align:left;"><a id="event8"></a></dd>
				<dd style="width: 300px; text-align:left;"><a id="event9"></a></dd>
				<dd style="width: 300px; text-align:left;"><a id="event10"></a></dd>
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
    jQuery(document).ready(function($){

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------

    	        getBucCmmnEventListdbAjax();

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------
   	});   
    
    var gridData = [];
    var dataNum =0;
    var dataCnt = 0;
    function getBucCmmnEventListdbAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucCmmnEventListdbAjax.do",
            async : false,
            dataType : 'json',
            success :function(json) {
            	dataCnt = 0;
                if(json.data.length > 0 ){
                    for(var i=0; i<json.data.length; i++)
                    {	  	 
                    	gridData[i] = json.data[i];
                  		dataCnt++;
                    }
                  
                }
                else{
                console.log(arguments);
                }

            },error : function(){
                console.log(arguments);
            }, complete : function() {
            	changeGridData();
            }
        });

    }
    
    
        // The `enabled` flag will be `false` if CSS 3D isn't available

			
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
        
        var fnTimeout = setInterval(function(){
        	$( '.list' ).makisu( 'toggle' )
        	setTimeout(function() {
        		$( '.list' ).makisu( 'open' );
            	changeGridData();
        	}, 2200);
        }, 10000);
        
        
        function changeGridData() {
        	for(var rowNum = 1; rowNum <11; rowNum++) {
        		if(dataCnt == 0) {
        			$('#bonbu' + rowNum).text('데이터없음');
        			$('#jisa' + rowNum).text('데이터없음');
        			$('#expiredate' + rowNum).text('데이터없음');
        			$('#permitno' + rowNum).text('데이터없음');
        			$('#event' + rowNum).text('데이터없음');
        		}
        		else {
        			if(gridData[dataNum] != null) {
            			$('#bonbu' + rowNum).text(gridData[dataNum].bonbu_nm);
            			$('#jisa' + rowNum).text(gridData[dataNum].kor_dptnm);
            			$('#expiredate' + rowNum).text(gridData[dataNum].prvu_end_dates);
            			if(gridData[dataNum].rlat_bass_ctnt != null) {
            				$('#permitno' + rowNum).text(gridData[dataNum].rlat_bass_ctnt);
            			} else {
            				$('#permitno' + rowNum).text('');
            			}
            			if(gridData[dataNum].prvu_objtv_ctnt != null) {
            				$('#event' + rowNum).text(gridData[dataNum].prvu_objtv_ctnt);
            			} else {
            				$('#event' + rowNum).text('');
            			}            			
            		} else {
            			$('#bonbu' + rowNum).text('');
            			$('#jisa' + rowNum).text('');
            			$('#expiredate' + rowNum).text('');
            			$('#permitno' + rowNum).text('');
            			$('#event' + rowNum).text('');
            		}
        		}  
        		dataNum++;
        	}
        	if(dataNum >= dataCnt) {
        		dataNum = 0;
        	}
        }

    </script>
</body>
</html>