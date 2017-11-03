AjaxQuery = function(buseo_code, fac_code, locationPath) {
	if (buseo_code == '' || fac_code == '' ){
		//alert('검색조건을 확인하십시오.');
		return;
	}
		
	var url = "http://" + location.host + "/fec/fecMdtoperationAjax01.do";
	
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
        	
//        	var mapChart = new global.Echarts(document.getElementById("idChart"));
//			require('echarts/util/mapData/params').params.Korea = {
//			    getGeoJson: function (callback) {
//			        $.getJSON('/js/echarts/source/geoJson/Korea_geo.json', callback);
//			    }
//			};
//			
			require('echarts/util/mapData/params').params.kyeongbuk = {
			    getGeoJson: function (callback) {
			        $.getJSON('/js/echarts/source/geoJson/kyeongbuk_geo.json', callback);
			    }
			};    
			
			require('echarts/util/mapData/params').params.kangwon = {
			    getGeoJson: function (callback) {
			        $.getJSON('/js/echarts/source/geoJson/kangwon_geo.json', callback);
			    }
			};   
			
			
			var maplocation = 'kangwon';
            var txtlocation = '강원본부';
            
//			var Options = {				
//			    backgroundColor: '#1b1b1b',	
//			    //backgroundColor: 'rgba(55,96,146,0)',					    
//			    //backgroundColor: 'rgb(177,177,177,1)',					        
//			    color: ['gold','aqua'],
//			    title : {
//			        text: txtlocation,
//			        //subtext: 'Data from www.census.gov.',
//			        //sublink: 'http://www.census.gov/popest/data/datasets.html',
//			        x:'center',
//			        textStyle : {
//			            color: '#fff'
//			        }
//			    },
//			    tooltip : {
//			        trigger: 'item'//,
//			        //formatter: '{b}'						        
//			        				        
//			    },    
//			    legend: {
//			        orient: 'vertical',
//			        x:'left',
//			        data:['수신율', '지연율'],
//			        selectedMode: 'single',
//			        selected:{
//			            '수신율' : true,
//			            '지연율' : false
//			        },
//			        textStyle : {
//			            color: '#fff'
//			        }
//			    },	
//			    dataRange: {
//			        min : 50,
//			        max : 100,
//			        calculable : true,
//			        color: [ 'lime','orange','#ff3333'],	
////			        color: [ 'rgba(22,96,74,1)','rgba(128,100,54,1)','rgba(112,46,33,1)'],	
//			        textStyle:{
//			            color:'#fff'
//			        }
//			    },			    
//			    series : [					    
//			        {					        
//			            name: '전국지도',					            
//			            type: 'map',
//			            roam: false,
//			            hoverable: true,
//			            mapType: maplocation, 					            
//			            itemStyle:{
//			                normal:{
//			                    borderColor:'rgba(100,149,237,1)',
//			                    borderWidth:0.5,
//			                    areaStyle:{
//			                        //color: '#1b1b1b'
//			                        color: 'rgba(80, 80, 80,1)'					                        					                        
//			                    },
//			                    label: {
//		                            show: true,
//		                            textStyle: {
//			                           color: "#fff"					                           					                           
//			                        }
//		                        }
//			                },
//        					emphasis:{label:{show:true}}
//			            },	
//			             data : [	            				                   
//			            ],					            
//			            geoCoord: {			                
//			                '강원지역본부': [127.9520,37.3997],
//			                '강원차량1': [127.9929,37.4131],
//			                '강원차량2': [128.3062,37.5430],
//			                '강원차량3': [128.6764,37.9640],  					                
//			                '강원차량4': [128.3025,37.7615],					                					                	
//			                '강원차량5': [128.0567,38.0247],	
//			                '강원차량6': [128.6462,38.0438],	
//			                '강원차량7': [129.0911,37.3346],  					                
//			                '충청지역본부': [127.4484,36.3622],
//			                '충청차량1': [126.5839,36.5250],
//			                '충청차량2': [127.9865,36.8145],
//			                '충청차량3': [127.5120,36.1216],					                
//			                '중부지역본부': [127.0899,37.3377],
//			                '호남지역본부': [126.8866,35.2607],
//			                '호남차량1': [127.0874,34.8156],
//			                '호남차량2': [127.1075,36.0095],
//			                '호남차량3': [127.5506,35.4866],
//			                '호남차량4': [127.6563,35.8750],
//			                '경북지역본부': [128.5377,35.9350],
//			                '경북차량1': [128.6630,35.9130],
//			                '경북차량2': [128.9224,35.9017],
//			                '경북차량3': [128.1922,35.7943],
//			                '경북차량4': [128.5877,36.3978],
//			                '경남지역본부': [128.7010,35.2847],					                					                
//			                '본사': [128.1890,36.1289]					                
//			            }
//			        },						        
//			         {
//			            name: '수신율',
//			            type: 'map',
//			            mapType: maplocation,
//			            data:[            		
//			            ],		            
//			            markLine : {
//			                smooth:true,
//			                effect : {
//			                    show: true,
//			                    scaleSize: 1,
//			                    period: 50,
//			                    color: '#fff',
//			                    shadowBlur: 5
//			                },
//			                itemStyle : {
//			                    normal: {
//			                        borderWidth:1,
//			                        lineStyle: {
//			                            type: 'solid',
//			                            shadowBlur: 5
//			                        }
//			                    }
//			                },
//			                data : [
//			                    [{name:'경기지역본부'},{name:'경기차량1',value:95}],
//			                    [{name:'경기지역본부'},{name:'경기차량2',value:90}],
//			                    [{name:'경기지역본부'},{name:'경기차량3',value:80}],
//			                    [{name:'경기지역본부'},{name:'경기차량4',value:90}],
//			                    [{name:'경기지역본부'},{name:'경기차량5',value:80}],
//			                    [{name:'강원지역본부'},{name:'강원차량1',value:70}],
//			                    [{name:'강원지역본부'},{name:'강원차량2',value:90}],
//			                    [{name:'강원지역본부'},{name:'강원차량3',value:90}],
//			                    [{name:'강원지역본부'},{name:'강원차량4',value:90}],
//			                    [{name:'강원지역본부'},{name:'강원차량5',value:50}],					                    
//			                    [{name:'강원지역본부'},{name:'강원차량6',value:76}],
//			                    [{name:'강원지역본부'},{name:'강원차량7',value:85}],
//			                    [{name:'경북지역본부'},{name:'경북차량1',value:70}],
//			                    [{name:'경북지역본부'},{name:'경북차량2',value:60}],
//			                    [{name:'경북지역본부'},{name:'경북차량3',value:50}],
//			                    [{name:'경북지역본부'},{name:'경북차량4',value:100}],
//			                    [{name:'충청지역본부'},{name:'충청차량1',value:100}],
//			                    [{name:'충청지역본부'},{name:'충청차량2',value:95}],
//			                    [{name:'충청지역본부'},{name:'충청차량3',value:90}],
//			                    [{name:'호남지역본부'},{name:'호남차량1',value:90}],
//			                    [{name:'호남지역본부'},{name:'호남차량2',value:80}],
//			                    [{name:'호남지역본부'},{name:'호남차량3',value:70}],
//			                    [{name:'호남지역본부'},{name:'호남차량4',value:60}]					                    
//			                ]
//			            },
//			            markPoint : {
//			                symbol:'emptyCircle',
//			                symbolSize : function (v){
//			                    return 1 + v/10						                    				                    
//			                },
//			                effect : {
//			                    show: true,
//			                    shadowBlur : 2
//			                },
//			                itemStyle:{
//			                    normal:{
//			                        label:{show:false}
//			                    },
//			                    emphasis: {
//			                        label:{position:'top'}
//			                    }
//			                },
//			                data : [					                    
//			                    {name:'경기차량1',value:95},
//			                    {name:'경기차량2',value:90},
//			                    {name:'경기차량3',value:80},
//			                    {name:'경기차량4',value:90},
//			                    {name:'경기차량5',value:80},
//			                    {name:'강원차량1',value:70},
//			                    {name:'강원차량2',value:90},
//			                    {name:'강원차량3',value:90},
//			                    {name:'강원차량4',value:90},
//			                    {name:'강원차량5',value:50},					                    
//			                    {name:'강원차량6',value:76},
//			                    {name:'강원차량7',value:85},
//			                    {name:'경북차량1',value:70},
//			                    {name:'경북차량2',value:60},
//			                    {name:'경북차량3',value:50},
//			                    {name:'경북차량4',value:100},
//			                    {name:'충청차량1',value:100},
//			                    {name:'충청차량2',value:95},
//			                    {name:'충청차량3',value:90},
//			                    {name:'호남차량1',value:90},
//			                    {name:'호남차량2',value:80},
//			                    {name:'호남차량3',value:70},
//			                    {name:'호남차량4',value:60}
//			                ]
//			            }
//			         },
//			         {
//			            name: '지연율',
//			            type: 'map',
//			            mapType: maplocation,
//			            data:[],
//			            markLine : {
//			                smooth:true,
//			                effect : {
//			                    show: true,
//			                    scaleSize: 1,
//			                    period: 50,
//			                    color: '#fff',
//			                    shadowBlur: 10
//			                },
//			                itemStyle : {
//			                    normal: {
//			                        borderWidth:1,
//			                        lineStyle: {
//			                            type: 'solid',
//			                            shadowBlur: 10
//			                        }
//			                    }
//			                },
//			                data : [
//			                    [{name:'경기지역본부'},{name:'경기차량1',value:75}],
//			                    [{name:'경기지역본부'},{name:'경기차량2',value:80}],
//			                    [{name:'경기지역본부'},{name:'경기차량3',value:80}],
//			                    [{name:'경기지역본부'},{name:'경기차량4',value:60}],
//			                    [{name:'경기지역본부'},{name:'경기차량5',value:70}],
//			                    [{name:'강원지역본부'},{name:'강원차량1',value:80}],
//			                    [{name:'강원지역본부'},{name:'강원차량2',value:70}],
//			                    [{name:'강원지역본부'},{name:'강원차량3',value:60}],
//			                    [{name:'강원지역본부'},{name:'강원차량4',value:70}],
//			                    [{name:'강원지역본부'},{name:'강원차량5',value:80}],					                    
//			                    [{name:'강원지역본부'},{name:'강원차량6',value:96}],
//			                    [{name:'강원지역본부'},{name:'강원차량7',value:75}],
//			                    [{name:'경북지역본부'},{name:'경북차량1',value:90}],
//			                    [{name:'경북지역본부'},{name:'경북차량2',value:70}],
//			                    [{name:'경북지역본부'},{name:'경북차량3',value:50}],
//			                    [{name:'경북지역본부'},{name:'경북차량4',value:90}],
//			                    [{name:'충청지역본부'},{name:'충청차량1',value:100}],
//			                    [{name:'충청지역본부'},{name:'충청차량2',value:95}],
//			                    [{name:'충청지역본부'},{name:'충청차량3',value:90}],
//			                    [{name:'호남지역본부'},{name:'호남차량1',value:90}],
//			                    [{name:'호남지역본부'},{name:'호남차량2',value:80}],
//			                    [{name:'호남지역본부'},{name:'호남차량3',value:70}],
//			                    [{name:'호남지역본부'},{name:'호남차량4',value:60}]
//			                ]
//			            },
//			            markPoint : {
//			                symbol:'emptyCircle',
//			                symbolSize : function (v){
//			                    return 10 + v/10
//			                },
//			                effect : {
//			                    show: true,
//			                    shadowBlur : 0
//			                },
//			                itemStyle:{
//			                    normal:{
//			                        label:{show:false}
//			                    },
//			                    emphasis: {
//			                        label:{position:'top'}
//			                    }
//			                },
//			                data : [
//			                    {name:'경기차량1',value:75},
//			                    {name:'경기차량2',value:80},
//			                    {name:'경기차량3',value:80},
//			                    {name:'경기차량4',value:60},
//			                    {name:'경기차량5',value:90},
//			                    {name:'강원차량1',value:80},
//			                    {name:'강원차량2',value:70},
//			                    {name:'강원차량3',value:60},
//			                    {name:'강원차량4',value:70},
//			                    {name:'강원차량5',value:80},					                    
//			                    {name:'강원차량6',value:96},
//			                    {name:'강원차량7',value:75},
//			                    {name:'경북차량1',value:90},
//			                    {name:'경북차량2',value:70},
//			                    {name:'경북차량3',value:50},
//			                    {name:'경북차량4',value:90},
//			                    {name:'충청차량1',value:100},
//			                    {name:'충청차량2',value:95},
//			                    {name:'충청차량3',value:90},
//			                    {name:'호남차량1',value:90},
//			                    {name:'호남차량2',value:80},
//			                    {name:'호남차량3',value:70},
//			                    {name:'호남차량4',value:60}					                    
//			                ]
//			            }
//			         }
//			    ]
//			};
            var Options = {};
            if (buseo_code == 1){
            	Options = {				
        			    //backgroundColor: '#1b1b1b',	
        			    //backgroundColor: 'rgba(55,96,146,0)',					    
        			    //backgroundColor: 'rgb(177,177,177,1)',					        
        			    color: ['gold','aqua'],
        			    title : {
        			        text: txtlocation,
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
//        			    legend: {
//        			        orient: 'vertical',
//        			        x:'left',
//        			        data:['수신율', '지연율'],
//        			        selectedMode: 'single',
//        			        selected:{
//        			            '수신율' : true,
//        			            '지연율' : false
//        			        },
//        			        textStyle : {
//        			            color: '#fff'
//        			        }
//        			    },	
        			    dataRange: {
        			        min : 85,
        			        max : 100,
        			        calculable : true,
        			        color: [ 'lime','orange','#ff3333'],	
//        			        color: [ 'rgba(22,96,74,1)','rgba(128,100,54,1)','rgba(112,46,33,1)'],	
        			        textStyle:{
        			            color:'#fff'
        			        },
        			        itemWidth : 10,
        			        itemHeight : 10,
        			        show: false
        			    },			    
        			    series : [					    
        			        {					        
        			            name: '전국지도',					            
        			            type: 'map',
        			            roam: false,
        			            hoverable: false,
        			            mapType: maplocation, 					            
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
        			                '강원차량7': [129.0911,37.3346] 
        			            }
        			        },						        
        			         {
        			            name: '수신율',
        			            type: 'map',
        			            mapType: maplocation,
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
    										[{name:'강원지역본부'},{name:'강원차량1',value:91}],
    										[{name:'강원지역본부'},{name:'강원차량2',value:94}],
    										[{name:'강원지역본부'},{name:'강원차량3',value:98}],
    										[{name:'강원지역본부'},{name:'강원차량4',value:85}],
    										[{name:'강원지역본부'},{name:'강원차량5',value:90}],					                    
    										[{name:'강원지역본부'},{name:'강원차량6',value:96}],
    										[{name:'강원지역본부'},{name:'강원차량7',value:95}]  				                    
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
    									{name:'강원차량1',value:91},
    									{name:'강원차량2',value:94},
    									{name:'강원차량3',value:98},
    									{name:'강원차량4',value:85},
    									{name:'강원차량5',value:90},					                    
    									{name:'강원차량6',value:96},
    									{name:'강원차량7',value:95}   		                    
        			                ]
        			            }
        			         },
        			         {
        			            name: '지연율',
        			            type: 'map',
        			            mapType: maplocation,
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
        			                    [{name:'강원지역본부'},{name:'강원차량1',value:91}],
        			                    [{name:'강원지역본부'},{name:'강원차량2',value:94}],
        			                    [{name:'강원지역본부'},{name:'강원차량3',value:98}],
        			                    [{name:'강원지역본부'},{name:'강원차량4',value:85}],
        			                    [{name:'강원지역본부'},{name:'강원차량5',value:90}],					                    
        			                    [{name:'강원지역본부'},{name:'강원차량6',value:96}],
        			                    [{name:'강원지역본부'},{name:'강원차량7',value:95}]    			                   
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
        			                    {name:'강원차량1',value:91},
        			                    {name:'강원차량2',value:94},
        			                    {name:'강원차량3',value:98},
        			                    {name:'강원차량4',value:85},
        			                    {name:'강원차량5',value:90},					                    
        			                    {name:'강원차량6',value:96},
        			                    {name:'강원차량7',value:95}    			                    	                    
        			                ]
        			            }
        			         }
        			    ]
        			};
            } else
            {
    			maplocation = 'kyeongbuk';
                txtlocation = '경북본부';
                
            	Options = {				
            		    //backgroundColor: '#1b1b1b',	
            		    //backgroundColor: 'rgba(55,96,146,0)',					    
            		    //backgroundColor: 'rgb(177,177,177,1)',					        
            		    color: ['gold','aqua'],
            		    title : {
            		        text: txtlocation,
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
//            		    legend: {
//            		        orient: 'vertical',
//            		        x:'left',
//            		        data:['수신율', '지연율'],
//            		        selectedMode: 'single',
//            		        selected:{
//            		            '수신율' : true,
//            		            '지연율' : false
//            		        },
//            		        textStyle : {
//            		            color: '#fff'
//            		        }
//            		    },	
            		    dataRange: {
            		    	show:false,
            		        min : 85,
            		        max : 100,
            		        calculable : true,
            		        color: [ 'lime','orange','#ff3333'],	
//            		        color: [ 'rgba(22,96,74,1)','rgba(128,100,54,1)','rgba(112,46,33,1)'],	
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
            		            mapType: maplocation, 					            
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
            		            mapType: maplocation,
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
            		                    [{name:'경북지역본부'},{name:'경북차량1',value:99}],
            		                    [{name:'경북지역본부'},{name:'경북차량2',value:96}],
            		                    [{name:'경북지역본부'},{name:'경북차량3',value:85}],
            		                    [{name:'경북지역본부'},{name:'경북차량4',value:89}]		                   			                    
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
            		                    {name:'경북차량1',value:99},
            		                    {name:'경북차량2',value:96},
            		                    {name:'경북차량3',value:85},
            		                    {name:'경북차량4',value:89}
            		                ]
            		            }
            		         },
            		         {
            		            name: '지연율',
            		            type: 'map',
            		            mapType: maplocation,
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
            		                  
            		                    [{name:'경북지역본부'},{name:'경북차량1',value:90}],
            		                    [{name:'경북지역본부'},{name:'경북차량2',value:70}],
            		                    [{name:'경북지역본부'},{name:'경북차량3',value:50}],
            		                    [{name:'경북지역본부'},{name:'경북차량4',value:90}]
            		                   
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
            		                    
            		                    {name:'경북차량1',value:90},
            		                    {name:'경북차량2',value:70},
            		                    {name:'경북차량3',value:50},
            		                    {name:'경북차량4',value:90}            		                    	                    
            		                ]
            		            }
            		         }
            		    ]
            		};  
            	
            		
            }  
            
            refresh();
			myChart.setOption(Options);
			setTable(buseo_code);
        },
        error: function(req)
        {
            //alert("Error : \n\n" + req.responseText);
        }
    });
};

function setTable(kubun){
	var sHtml = "";
	var eHtml = "";
	if (kubun == 1){
		
		sHtml += '<tr style="height:50px; ">	';			
		sHtml += '	<th style="font-size:13px;width:100px; color:white;background-color:rgb(27,31,36);text-align: center;"> 수신율 구분 </th>';
		sHtml += '	<th colSpan="2" style="font-size:13px; width:80px; color:white;background-color:rgb(27,31,36);text-align: center;"> 운행차량</th>';
		sHtml += '</tr>';
		sHtml += '<tr style="height:37px;">';							
		sHtml += '	<td rowSpan="2" style="font-size:12px;text-align: center; width:80px; color:white; background-color:rgb(22,96,74);"> 95%이상 </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(22,96,74); background-color:rgb(27,31,36); width:40px;"> 금일 </td>';				    
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(22,96,74); background-color:rgb(27,31,36); width:40px;"> 95 </td>';
		sHtml += '</tr>';
		sHtml += '<tr style="height:37px;">';								
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(22,96,74); background-color:rgb(27,31,36); width:40px;"> 전일 </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(22,96,74); background-color:rgb(27,31,36); width:40px;"> 85 </td>';
		sHtml += '</tr>';
		
		sHtml += '<tr style="height:37px;">';
		sHtml += '    <td rowSpan="2"  style="font-size:12px;text-align: center; width:80px; color:white; background-color:rgb(128,100,54)"> 85~94% </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(128,100,54); background-color:rgb(27,31,36);width:40px;"> 금일 </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(128,100,54); background-color:rgb(27,31,36);width:40px;">  4 </td>';
		sHtml += '</tr>';
		sHtml += '<tr style="height:37px;">';								
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(128,100,54); background-color:rgb(27,31,36);width:40px;"> 전일 </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(128,100,54); background-color:rgb(27,31,36);width:40px;"> 20 </td>';
		sHtml += '</tr>';
		
		sHtml += '<tr style="height:37px;">';
		sHtml += '    <td rowSpan="2"  style="font-size:12px;text-align: center; width:80px; color:white; background-color:rgb(112,46,33)"> 85%이하 </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(112,46,33); background-color:rgb(27,31,36);width:40px;"> 금일 </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(112,46,33); background-color:rgb(27,31,36);width:40px;">  1 </td>';
		sHtml += '</tr>';
		sHtml += '<tr style="height:37px;">';								
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(112,46,33); background-color:rgb(27,31,36);width:40px;"> 전일 </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(112,46,33); background-color:rgb(27,31,36);width:40px;">  5 </td>';
		sHtml += '</tr>';
		sHtml += '</table>';
		
		eHtml += '<table class="class_table" style=" border-collapse:collapse; border:3px solid rgb(39,43,49); width:460px; margin-top:-1px;" cellpadding="1" cellspacing="2" border="1" align="left" >';
		eHtml += '	<tr style="height:50px; background-color:rgb(27,31,36);">';				
		eHtml += '		<th colSpan="4" style="font-size:13px;width:100%; color:white;"> 수신율 장애장비 정보</th>';
		eHtml += '	</tr>';
			
		eHtml += '	<tr style="height:37px; background-color:rgb(27,31,36);">';
		eHtml += '		<th style="font-size:13px;width:100px; color:white; text-align: center;"> 일련번호 </th>';
		eHtml += '		<th style="font-size:13px;width:130px; color:white; text-align: center;"> 지사 </th>';
		eHtml += '		<th style="font-size:13px;width:100px; color:white; text-align: center;"> 최종작업 </th>';
		eHtml += '		<th style="font-size:13px;width:130px; color:white; text-align: center;"> 최종위치 </th>';
		eHtml += '	</tr>';
			
		eHtml += '	<tr style="height:37px;">';								
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 00001 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 원주지사 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 염수살포</td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> </td>';				    
		eHtml += '	</tr>';
		eHtml += '	<tr style="height:37px;">';								
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 00002 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 대관령지사 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 소금살포</td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> </td>';				    
		eHtml += '	</tr>';
		eHtml += '	<tr style="height:37px;">';								
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 00003 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 홍천지사 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 모래살포</td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> </td>';				    
		eHtml += '	</tr>';
		eHtml += '	<tr style="height:37px;">';								
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 00004 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 충주지사 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 리무빙작업</td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> </td>';				    
		eHtml += '	</tr>';
		eHtml += '	<tr style="height:37px;">';								
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 00005 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 춘천지사 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 제설작업</td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> </td>';				    
		eHtml += '	</tr>';			
		eHtml += '</table>';
	
	}else
	{
		sHtml += '<tr style="height:50px; ">	';			
		sHtml += '	<th style="font-size:13px;width:100px; color:white;background-color:rgb(27,31,36);text-align: center;"> 수신율 구분 </th>';
		sHtml += '	<th colSpan="2" style="font-size:13px; width:80px; color:white;background-color:rgb(27,31,36);text-align: center;"> 운행차량</th>';
		sHtml += '</tr>';
		sHtml += '<tr style="height:37px;">';							
		sHtml += '	<td rowSpan="2" style="font-size:12px;text-align: center; width:80px; color:white; background-color:rgb(22,96,74);"> 95%이상 </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(22,96,74); background-color:rgb(27,31,36); width:40px;"> 금일 </td>';				    
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(22,96,74); background-color:rgb(27,31,36); width:40px;"> 98 </td>';
		sHtml += '</tr>';
		sHtml += '<tr style="height:37px;">';								
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(22,96,74); background-color:rgb(27,31,36); width:40px;"> 전일 </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(22,96,74); background-color:rgb(27,31,36); width:40px;"> 85 </td>';
		sHtml += '</tr>';
		
		sHtml += '<tr style="height:37px;">';
		sHtml += '    <td rowSpan="2"  style="font-size:12px;text-align: center; width:80px; color:white; background-color:rgb(128,100,54)"> 85~94% </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(128,100,54); background-color:rgb(27,31,36);width:40px;"> 금일 </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(128,100,54); background-color:rgb(27,31,36);width:40px;"> 25 </td>';
		sHtml += '</tr>';
		sHtml += '<tr style="height:37px;">';								
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(128,100,54); background-color:rgb(27,31,36);width:40px;"> 전일 </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(128,100,54); background-color:rgb(27,31,36);width:40px;"> 15</td>';
		sHtml += '</tr>';
		
		sHtml += '<tr style="height:37px;">';
		sHtml += '    <td rowSpan="2"  style="font-size:12px;text-align: center; width:80px; color:white; background-color:rgb(112,46,33)"> 85%이하 </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(112,46,33); background-color:rgb(27,31,36);width:40px;"> 금일 </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(112,46,33); background-color:rgb(27,31,36);width:40px;">  2</td>';
		sHtml += '</tr>';
		sHtml += '<tr style="height:37px;">';								
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(112,46,33); background-color:rgb(27,31,36);width:40px;"> 전일 </td>';
		sHtml += '    <td style="font-size:13px;text-align: center; color:rgb(112,46,33); background-color:rgb(27,31,36);width:40px;">  1 </td>';
		sHtml += '</tr>';
		sHtml += '</table>';
		
		eHtml += '<table class="class_table" style=" border-collapse:collapse; border:3px solid rgb(39,43,49); width:460px; margin-top:-1px;" cellpadding="1" cellspacing="2" border="1" align="left" >';
		eHtml += '	<tr style="height:50px; background-color:rgb(27,31,36);">';				
		eHtml += '		<th colSpan="4" style="font-size:13px;width:100%; color:white;"> 수신율 장애장비 정보</th>';
		eHtml += '	</tr>';
			
		eHtml += '	<tr style="height:37px; background-color:rgb(27,31,36);">';
		eHtml += '		<th style="font-size:13px;width:100px; color:white; text-align: center;"> 일련번호 </th>';
		eHtml += '		<th style="font-size:13px;width:130px; color:white; text-align: center;"> 지사 </th>';
		eHtml += '		<th style="font-size:13px;width:100px; color:white; text-align: center;"> 최종작업 </th>';
		eHtml += '		<th style="font-size:13px;width:130px; color:white; text-align: center;"> 최종위치 </th>';
		eHtml += '	</tr>';
			
		eHtml += '	<tr style="height:37px;">';								
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 00001 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 구미지사 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 염수살포</td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> </td>';				    
		eHtml += '	</tr>';
		eHtml += '	<tr style="height:37px;">';								
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 00002 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 대구지사 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 소금살포</td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> </td>';				    
		eHtml += '	</tr>';
		eHtml += '	<tr style="height:37px;">';								
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 00003 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 군위지사 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 모래살포</td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> </td>';				    
		eHtml += '	</tr>';
		eHtml += '	<tr style="height:37px;">';								
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 00004 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 상주지사 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 제설작업</td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> </td>';				    
		eHtml += '	</tr>';
		eHtml += '	<tr style="height:37px;">';								
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 00005 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 영천지사 </td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 모래살포</td>';
		eHtml += '	    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> </td>';				    
		eHtml += '	</tr>';			
		eHtml += '</table>';
	}	
	$('#idTable_mdt  *').remove();
	$('#idTable_mdt').append(sHtml);
	$('#idTable_inform  *').remove();
	$('#idTable_inform').append(eHtml);
	
	$( "#idDiv" ).fadeIn( "slow", function() {
		
	});
	
//	setTimeout($.proxy(function () {
//		$( "#idDiv" ).fadeIn( "slow", function() {
//			
//		});
//	}, this), 500);


	
}