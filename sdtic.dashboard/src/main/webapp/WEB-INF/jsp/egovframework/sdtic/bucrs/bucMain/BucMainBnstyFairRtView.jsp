<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title></title>
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
	
	
	function move() {
		  var elem = document.getElementById("label");
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
		  
		  var width = 10;
		  var width1 = 10;
		  var width2 = 10;
		  var width3 = 10;
		  var width4 = 10;
		  var width5 = 10;
		  var width6 = 10;
		  var width7 = 10;
		  var width8 = 10;
		  var width9 = 10;
		  var width10 = 10;
		  var width11 = 10;
		  var width12 = 10;
		  
		  function frame() {
		    if (width >= 85) {
		      clearInterval(id);
		    } else {
		      width++; 
		      elem.style.width = width + '%'; 
		      document.getElementById("unyoung").innerHTML = width  + '/' + "85";
		      
		    }
		    
		  }
		  function frame1() {
			    
			    if (width1 >= 65) {
				      clearInterval(id1);
				    } else {
				      width1++; 
				      elem1.style.width = width1 + '%'; 
				      document.getElementById("ulpo").innerHTML = width1  + '/' + "65";
				    }
			  }
		  function frame2() {
			    
			    if (width2 >= 55) {
				      clearInterval(id2);
				    } else {
				      width2++; 
				      elem3.style.width = width2 + '%'; 
				      document.getElementById("umjae").innerHTML = width2  + '/' + "60";
				    }
			  }
		  function frame3() {
			    
			    if (width3 >= 82) {
				      clearInterval(id3);
				    } else {
				      width3++; 
				      elem2.style.width = width3 + '%'; 
				      document.getElementById("seonggu").innerHTML = width3  + '/' + "82";
				    }
			  }
		  function frame4() {
			    
			    if (width4 >= 68) {
				      clearInterval(id4);
				    } else {
				      width4++; 
				      elem4.style.width = width4 + '%'; 
				      document.getElementById("sudokwon").innerHTML = width4  + '/' + "68";
				    }
			  }
		  function frame5() {
			    
			    if (width5 >= 74) {
				      clearInterval(id5);
				    } else {
				      width5++; 
				      elem5.style.width = width5 + '%'; 
				      document.getElementById("ahcheon").innerHTML = width5  + '/' + "74";
				    }
			  }
		  function frame6() {
			    
			    if (width6 >= 88) {
				      clearInterval(id6);
				    } else {
				      width6++; 
				      elem6.style.width = width6 + '%'; 
				      document.getElementById("kimpo").innerHTML = width6  + '/' + "88";
				    }
			  }
		  function frame7() {
			    
			    if (width7 >= 80) {
				      clearInterval(id7);
				    } else {
				      width7++; 
				      elem7.style.width = width7 + '%'; 
				      document.getElementById("gwangju").innerHTML = width7  + '/' + "80";
				    }
			  }
		  function frame8() {
			    
			    if (width8 >= 35) {
				      clearInterval(id8);
				    } else {
				      width8++; 
				      elem8.style.width = width8 + '%'; 
				      document.getElementById("road").innerHTML = width8  + '/' + "45";
				    }
			  }
		  function frame9() {
			    
			    if (width9 >=43) {
				      clearInterval(id9);
				    } else {
				      width9++; 
				      elem9.style.width = width9 + '%'; 
				      document.getElementById("daegu").innerHTML = width9  + '/' + "43";
				    }
			  }
		  function frame10() {
			    
			    if (width10 >= 85) {
				      clearInterval(id10);
				    } else {
				      width10++; 
				      elem10.style.width = width10 + '%'; 
				      document.getElementById("poyoung").innerHTML = width10  + '/' + "85";
				    }
			  }
		  function frame11() {
			    
			    if (width11 >= 58) {
				      clearInterval(id11);
				    } else {
				      width11++; 
				      elem11.style.width = width11 + '%'; 
				      document.getElementById("changmil").innerHTML = width11  + '/' + "65";
				    }
			  }
		  function frame12() {
			    
			    if (width12 >= 71) {
				      clearInterval(id12);
				    } else {
				      width12++; 
				      elem12.style.width = width12 + '%'; 
				      document.getElementById("changkim").innerHTML = width12  + '/' + "71";
				    }
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

#label,#label1,#label3,#label4,#label5,
#label6,#label7,#label9,#label10,#label12{
  
  width: 10%;
  height: 15px;
  background-color: #426fc4;
}
#label2,#label8,#label11 {
  
  width: 10%;
  height: 15px;
  background-color: #fb0000;
}


#unyoung, #ulpo, #umjae, #seonggu, 
#sudokwon, #ahcheon, #kimpo, #gwangju, 
#road, #daegu, #poyoung, #changmil, #changkim {
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
                <td align="center">언양영천건설사업단</td>
                <td align="center">6</td>
                <td id="myProgress"><div id="label"><div id="unyoung"></div></div></td>
            </tr>
            <tr>
                <td align="center">울산포항건설사업단</td>
                <td align="center">1</td>
              <td><div id="label1"><div id="ulpo"></div></div></td>
            </tr>
            <tr>
                <td style="color: red" align="center">음성제천건설사업단</td>
                <td style="color: red" align="center">12</td>
                <td><div id="label2"><div id="umjae"></div></div></td>
            </tr>
            <tr>
                <td align="center">성남구리건설사업단</td>
                <td align="center">11</td>
                <td><div id="label3"><div id="seonggu"></div></div></td>
            </tr>
            <tr>
                <td align="center">수도권건설사업단</td>
                <td align="center">10</td>
                <td><div id="label4"><div id="sudokwon"></div></div></td>
            </tr>
            <tr>
                <td align="center">아산천안건설사업단</td>
                <td align="center">7</td>
                <td><div id="label5"><div id="ahcheon"></div></div></td>
            </tr>
            <tr>
                <td align="center">김포포천건설사업단</td>
                <td align="center">6</td>
                <td><div id="label6"><div id="kimpo"></div></div></td>
            </tr>
            <tr>
                <td align="center">광주순환건설사업단</td>
                <td align="center">4</td>
                <td><div id="label7"><div id="gwangju"></div></div></td>
            </tr>
            <tr>
                <td style="color: red" align="center">도로개량건설사업단</td>
                <td style="color: red"  align="center">13</td>
                <td><div id="label8"><div id="road"></div></div></td>
            </tr>
            <tr>
                <td align="center">대구순환건설사업단</td>
                <td align="center">8</td>
                <td><div id="label9"><div id="daegu"></div></div></td>
            </tr>
            <tr>
                <td align="center">포항영덕건설사업단</td>
                <td align="center">5</td>
                <td><div id="label10"><div id="poyoung"></div></div></td>
            </tr>
            <tr>
                <td style="color: red" align="center">창녕밀양건설사업단</td>
                <td style="color: red" align="center">3</td>
                <td><div id="label11"><div id="changmil"></div></div></td>
            </tr>
            <tr>
                <td align="center">창원김해건설사업단</td>
                <td align="center">4</td>
                <td><div id="label12"><div id="changkim"></div></div></td>
            </tr>
        		</table>
    			</div>
    		</div>
        </td>
    </tr>
</table>
</body>
</html>