<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>시설물 고장 수리 완료율</title>
<!-- including ECharts file -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>
<body style="background-color:#ffffffff">
    <!-- prepare a DOM container with width and height -->
    <div id="main" style="width:100%; height:500px"></div>
	<div id = "idDiv" style="top:30px; width:100%;height: 30px;z-index:102;position: absolute;">
	    <div id = "select1lv" style="float:right;"></div>
	</div>
		<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('main'), 'dark');
		
		var spirit = 'image://data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAgAAAAIACAMAAADDpiTIAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAC8VBMVEUAAAAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAbfAAAABixdPgAAAA+XRSTlMAAhEkNklTRjgpGgwTQllsfpGjtcja7f387+DSw7Sml4ltPQ5EeKvf/t2tfU0cEEN2quy8jFwsBGqo3PfKgS312YUxiuGOOgH25ZM/awuLHjm7riqhIfqS6mDEL5DnUZzb+3wDIO5FcqIIy+hMWml5gnBfUPjyKxJi+RWxZvQmhNNz8xupBkd0DfGIFxR7BR/JY+sPr7pVzKBWmpkHI+nOaKydvdEJz3q/SgqfSNjQZZTU4ygiM1J/ldawwRbmcdW2vteDm4d1llcYGUAut1ilTsa4b15bjTfAJc00YbkdMo9n3oaYXW6kOzXkPLN3p0/iwvAwS57Fx7K77c/jAAAAAWJLR0QAiAUdSAAAAAlwSFlzAAAN1wAADdcBQiibeAAAAAd0SU1FB+EJCAIPNQvHJJsAABFhSURBVHja7d1rYBTVGcZxE0BESAWEXAwgEYSgCAJiwGjACwREEAXDRYTEFDTeKHIzCIggQkTQGgoqFykX0SAgYpUoSkSLpSoiKt5RUWutrbVVa+dbTUEkye7snNlz5jmT9/l97s7uec+/uNmdnTnmGKLAJCTWqVvv2PrHNTi+IfqlUGAaJf3qhMZNmp7YrHlyinNEatpJ6S1atjq5dcYpbdCvkExJbHtqu/ZOLJkdTju94xno10p6dep8ZpcOMff+KF27ndX97Cz0yyYtevQ8J1Nl84/IPve8HPSLp/gl9fK1/Yf0Pv8C9OuneMVVgON0uLAuegUUnzgLcJyL+vTNRS+C4pDUL84CHKf/xQPYQHhpKMBxml8yEL0O8ktLAU7aoEvRCyGf9BTgpHYZjF4J+aOpAMe5jH8UhJO2ApzLh6DXQn7oKyBl6BXoxZAPnbUV4OQNS0SvhtRpLMAZPoKfC4SPzgKckVeil0PKtBaQOoqnj4SO1gKcq0aj10Oq9BbgjOHHw2GjuYB8fi4UNpoLKLi6EL0iUqO5AGfkr9ErIjW6Cxg7Dr0iUqO7gNRr0CsiNW01F+BcW4ReEinRXsB1/DVJuGgv4Pq+6CWREu0FZN+AXhIp0V5AwY3oJZES7QWk3IReEinRXoAzHr0kUqK/gNboJZES/QUMQy+JlOgv4DfoJZES/QVMQC+JlIzTXUDmzeglkZJx2ZoLSJ2IXhIp0V7ApCT0kkiJ9gImT0EviZRoL+CcqeglkRLtBXTjiYLhor2AJugVkRrtBdyCXhGp0V1AMU8QCRndBVw1Db0iUqO7gFvRCyJF9TUXMB29IFKkuYAZM9ELIkWaC7iOl5wPG80F3IZeD6nSW0Aq/xYMHb0FzOJ/BEJHbwG3o5dDyrQWMHsOejmkTGsBd6BXQ+q0FsCrR4SQzgJ6z0WvhtTdqbGAeejFkA8aC+g6H70Y8kFjAY3RayE/9BVQwlNEQ0lfAXehl0K+aCug1wL0UsgXbQXwHOGQ0lVA9t3olZA/ugpYiF4I+aSpgP6L0Ashn+5M0VIALyEXVvfo+W/Aveh1kE+/1ROAcxx6IeRPT00B9EQvhHzJvU9TAMWl6KWQHxdo2n/H6Y5eCvlxprYAFqOXQn78TlsA/XiLwRAq0nhm0BL0YkhdZ337z78DwugujQFM5o2lwmepxgCcjujVkKpGer4IOOx+9HJI1QM6998Zy68Ew+ZBrQE49dHrIUXt9QawDL0e+y236gzqFXr331mZgF6R9eo+ZFMBqzQH4AxAr8h6PRybCvi97gAGoVdkvdWORQUkjNUdwBr0kqy31rGogLq699/pil6S7dYVVI7pYUsKWK89AIcXjHF33KExWVLAI/oDeBS9JstdcnhODzdCv5KflBXrD4A3F3a34edB2VDAY/r3n5eMiiH9yKQsKOAsAwFsRC/KbmWpv4xqE7yAtQYCSClDr8pqg4+eFbqABZkGAnDqomdstYwqswIXcKOJ/Xc2o2dstaFVh4UtYIO/HY7hcfSMrbal2rTWIq+r8ISRAEaiZ2yz3ILq4wIWsNXI/juTc9FTtlhpzXnhCjjBTADOk+gpW+yKCPOCFXCroQDaoqdssT9EGhiogKwSQwE8hZ6yxdpGnFg6pIC+hvbfuRk9ZYs9EHlkkAKeNhVABnrKFot2Cl464C68LUwFsB49ZYtFPQEj+ALmF6hsqgpeNzi66F+/zQq6gI6m9t/Zhp6yxVZHH1vQBTQxFsC16ClbbLHL3AIuoNxYAM+gp2yxZ90GF2gBc4ztP88MdzHLdXJBFnCzuQCuQ0/ZYv3dR7dle2CvpKm5AHhSWHSxLsgUXAFXmQvgOfSULTYp1vCCKiDH3P47s9FTttjwmNMLqIDnDQaQyZ+IR5Ufe3w7AimgwmAAqTwjJCovl+QKooC5MwwGMBw9ZYu94GWAO8zfgm2Awf13dqKnbLHFniZovoAXTQbQAj1liw31NkLjBTQzGQAvGh7dMI8zLDdbQKdUj6/Dl5fQU7aY5396zRYw2uT+O39ET9liuzxP0WgBLxsNYB56yhab7n2MJgtobjSAEegpW+xPCnMs323qVWi6UWA0N6CnbLF6KoPcaaoAXTcKjIL3D4xO7Vx8UwX0NBtAHfSULTZFbZRmCtB2o8AoOqGnbLEixT/AjRSg70aBERXwuyAXWxSnaaIAfTcKjGglesZWUz4Ta+Oftb8GfTcKjIhfBbi5RnmeuguY+4rGGwVG0gc9Y6slqQ9UYwG5r17zWi+z2+84e9AzttpUHxPVVMAZI16/3vTmV1qBnrHdToIU0GbvxTuD2PyfJKMnbLln/Ay1dzwFLDrlvDeM/RK4pn3oCVvO32UZeh/v8+mmvNlydnCbX+lF9IQtt9ffWP0UcPxb1z4X7OZX4t1j3V3qc66KBTS8YdSO4De/krHvMGuLZJ+Dbe65gKy+jVvkYXbfcZ5Az9d63fyO1lsBWzNuLUFtfqXT0PO1nv+bNMQsYMHbG8xc/lfBqej5Wm+J/+E2d7kj18B6+9P9H1mfzuj5Wq9hHB/FRymg8J2r3y1G7/whmaXo+drP10dBh+XXLOC9Hpenobf9F9dnocdrv+7xDLhqAdP2jLkIveXVvNYQPV/rlRZrKWBd/UEPG7nnT5zeB1z0NGRaxjXgygISPhi/JubFRlAQl70Nlw/jG3D+Je38fpjEAqwwNcDv5liAjT5C7xALwNqM3iAWgDXN6M/zrcACXK1B7w8LwOqB3p4ABH4DhDDZnYLeHhaA9S56d1gAVhzfCYcIC4iq0LbvcFhAwOah94YFYHUyebFei7CAaB5Hbw0LwHrPxu/yWUCATN283TosILIrpfwTwAKi6IneGBaANbP2fyfIAlyNQe8LC8A6YO15nSwgGKPQ28ICsKalobeFBWCtQu8KC8BKuBe9KywA62M5fwqygIi83kasdmABNbQBXMeLBdhkD3pPWABYO/SesACsqf3Re8ICsNqK+V6YBUT2CXpLWADWciuu78YCcHIEfS3IAiL5FL0jLADM7O28LcQCqsp6BL0jLACr0UH0jrAArJyA7+yCxwKqmijs8yAWUJ2QHwyzgKg+Q28ICwD7HL0hLAAroSd6Q1gA1qIK9IawAKyykegNYQFYbZ5FbwgLwFoX3+0kwogFVJH1OnpDWABWgrivBllANeejN4QFgM3j9wLCdSxB7wgLwNq6Eb0jLACrVNyfgyygqoTbpL0RYAHVHCvtJCEWUM2KN9BbwgKwChfmofeEBWB9XI7eExaAVTRK1ntBFlBD53PQm8ICsJYv7IXelSBtYQE1HOiC3hUWAJa0A70tLAAr6/mu6H1hAVgNxyejN4YFYM2/eix6Z1gAVpvGaeitYQFYpbcL+Vhgy3b0qG2V8GiFiA8HWUB0K/anobeHBWCVfdGy9n9RyAJcJd6yrwC9RSwA6+7plxXHO+RJ+/4y80v0TrMA38rqX/iQ//eEF53cseyngxSygFBrtGTZzhTV0aamj9k85ecjsIDQG/jXjA1rPb4nSDnYbteAgVUezgJqhaKv3l6/bN/OqKcPZP7thWXz9jZYHuGhLKA2mfZx26c+fLPxWQ+2er3p0A2rX1rW5PRVxw4Ysr3Q5TEsQDoWIB0LkI4FSMcCpGMB0rEA6ViAdCxAOhYgHQuQjgVIxwKkYwHSsQDpWIB0LEA6FiAdC5COBUjHAqRjAdKxAOlYgHQsQDoWIB0LkI4FSMcCpGMB0rEA6ViAdCxAOhYgHQuQjgVIxwKkYwHSsQDpWIB09hawgwUEggVIxwKkYwHSsQDpWIB0LEA6FiAdC5COBUjHAqRjAdKxAOlYgHQsQDoWIB0LkI4FSMcCpGMB0rEA6ViAdCxAOhYgHQuQjgVIxwKkYwHSsQDpWIB0FhewAD0bGViAdCxAOhYgHQuQjgVIxwKkYwHSsQDpWIB0LEA6FiAdC5COBUjHAqRjAdKxAOlYgHQsQDoWIB0LkI4FSMcCpGMB0rEA6ViAdCxAOhYgnb0FlLOAQLAA6ViAdCxAOhYgHQuQjgVIxwKkYwHSsQDpWIB0LEA6FiAdC5COBUjHAqRjAdKxAOlYgHQsQDoWIB0LkI4FSMcCpGMB0rEA6ViAdCxAOhYgHQuQjgVIxwKkYwHSsQDpWIB0LEA6FiAdC5COBUjHAqRjAdKxAOlYgHQsQDoWIB0LkI4FSMcCpGMB0rEA6SwuYDd6NjKwAOlYgHQsQDoWIB0LkI4FSMcCpGMB0tlbwE4WEAgWIB0LkI4FSMcCpGMB0rEA6ViAdCxAOhYgHQuQjgVIxwKkYwHSsQDpWIB0LEA6FiAdC5COBUjHAqRjAdKxAOlYgHQsQDoWIB0LkI4FSMcCpLO4gO3o2chgbwHvz0fPRgZ7C1gzFz0bGewtoEsCejYy2FvA4+jRCGFvAd3RoxHC2gIm10GPRghrC1jKN4LBsLaA/ejJSGFrAZlfoycjha0FbCpET0YKWwvogR6MGJYWkNwIPRgxLC3gc/Rc5LCzgIJL0XORw84CmqDHIoiVBfS6Gz0WQaws4Dz0VCSxsYDkdeipSGJjAUvQQxHFwgJOQ89EFvsKyOb5gYGyr4Av0CMRxroC/o6eiDS2FTCZ3wkGzLYCvkIPRByzBSQfnKH2gHnoechjqIDMN84cfE/lmX7zZ47b38Hzw/gmIHgmCji4quqPPnM+m+3tgWnoaUikvYCuE2qe5LtgW56nx/K0EADNBawujfgsdZp5efAU9DBE0llA6pvRnqWoqYeHt0XPQiZ9BaTVd3maf2TGfDw/C8TQVUDeANenWR/zALvQk5BKUwHTYzxNq1gH6IMehFhaCrg41rMUnRvjCN+g5yCXhgLax/6NZ4NU90O8ix6DYPEX4OV3/mPcD7ERPQXJ4i1gU66HJ5nTz/UYJeghiBZnAf/09CSfuB4jDz0D2eIqoMTbVR7ecT3IWPQIhIungFbeniK3v9tBvkVPQLo4CnjA41O87HaQHegBiOe/gE4en2Gi20HuRa+f/BYww+sTfOB2lAr08slvAflejz/H7SjD0KsnvwX8y+vhs1JcjpKBXjwd47OAyz0ffqzLUR5Dr50q+SngEa8HT3D7OuBJ9NLp/3wU4PlT/N0uB+nHX4ZYQr2Af3s99HcuB1mDXjf9TL2AgR6P/L3LMRqjl01HKBfwvccDD3I5xgCPx6AAqBbwksfj5kc/xKQi9KLpKIoFrPR265cpLofw/JcEBUKxAG//fj/tcgReMNgyagV4egvfKTn6AQqmoRdM1agVUM/DEVu7PP4j9HKpBqUC0mO/CziQ7fL4EejVUk1KBZwa62gJFS6PnlHq5QVRwFQKSIn1WYDbfwCcUeilUkQqBZQ0cD3U226PzTuAXilFplJAe7cCRru9AXDuR6+TolH6NyD6nwILXX8dnjkEvUyKSul9wK7IfwvM/8b9cXegF0kulP4WWBvhtJ5FGcPdH9SL7wCspvaJULdXqp7Y0fCtDrEeshC9QnKn+L3AfT/sTTz0wIQDm0+cFPN/n78cvUCKQf0MkX4H/1OxtH+qp//to+jlUUwmryr7A3px5IG5AsrL0GsjL0wVkJ2DXhl5Y6iAm9DrIq+MFDAUvSryzkABFVnoRZEC7QX8yDeA4aK5gHJeID5sCu/XuP/5/AogfHJbx7/xhy3djl4M+TEh9nXfPfmoIXol5M+eYh37/+Ui9DrIr6+/jXv7C8Z7ubQsWSpxcZz7334wegkUnx7Z8ex/F/4IIPRyfvS9/ffxR0C1Qe6Ilb62P3VbIvqlkx6lTbyd8FPFyO/QL5v02brB2y1Bj2g2kW/+a5cz+ni8MXCl115Bv1zSb+quTd7e+m27Ev1SyZAh5x+Msfuzv6zHL/5rtQsmPBPt8i/FIz+7k1/7C5D76qf7/7uz+Kitz3zihWW3J61DvzAKUsKBswePG919Sb1TvqvD/9+Tmv8BSp6Nt+C28LwAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTctMDktMDhUMDI6MTU6NTMrMDI6MDAmCh6gAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE3LTA5LTA4VDAyOjE1OjUzKzAyOjAwV1emHAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAAASUVORK5CYII=';
		var spanner ='image://data:image/png;base64,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';
		 
		var kor_dptnm = new Array();
		var acpt = new Array();
		var rcvr = new Array();
		var c_percent = new Array();
		var bonbucd = '';
		var deptcd = '';
	    var instClsfcCd = '';

	$(window).resize(function(){
	
	    setDivHeight('main');
	
	});
	
	var timerValue = 0;
    $(window).load(function(){

        timerValue = "${param.widgetTimer}";
        eptcd = "${param.dptCd}";
        instClsfcCd = "${param.instClsfcCd}";
        
        if(timerValue == 0){
            timerValue = 60000*60;
        }
        
        if(deptcd == null || deptcd == ''){
            deptcd = '';
        }
        
        if(instClsfcCd == null || instClsfcCd == ''){
            instClsfcCd = '';
        }
        
        window.setInterval("getBucMntmngProfitToPlanViewAjax()",timerValue);
        
    });
	
	function setDivHeight(objSet)
	{
	
	    var objSet   = document.getElementById(objSet);
	    objSet.style.width  = ($(window).width()) + "px";
	    objSet.style.height  = ($(window).height()) + "px";
	    	
	    $('#main').width(($(window).width()) + "px");
	    $('#main').height(($(window).height()) + "px");
	
	
	    myChart.resize({
	        width: $(window).width(),
	        height : $(window).height()
	        
	    });
	    myChart.setOption(option);
		
	}
	 function getBucMntmngProfitToPlanViewAjax(){
		 myChart.clear();
		 kor_dptnm = [];
		 rcvr = [];
  		 acpt= [];
  		 c_percent = [];
  		 
  		 
  		
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
	                      bonbucd = jasa_dptcd;
	                  }                   
	           });
	         
	          
	      }
		  
	      if(bonbucd == ''){
	    	  bonbucd  = $("#upperhdqrtrs").val();
	      }
	      
	      $.ajax({
			    	url : "${pageContext.request.contextPath}/buc/bucMntmngProfitToPlanbonbuAjax.do",
	             async : true,
	             dataType : 'json',
	             data: {
	             	'use_cd' : bonbucd
	            	},
	             success :function(json) {

	            	var max_bonbu_cnt = 8;
	            	
	             	if(json.data.length > 0 ){
	                     for(var i = 0; i < json.data.length; i++) {
	                    	 rcvr[i] = json.data[i].rcvr;
	 	            		acpt[i] = json.data[i].acpt;
	 	            		kor_dptnm[i] = json.data[i].kor_dptnm;
	 	            		c_percent[i] = json.data[i].c_percent;
	                     }
	    
	             	}
	             	option = {
	        			    xAxis: {
	        			        //max: maxData,
	        			        splitLine: {show: false},
	        			        offset: 10,
	        			        axisLine: {
	        			            lineStyle: {
	        			                color: '#999'
	        			            }
	        			        },
	        			        axisLabel: {
	        			            margin: 10
	        			        }
	        			    },
	        			    yAxis: {
	        			        data: kor_dptnm,
	        			        inverse: true,
	        			        axisTick: {show: false},
	        			        axisLine: {show: false},
	        			        axisLabel: {
	        			            margin: 10,
	        			            textStyle: {
	        			                color: '#999',
	        			                fontSize: 15
	        			            }
	        			        }
	        			    },
	        			    grid: {
	        			        top: 'center',
	        			        height: 350,
	        			        left: 120,
	        			        right: 100,
	        			        //bottom: 30
	        			    },
	        			    series: [{
	        			        // current data
	        			        type: 'pictorialBar',
	        			        symbol: spirit,
	        			        symbolRepeat: 'true',
	        			        symbolMargin: '5%',
	        			        symbolClip: false,
	        			        symbolSize: 30,
	        			       // symbolBoundingData: maxData,
	        			        data: rcvr,
	        			        z: 10
	        			    }, {
	        			        // full data
	        			        type: 'pictorialBar',
	        			        itemStyle: {
	        			            normal: {
	        			                opacity: 0.2
	        			            }
	        			        },
	        			        label: {
	        			            normal: {
	        			                show: true,
	        			                formatter:function(value) {
	        			                	var texts = c_percent[value.dataIndex];
	        			                	return texts + '%';
	        			                   
	        			                },
	        			                position: 'right',
	        			                offset:[0,2],
	        			                textStyle: {
	        			                    color: 'white',
	        			                    fontSize: 16
	        			                }
	        			            }
	        			        },
	        			        animationDuration: 0,
	        			        symbolRepeat: 'true',
	        			        symbolMargin: '5%',
	        			        symbol: spanner,
	        			        symbolSize: 30,
	        			        //symbolBoundingData: maxData,
	        			        data: acpt,
	        			        z: 5
	        			    }]
	        			};
	        		 myChart.setOption(option);
	             },error : function(){
	                 
	                 console.log(arguments);
	             },complete : function() {
	                  myChart.setOption(option);
	             }
	             
	         });
			 
		 }
	 
	

	
	jQuery(document).ready(function($){
	    searchUpperhdqrtrs();
	    getBucMntmngProfitToPlanViewAjax();
	    	    
	    function searchUpperhdqrtrs(){
	        $.ajax({
	            type: 'POST',
	            url: "/buc/selectMainInstt1lv.do",
	            dataType: "json",
	            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	            success: function(data, responseText, statusText, textStatus){
	                $("#select1lv").html("");
	                var contentStr  = "";
	                contentStr += "<select id='upperhdqrtrs' onchange ='callAjaxfunction()'style='border: 1px solid rgba(74, 74, 74, 0.2);width:150px;height: 30px;z-index:102;background-color:rgba(50,50,50,0.7);color:#eee;font-size:20px;'>";
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
	
	});
	 function callAjaxfunction(){
			bonbucd =  $("#upperhdqrtrs").val();
			getBucMntmngProfitToPlanViewAjax();
		}
	 
	 

</script>

</body>
</html>
