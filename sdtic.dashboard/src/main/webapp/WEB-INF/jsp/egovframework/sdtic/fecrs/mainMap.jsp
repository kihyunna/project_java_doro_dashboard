<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="ajax" uri="http://ajaxtags.sourceforge.net/tags/ajaxtags" %>

<!doctype html>
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8" lang="en"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9" lang="en"><![endif]-->
<!--[if gt IE 8]><!-->
<!-- <html class="no-js"> -->
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> -->
<meta http-equiv="Content-Language" content="ko">
<meta name="robots" content="index, all" />

<title>상황판</title>	
<!-- 	<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css"> -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fecrs/css/mainMapstyle.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/fecrs/facilities/slide/origine/assets/css/reset.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/fecrs/facilities/slide/origine/assets/css/main.css" />
	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/fecrs/facilities/slide/origine/assets/css/refineslide-theme-dark.css" />	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/fecrs/facilities/slide/origine/refineslide.css" />
	<script src="<%=request.getContextPath()%>/js/fecrs/facilities/slide/origine/assets/js/modernizr.js"></script>

        
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/fecrs/facilities/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/fecrs/facilities/proj4js/lib/proj4js.js"></script>

    <style type="text/css">
		/* 로딩바 */
		#LodingBarWrap { width:100%; z-index:1000000; border:0; position:absolute; left:350px; top:350px; bottom:0; right:0;}
		#LodingBarWrap .LodingBar {position:absolute; border:3px solid #2a88c4; padding:10px;text-algin:center;  background: #d4eeff; background : rgba(212,238,255,1.0); }
		#LodingBarWrap .LodingBar font { color:#1d465f;  display:block; text-algin:center; font-size:20px; font-family:"나눔고딕",NanumGothic,ngeot,ngbeot,"돋움", Dotum,sans-serif; }
		
		
		.bodyOverflow {
					-webkit-backface-visibility: hidden;
					-moz-backface-visibility: hidden;
					-webkit-transform: translate3d(0, 0, 0);
					-moz-transform: translate3d(0, 0, 0);		
		} 
	</style>
	
	<%-- 차트 사용 jquery  --%>  
<%-- <script src="<%=request.getContextPath()%>/js/echarts/source/js/jquery.min.js"></script> --%>
<%-- 차트   --%>  
<script src="<%=request.getContextPath()%>/js/echarts/dist/echarts.js" type="text/javascript"></script>
	
<script type="text/javascript">	
	var fac_kind = 1;//1:터널, 2:사면, 3:전기
	var bonbu_kind = 2;
	var fac_box_top = 5;
	
	var boxChange = null;
	var bonbuChange = null;
	
	function loading(){	 
// 		setChart();
	eventFinish = false;
	map.getLayer("gangwon_map").setVisible(true);
		setTimeout($.proxy(function () {
			changeLocation();
		}, this), 10000);	
		
		if (boxChange)
			clearInterval(boxChange);
		boxChange = setInterval($.proxy(function () {
			if (eventFinish)
				return;
			showFacilities();
			fac_kind++;
		}, this), 5000);	
		
		if (bonbuChange)
			clearInterval(bonbuChange);
		bonbuChange = setInterval($.proxy(function () {
			if (eventFinish)
				return;
			map.getLayer("gangwon_map").setVisible(false);
			map.getLayer("gyeongbuk_map").setVisible(false);
			if (bonbu_kind == 1)
				map.getLayer("gangwon_map").setVisible(true);
			else
		 		map.getLayer("gyeongbuk_map").setVisible(true);
			
			bonbu_kind++;
			
		}, this), 10000);
	}	
	
	function changeLocation(){
		
	 	
// 		$("#idChart").animate({ top : "10px" },1000)
// 	      .animate({ left : "10px" },1000);
		//return;
		loadSamyeon();
		
		setTimeout($.proxy(function () {
			showWarning();			
		}, this), 10000);
		
	}
	
    function showWarning(){
    	
	 	$('#LodingBarWrap').toggle(1000);
	 	$('#idBox').fadeOut(100); 
// 	 	map.addLayer(vectorLayer2);
	 	
		setTimeout($.proxy(function () {
			closeWarning();
		}, this), 3000);	  
			 
     }
 	function closeWarning(){	
		$('#LodingBarWrap').fadeOut(4000); 
		setTimeout($.proxy(function () {
			map.getLayer("vworldSatellite").setVisible(true); 
		}, this), 800);
		setTimeout($.proxy(function () {
			
			layersOff();
		}, this), 1000);	
 	}
 
 	function layersOff(){
	 	map.getLayer("test_bonbu").setVisible(false);
	 	map.getLayer("test_road").setVisible(false);
	 	
	 	map.getLayer("gangwon_map").setVisible(false);
	 	map.getLayer("gyeongbuk_map").setVisible(false);
	 	
// 	 	$('#idChart').animate({ left : "-450px" },1000).animate({ top : "350px" },1000);
	 	
 		setTimeout($.proxy(function () {
 			setfly();
	  	}, this), 100);
	 
 	}
 
 	function setfly(){
		 var bern = null;
		 flyTo(bern, function () {}); 	
		 eventFinish = true;
 	}

	 function loadSamyeon(){
		 var url = 'http://'+location.host+'/panorama.html';		 
		 $('#my_frame').attr('src', url);
		 
		 //window.open(url,"사면",'scrollbars=no,toolbar=no,location=no,status=no,menubar=no,resizable=no,left=0,top=0'+'height=1000px,width=900px');
		 //,width=1800px,height=1000px  + 'fullscreen=yes'
	 }    
	 
	 function flyTo(location, done) {
		 
		 location = [14080662.5015, 4166838.987];	 
	     var duration = 2000;
	     var zoom = map.getView().getZoom();
	     var parts = 2;
	     var called = false;
	     function callback(complete) {
	       //--parts;
	       if (called) {
	         return;
	       }
	       if (parts === 0 || !complete) {
	         called = true;
	         done(complete);
	       }
	     }
	     map.getView().animate({
	       center: location,
	       duration: duration
	     });     
	     
	     map.getView().animate({
	       zoom: zoom -1,
	       duration: duration / 2
	     }, {
	       zoom: 12 ,
	       duration: duration / 2       
	     }, callback);
	     
	     location = [[14080652.5015, 4166838.987]];
	        
	     eventFinish = false;
	     flashEvent(location, "");	     	     
	    
// 	     map.addLayer(vectorLayer2);
	     setTimeout($.proxy(function () {
	    	 slide(1);	    	 
			  }, this), 4000);	 
	     setTimeout($.proxy(function () {
	    	 setCameraTime();	    	 
			  }, this), 6000);	
	     
   } 
	var tiltAngle = 0; 
	var camera_alti = 272.87036562924743; 
	var headAngle = 0; 
	//var camera_distance = 214.4121208041348;
	var camera_distance = 762.335123;
	
	function setCameraTime(){
		if (tiltAngle > 72){
			setChart2();
			setTimeout($.proxy(function () {
		    	 mapExtent();
				  }, this), 8000);
			
			return;
		}			
		setCamera(tiltAngle, camera_alti, headAngle, camera_distance);
		//getCamera();
		tiltAngle += 1.8;
		camera_alti -= 1;
		camera_distance -= 14;
		headAngle += 9;
		setTimeout($.proxy(function () {
			setCameraTime();
			  }, this), 50);
	}
 
	function flyToreturn(location, done) {
		 
		 location = [14213400.862804638,4378632.058197232];	 
	     var duration = 2000;
	     var zoom = map.getView().getZoom();
	     var parts = 2;
	     var called = false;
	     function callback(complete) {
	       //--parts;
	       if (called) {
	         return;
	       }
	       if (parts === 0 || !complete) {
	         called = true;
	         done(complete);
	       }
	     }
	     map.getView().animate({
	       center: location,
	       duration: duration
	     });     
	     
	     map.getView().animate({
	       zoom: 12,
	       duration: duration / 2
	     }, {
	       zoom: 3 ,
	       duration: duration / 2       
	     }, callback);   
   }
 
	 function mapExtent(){
		 $('#idChart_samyeon').animate({ top : "1500px" },2000,"swing");
		 eventFinish = true;
		 flyToreturn();
		 setTimeout($.proxy(function () {
			 show_event();
			  }, this), 2000);
		 
	 }
	 
	 function show_event(){
// 		 map.removeLayer(vectorLayer2);
// 		 $('#my_frame').fadeIn(1000);
// 		 $('#my_frame').animate({ top : "0px" },3000);
		slide(2);
	    setTimeout($.proxy(function () {
	    	 map.getLayer("test_bonbu").setVisible(true);
	    	 map.getLayer("test_road").setVisible(true);
			 map.getLayer("vworldSatellite").setVisible(false); 
			 
			tiltAngle = 0; 
			camera_alti = 272.87036562924743; 
			headAngle = 0; 
			camera_distance = 762.335123;
				
			 setCamera(tiltAngle, camera_alti, headAngle, camera_distance);
				map.getView().setCenter([14213400.862804638,4360632.058197232]);
			    map.getView().animate({
			           zoom: 3
			    });  
			    
			  }, this), 1000);
	    
	    setTimeout($.proxy(function () {
	    	defualtToReturn();
			  }, this), 10000);
	}
	 
	 function defualtToReturn(){
		
		 slide(0);		 
// 		 $('#my_frame').animate({ left : "1500px" },1000,closeiFrame());	
		 $('#idBox').fadeIn(100); 
		
		 
		 setTimeout($.proxy(function () {
			 loading();	    	 
			  }, this), 1000);	
		 //showBuildings();
		 //showFacilities();
// 		 setChart();

	    
	 }
	 
	 function closeiFrame(){
// 		 setTimeout($.proxy(function () {	    	 
// 			 $('#my_frame').fadeOut();
// 		 	 $("#my_frame").animate({ top : "1500px" },100)
// 	 	      .animate({ left : "0px" },100);
// 				  }, this), 3000);		 
	 }
	 

 </script>
</head>
<body onload="javascript:loading();" style="overflow:hidden;top:0px;left:0px;" >
<!-- -->
<div style="height:50px;">
	<a href="#" class="map_title" style="margin-left:260px;"> 현장설비 지도관제</a>
</div>
<div id="LodingBarWrap" style="display:none">
	<div class="LodingBar"  >	
		<font >사면 이벤트 발생</font><br />
		<img src="<%=request.getContextPath()%>/images/fecrs/warning.png" width="150" height="150" />		
	</div>
</div>

<div class="group section-wrap upper" id="upper" style="z-index:10;">
	<div class="wrap group">
		<div class="section-2 group">
			<ul id="images" class="rs-slider">
				<li class="group"> 
<!-- 					<a href="#">  -->
					    <div id="map" style="width:900px;height:900px;background-color:rgb(23,26,31);" >
					    </div>
					    
<!-- 					</a>					 -->
				</li>
				<li class="group"> 
<!-- 					<a href="#" class="slide-parent"> -->
						<div id="map3d" style="width:900px;height:900px;">
					    </div> 
<%-- 						<img src="<%=request.getContextPath()%>/js/fecrs/facilities/slide/origine/assets/img/greenbut.jpg" alt=""/>  --%>
<!-- 					</a>					 -->
				</li>	
				<li class="group"> 
<!-- 					<a href="#" class="slide-parent"> -->
						<iframe id = "my_frame" style="width:900px;height:900px;background-color:rgb(125,125,125)">						
					    </iframe> 

<!-- 					</a>					 -->
				</li>			
			</ul>
		</div>
<!-- /.section-2 --> 
	</div>
<!-- /.wrap --> 
</div>
<!-- /#upper -->



<!-- <div id = "idChart" style="top:350px; left: -450px; width: 400px; height: 400px; z-index:200; position:absolute; background-color:rgba()"> -->
<!-- </div> -->

<div id = "idChart_samyeon" style="top:1500px; left: 50px; width: 800px; height: 400px; z-index:200; position:absolute;">
</div>

<!-- <iframe id = "my_frame" style="position:absolute;top:1500px;left:0px; width:900px;height:1000px;z-index:1000;display:none"> -->
<!-- </iframe>  -->

<div id="idBox">
	<div id="idFacBtn" style="position:absolute;top:60px;left:10px;z-index:100;">
		<li><a href="" id="idFac_1" class="fac_warning">터널: 20건</a></li>
		<li><a href="" id="idFac_2" class="fac_normal">사면: 21건</a></li>
		<li><a href="" id="idFac_3" class="fac_normal">전기: 28건</a></li>
	</div>
	
	<div id="idFacBox" class="fac_box" style="position:absolute;top:59px;left:20px;z-index:101;">
	</div>
</div>




<script>
var RsObj = null;

function slide(val){
	if (RsObj)
	{
		RsObj.transition(val); // Call transition using identifier from thumb class
	}

}
</script>


<%-- <script src="<%=request.getContextPath()%>/js/fecrs/facilities/slide/origine/assets/js/jquery.js"></script> --%>
<script src="<%=request.getContextPath()%>/js/fecrs/facilities/slide/refineslide_jquery.js"></script> 
<script>

        $(function () {		

            var $upper = $('#upper');

            $('#images').refineSlide({
                transition : 'cubeH',
                onInit : function () {
                    var slider = this.slider,
                       $triggers = $('.translist').find('> li > a');

                    $triggers.parent().find('a[href="#_'+ this.slider.settings['transition'] +'"]').addClass('active');

                    $triggers.on('click', function (e) {
                       e.preventDefault();

                        if (!$(this).find('.unsupported').length) {
                            $triggers.removeClass('active');
                            $(this).addClass('active');
                            slider.settings['transition'] = $(this).attr('href').replace('#_', '');
                        }
                    });

                    function support(result, bobble) {
                        var phrase = '';

                        if (!result) {
                            phrase = ' not';
                            $upper.find('div.bobble-'+ bobble).addClass('unsupported');
                            $upper.find('div.bobble-js.bobble-css.unsupported').removeClass('bobble-css unsupported').text('JS');
                        }
                    }

                    support(this.slider.cssTransforms3d, '3d');
                    support(this.slider.cssTransitions, 'css');
                }
            });
        });
    </script>
    <script src="<%=request.getContextPath()%>/js/fecrs/facilities/cesium/origine/inject_ol_cesium.js"></script>
    <script src="<%=request.getContextPath()%>/js/fecrs/facilities/infra/js/ol-infra.min.js"></script>
    <script> 
    	function getCamera(){
    		alert(camera.getHeading() * 180 / Math.PI);
    		alert('고도 : ' +camera.getAltitude());
    		alert(camera.getDistance());
    		alert(camera.getPosition() + '__' +camera.getCenter());
    		alert(camera.getTilt() * 180 / Math.PI);    
    	}
    	function setCameraheading(){
    		camera.setHeading(0);
    	}
    	function setCamera(tilt_ang, alti_ang, head_ang, dist_ang){
    		camera.setHeading(head_ang/ 180 * Math.PI);
    		//camera.setAltitude(alti_ang);//272.87036562924743
    		camera.setDistance(dist_ang);
    		
    		////camera.setPosition(14234133.635719163,3915495.565708074);
    		camera.setCenter([14080662.5015,4166838.987]);
    		camera.setTilt(tilt_ang/ 180 * Math.PI);    		
    	}
    </script>
    <script src="<%=request.getContextPath()%>/js/fecrs/facilities/mainMap_olcesium.js"></script>
    <script src="<%=request.getContextPath()%>/js/fecrs/facilities/mainMap_charts.js"></script> 
</body>
</html>
