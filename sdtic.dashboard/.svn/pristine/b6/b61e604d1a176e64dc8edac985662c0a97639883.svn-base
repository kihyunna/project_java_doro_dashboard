AjaxQuery = function(buseo_code, fac_code, locationPath) {
	if (buseo_code == '' || fac_code == '' ){
		//alert('검색조건을 확인하십시오.');
		return;
	}
		
	var url = "http://" + location.host + "/fec/fecPwrerUsgqtyMain.do";
	
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
         	
        	var mapChart = echarts.init(document.getElementById("idChart"));
        
			var Options = {
					//backgroundColor : '#22272d',
				    tooltip : {
				        trigger: 'axis'
				    },    
				  legend: {
				        data:['금일','전일','월평균','전월평균','전년평균'],
				        textStyle : {color :  'rgba(255,255,255,100)'}
				    },
				    calculable : true,     
				    xAxis : [
				        {				        	
				           //name : '부',
				           color:'rgba(255,255,255,100)', 
				            type : 'category',
				            data : ['원주','대관령','홍천','충주','춘천','강릉','제천'],
				            axisLabel : {
				                formatter: '{value}',
				               textStyle : {color :  'rgba(255,255,255,100)'}
				            }
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            //name : '전력량',
				            axisLabel : {
				                formatter: '{value} kw',
				                textStyle : {color :  'rgba(255,255,255,100)'}
				            }
				        }
				    ],
				    series : [{     
				       
				           itemStyle: {
				                normal: {
				                    color: 'rgb(202,84,85)',				                	
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
				            data:[100, 150, 162.2, 123.2, 125.6, 176.7, 135.6]
				        },
				        {
				          itemStyle: {
				                normal: {
				                    color: '#27727B',
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
				            data:[142.6, 145.9, 129.0, 126.4, 128.7, 170.7, 175.6]
				        },
				        {
				  itemStyle: {
				                normal: {
				                    color: '#99FF00',
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
				        },
				        {
				          itemStyle: {
				                normal: {
				                    color: 'blue',
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
				            data:[142.0, 162.2, 153.3, 134.5, 136.3,170.2, 140.3]
				        },
				        {
				          itemStyle: {
				                normal: {
				                    color: 'green',
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
				            data:[142.0, 155.2, 173.3, 144.5, 146.3,130.2, 160.3]
				        }
				    ]
				};
			
			setInterval(chartRefresh, 10000);

			function chartRefresh(){
			    var mapChart = echarts.init(document.getElementById("idChart"));

			    var Options = {
			        //backgroundColor : '#22272d',
			        tooltip : {
			            trigger: 'axis'
			        },
			        legend: {
			            data:['금일','전일','월평균','전월평균','전년평균'],
			            textStyle : {color :  'rgba(255,255,255,100)'}
			        },
			        calculable : true,
			        xAxis : [
			            {
			                name : '부',
			                type : 'category',
			                data : ['구미','대구','군위','상주','영천','고령','영주','성주'],
			                axisLabel : {
			                    formatter: '{value}',
			                    textStyle : {color :  'rgba(255,255,255,100)'}
			                }
			            }
			        ],
			        yAxis : [
			            {
			                type : 'value',
			                name : '전력량',
			                axisLabel : {
			                    formatter: '{value} kw',
			                    textStyle : {color :  'rgba(255,255,255,100)'}
			                }
			            }
			        ],
			        series : [{

			            itemStyle: {
			                normal: {
			                    color: 'rgb(202,84,85)',
			                    label: {
			                        show: false,
			                        position: '',
			                        formatter: '{a}'
			                    }
			                }
			            },
			            name:'금일',
			            type:'bar',
			            data:[120, 155, 150.2, 110.2, 140.6, 160.7, 150.6, 145]
			        },
			            {
			                itemStyle: {
			                    normal: {
			                        color: '#27727B',
			                        label: {
			                            show: false,
			                            position: 'bottom',
			                            formatter: '{a}'
			                        }
			                    }
			                },
			                name:'전일',
			                type:'bar',
			                data:[130.6, 120.9, 135.0, 110.4, 138.7, 162.7, 160.6, 140]
			            },
			            {
			                itemStyle: {
			                    normal: {
			                        color: '#99FF00',
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
			                data:[125.0, 145.2, 145.3, 120.5, 150.3, 130.2, 140.3, 150]
			            },
			            {
			                itemStyle: {
			                    normal: {
			                        color: 'blue',
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
			                data:[160.0, 152.2, 163.3, 144.5, 133.3,165.2, 148.3, 155]
			            },
			            {
			                itemStyle: {
			                    normal: {
			                        color: 'green',
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
			                data:[140.0, 145.2, 153.3, 164.5, 156.3,140.2, 155.3, 143]
			            }
			        ]
			    };

			    mapChart.setOption(Options);
			}
			
			setInterval(chart02Refresh, 20000);

			function chart02Refresh(){
			    var mapChart = echarts.init(document.getElementById("idChart"));

			    var Options = {
						//backgroundColor : '#22272d',
					    tooltip : {
					        trigger: 'axis'
					    },    
					  legend: {
					        data:['금일','전일','월평균','전월평균','전년평균'],
					        textStyle : {color :  'rgba(255,255,255,100)'}
					    },
					    calculable : true,     
					    xAxis : [
					        {				        	
					           //name : '부',
					           color:'rgba(255,255,255,100)', 
					            type : 'category',
					            data : ['원주','대관령','홍천','충주','춘천','강릉','제천'],
					            axisLabel : {
					                formatter: '{value}',
					               textStyle : {color :  'rgba(255,255,255,100)'}
					            }
					        }
					    ],
					    yAxis : [
					        {
					            type : 'value',
					            //name : '전력량',
					            axisLabel : {
					                formatter: '{value} kw',
					                textStyle : {color :  'rgba(255,255,255,100)'}
					            }
					        }
					    ],
					    series : [{     
					       
					           itemStyle: {
					                normal: {
					                    color: 'rgb(202,84,85)',				                	
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
					            data:[100, 150, 162.2, 123.2, 125.6, 176.7, 135.6]
					        },
					        {
					          itemStyle: {
					                normal: {
					                    color: '#27727B',
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
					            data:[142.6, 145.9, 129.0, 126.4, 128.7, 170.7, 175.6]
					        },
					        {
					  itemStyle: {
					                normal: {
					                    color: '#99FF00',
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
					        },
					        {
					          itemStyle: {
					                normal: {
					                    color: 'blue',
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
					            data:[142.0, 162.2, 153.3, 134.5, 136.3,170.2, 140.3]
					        },
					        {
					          itemStyle: {
					                normal: {
					                    color: 'green',
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
					            data:[142.0, 155.2, 173.3, 144.5, 146.3,130.2, 160.3]
					        }
			        ]
			    };

			    mapChart.setOption(Options);
			}
    		
			mapChart.setOption(Options);
        },
        error: function(req)
        {
            //alert("Error : \n\n" + req.responseText);
        }
    });
};