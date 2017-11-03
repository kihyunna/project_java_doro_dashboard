AjaxQuery = function(buseo_code, fac_code, locationPath) {
	if (buseo_code == '' || fac_code == '' ){
		//alert('검색조건을 확인하십시오.');
		return;
	}
		
	var url = "http://" + location.host + "/fec/fecSptEqpOprCstsLv2.do";
	
    $.ajax(
    {
    	type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: {'buseo_code' : buseo_code, 'fac_code' : fac_code },
        cache: false,
        success: function(data){ 
        	$.each(data, function(index){  
//        		sHtml += '<tr>'; 
//        		sHtml += '<td class="center">'+nCnt+'</td>'; 
//        		sHtml += '<td class="center">'+data[index].data1+'</td>';        		 
//        		sHtml += '<td class="right">'+getCommaSuso(data[index].area,0)+'</td>'; 
//        		sHtml += '<td class="right">'+getCommaSuso(data[index].ratio,2)+'</td>'; 
//        		sHtml += '</tr>';
        	
        	});
        	if (buseo_code == 1)
        	{
        		rRefresh();	
        	}else
        	{
        		tRefresh();	
        	}	
        	
        	//setTimeout(function(){$( '.list' ).makisu( 'toggle' )}, 9000);
        	
        }
    });
}

		function rRefresh(){
         	
        	var mapChart = echarts.init(document.getElementById("idChart"));
        
        	var mainData = [];
        	backgroundColor : 'rgba(0,0,0,90)',
        	mainData.push({
        	    name: '터널',
        	    value: 4,
        	    prevalue: 5,
        	    hismax: 5
        	});
        	mainData.push({
        	    name: '전기',
        	    value: 319,
        	    prevalue: 350,
        	    hismax: 350
        	});
        	mainData.push({
        	    name: '오수',
        	    value: 6,
        	    prevalue: 8,
        	    hismax: 8
        	});
        	mainData.push({
        	    name: '사면',
        	    value: 45,
        	    prevalue: 45,
        	    hismax: 45
        	});
        	mainData.push({
        	    name: '염수',
        	    value: 21,
        	    prevalue: 21,
        	    hismax: 21
        	});
        	mainData.push({
        	    name: 'CCTV',
        	    value: 45,
        	    prevalue: 47,
        	    hismax: 47
        	});

        	 function showAttribute(obj) {
        	  try {
        	    var data = '';
        	    
        	    for (var attr in obj) {
        	      if (typeof(obj[attr]) == 'string' || typeof(obj[attr]) == 'number') {
        	        data = data + 'Attr Name : ' + attr + ', Value : ' + obj[attr] + ', Type : ' + typeof(obj[attr]) + '\n';
        	      } else {
        	        data = data + 'Attr Name : ' + attr + ', Type : ' + typeof(obj[attr]) + '\n';
        	      }
        	    }
        	    //alert(data);
        	    
        	  } catch (e) {
        	    //alert(e.message);
        	  }
        	}

        	 

        	function createSeries(mainData) {
        	    var result = [];
        	    var insideLabel = {
        	        normal: {
        	            position: 'center',
        	            formatter: function(params) {
        	                if (params.name == "other")
        	                    return "";
        	                    //showAttribute(params);
        	                return  params.name;
        	            },
        	            textStyle: {
        	                fontStyle: 'normal',
        	                fontWeight: 'normal',
        	                fontSize: 18
        	            }
        	        }
        	    };
        	    var outsideLabel = {
        	        normal: {
        	            show: false
        	        }
        	    };
        	    var itemOthers = {
        	        normal: {
        	            color: '#ccc'
        	        }
        	    };
        	    var colorList = [
        	                          '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
        	                           '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
        	                           '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
        	                        ];

        	    for (var i = 0; i < mainData.length; i++) {
        	        
        	    		var increase = mainData[i].value > mainData[i].prevalue;  
        	    		//mainData[i].value = mainData[i].value+'/'+mainData[i].prevalue;
        	    		//alert(increase);
        	        result.push({
        	            type: 'pie',
        	            center: [i * 15 + 10 + '%', '10%'],
        	            radius: ['10%', '14%'],
        	            clockWise:false,
        	            itemStyle: {
        	                normal: {
        	                    color: colorList[i]
        	                }
        	            },
        	            label:  /*{
        	                        show : true,
        	                        position : 'center',
        	                        formatter : "{a}%",
        	                        textStyle : {
        	                            color : 'red',
        	                            fontSize : '30',
        	                            fontFamily : '微?雅黑',
        	                            fontWeight : 'bold'
        	                        }
        	                    },//*/insideLabel,
        	            data: [{
        	                name: 'other',
        	                value: mainData[i].hismax - mainData[i].value,
        	                itemStyle: itemOthers,
        	                prevalue: mainData[i].prevalue,
        	                hismax: mainData[i].hismax
        	            }, {
        	                name: '\n'+ '\n'+ '\n'+  ((mainData[i].value) * 100 / mainData[i].prevalue).toFixed(2) + '%'+'\n'+mainData[i].value +'/' + mainData[i].prevalue + '\n'+'\n'+'\n'+ '\n'+ mainData[i].name,
        	                value: mainData[i].value,
        	                prevalue: mainData[i].prevalue,
        	                hismax: mainData[i].hismax,
        	                
        	            }],
        	            markPoint: {
        	            data: [{
        	                        symbol: 'triangle',
        	                        symbolSize: 0,
        	                        symbolRotate: increase ? 0 : 180,
        	                        itemStyle: {
        	                            normal: {
        	                                color: increase ? 'red' : 'green'
        	                            }
        	                        },
        	                        name: mainData[i].name,
        	                        
        	                        prevalue: mainData[i].prevalue,
        	                        hismax: mainData[i].hismax,
        	                        value: ((mainData[i].value - mainData[i].prevalue) * 100 / mainData[i].prevalue).toFixed(2) + '%',
        	                        x: mapChart.getWidth() * (i + 1.5) / 5 - 45,
        	                        y: mapChart.getHeight() * 0.45 + 15,
        	                        label: {
        	                            normal: {
        	                                show: true,
        	                                position: 'top',
        	                                formatter: function(params) {
        	                                    return params.value;
        	                                },
        	                                textStyle: {
        	                                    color: increase ? 'red' : 'green'
        	                                }
        	                            }
        	                        },
        	                    }
        	            ]
        	        }
        	        });
        	    }
        	    return result;
        	}
        	Options = {

        	    series: createSeries(mainData)
        	}
			
			mapChart.setOption(Options);
        	
		}
		

		function tRefresh(){
         	
        	var mapChart = echarts.init(document.getElementById("idChart"));
        
        	var mainData = [];
        	backgroundColor : 'rgba(0,0,0,90)',
        	mainData.push({
        	    name: '터널',
        	    value: 22,
        	    prevalue: 24,
        	    hismax: 24
        	});
        	mainData.push({
        	    name: '전기',
        	    value: 469,
        	    prevalue: 476,
        	    hismax: 476
        	});
        	mainData.push({
        	    name: '오수',
        	    value: 5,
        	    prevalue: 5,
        	    hismax: 5
        	});
        	mainData.push({
        	    name: '사면',
        	    value: 55,
        	    prevalue: 59,
        	    hismax: 59
        	});
        	mainData.push({
        	    name: '염수',
        	    value: 10,
        	    prevalue: 12,
        	    hismax: 12
        	});
        	mainData.push({
        	    name: 'CCTV',
        	    value: 76,
        	    prevalue: 78,
        	    hismax: 78
        	});

        	 function showAttribute(obj) {
        	  try {
        	    var data = '';
        	    
        	    for (var attr in obj) {
        	      if (typeof(obj[attr]) == 'string' || typeof(obj[attr]) == 'number') {
        	        data = data + 'Attr Name : ' + attr + ', Value : ' + obj[attr] + ', Type : ' + typeof(obj[attr]) + '\n';
        	      } else {
        	        data = data + 'Attr Name : ' + attr + ', Type : ' + typeof(obj[attr]) + '\n';
        	      }
        	    }
        	    //alert(data);
        	    
        	  } catch (e) {
        	    //alert(e.message);
        	  }
        	}

        	 

        	function createSeries(mainData) {
        	    var result = [];
        	    var insideLabel = {
        	        normal: {
        	            position: 'center',
        	            formatter: function(params) {
        	                if (params.name == "other")
        	                    return "";
        	                    //showAttribute(params);
        	                return  params.name;
        	            },
        	            textStyle: {
        	                fontStyle: 'normal',
        	                fontWeight: 'normal',
        	                fontSize: 18
        	            }
        	        }
        	    };
        	    var outsideLabel = {
        	        normal: {
        	            show: false
        	        }
        	    };
        	    var itemOthers = {
        	        normal: {
        	            color: '#ccc'
        	        }
        	    };
        	    var colorList = [
        	                          '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
        	                           '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
        	                           '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
        	                        ];

        	    for (var i = 0; i < mainData.length; i++) {
        	        
        	    		var increase = mainData[i].value > mainData[i].prevalue;  
        	    		//mainData[i].value = mainData[i].value+'/'+mainData[i].prevalue;
        	    		//alert(increase);
        	        result.push({
        	            type: 'pie',
        	            center: [i * 15 + 10 + '%', '10%'],
        	            radius: ['10%', '14%'],
        	            clockWise:false,
        	            itemStyle: {
        	                normal: {
        	                    color: colorList[i]
        	                }
        	            },
        	            label:  /*{
        	                        show : true,
        	                        position : 'center',
        	                        formatter : "{a}%",
        	                        textStyle : {
        	                            color : 'red',
        	                            fontSize : '30',
        	                            fontFamily : '微?雅黑',
        	                            fontWeight : 'bold'
        	                        }
        	                    },//*/insideLabel,
        	            data: [{
        	                name: 'other',
        	                value: mainData[i].hismax - mainData[i].value,
        	                itemStyle: itemOthers,
        	                prevalue: mainData[i].prevalue,
        	                hismax: mainData[i].hismax
        	            }, {
        	                name: '\n'+ '\n'+ '\n'+  ((mainData[i].value) * 100 / mainData[i].prevalue).toFixed(2) + '%'+'\n'+mainData[i].value +'/' + mainData[i].prevalue + '\n'+'\n'+'\n'+ '\n'+ mainData[i].name,
        	                value: mainData[i].value,
        	                prevalue: mainData[i].prevalue,
        	                hismax: mainData[i].hismax,
        	                
        	            }],
        	            markPoint: {
        	            data: [{
        	                        symbol: 'triangle',
        	                        symbolSize: 0,
        	                        symbolRotate: increase ? 0 : 180,
        	                        itemStyle: {
        	                            normal: {
        	                                color: increase ? 'red' : 'green'
        	                            }
        	                        },
        	                        name: mainData[i].name,
        	                        
        	                        prevalue: mainData[i].prevalue,
        	                        hismax: mainData[i].hismax,
        	                        value: ((mainData[i].value - mainData[i].prevalue) * 100 / mainData[i].prevalue).toFixed(2) + '%',
        	                        x: mapChart.getWidth() * (i + 1.5) / 5 - 45,
        	                        y: mapChart.getHeight() * 0.45 + 15,
        	                        label: {
        	                            normal: {
        	                                show: true,
        	                                position: 'top',
        	                                formatter: function(params) {
        	                                    return params.value;
        	                                },
        	                                textStyle: {
        	                                    color: increase ? 'red' : 'green'
        	                                }
        	                            }
        	                        },
        	                    }
        	            ]
        	        }
        	        });
        	    }
        	    return result;
        	}
        	Options = {

        	    series: createSeries(mainData)
        	}
			
			mapChart.setOption(Options);
        	
		}
		
		
