<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>건설 공정율</title>
<!-- including ECharts file -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
<script type="text/javascript">

	//var htmlHeader;
	$(window).load(function(){
		move();
	
	});
	jQuery(document).ready(function($){
		
    	//-----------------------------------AJAX 호출 영역 ---------------------------------------

    	        getBucMainBnstyFairRtdbAjax();
    	        

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------
    })
    
    var timerValue = 0;
    $(window).load(function(){

        timerValue = "${param.widgetTimer}";
        
        if(timerValue == 0){
            timerValue = 60000*60;
        }
        
        window.setInterval("getBucMainBnstyFairRtdbAjax()",timerValue);
        
    });
    
    var gridData = [];
	var planData= [];
	var excuteData = [];	
    
        function getBucMainBnstyFairRtdbAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucMainBnstyFairRtdbAjax.do",
            async : false,
            dataType : 'json',
            success :function(json) { 
            		var dataCnt = 0;
	                if(json.data.length > 0 ){
	                    for(var i=0; i<json.data.length; i++)
	                    {
	                    	if(json.data[i].biz_mgmt_nm != "도로개량사업단"){
								gridData[dataCnt] = json.data[i];
								planData[dataCnt] = Math.round(json.data[i].whol_plan_rate, 1);
								excuteData[dataCnt] = Math.round(json.data[i].whol_efcn_rate, 1);
								dataCnt++;
	                    	}
	                    }
	                }
	                else{
	                console.log(arguments);
	                }
	
	            },error : function(){
	                console.log(arguments);
	            }, complete : function() {
	               for(var j = 0; j < gridData.length; j++) {
	            	   $('#saup' + j).text(gridData[j].biz_mgmt_nm);
	            	   $('#gongu' + j).text(gridData[j].biz_loct_count);
	            	   if(planData[j] == excuteData[j]) {
		            	   $('#label' + j).addClass("success");
	            	   } else {
		            	   $('#saup' + j).css("color", "red");
		            	   $('#gongu' + j).css("color", "red");
		            	   $('#label' + j).addClass("fail");
	            	   }
	               }
	            }
	        });
		
	    }
	
	function move() {
		  var elem = document.getElementById("label0");
		  var elem1 = document.getElementById("label1"); 
		  var elem2 = document.getElementById("label2");
		  var elem3 = document.getElementById("label3");
		  var elem4 = document.getElementById("label4");
		  var elem5 = document.getElementById("label5");
		  var elem6 = document.getElementById("label6");
		  var elem7 = document.getElementById("label7");
		  var elem8 = document.getElementById("label8");
		  var elem9 = document.getElementById("label9");
		  var elem10 = document.getElementById("label10");
		  var elem11 = document.getElementById("label11");
		  var elem12 = document.getElementById("label12");
		 
		  var id = setInterval(frame, 10);
		  var id1 = setInterval(frame1, 10);
		  var id2 = setInterval(frame2, 10);
		  var id3 = setInterval(frame3, 10);
		  var id4 = setInterval(frame4, 10);
		  var id5 = setInterval(frame5, 10);
		  var id6 = setInterval(frame6, 10);
		  var id7 = setInterval(frame7, 10);
		  var id8 = setInterval(frame8, 10);
		  var id9 = setInterval(frame9, 10);
		  var id10 = setInterval(frame10, 10);
		  var id11 = setInterval(frame11, 10);
		  var id12 = setInterval(frame12, 10);
		  
		  var width = 0;
		  var width1 = 0;
		  var width2 = 0;
		  var width3 = 0;
		  var width4 = 0;
		  var width5 = 0;
		  var width6 = 0;
		  var width7 = 0;
		  var width8 = 0;
		  var width9 = 0;
		  var width10 = 0;
		  var width11 = 0;
		  var width12 = 0;
		  
		  function frame() {
		    if (width >= excuteData[0]) {
		      clearInterval(id);
		    } else {
		      width++; 
		      elem.style.width = width + '%'; 
		      
		    }
		    document.getElementById("gubun0").innerHTML = width  + '/' + planData[0];
		    
		  }
		  function frame1() {
			    
			    if (width1 >= excuteData[1]) {
				      clearInterval(id1);
				    } else {
				      width1++; 
				      elem1.style.width = width1 + '%'; 
				    }
			    document.getElementById("gubun1").innerHTML = width1  + '/' + planData[1]
			  }
		  function frame2() {
			    
			    if (width2 >= excuteData[2]) {
				      clearInterval(id2);
				    } else {
				      width2++; 
				      elem2.style.width = width2 + '%'; 
				    }

			      document.getElementById("gubun2").innerHTML = width2  + '/' + planData[2];
			  }
		  function frame3() {
			    
			    if (width3 >= excuteData[3]) {
				      clearInterval(id3);
				    } else {
				      width3++; 
				      elem3.style.width = width3 + '%'; 
				    }

			      document.getElementById("gubun3").innerHTML = width3  + '/' + planData[3];
			  }
		  function frame4() {
			    
			    if (width4 >= excuteData[4]) {
				      clearInterval(id4);
				    } else {
				      width4++; 
				      elem4.style.width = width4 + '%'; 
				    }

			      document.getElementById("gubun4").innerHTML = width4  + '/' + planData[4];
			  }
		  function frame5() {
			    
			    if (width5 >= excuteData[5]) {
				      clearInterval(id5);
				    } else {
				      width5++; 
				      elem5.style.width = width5 + '%'; 
				    }
			      document.getElementById("gubun5").innerHTML = width5  + '/' + planData[5];
			  }
		  function frame6() {
			    
			    if (width6 >= excuteData[6]) {
				      clearInterval(id6);
				    } else {
				      width6++; 
				      elem6.style.width = width6 + '%'; 
				    }
			      document.getElementById("gubun6").innerHTML = width6  + '/' + planData[6];
			  }
		  function frame7() {
			    
			    if (width7 >= excuteData[7]) {
				      clearInterval(id7);
				    } else {
				      width7++; 
				      elem7.style.width = width7 + '%'; 
				    }
			      document.getElementById("gubun7").innerHTML = width7  + '/' + planData[7];
			  }
		  function frame8() {
			    
			    if (width8 >= excuteData[8]) {
				      clearInterval(id8);
				    } else {
				      width8++; 
				      elem8.style.width = width8 + '%'; 
				    }
			      document.getElementById("gubun8").innerHTML = width8  + '/' + planData[8];
			  }
		  function frame9() {
			    
			    if (width9 >= excuteData[9]) {
				      clearInterval(id9);
				    } else {
				      width9++; 
				      elem9.style.width = width9 + '%'; 
				    }
			      document.getElementById("gubun9").innerHTML = width9  + '/' + planData[9];
			  }
		  function frame10() {
			    
			    if (width10 >= excuteData[10]) {
				      clearInterval(id10);
				    } else {
				      width10++; 
				      elem10.style.width = width10 + '%'; 
				    }
			      document.getElementById("gubun10").innerHTML = width10  + '/' + planData[10];
			  }
		  function frame11() {
			    
			    if (width11 >= excuteData[11]) {
				      clearInterval(id11);
				    } else {
				      width11++; 
				      elem11.style.width = width11 + '%'; 
				    }
			      document.getElementById("gubun11").innerHTML = width11  + '/' + planData[11];
			  }
		  function frame12() {
			    
			    if (width12 >= excuteData[12]) {
				      clearInterval(id12);
				    } else {
				      width12++; 
				      elem12.style.width = width12 + '%'; 
				    }
			      document.getElementById("gubun12").innerHTML = width12  + '/' + planData[12];
			  }
		  
		  
		  
		}

</script>


<style>
  #BudTbl {
   border-collapse: collapse;
   background-color: #22272d;
   border: 1px solid gray;
   color: #fbfbfb;
   }
   #BudTbl tr,th,td{
   border-collapse: collapse;
   border: 1px solid gray;
}
th{
    color: #fbfbfb;
    border: 1px solid gray;
    background-color: #3D4146;
    font-size: 14px;
}
#BudTbl td{
    border: 1px solid gray;
    font-size: 13px;
    height: 15px;
    border-left: none;
}


#title_1 table,td{
    border: 0px;
}

#myProgress {

  height: 15px;
  width: 200px;
}

.success{
  
  width: 0%;
  height: 15px;
  background-color: #426fc4;
}
.fail{
  
  width: 0%;
  height: 15px;
  background-color: #fb0000;
}


#gubun0, #gubun1, #gubun2, #gubun3, 
#gubun4, #gubun5, #gubun6, #gubun7, 
#gubun8, #gubun9, #gubun10, #gubun11, #gubun12 {
  text-align: center;
  color: white;
}

</style>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
       <div>
            <table id="title_1">
               <td width="550x;" align="right"><font style="font-size:11px; color:#f9f9f9;">사업단별 평균 공정률(%)</font></td>
            </table>
        </div>
        <table id="BudTbl" frame="void" align="center">
            <tr>
                <th width="220px;" height="18px;">사업단</th>
                <th width="100px;">공구수</th>
                <th width="220px;">공정률/목표(%)</th>
            </tr>
    
            <tr>
                <td align="center" id="saup0"></td>
                <td align="center" id="gongu0"></td>
                <td id="myProgress"><div id="label0"><div id="gubun0"></div></div></td>
            </tr>
            <tr>
                <td align="center" id="saup1"></td>
                <td align="center" id="gongu1"></td>
              <td><div id="label1"><div id="gubun1"></div></div></td>
            </tr>
            <tr>
                <td align="center" id="saup2"></td>
                <td align="center" id="gongu2"></td>
                <td><div id="label2"><div id="gubun2"></div></div></td>
            </tr>
            <tr>
                <td align="center" id="saup3"></td>
                <td align="center" id="gongu3"></td>
                <td><div id="label3"><div id="gubun3"></div></div></td>
            </tr>
            <tr>
                <td align="center" id="saup4"></td>
                <td align="center" id="gongu4"></td>
                <td><div id="label4"><div id="gubun4"></div></div></td>
            </tr>
            <tr>
                <td align="center" id="saup5"></td>
                <td align="center" id="gongu5"></td>
                <td><div id="label5"><div id="gubun5"></div></div></td>
            </tr>
            <tr>
                <td align="center" id="saup6"></td>
                <td align="center" id="gongu6"></td>
                <td><div id="label6"><div id="gubun6"></div></div></td>
            </tr>
            <tr>
                <td align="center" id="saup7"></td>
                <td align="center" id="gongu7"></td>
                <td><div id="label7"><div id="gubun7"></div></div></td>
            </tr>
            <tr>
                <td align="center" id="saup8"></td>
                <td align="center" id="gongu8"></td>
                <td><div id="label8"><div id="gubun8"></div></div></td>
            </tr>
            <tr>
                <td align="center" id="saup9"></td>
                <td align="center" id="gongu9"></td>
                <td><div id="label9"><div id="gubun9"></div></div></td>
            </tr>
            <tr>
                <td align="center" id="saup10"></td>
                <td align="center" id="gongu10"></td>
                <td><div id="label10"><div id="gubun10"></div></div></td>
            </tr>
            <tr>
                <td align="center" id="saup11"></td>
                <td align="center" id="gongu11"></td>
                <td><div id="label11"><div id="gubun11"></div></div></td>
            </tr>
            <tr>
                <td align="center" id="saup12"></td>
                <td align="center" id="gongu12"></td>
                <td><div id="label12"><div id="gubun12"></div></div></td>
            </tr>
        		</table>
    			</div>
    		</div>
        </td>
    </tr>
</table>
</body>
</html>