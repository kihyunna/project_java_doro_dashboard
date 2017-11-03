var DeptName = '';
var DeptJson = '';
var MaxListCount = 0;
var CurrentListIdx = 0;
var breaktimer = false;
Proj4js.defs["EPSG:5186"] = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +units=m +no_defs";

var proj4326 = new Proj4js.Proj('EPSG:4326'); //WGS84 경위도 
var proj5186 = new Proj4js.Proj('EPSG:5186');

var  Options = {	
	    color: ['gold','aqua'],
	    title : {
	        text: '',//DeptName,
	        x:'center',
	        textStyle : {
	            color: '#fff'
	        }
	    },
	    tooltip : {
	        trigger: 'item',
	        show:false
	    }, 
	    dataRange: {
	        min : 85,
	        max : 100,
	        calculable : true,
	        color: [ 'lime','orange','#ff3333'],	
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
	            mapType: DeptJson, 					            
	            itemStyle:{
	            	label: {
                        show: false				                           					                           
                        },
	                normal:{
	                    borderColor:'rgba(100,149,237,0)',
	                    borderWidth:0.5,
	                    areaStyle:{
	                    	color: '#A8A8A8'	
	                    },	
//	                	borderColor:
//	                		'rgba(120,169,237,1)',
//	                    borderWidth:0.5,
//	                    areaStyle:{
//	                        color: 'rgba(27,27,27,0.5)'
//	                    	
//	                        	   
//	                    },		                    
	                    label: {
                            show: false				                           					                           
	                        }
                    },
                    emphasis:{label:{show:false}}					
	            },	
	             data : [	            				                   
	            ],					            
	            geoCoord: {}//geo_coord
	        },						        
	         {
	            name: '수신율',
	            type: 'map',
	            mapType: DeptJson,
	            hoverable: false,
	            data:[            		
	            ],		
	            itemStyle:{
	            	label: {
                        show: false				                           					                           
                        },
	                normal:{label:{show:false}},
	                emphasis:{label:{show:false}}
	            },
	            markLine : {
	                smooth:true,
	                effect : {
	                    show: true,
	                    scaleSize: 1,
	                    period: 100,
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
	                    			},
	                    	emphasis:{label:{show:false}}
	                			},
	                data : []//data_line
	            },
	            markPoint : {
	                symbol:'emptyCircle',
	                symbolSize : function (v){
	                	if (v>100)
	                		v = 100;
	                    return 1 + v/10	
	                },
	                effect : {
	                    show: true,
	                    shadowBlur : 0,	                    
	                    period: 100
	                },
	                itemStyle:{
	                	label: {
                            show: false
                        },
	                    normal:{
	                        label:{show:false}
	                    },
	                    emphasis: {
	                        label:{position:'top', show:false}	                        
	                    }
	                },
	                data : []//data_point
	            }
	         }
	    ]
	};  

function getDeptOption(sVal){
	if (sVal == 'N01796'){
		DeptName = '강원본부';
		DeptJson = 'kangwon';		
	}else if (sVal == 'N01800'){
		DeptName = '대구경북본부';
		DeptJson = 'kyeongbuk';	
	}else if (sVal == 'N01801'){
		DeptName = '부산경남본부';
		DeptJson = 'kyeongnam';	
	}else if (sVal == 'N01795'){
		DeptName = '수도권본부';
		DeptJson = 'kyeonggi';	
	}else if (sVal == 'N02723'){
		DeptName = '충북본부';
		DeptJson = 'chungbuk';	
	}else if (sVal == 'N01797'){
		DeptName = '대전충남본부';
		DeptJson = 'chungnam';	
	}else if (sVal == 'N01798'){
		DeptName = '전북본부';
		DeptJson = 'jeonbuk';	
	}else if (sVal == 'N01799'){
		DeptName = '광주전남본부';
		DeptJson = 'jeonnam';	
	}else{
		DeptName = '수도권본부';
		DeptJson = 'kyeonggi';	
	}
	
}

AjaxQuery = function(val) {
	if (init == false)
		return;
	breaktimer = true;
	if (timeoutObj != null){
		clearTimeout(timeoutObj);
		timeoutObj = null;
	}
	
	getDeptOption(val);
	var url = "http://" + location.host + "/fecMDTOperLv1.do";
	
    $.ajax(
    {
    	type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: {'deptCode' : val},
        cache: false,
        success: function(data){  
        	
        	var sHtml = setMdtRatio(data.Oper);
    		var eHtml = setMdtInfo(data.Trobl);
    		Options = setMdtMap(data.Map);   
    		
    		$('#idTable_mdt  *').remove();
    		$('#idTable_mdt').append(sHtml);
//    		
    		$('#idTable_inform  *').remove();
    		$('#idTable_inform').append(eHtml);
    		        	
    		refresh();
    		myChart.setOption(Options);  
    		    		
    		setTimeout($.proxy(function () {
				breaktimer = false;
				ChangeRow();
			}, this), 3000);
        },
        error: function(req)
        {
            
        }
    });
};

function setDeptforMap(){
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
	
	require('echarts/util/mapData/params').params.kyeongnam = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/kyeongnam_geo.json', callback);
	    }
	};    
	
	require('echarts/util/mapData/params').params.kyeonggi = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/kyeonggi_geo.json', callback);
	    }
	}; 
	
//	require('echarts/util/mapData/params').params.chungcheong = {
//	    getGeoJson: function (callback) {
//	        $.getJSON('/js/echarts/source/geoJson/chungcheong_geo.json', callback);
//	    }
//	};    
	
	require('echarts/util/mapData/params').params.chungbuk = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/chungbuk_geo.json', callback);
	    }
	}; 
	
	require('echarts/util/mapData/params').params.chungnam = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/chungnam_geo.json', callback);
	    }
	}; 
	
	require('echarts/util/mapData/params').params.kangwon = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/kangwon_geo.json', callback);
	    }
	}; 
	
	require('echarts/util/mapData/params').params.jeonbuk = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/jeonbuk_geo.json', callback);
	    }
	};    
	
	require('echarts/util/mapData/params').params.jeonnam = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/jeonnam_geo.json', callback);
	    }
	}; 
}

function setMdtRatio(data){
	if (data == undefined){
		data = {};
		data.nrmltToday = '0';
		data.nrmltBfrt = '0';
		data.warnToday = '0';
		data.warnBfrt = '0';
		data.troblToday = '0';
		data.troblBfrt = '0';
	}
	
	var sHtml = '';
	sHtml += '<table class="tblWgt tp01" summary="수신율별로 금일과 전일의 운행차량 댓수를 보여 준다.">';
	sHtml += '<caption>수신율별 운행차량</caption>';
	sHtml += '<colgroup>';
	sHtml += '	<col width="*" />';
	sHtml += '	<col width="60" />';
	sHtml += '	<col width="70" />';
	sHtml += '</colgroup>';
	sHtml += '<thead>';
	sHtml += '	<tr>';
	sHtml += '		<th scope="col">수신율</th>';
	sHtml += '		<th scope="col" colspan="2">운행차량</th>';
	sHtml += '	</tr>';
	sHtml += '</thead>';
	sHtml += '<tbody>';
	sHtml += '	<tr class="tpG">';
	sHtml += '		<th scope="row" rowspan="2">95% 이상</th>';
	sHtml += '		<td class="day">금일</td>';
	if (data == null)
		sHtml += '		<td>0</td>';
	else
		sHtml += '		<td>'+data.nrmltToday+'</td>';
	sHtml += '	</tr>';
	sHtml += '	<tr class="tpG">';
	sHtml += '		<td class="day">전일</td>';
	if (data == null)
		sHtml += '		<td>0</td>';
	else
		sHtml += '		<td>'+data.nrmltBfrt+'</td>';
	sHtml += '	</tr>';
	sHtml += '	<tr class="tpY">';
	sHtml += '		<th scope="row" rowspan="2">85~94%</th>';
	sHtml += '		<td class="day">금일</td>';
	if (data == null)
		sHtml += '		<td>0</td>';
	else
		sHtml += '		<td>'+data.warnToday+'</td>';
	sHtml += '	</tr>';
	sHtml += '	<tr class="tpY">';
	sHtml += '		<td class="day">전일</td>';
	if (data == null)
		sHtml += '		<td>0</td>';
	else
		sHtml += '		<td>'+data.warnBfrt+'</td>';
	sHtml += '	</tr>';
	sHtml += '	<tr class="tpR">';
	sHtml += '		<th scope="row" rowspan="2">85% 이하</th>';
	sHtml += '		<td class="day">금일</td>';
	if (data == null)
		sHtml += '		<td>0</td>';
	else
		sHtml += '		<td>'+data.troblToday+'</td>';
	sHtml += '	</tr>';
	sHtml += '	<tr class="tpR">';
	sHtml += '		<td class="day">전일</td>';
	if (data == null)
		sHtml += '		<td>0</td>';
	else
		sHtml += '		<td>'+data.troblBfrt+'</td>';
	sHtml += '	</tr>';
	sHtml += '</tbody>';
	sHtml += '</table>'; 

	return sHtml;
}

function setMdtInfo(data){
	var eHtml = '';
	var eStyle= 'display:none;height:0px;';
	var count = 0;
	if (data == undefined){
		
		var idx = count+1;
		if (count < 5){
			for (idx;idx<=5;idx++){
				eHtml += '<ul id="u'+idx+'" style="height:37px;width:295px;">';	
				eHtml += '<li class="leftPos" ></li>';	
				eHtml += '<li class="middlePos"></li>';	
				eHtml += '<li class="rightPos" ></li>';	
				eHtml += '</ul>';
				count++;
			}		
		}	
		MaxListCount = count;
		CurrentListIdx = 0; 
		
		return eHtml;
	}
	
	$.each(data, function(index){
		count++;
		if (count>5)
			eHtml += '<ul id="ul'+count+'" style="height:37px;width:295px;'+eStyle+'">';	
		else
			eHtml += '<ul id="ul'+count+'" style="height:37px;width:295px;">';
		eHtml += '<li class="leftPos" >'+data[index].rgst_seq+'</li>';	
		eHtml += '<li class="middlePos">'+data[index].mtnof_nm+'</li>';	
		eHtml += '<li class="rightPos" >'+data[index].insr_modl_nm+'</li>';	
		eHtml += '</ul>';
		
	});  
	
	var idx = count+1;
	if (count < 5){
		for (idx;idx<=5;idx++){
			eHtml += '<ul id="u'+idx+'" style="height:37px;width:295px;">';	
			eHtml += '<li class="leftPos" ></li>';	
			eHtml += '<li class="middlePos"></li>';	
			eHtml += '<li class="rightPos" ></li>';	
			eHtml += '</ul>';
			count++;
		}		
	}	
	MaxListCount = count;
	CurrentListIdx = 0; 
	
	return eHtml;
}

function setMdtMap(data){
	var option = Options;
	
	var geo_coord = {};
	var data_line = [];
	var data_point = [];
	var oldDept = '';
	
	if (data == undefined){
		option.title.text = DeptName;
		option.series[0].mapType = DeptJson;
		option.series[0].geoCoord = geo_coord;
		option.series[1].mapType = DeptJson;
		option.series[1].markLine.data = data_line;
		option.series[1].markPoint.data = data_point;
		
		return option;
	}
	
	$.each(data, function(index){
		var p = new Proj4js.Point(data[index].hdqr_xcord,data[index].hdqr_ycord);
        Proj4js.transform(proj5186, proj4326, p);
        var hdqr_xcord = p.x;
        var hdqr_ycord = p.y; 
		
		if (oldDept != data[index].hdqr_nm){
			geo_coord[data[index].hdqr_nm] = [hdqr_xcord,hdqr_ycord];
			oldDept = data[index].hdqr_nm;	    				
		}
		
		var p1 = new Proj4js.Point(data[index].xcord,data[index].ycord);
        Proj4js.transform(proj5186, proj4326, p1);
        var xcord = p1.x;
        var ycord = p1.y;         
        
		geo_coord[data[index].rgst_seq] = [xcord, ycord];
			    			
		var linesubdata = [];
		
		var subObj1 = {};
		var subObj2 = {};

		subObj1.name = data[index].hdqr_nm;
		linesubdata.push(subObj1);
		subObj2.name = data[index].rgst_seq;
		subObj2.value = data[index].recptnRatio;
		linesubdata.push(subObj2);
		
		data_line.push(linesubdata);
		
		var subObj3 = {};
		subObj3.name = data[index].rgst_seq;
		subObj3.value = data[index].recptnRatio;
		
		data_point.push(subObj3);	    	
	});
	
	option.title.text = DeptName;
	option.series[0].mapType = DeptJson;
	option.series[0].geoCoord = geo_coord;
	option.series[1].mapType = DeptJson;
	option.series[1].markLine.data = data_line;
	option.series[1].markPoint.data = data_point;
	
	return option;
}