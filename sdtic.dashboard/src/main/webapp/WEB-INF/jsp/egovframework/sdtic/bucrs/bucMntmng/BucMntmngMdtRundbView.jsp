<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv='description' content='' />
<title>차량관제 현황</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
 <script type="text/javascript" src="${contextPath}/js/bucrs/anime.js"></script>
</head>

<body style="background-color:#ffffffff">
	<div id="main" style="width:300px;height:280px;"></div>
	<div id = "idDiv" style="top:30px; width:100%;height: 30px;z-index:102;position: absolute;">
	<div id = "select1lv" style="float:right;"></div>
	</div>
	<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main'),'dark');
	
	var car =  'image://data:image/png;base64,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';
	
	var bonbucd = '';
	var distance =  [0, 0, 0, 0, 0, 0, 0, 0];
	var kor_dptnm = new Array();
	//jQuery(document).ready(function($){

		//-----------------------------------AJAX 호출 영역 ---------------------------------------
		       getBucMntmngMdtRundbAjax();
		      //-----------------------------------AJAX 호출 영 역 ---------------------------------------        
		  	 function isNumeric(num, opt){
		         num = String(num).replace(/^\s+|\s+$/g, "");
		         if(typeof opt == "undefined" || opt == "1"){
		             var regex = /^[+\-]?(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;
		         }else if(opt == "2"){
		         	var regex = /^(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;
		 	    }else if(opt == "3"){
		 	        var regex = /^[0-9]+(\.[0-9]+)?$/g;
		 	    }else{
		 	        var regex = /^[0-9]$/g;
		 	    }
		 	
		 	    if( regex.test(num) ){
		 	        num = num.replace(/,/g, "");
		 	        return isNaN(num) ? false : true;
		 	    }else{ return false;  }
		 	}
		     function getNumeric(str, opt){
		         if(isNumeric(str, opt)){
		       	    str = String(str).replace(/^\s+|\s+$/g, "").replace(/,/g, "");
		       	    return Number(str);
		       	}else{
		       		return str;

		       	}

		     }

		     function formatNumber(str, opt){

		       var rstr = "", sign = "";

		       if(isNumeric(str, opt)){

		     	    str = String(getNumeric(str, opt));

		     	    if(str.substr(0, 1) == "-" ){

		     	    	    sign = "-";

		     	    	    str = str.substr(1);

		     	    }

		     	    var arr = str.split(".");

		     	    for(var ii = 0 ; ii < arr[0].length ; ii++){

		     	    	  if( ii % 3 == 0 && ii > 0){

		     	    		    rstr = arr[0].substring(arr[0].length-ii,arr[0].length-ii-1) + "," + rstr;

		     	    	 }else{

		     	         rstr = arr[0].substring(arr[0].length-ii,arr[0].length-ii-1) + rstr;

		     	         }

		     	    }

		 		    rstr = sign + rstr;
		 		
		 		    return arr.length > 1 ? rstr + "." + arr[1] : rstr;

		 		}else{

		 	return str;

		   }
		     }
		       
		        function searchUpperhdqrtrs(){
			        $.ajax({
			            type: 'POST',
			            url: "/buc/selectMainInstt1lv.do",
			            dataType: "json",
			            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			            success: function(data, responseText, statusText, textStatus){
			                $("#select1lv").html("");
			                var contentStr  = "";
			                contentStr += "<select id='upperhdqrtrs' onchange='callAjaxfunction()' style='border: 1px solid rgba(74, 74, 74, 0.2);width:120px;height: 30px;z-index:102;background-color:rgba(50,50,50,0.7);color:#eee;font-size:20px;'>";
			                contentStr += "<option value=''> == 전체 ==</option>";
			                for(var i=0; i<data.data.length; i++)
			                {
			                    contentStr += "    <option value=\'"+data.data[i].intg_dptcd+"\'>"+data.data[i].kor_dptnm+"\</option>";
			                }
			                contentStr += "</select>";
			                $("#select1lv").html(contentStr);
			            }
			            ,error : function(request, status, error){  alert("code : " +request.status + "\r\nmessage : " + request.reponseText); }
			            ,beforeSend:function(){}
			            ,complete :function(){}
			        });
			    }
		        
		        function callAjaxfunction(){
					bonbucd =  $("#upperhdqrtrs").val();
					getBucMntmngMdtRundbAjax();
				}  
		      
		        function getBucMntmngMdtRundbAjax(){
		        	distance =  [, , , , , , , ];
		        	kor_dptnm = new Array();
		            $.ajax({
		                url : "${pageContext.request.contextPath}/buc/bucMntmngMdtRundbAjax.do",
		                async : false,
		                dataType : 'json',
		                data:{
			             	'use_cd' : bonbucd
			            	},
		                success :function(json) {     
		                	
		    	                if(json.data.length > 0 ){
		    	                	for(var i = 0; i < json.data.length; i++) {
		    	                		distance[i] = json.data[i].distance;
		    	                		kor_dptnm[i] = json.data[i].kor_dptnm;
		    	                	}
		    	                }
		    	                else{
		    	                console.log(arguments);
		    	                }
		    	                option = {

			    	       			     /* tooltip: {
			    	       			        trigger: 'axis',
			    	       			        axisPointer: {
			    	       			            type: 'none',
			    	       			            formatter: function(v) {
			    	       			            	return v.value + 'km';
			    	       			            }
			    	       			        }
			    	       			       
			    	       			    },  */
			    	       			   
			    	       			    xAxis: {
			    	       			    	show: true,
			    	       			    	type: 'value',
			    	       			    	splitLine: {show: false},
			    	       			    	name: '단위:km'/* ,
			    	       			        splitLine: {show: false},
			    	       			        axisTick: {show: false},
			    	       			        axisLine: {show: false},
			    	       			        axisLabel: {show: false} */
			    	       			    },
			    	       			     yAxis: {
			    	       			        data: kor_dptnm,
			    	       			       // offset:'10',
			    	       			        axisTick: {show: false},
			    	       			        axisLine: {show: false},
			    	       			        axisLabel: {show: true},
			    	       			    },
			    	       			    grid: {
			    	       			    	left : 100,
			    	       			    	right : 200
			    	       			    },
			    	       			    series: [{
			    	       			     	name: '거리',
			    	       			        type: 'pictorialBar',
			    	       			        barCategoryGap: '50%',
			    	       			        symbolSize: 10,
			    	       			        symbolRepeat:'true',
			    	       			        itemStyle: {
			    	       			            normal: {
			    	       			            	color : '#91c7ae',
			    	       			                opacity: 0.8
			    	       			            },
			    	       			            emphasis: {
			    	       			                opacity: 1
			    	       			            }
			    	       			        },
			    	       			        data: distance,
			    	       			        z: 10
			    	       			    }, {
			    	       			    	name: '거리',
			    	       			        type: 'pictorialBar',
			    	       			        barGap: '-100%',
			    	       			        symbolPosition: 'end',
			    	       			        symbolSize: [40,30],
			    	       			        symbolOffset: [65, -5],
			    	       			        data: distance,
			    	       			        symbol: car,
			    	       			        label: {
			    	       			        	normal: {
			    	       			        		show: true,
			    									position: 'right',
			    									offset:[10,0],
			    									formatter:function(value) {
			    			                            var texts = formatNumber(value.value);
			    			                            return texts 
			    									}
			    	       			        	}
			    	       			        }
			    	       			    }]
			    	       			};
		    	
		    	            },error : function(){
		    	                console.log(arguments);
		    	            }, complete : function() {
		    	            	myChart.setOption(option);
		    	            }
		    	        });
		    		
		    	    }
		        
		//});

			
		
		
		myChart.setOption(option);	
		var getParamTime = 0;
		var deptcd = '';
        var instClsfcCd = '';
        var hgrn_dptcd = '';
		 $(window).load(function() {
			 
			 getParamTime = "${param.widgetTimer}";
	         deptcd = "${param.dptCd}";
	         instClsfcCd = "${param.instClsfcCd}";
	         
	         if(getParamTime == 0){
	        	 getParamTime = 60000*60;
	         }
	         
	         window.setInterval("getBucMntmngMdtRundbAjax()",getParamTime);
	            
			 
			 searchUpperhdqrtrs();
			 
			 if(instClsfcCd = 'B'){
                 bonbucd  = deptcd;
              $('#upperhdqrtrs').value = bonbucd;
	           }
	    
	           if(instClsfcCd == 'J'){
	       
	               $.ajax({
	                    url : "${pageContext.request.contextPath}/buc/bucCmmnGetHGRN_DPTCDAjax.do",
	                       async : false,
	                       dataType : 'json',
	                       data:{
	                          jasa_dptcd : deptcd
	                       },
	                       success :function(json) {
	                           hgrn_dptcd = json.data[0].bonbu_dptcd;
	                       }, error : function() {
	                           console.log(arguments);
	                       }, complete: function(json) {
	                           $('#upperhdqrtrs').value = hgrn_dptcd;
	                           
	                       }                   
	                });
	              
	               
	           }
	           
	           
	               bonbucd  = $("#upperhdqrtrs").val();
	           
			 
			 
		     setDivHeight('main');
		     getBucMntmngMdtRundbAjax();
		        
		});
		 
		 $(window).resize(function(){

		        setDivHeight('main');

		    });
		
		 
		 
	    function setDivHeight(objSet)
	    {

	        var objSet   = document.getElementById(objSet);
	        objSet.style.width  = ($(window).width()) + "px";
	        objSet.style.height  = ($(window).height()) + "px";
	        //option.baseOption.timeline.width = ($(window).width() - 10) + "px";


	        $('#main').width(($(window).width()) + "px");
	        $('#main').height(($(window).height()) + "px");


	        myChart.resize({
	            width: $(window).width(),
	            height : $(window).height()
	            
	        });
	        myChart.setOption(option);
			
	    } 
		         
	</script>
	</div>
</body>
</html>