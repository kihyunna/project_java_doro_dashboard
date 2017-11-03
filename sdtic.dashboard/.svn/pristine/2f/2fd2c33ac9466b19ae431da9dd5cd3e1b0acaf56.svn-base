AjaxQuery = function(buseo_code, fac_code, locationPath) {
	if (buseo_code == '' || fac_code == '' ){
		//alert('검색조건을 확인하십시오.');
		return;
	}
		
	var url = "http://" + location.host + "/fecMdtcontrolAjax01.do";
	
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
        	// ：mapType = Korea
			require('echarts/util/mapData/params').params.Korea = {
			    getGeoJson: function (callback) {
			        $.getJSON('geoJson/Korea_geo.json', callback);
			    }
			};        			
					
			var Options = {				
			    backgroundColor: '#1b1b1b',	
			    //backgroundColor: 'rgba(55,96,146,0)',					    
			    //backgroundColor: 'rgb(177,177,177,1)',					        
			    color: ['gold','aqua'],
			    title : {
			        text: 'Sample',
			        //subtext: 'Data from www.census.gov.',
			        //sublink: 'http://www.census.gov/popest/data/datasets.html',
			        x:'center',
			        textStyle : {
			            color: '#fff'
			        }
			    },
			    tooltip : {
			        trigger: 'item'//,
			        //formatter: '{b}'						        
			        				        
			    },    
			    legend: {
			        orient: 'vertical',
			        x:'left',
			        data:['수신율', '지연율'],
			        selectedMode: 'single',
			        selected:{
			            '수신율' : true,
			            '지연율' : false
			        },
			        textStyle : {
			            color: '#fff'
			        }
			    },	
			    dataRange: {
			        min : 50,
			        max : 100,
			        calculable : true,
			        color: [ 'lime','yellow','orange','#ff3333'],					        					        					        
			        textStyle:{
			            color:'#fff'
			        }
			    },			    
			    series : [					    
			        {					        
			            name: '전국지도',					            
			            type: 'map',
			            roam: false,
			            hoverable: false,
			            mapType: 'Korea', 					            
			            itemStyle:{
			                normal:{
			                    borderColor:'rgba(100,149,237,1)',
			                    borderWidth:0.5,
			                    areaStyle:{
			                        //color: '#1b1b1b'
			                        color: 'rgba(80, 80, 80,1)'					                        					                        
			                    },
			                    label: {
		                            show: true,
		                            textStyle: {
			                           color: "#fff"					                           					                           
			                        }
		                        }
			                },
        					emphasis:{label:{show:true}}
			            },	
			             data : [	            				                   
			            ],					            
			            geoCoord: {			                
			                '강원지역본부': [127.9520,37.3997],
			                '강원차량1': [127.9929,37.4131],
			                '강원차량2': [128.3062,37.5430],
			                '강원차량3': [128.6764,37.9640],  					                
			                '강원차량4': [128.3025,37.7615],					                					                	
			                '강원차량5': [128.0567,38.0247],	
			                '강원차량6': [128.6462,38.0438],	
			                '강원차량7': [129.0911,37.3346],  					                
			                '충청지역본부': [127.4484,36.3622],
			                '충청차량1': [126.5839,36.5250],
			                '충청차량2': [127.9865,36.8145],
			                '충청차량3': [127.5120,36.1216],					                
			                '중부지역본부': [127.0899,37.3377],
			                '호남지역본부': [126.8866,35.2607],
			                '호남차량1': [127.0874,34.8156],
			                '호남차량2': [127.1075,36.0095],
			                '호남차량3': [127.5506,35.4866],
			                '호남차량4': [127.6563,35.8750],
			                '경북지역본부': [128.5377,35.9350],
			                '경북차량1': [128.6630,35.9130],
			                '경북차량2': [128.9224,35.9017],
			                '경북차량3': [128.1922,35.7943],
			                '경북차량4': [128.5877,36.3978],
			                '경남지역본부': [128.7010,35.2847],					                					                
			                '본사': [128.1890,36.1289]					                
			            }
			        },						        
			         {
			            name: '수신율',
			            type: 'map',
			            mapType: 'Korea',
			            data:[            		
			            ],		            
			            markLine : {
			                smooth:true,
			                effect : {
			                    show: true,
			                    scaleSize: 1,
			                    period: 50,
			                    color: '#fff',
			                    shadowBlur: 5
			                },
			                itemStyle : {
			                    normal: {
			                        borderWidth:1,
			                        lineStyle: {
			                            type: 'solid',
			                            shadowBlur: 5
			                        }
			                    }
			                },
			                data : [
			                    [{name:'경기지역본부'},{name:'경기차량1',value:95}],
			                    [{name:'경기지역본부'},{name:'경기차량2',value:90}],
			                    [{name:'경기지역본부'},{name:'경기차량3',value:80}],
			                    [{name:'경기지역본부'},{name:'경기차량4',value:90}],
			                    [{name:'경기지역본부'},{name:'경기차량5',value:80}],
			                    [{name:'강원지역본부'},{name:'강원차량1',value:70}],
			                    [{name:'강원지역본부'},{name:'강원차량2',value:90}],
			                    [{name:'강원지역본부'},{name:'강원차량3',value:90}],
			                    [{name:'강원지역본부'},{name:'강원차량4',value:90}],
			                    [{name:'강원지역본부'},{name:'강원차량5',value:50}],					                    
			                    [{name:'강원지역본부'},{name:'강원차량6',value:76}],
			                    [{name:'강원지역본부'},{name:'강원차량7',value:85}],
			                    [{name:'경북지역본부'},{name:'경북차량1',value:70}],
			                    [{name:'경북지역본부'},{name:'경북차량2',value:60}],
			                    [{name:'경북지역본부'},{name:'경북차량3',value:50}],
			                    [{name:'경북지역본부'},{name:'경북차량4',value:100}],
			                    [{name:'충청지역본부'},{name:'충청차량1',value:100}],
			                    [{name:'충청지역본부'},{name:'충청차량2',value:95}],
			                    [{name:'충청지역본부'},{name:'충청차량3',value:90}],
			                    [{name:'호남지역본부'},{name:'호남차량1',value:90}],
			                    [{name:'호남지역본부'},{name:'호남차량2',value:80}],
			                    [{name:'호남지역본부'},{name:'호남차량3',value:70}],
			                    [{name:'호남지역본부'},{name:'호남차량4',value:60}]					                    
			                ]
			            },
			            markPoint : {
			                symbol:'emptyCircle',
			                symbolSize : function (v){
			                    return 1 + v/10						                    				                    
			                },
			                effect : {
			                    show: true,
			                    shadowBlur : 2
			                },
			                itemStyle:{
			                    normal:{
			                        label:{show:false}
			                    },
			                    emphasis: {
			                        label:{position:'top'}
			                    }
			                },
			                data : [					                    
			                    {name:'경기차량1',value:95},
			                    {name:'경기차량2',value:90},
			                    {name:'경기차량3',value:80},
			                    {name:'경기차량4',value:90},
			                    {name:'경기차량5',value:80},
			                    {name:'강원차량1',value:70},
			                    {name:'강원차량2',value:90},
			                    {name:'강원차량3',value:90},
			                    {name:'강원차량4',value:90},
			                    {name:'강원차량5',value:50},					                    
			                    {name:'강원차량6',value:76},
			                    {name:'강원차량7',value:85},
			                    {name:'경북차량1',value:70},
			                    {name:'경북차량2',value:60},
			                    {name:'경북차량3',value:50},
			                    {name:'경북차량4',value:100},
			                    {name:'충청차량1',value:100},
			                    {name:'충청차량2',value:95},
			                    {name:'충청차량3',value:90},
			                    {name:'호남차량1',value:90},
			                    {name:'호남차량2',value:80},
			                    {name:'호남차량3',value:70},
			                    {name:'호남차량4',value:60}
			                ]
			            }
			         },
			         {
			            name: '지연율',
			            type: 'map',
			            mapType: 'Korea',
			            data:[],
			            markLine : {
			                smooth:true,
			                effect : {
			                    show: true,
			                    scaleSize: 1,
			                    period: 50,
			                    color: '#fff',
			                    shadowBlur: 10
			                },
			                itemStyle : {
			                    normal: {
			                        borderWidth:1,
			                        lineStyle: {
			                            type: 'solid',
			                            shadowBlur: 10
			                        }
			                    }
			                },
			                data : [
			                    [{name:'경기지역본부'},{name:'경기차량1',value:75}],
			                    [{name:'경기지역본부'},{name:'경기차량2',value:80}],
			                    [{name:'경기지역본부'},{name:'경기차량3',value:80}],
			                    [{name:'경기지역본부'},{name:'경기차량4',value:60}],
			                    [{name:'경기지역본부'},{name:'경기차량5',value:70}],
			                    [{name:'강원지역본부'},{name:'강원차량1',value:80}],
			                    [{name:'강원지역본부'},{name:'강원차량2',value:70}],
			                    [{name:'강원지역본부'},{name:'강원차량3',value:60}],
			                    [{name:'강원지역본부'},{name:'강원차량4',value:70}],
			                    [{name:'강원지역본부'},{name:'강원차량5',value:80}],					                    
			                    [{name:'강원지역본부'},{name:'강원차량6',value:96}],
			                    [{name:'강원지역본부'},{name:'강원차량7',value:75}],
			                    [{name:'경북지역본부'},{name:'경북차량1',value:90}],
			                    [{name:'경북지역본부'},{name:'경북차량2',value:70}],
			                    [{name:'경북지역본부'},{name:'경북차량3',value:50}],
			                    [{name:'경북지역본부'},{name:'경북차량4',value:90}],
			                    [{name:'충청지역본부'},{name:'충청차량1',value:100}],
			                    [{name:'충청지역본부'},{name:'충청차량2',value:95}],
			                    [{name:'충청지역본부'},{name:'충청차량3',value:90}],
			                    [{name:'호남지역본부'},{name:'호남차량1',value:90}],
			                    [{name:'호남지역본부'},{name:'호남차량2',value:80}],
			                    [{name:'호남지역본부'},{name:'호남차량3',value:70}],
			                    [{name:'호남지역본부'},{name:'호남차량4',value:60}]
			                ]
			            },
			            markPoint : {
			                symbol:'emptyCircle',
			                symbolSize : function (v){
			                    return 10 + v/10
			                },
			                effect : {
			                    show: true,
			                    shadowBlur : 0
			                },
			                itemStyle:{
			                    normal:{
			                        label:{show:false}
			                    },
			                    emphasis: {
			                        label:{position:'top'}
			                    }
			                },
			                data : [
			                    {name:'경기차량1',value:75},
			                    {name:'경기차량2',value:80},
			                    {name:'경기차량3',value:80},
			                    {name:'경기차량4',value:60},
			                    {name:'경기차량5',value:90},
			                    {name:'강원차량1',value:80},
			                    {name:'강원차량2',value:70},
			                    {name:'강원차량3',value:60},
			                    {name:'강원차량4',value:70},
			                    {name:'강원차량5',value:80},					                    
			                    {name:'강원차량6',value:96},
			                    {name:'강원차량7',value:75},
			                    {name:'경북차량1',value:90},
			                    {name:'경북차량2',value:70},
			                    {name:'경북차량3',value:50},
			                    {name:'경북차량4',value:90},
			                    {name:'충청차량1',value:100},
			                    {name:'충청차량2',value:95},
			                    {name:'충청차량3',value:90},
			                    {name:'호남차량1',value:90},
			                    {name:'호남차량2',value:80},
			                    {name:'호남차량3',value:70},
			                    {name:'호남차량4',value:60}					                    
			                ]
			            }
			         }
			    ]
			};
    		
			mapChart.setOption(Options);
        },
        error: function(req)
        {
            //alert("Error : \n\n" + req.responseText);
        }
    });
};