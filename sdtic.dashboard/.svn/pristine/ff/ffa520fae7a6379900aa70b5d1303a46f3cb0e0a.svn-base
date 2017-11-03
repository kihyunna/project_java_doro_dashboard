AjaxQuery = function(buseo_code, fac_code, locationPath) {
	if (buseo_code == '' || fac_code == '' ){
		//alert('검색조건을 확인하십시오.');
		return;
	}
		
	var url = "http://" + location.host + "/fec/fecAreclTroblOccrrncManagtMain.do";
	
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
					//backgroundColor : 'rgba(22,25,29,90)',
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				      data:['장애', '조치'],
				      textStyle : {color :  'rgba(255,255,255,100)'}
				    },
				    calculable : true,
				    xAxis : [
				      {
						 type : 'value',
							  axisLabel : {
						         formatter: '{value}',
					             textStyle : {color :  'rgba(255,255,255,100)'}
						        }
						    }
				    ],
				    yAxis : [
				       {
							type : 'category',
							  data : ['제천','강릉','춘천','충주','홍천','대관령','원주'],
								 axisLabel : {
								    formatter: '{value}',
								   textStyle : {color :  'rgba(255,255,255,100)'}
							   }
						  }
				    ],
				    series : [{
				       itemStyle: {
							normal: {
								color: 'rgb(202,84,85)',
									label: {
											show: true,
											position: 'inside',
											textStyle : {color : 'rgb(199,173,182)', fontSize : '1px'}
									}
								}
							},
				            name:'장애',
				            type:'bar',
				            barWidth : 8,
				            data:[10, 11, 11, 9, 17, 3, 32]
				        },
				        {
				       itemStyle: {
							normal: {
								color: 'rgb(75,95,114)',
									label: {
											show: true,
											position: 'inside',
											textStyle : {color : 'rgb(183,188,186)', fontSize : '1px'}
									}
								}
							},
				            name:'조치',
				            type:'bar',
				            barWidth : 8,
				            data:[9, 10, 9, 9, 14, 2 ,28]
				        }
				    ]
				};
				                    
			
			setInterval(chartRefresh, 10000);

			function chartRefresh(){
			    var mapChart = echarts.init(document.getElementById("idChart"));

				var Options = {
						//backgroundColor : 'rgba(22,25,29,90)',
					    tooltip : {
					        trigger: 'axis'
					    },
					    legend: {
					      data:['장애', '조치'],
					      textStyle : {color :  'rgba(255,255,255,100)'}
					    },
					    calculable : true,
					    xAxis : [
					      {
							 type : 'value',
								  axisLabel : {
							         formatter: '{value}',
						             textStyle : {color :  'rgba(255,255,255,100)'}
							        }
							    }
					    ],
					    yAxis : [
					       {
								type : 'category',
								  data : ['성주','영주','고령','영천','상주','군위','대구','구미'],
									 axisLabel : {
									    formatter: '{value}',
									   textStyle : {color :  'rgba(255,255,255,100)'}
								   }
							  }
					    ],
					    series : [{
					       itemStyle: {
								normal: {
									color: 'rgb(202,84,85)',
										label: {
												show: true,
												position: 'inside',
										}
									}
								},
					            name:'장애',
					            type:'bar',
					            barWidth : 8,
					            data:[8, 15, 4, 11, 5, 9, 10, 7]
					        },
					        {
					       itemStyle: {
								normal: {
									color: 'rgb(75,95,114)',
										label: {
												show: true,
												position: 'inside',
										}
									}
								},
					            name:'조치',
					            type:'bar',
					            barWidth : 8,
					            data:[7, 12, 3, 10, 4, 7, 7, 6]
					        }
					    ]
					};

			    mapChart.setOption(Options);
			   
			}
			
			setInterval(chart02Refresh, 20000);

			function chart02Refresh(){
			    var mapChart = echarts.init(document.getElementById("idChart"));

				var Options = {
						//backgroundColor : 'rgba(22,25,29,90)',
					    tooltip : {
					        trigger: 'axis'
					    },
					    legend: {
					      data:['장애', '조치'],
					      textStyle : {color :  'rgba(255,255,255,100)'}
					    },
					    calculable : true,
					    xAxis : [
					      {
							 type : 'value',
								  axisLabel : {
							         formatter: '{value}',
						             textStyle : {color :  'rgba(255,255,255,100)'}
							        }
							    }
					    ],
					    yAxis : [
					       {
								type : 'category',
								  data : ['제천','강릉','춘천','충주','홍천','대관령','원주'],
									 axisLabel : {
									    formatter: '{value}',
									   textStyle : {color :  'rgba(255,255,255,100)'}
								   }
							  }
					    ],
					    series : [{
					       itemStyle: {
								normal: {
									color: 'rgb(202,84,85)',
										label: {
												show: true,
												position: 'inside',
												textStyle : {color : 'rgb(199,173,182)', fontSize : '1px'}
										}
									}
								},
					            name:'장애',
					            type:'bar',
					            barWidth : 8,
					            data:[10, 11, 11, 9, 17, 3, 32]
					        },
					        {
					       itemStyle: {
								normal: {
									color: 'rgb(75,95,114)',
										label: {
												show: true,
												position: 'inside',
												textStyle : {color : 'rgb(183,188,186)', fontSize : '1px'}
										}
									}
								},
					            name:'조치',
					            type:'bar',
					            barWidth : 8,
					            data:[9, 10, 9, 9, 14, 2 ,28]
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