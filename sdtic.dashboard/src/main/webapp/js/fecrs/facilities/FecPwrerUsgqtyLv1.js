var mapChart;
var Options = {
		//backgroundColor : '#22272d',
	    tooltip : {
	        trigger: 'axis'
	    },    
	  legend: {
	        data:['금일','전일','전월평균','전년평균'],
	        textStyle : {color :  'rgba(255,255,255,100)'},
	    	right : '6%'
	    },
	    calculable : true,     
	    xAxis : [
	        {				        	
	           //name : '부',
	           color:'rgba(255,255,255,100)', 
	            type : 'category',
	            data : [],
	            axisLabel : {
	                formatter: '{value}',
	               textStyle : {color :  'rgba(255,255,255,100)'}
	            }
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            name : '전력량(KW)',
	            nameTextStyle : {color:'rgba(255,255,255,100)'},
	            axisLabel : {
	                formatter: '{value}',
	                textStyle : {color :  'rgba(255,255,255,100)'}
	            }
	        
	        
	        }
	    ],
	    grid:{x:'8%'},
	    series : [{     
	       
	           itemStyle: {
	                normal: {
	                    color: '#c23531',				                	
	                    label: {
	                        show: false,
	                        position: '',
	                        formatter: '{a}'
	                    }
	                }
	            },
	            name:'금일',
	            type:'bar',
	            barWidth : 13,
	            data:[]
	        },
	        {
	          itemStyle: {
	                normal: {
	                    color: '#2f4554',
	                    label: {
	                        show: false,
	                        position: 'bottom',
	                        formatter: '{a}'
	                    }
	                }
	            },         
	            name:'전일',
	            type:'bar',
	            barWidth : 13,
	            data:[]
	        },
	        /*{
	  itemStyle: {
	                normal: {
	                    color: '#61a0a8',
	                    label: {
	                        show: false,
	                        position: 'bottom',
	                        formatter: '{a}'
	                    }
	                }
	            },
	            name:'월평균',
	            type:'line',
	            yAxisIndex: 0,
	            data:[152.0, 152.2, 163.3, 124.5, 176.3,110.2, 120.3]
	        },*/
	        {
	          itemStyle: {
	                normal: {
	                    color: '#d48265',
	                    label: {
	                        show: false,
	                        position: 'top',
	                        formatter: '{a}'
	                    }
	                }
	            },
	            name:'전월평균',
	            type:'line',
	            yAxisIndex: 0,
	            data:[]
	        },
	        {
	          itemStyle: {
	                normal: {
	                    color: '#91c7ae',
	                    label: {
	                        show: false,
	                        position: 'bottom',
	                        formatter: '{a}'
	                    }
	                }
	            },
	            name:'전년평균',
	            type:'line',
	            yAxisIndex: 0,
	            data:[]
	        }
	    ]
	};
AjaxQuery = function(DeptCode ) {
	
	if (mapChart == null)
		mapChart = echarts.init(document.getElementById("idChart"));
	
	if (DeptCode == ''   ){
		//alert('검색조건을 확인하십시오.');
		return;
	}
		
	var url = "http://" + location.host + "/fec/fecPwrerUsgqtyLv1.do";
	
    $.ajax(
    {
    	type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: {'DeptCode' : DeptCode },
        cache: false,
        success: function(data){
        	var jisaname = [];
        	var day_data = [];
        	var bday_data = [];
        	var bmonth_data = [];
        	var byear_data = [];
        	
        	
        	$.each(data.data, function(index){  
        		jisaname.push(data.data[index].jisaNm);
            	day_data.push(data.data[index].actsv_Val);
            	bday_data.push(data.data[index].pre_Date_Val);
            	bmonth_data.push(data.data[index].pre_Month_Val);
            	byear_data.push(data.data[index].pre_Year_Month_Val);
        	
        	});          	         	   	
        	
    		Options.xAxis[0].data = jisaname;
    		Options.series[0].data = day_data;//금일
    		Options.series[1].data = bday_data;//전일        	
    		Options.series[2].data = bmonth_data;//전월평균
    		Options.series[3].data = byear_data;//전년평균
    	
			mapChart.setOption(Options);
			
        },
        error: function(req)
        {
            //alert("Error : \n\n" + req.responseText);
        }
    });
};