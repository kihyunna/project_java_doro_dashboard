var Option = {
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    legend: {
	        data:['금일장애', '금일조치', '전일장애', '전일조치'],
	    	textStyle : {color :  'rgba(255,255,255,1)'},
	    	right : '8%'
	    },				    
	    calculable : true,
	    grid:{
	    	y : 30
	    },
	    xAxis : [
	        {
	            type : 'value',
            	axisLabel : {
			         /*formatter: '{value}',*/
            		formatter: function(value) {
    	                if (value <0) {
    	                    return -value
    	                } else {
    	                    return value
    	                }
    	            },
		             textStyle : {color :  'rgba(255,255,255,100)'}
			        }
			    
	        }
	    ],
	    yAxis : [
	        {
	            type : 'category',
	            axisTick : {show: false},
	            data : [],
            	axisLabel : {
			         formatter: '{value}',
		             textStyle : {color :  'rgba(255,255,255,100)'}
			        }
	        }
	    ],
	    series : [
	        {
	            name:'금일장애',
	            type:'bar',
	            stack: '1',	
	            itemStyle : { normal: {label : {show: true, position: 'right'}}},
	            data:[]
	        },
	        {
	            name:'금일조치',
	            type:'bar',
	            barWidth : 5,
	            stack: '2',				            			            
	            itemStyle: {normal: {
	                label : {show: true, position: 'inside'}
	            }},
	            data:[]
	        },
	        {
	            name:'전일장애',
	            type:'bar',
	            stack: '1',
	            itemStyle: {normal: {
	                label : {
	                	show: true, position: 'left'
	                	,
	                	formatter: function(data) {
	                		
	    	                if (data.data <0) {
	    	                    return -data.data
	    	                } else {
	    	                    return data.data
	    	                }
	    	            }
	                }
	            }},
	            data:[]
	        },
	        {
	            name:'전일조치',
	            type:'bar',
	            barWidth : 5,
	            stack: '2',	            
	            itemStyle: {normal: {
	                label : {show: true, position: 'inside',
	                	formatter: function(data) {
	                		
	    	                if (data.data <0) {
	    	                    return -data.data
	    	                } else {
	    	                    return data.data
	    	                }
	    	            }}
	            }},
	            data:[]	            
	        }
	    ]
	};	

AjaxQuery = function(val) {
	if (val == ''){
		//alert('검색조건을 확인하십시오.');
		return;
	}
	
	var url = "http://" + location.host + "/fec/fecAreclTroblOccrrncManagtLv1.do";
	
    $.ajax(
    {
    	type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: {'bonbuCode' : val},
        cache: false,
        success: function(data){ 
        	var dept = []; 
        	var trobData = [];
        	var mngData = [];
        	var preTrobData = [];
        	var preMngData = [];
        	
        	$.each(data.data, function(index){  
        		dept.push(data.data[index].MTNOF_NM);
        		trobData.push(data.data[index].TROBL);
        		mngData.push(data.data[index].RECOVER);
        		preTrobData.push(-1*data.data[index].PRE_TROBL);
        		preMngData.push(-1*data.data[index].PRE_RECOVER);
        	}); 
        	
        	Option.yAxis[0].data=dept;
        	Option.series[0].data=trobData;//금일장애
        	Option.series[1].data=mngData;//금일조치
        	Option.series[2].data=preTrobData;//전일장애
        	Option.series[3].data=preMngData;//전일조치		
			
			mapChart.setOption(Option);
        },
        error: function(req)
        {
            //alert("Error : \n\n" + req.responseText);
        }
    });
};