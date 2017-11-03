/**
 * 
 */

var map;
var _layers;
//Proj4js.defs["EPSG:5186"] = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +units=m +no_defs";
//Proj4js.defs["EPSG:5174"] = "+proj=tmerc +lat_0=38 +lon_0=127.0028902777778 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +towgs84=-115.80,474.99,674.11,1.16,-2.31,-1.63,6.43 +units=m +no_defs";
//Proj4js.defs["EPSG:900913"]= "+title=GoogleMercator +proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +no_defs";
var proj900913 = new Proj4js.Proj('EPSG:900913');
//Google Mercator: 구글지도/빙지도/야후지도/OSM 등 에서 사용중인 좌표계 - EPSG:3857(공식), EPSG:900913(통칭)
var proj4326 = new Proj4js.Proj('EPSG:4326'); //WGS84 경위도 
//EPSG:4019, EPSG:4737 (Korean 2000) - GRS80 경위도

var proj5186 = new Proj4js.Proj('EPSG:5186'); //*중부원점(GRS80)-falseY:60000
// EPSG:5185 - 서부, EPSG:5187- 동부, EPSG:5188 - 동해
var proj5174 = new Proj4js.Proj('EPSG:5174'); //*보정된 중부원점(Bessel) 오래됨 - KLIS
//EPSG:5173- 서부, EPSG:5175 - 제주, EPSG:5176 - 동부,  EPSG:5177 - 동해

var locationPath = "http://" + location.host + "/total";

//var apiKey = "70422590-7C48-39EF-A154-5BFED346C4A4"; // 183.100.246.83:8080/
var apiKey = "11B20A59-5179-3019-9E5E-AF43EC81AF4B"; // localhost:8080/total/

var geoJson = new ol.format.GeoJSON();

//데이터 가져오기
//setInterval(getData, 1000 * 60 * 3);

//이벤트 오류 제거용 선언
var _facVectorLayer = null;
var draw = new ol.interaction.Draw({
    type: /** @type {ol.geom.GeometryType} */ ('LineString')
});
jQuery(document).ready(function() {
	var safeStyle = function (feature, res) { 
		return new ol.style.Style({
	 	  	image: new ol.style.Icon( ({    			   
	 	  		anchor: [0.5, 0.5],
			    scale : 0.5,
		 	    anchorXUnits: 'fraction',
		 	    anchorYUnits: 'fraction',//'pixels',
		 	    opacity: 1,
		 	    src: locationPath + '/images/gis/grade_'+ feature.grade.trim() +'.png'
			})),
			text: createTextStyle(feature, res)
		});;    	
    };
    
    var sidoStyle = new ol.style.Style({
        fill: new ol.style.Fill({
            color: 'rgba(255, 128, 0, 0.1)'
        }),
        stroke: new ol.style.Stroke({
            color: 'rgba(255, 128, 0, 1)',
            width: 2,
            lineDash: [4]
        }),
        //image: new ol.style.Circle({
        //    radius: 3,
        //    fill: new ol.style.Fill({
        //        color: '#ffcc33'
        //    })
        //})
    });
    
    var createTextStyle = function(feature, resolution) {
        var align = 'left';//Hide,Normal,Shorten,Wrap
        var baseline = 'middle';//alphabetic,bottom,hanging, ideographic, middle, top
        var size = '14px';//12px
        var offsetX = 15;//parseInt(dom.offsetX.value, 10);//0
        var offsetY = -2;//parseInt(dom.offsetY.value, 10);//0
        var weight = 'bold';//bold, normal
        var rotation = 0.0;//0, 0.785398164(45도), 1.570796327(90도)        
        var fillColor = '#ffffff';//#aa3300
        var outlineColor = '#0000ff';//#ffffff
        var outlineWidth = 2;//parseInt(dom.outlineWidth.value, 10);//3
    	var facName = '';
    	if (resolution <= 76){
    		facName = feature.facName;    		
    		if (resolution <=9)
    			size = '20px';
    	}    	
    	var font = weight + ' ' + size + ' ' + '맑은 고딕';//Arial, Courier New, Verdana    		   	
    		
        return new ol.style.Text({
          textAlign: align,
          textBaseline: baseline,
          font: font,
          text: facName,
          fill: new ol.style.Fill({color: fillColor}),
          stroke: new ol.style.Stroke({color: outlineColor, width: outlineWidth}),
          offsetX: offsetX,
          offsetY: offsetY,
          rotation: rotation
        });
      };
    
    _safeVector = new ol.layer.Vector({
        name: 'safeVector',
        source: new ol.source.Vector(),
        style: safeStyle
    });	
    
	_layers = [
		//new infra.layer.VworldBase({visible:false}),
		new infra.layer.VworldSatellite({visible:false}),
		//new infra.layer.VworldHybrid({visible:false}),	
		new infra.layer.MapGuideMap({
			name: "test_bonbu",			
			visible:true,	
			mapDefinition:'Library://GoogleTM/HI_Nex-Man/Maps/test_bonbu.MapDefinition',			
			autoRefreshInterval: 1000 * 60 * 3,
			//serverPath : "http://183.100.246.83:8008/mapserver2016/",
			//serverPath : "http://192.168.218.8:8008/mapserver2016/",
			serverPath : "http://itfsvr.iptime.org:10201/mapserver2016/",
			serverVersion : 2016
			//mapCommandUrl: "http://rnd.krinfra.co.kr/AIMSApp/Handler.ashx"
		}), 		
		new infra.layer.MapGuideMap({
			name: "test_road",
			visible:true,
			mapDefinition:'Library://GoogleTM/HI_Nex-Man/Maps/test_road.MapDefinition',
			autoRefreshInterval: 1000 * 60 * 3,
			//serverPath : "http://183.100.246.83:8008/mapserver2016/",
			//serverPath : "http://192.168.218.8:8008/mapserver2016/",
			serverPath : "http://itfsvr.iptime.org:10201/mapserver2016/",
			serverVersion : 2016
			//mapCommandUrl: "http://rnd.krinfra.co.kr/AIMSApp/Handler.ashx"
		}), 		
		new infra.layer.MapGuideMap({
			name: "test",
			visible:false,
			mapDefinition:'Library://GoogleTM/HI_Nex-Man/Maps/test.MapDefinition',
			autoRefreshInterval: 1000 * 60 * 3,
			//serverPath : "http://183.100.246.83:8008/mapserver2016/",
			serverPath : "http://itfsvr.iptime.org:10201/mapserver2016/",
			serverVersion : 2016
			//mapCommandUrl: "http://rnd.krinfra.co.kr/AIMSApp/Handler.ashx"
		}), 
        //new infra.layer.VworldJijuk({visible:false, apiKey: getServerPath("KEY")}), 
              
        new ol.layer.Vector({
            name: 'tunnel',
            source: new ol.source.Vector({}),
            visible: true
        }),
        new ol.layer.Vector({
            name: 'electric',
            source: new ol.source.Vector({}),
            visible: true
        }),
        new ol.layer.Vector({
            name: 'slope',
            source: new ol.source.Vector({}),
            visible: true
        }),
        new ol.layer.Vector({
            name: 'building',
            source: new ol.source.Vector({}),
            visible: true
        }),
        new ol.layer.Vector({
            name: 'sido',
            source: new ol.source.Vector({}),
            style: sidoStyle,
            visible: true
        }),
        _safeVector
        
	];
	
	var extent = [13867518.905289,3911131.974575,14625774.635093,4764781.167161];
	//var extent = [0,50000,550000,650000];
    extent[0] -= 2000000;
    extent[1] -= 2000000;
    extent[2] += 2000000;
    extent[3] += 2000000;    
    
    var resolutions = [
		//156543.03392804097,
		//78271.51696402048,
		//39135.75848201024,
		//19567.87924100512,
		//9783.93962050256,
		4891.96981025128,
		2445.98490512564,
		1222.99245256282,
		611.49622628141,
		305.748113140705,
		152.8740565703525,
		76.43702828517625,
		38.21851414258813,
		19.109257071294063,
		9.554628535647031,
		4.777314267823516,
		2.388657133911758,
		1.194328566955879,
		0.5971642834779395,
		0.29858214173896974
		//0.14929107086948487,
		//0.07464553543474243,
		//0.03732276771737122,
		//0.01866138385868561,
		//0.009330691929342804,
		//0.004665345964671402,
		//0.002332672982335701,
		//0.0011663364911678505,
		//0.0005831682455839253
		];

    map = new infra.Map({
        target: 'mapContent',
        layers: _layers,
        viewExtent: extent,
        viewResolutions: resolutions,
        pointColor: [255,0,0],
    });
    

    // 추가 컨트롤
//    map.addControl(new ol.control.ZoomSlider());
//    map.addControl(new ol.control.ScaleLine());
//    map.addControl(new infra.control.Measure({
//        start:function(type){jQuery("#open_explanation").show();},
//        finish:function(type, value){jQuery("#open_explanation").hide();},
//        clear:function(type){jQuery("#open_explanation").hide();}
//    }));
//    map.addControl(new infra.control.ViewRotate());
        
    setTimeout($.proxy(function () {
    	showCar();
	  }, this), 4000);
    
    setTimeout($.proxy(function () {
    	showBuildings();
	  }, this), 4000);        
    
    map.getView().animate({
        zoom: 3
    });
    
    
    
});

function showCar(){
	var building_point = [];
	eventFinish = false;
//	eventFinish = false;
//	'경기지역본부': [127.1548,37.5143],					                
//    '경기차량1': ,
//    '경기차량2': [,
//    '경기차량3': ,					                
//    '경기차량4': ,	
//    '경기차량5': ,				                
//    '강원지역본부': [127.9520,37.3997],
//    '강원차량1': ,
//    '강원차량2': ,
//    '강원차량3': ,  					                
//    '강원차량4': ,					                					                	
//    '강원차량5': ,	
//    '강원차량6': ,	
//    '강원차량7': ,  					                
//    '충청지역본부': [127.4484,36.3622],
//    '충청차량1': ,
//    '충청차량2': ,
//    '충청차량3': ,					                
//    '중부지역본부': [127.0899,37.3377],
//    '호남지역본부': [126.8866,35.2607],
//    '호남차량1': ,
//    '호남차량2': ,
//    '호남차량3': ,
//    '호남차량4': ,
//    '경북지역본부': [128.5377,35.9350],
//    '경북차량1': ,
//    '경북차량2': ,
//    '경북차량3': ,
//    '경북차량4': ,
//    '경남지역본부': [128.7010,35.2847],					                					                
//    '본사': [128.1890,36.1289]	
	
	map.getLayer("building").getSource().clear();
	
	building_point.push([127.1548,37.5143]);
	building_point.push([127.9520,37.3997]);
	building_point.push([127.4484,36.3622]);
	building_point.push([127.0899,37.3377]);
	building_point.push([126.8866,35.2607]);
	building_point.push([128.5377,35.9350]);
	building_point.push([128.7010,35.2847]);
	
	for(var nIdx = 0;nIdx < building_point.length;nIdx++){
		var p = new Proj4js.Point(building_point[nIdx][0],building_point[nIdx][1]);
		Proj4js.transform(proj4326, proj900913, p);
		
//		var buildingFeature = new ol.Feature({
//			geometry: new ol.geom.Point([p.x,p.y]),
//			id : "building"
//		});
		
		//var buildingFeature = new ol.Feature(new ol.geom.Point([p.x,p.y]));
		var buildingFeature = new ol.Feature({
			geometry: new ol.geom.Point([p.x,p.y])
		});
		var locationPath1 = "http://" + location.host + "/total";
		var sStyle = function (feature, res) { 
			return new ol.style.Style({
		 	  	image: new ol.style.Icon( ({    			   
		 	  		anchor: [0.5, 0.5],
				    scale : 0.03,
			 	    anchorXUnits: 'fraction',
			 	    anchorYUnits: 'fraction',//'pixels',
			 	    opacity: 1,
			 	    src: locationPath1 + '/images/building.png'			 	    
				}))			
			
			//,
				//text: createTextStyle(feature, res)
			});    	
	    };
		
//		var sStyle = new ol.style.Style({
//	        image: new ol.style.Circle({
//	          radius: 100,
//	          snapToPixel: false,
//	          stroke: new ol.style.Stroke({
//	            color: 'rgba(255,0,0,1)',
//	            width: 0.25 + 1
//	          })
//	        })
//	      });
	    
	    buildingFeature.setStyle(sStyle);
	    map.getLayer("building").getSource().addFeature(buildingFeature);
		
	    
	}
	map.getLayer('sido').getSource().clear();	
//	querySidoData('11');
//	querySidoData('27'); //대구
//	querySidoData('26');
//	querySidoData('29');
//	querySidoData('30');
//	querySidoData('31');
//	querySidoData('28');
//	querySidoData('41');
//	querySidoData('42'); //강원	
//	querySidoData('43');
//	querySidoData('44');	
//	querySidoData('47');
//	querySidoData('46');
//	querySidoData('45');	
//	querySidoData('48');	
//	querySidoData('36');	
	
}

function showBuildings(){
	var building_point = [];
	eventFinish = false;
	
	building_point.push([127.1419,37.6156]);
	building_point.push([127.1655,37.5731]);
	building_point.push([127.2451,37.4781]);
	building_point.push([126.6438,37.4046]);
	building_point.push([127.0567,37.0247]);
	building_point.push([127.9929,37.4131]);
	building_point.push([128.3062,37.5430]);
	building_point.push([128.6764,37.9640]);
	building_point.push([128.3025,37.7615]);
	building_point.push([128.0567,38.0247]);
	building_point.push([128.6462,38.0438]);
	building_point.push([129.0911,37.3346]);
	building_point.push([126.5839,36.5250]);
	building_point.push([127.9865,36.8145]);
	building_point.push([127.5120,36.1216]);
	building_point.push([127.0874,34.8156]);
	building_point.push([127.1075,36.0095]);
	building_point.push([127.5506,35.4866]);
	building_point.push([127.6563,35.8750]);
	building_point.push([128.6630,35.9130]);
	building_point.push([128.9224,35.9017]);
	building_point.push([128.1922,35.7943]);
	building_point.push([128.5877,36.3978]);
	
	var building_pointRed = [];
	var building_pointGreen = [];
	var building_pointYellow = [];
	var building_pointOrange = [];
	for(var nIdx = 0;nIdx < building_point.length;nIdx++){
		var p = new Proj4js.Point(building_point[nIdx][0],building_point[nIdx][1]);
		Proj4js.transform(proj4326, proj900913, p);		
		var random = makeRandom(80,100);		
		if (random<=85){
			building_pointRed.push([p.x, p.y]);
			flashRed(building_pointRed, random/20);			
			building_pointRed = [];
		}else if (random<90 && random>=85){
			building_pointOrange.push([p.x, p.y]);
			flashOrange(building_pointOrange, random/20);
			building_pointOrange = [];
		}else if (random<95 && random>=90){
			building_pointYellow.push([p.x, p.y]);
			flashYellow(building_pointYellow, random/20);
			building_pointYellow = [];
		}else{			
			building_pointGreen.push([p.x, p.y]);
			flashGreen(building_pointGreen, random/20);
			building_pointGreen = [];			
		}		
	}	
	
	
		
	//flashRed(building_pointRed);
	//flashGreen(building_pointGreen);
	//flashYellow(building_pointYellow);
	//flashOrange(building_pointOrange);	
}

function makeRandom(min, max){
    var RandVal = Math.random() * (max- min) + min;
    return Math.floor(RandVal);
}


function getServerPath(param){
	switch (location.host) {
        case "211.232.85.231:8080/":
        	this.AIMS_SERVER_PATH = 'http://rnd.krinfra.co.kr:8008/mapserver2016/';
            this.vworldApiKey = '5192AB27-A50C-3A52-926D-1526F42D9304';
            this.AIMS_APP_PATH = 'http://rnd.krinfra.co.kr:80/crismap/MapApp.aspx';
            break;
        case "rnd.krinfra.co.kr:8080":
        	this.AIMS_SERVER_PATH = 'http://rnd.krinfra.co.kr:8008/mapserver2016/';
        	this.vworldApiKey = '0EE3BADC-48BE-3E88-AF84-98693E6B5833';    	
        	this.AIMS_APP_PATH = 'http://rnd.krinfra.co.kr:80/crismap/MapApp.aspx';
        	break;
        case "localhost:8080" : 
        	this.AIMS_SERVER_PATH = 'http://rnd.krinfra.co.kr:8008/mapserver2016/';
        	this.vworldApiKey = '363E734A-C09E-3808-A142-7DA35741A212';
        	this.AIMS_APP_PATH = 'http://rnd.krinfra.co.kr:80/crismap/MapApp.aspx';
        	break;
        default:
        	this.AIMS_SERVER_PATH = 'http://rnd.krinfra.co.kr:8008/mapserver2016/';
        	this.vworldApiKey = '5192AB27-A50C-3A52-926D-1526F42D9304';
        	this.AIMS_APP_PATH = 'http://rnd.krinfra.co.kr:80/crismap/MapApp.aspx';
	}

    if(param == "PATH")
    	return this.AIMS_SERVER_PATH;
    else if(param == "KEY")
    	return this.vworldApiKey;
    else if(param == "APATH")
    	return this.AIMS_APP_PATH;
    else 
        console.info("Param don't support.");
}


function getData(){
	jQuery("#box_03 .tableWrap *").remove();
	jQuery("#box_02 .tableWrap *").remove();
	jQuery("#box_03 .tableWrap *").remove();
	getWaterRateList();
	getDroughtList();
	getFloodList();
}

function getWaterRateList(){

	jQuery("#box_01 .tableWrap *").remove();
	var url = locationPath + "/main/WaterAreaSupplyInfo.do";
	jQuery.ajax({
		url : url,
		type:"POST",
		async:true,
		dataType : "json",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success:function(data){
			var total = "<table class='normal_table'><tr><th>지역</th><th>저수율(%)</th><th>시설수</th></tr>";
			var inHtml = "";
			jQuery.each(data, function(index){
				//var condition = Math.floor(Math.random() * 100) + 1;
				if(data[index].area == "전국"){
					total += "<tr><td>" + data[index].area+"</td><td>" + getWaterRateCondition(data[index].rate) + ' '+data[index].rate + "%</td><td>" + data[index].value + "</td><tr>";
				}else {
					inHtml += "<tr><td>" + data[index].area+"</td><td>" + getWaterRateCondition(data[index].rate) + ' '+data[index].rate + "%</td><td>" + data[index].value + "</td><tr>";
				}
				
			});
			inHtml += "</table>";
			inHtml = total + inHtml;
			jQuery("#box_01 .tableWrap").append(inHtml);
		}
	});
}

function getDroughtList(){
	jQuery("#box_02 .tableWrap *").remove();
	var url = locationPath + "/main/selectDroughtList.do";
	jQuery.ajax({
		url : url,
		type:"POST",
		async:true,
		dataType : "json",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success:function(data){
			var inHtml = "<table class='normal_table'><tr><th style='width:25%'>시도</th><th>시군</th><th>읍면동</th><th>가뭄<br />지수</th><th style='width:25%'>비고</th></tr>";
			jQuery.each(data, function(index){
				inHtml += "<tr><td>" + data[index].sidoname+"</td><td>" +  data[index].sigunname + "</td><td>" + data[index].upmyun + "</td><td>-" + data[index].jisu + "</td><td>" + getDroughtIndex(data[index].jisu) + "</td></tr>";
			});
			inHtml += "</table>";
			jQuery("#box_02 .tableWrap").append(inHtml);
		}
	});
}

function getFloodList(){
	jQuery("#box_03 .tableWrap *").remove();
	var url = locationPath + "/main/selectFloodList.do";
	jQuery.ajax({
		url : url,
		type:"POST",
		async:true,
		dataType : "json",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success:function(data){
			var inHtml = "<table class='normal_table'><tr><th style='width:23%'>시도</th><th>시군</th><th>읍면동</th><th >홍수<br />지수</th><th style='width:27%'>비고</th></tr>";
			jQuery.each(data, function(index){
				inHtml += "<tr><td>" + data[index].sidoname+"</td><td>" +  data[index].sigunname + "</td><td>" + data[index].upmyun + "</td><td>" + data[index].jisu + " %</td><td>" + getFloodIndex(data[index].jisu) + "</td></tr>";
			});
			
			inHtml += "</table>";
			jQuery("#box_03 .tableWrap").append(inHtml);
		}
	});
}

function getWaterRateCondition(index){
	var rvow = index * 1;
	if (rvow == null) {
		return "<div class='box_gray'></div>";
	} else if (rvow < 30) {
		return "<div class='box_red'></div>";//비상
	} else if (rvow < 50) {
		return "<div class='box_orange'></div>";//위험
	} else if (rvow < 70) {
	    return "<div class='box_yellow'></div>";//주의
	} else if (rvow < 90) {
	    return "<div class='box_green'></div>";//관심
	} else if (rvow >= 90) {
	    return "<div class='box_blue'></div>";//양호
	} else {
	    return "<div class='box_red'></div>";
	} 
}

function getDroughtIndex(index){
	var num = index * 1;
	if(num == 1){
		return "<div class='box_green'></div>약한가뭄";
	} else if(num == 2){
		return "<div class='box_yellow'></div>보통가뭄";
	} else if(num == 3){
		return "<div class='box_orange'></div>심한가뭄";
	} else if(num == 4){
		return "<div class='box_red'></div>극한가뭄";
	} else{
		return "";
	}
}

function getFloodIndex(index){
	var num = index * 1;
	if(num > 90){
		return "<div class='box_brownn'></div>범람주의";
	} else if(num <= 90 && num >70){
		return "<div class='box_red'></div>홍수경보";
	} else if(num <= 70 && num >50){
		return "<div class='box_orange'></div>홍수<br />주의보";
	} else {
		return "";
	}
}



function togglesisul(){

	var className = $("#cTyphoonInfo_show").attr('class');
	var cWidth;
	var cLeft;
	if (className == "btn_open"){
		$("#cTyphoonInfo_show").attr('class', 'btn_close');
		$( "#idtyphoonBox" ).fadeOut();
		$( "#id_normal_tablewrap" ).fadeOut();
		$( "#id_h3" ).fadeOut();		
		cWidth ='0px';
		cLeft ='284px';
	}else
	{
		$("#cTyphoonInfo_show").attr('class', 'btn_open');
		$( "#idtyphoonBox" ).fadeIn();
		$( "#id_normal_tablewrap" ).fadeIn();
		$( "#id_h3" ).fadeIn();
		cWidth ='300px';	
		cLeft ='584px';
	}	
	$( "#sisulsearch" ).animate({
	    width : cWidth
	});	
	$( "#cTyphoonInfo_show" ).animate({
	    left : cLeft
	});
}

// 태풍정보 조회
function searchTyphoonCreatePolygon(unsafedata){
	map.getLayer("vector").getSource().clear();
	var url = locationPath + "/gis/SearchTyphoon.do" ;
	var data = {"typ_seq" : '24',
			"typ_name" : ''};
	jQuery.ajax({
		url : url,
		type:"POST",
		data : data,
		async:true,
		dataType : "json",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success:function(data){
			var typhoonDraw = new infra.TyphoonDraw(map.getLayer("vector"));
			var containFac = typhoonDraw.CreatePolygon(data, unsafedata);
			
			jQuery('#idtyphoonBox *').remove();		
			var Inhtml = '<h5>태풍정보</h5>';
			Inhtml += '<dl>';
			Inhtml += '<dt> 태풍이름</dt>';
			Inhtml += '<dd>'+data[0].typ_seq+'호 태풍 '+data[0].typ_en+'</dd>';
			Inhtml += '<dt> 태풍위치</dt>';
			Inhtml += '<dd>'+data[0].typ_loc+'</dd>';
			Inhtml += '</dl>';			
			jQuery("#idtyphoonBox").append(Inhtml);			
			
			jQuery('#divTypoonRouteFac *').remove();			
			var Inhtml = '<colgroup>';
			Inhtml += '<col widht="20%">';
			Inhtml += '<col widht="16%">';
			Inhtml += '<col widht="16%">';
			Inhtml += '<col widht="16%">';
			Inhtml += '<col widht="16%">';
			Inhtml += '<col widht="16%">';
			Inhtml += '</colgroup>';
			
			Inhtml += '<tr><th>시도</th>';
			Inhtml += '<th>시군구</th><th>시설<br />종류</th><th>시설명</th>';
			Inhtml += '<th>안전<br />등급</th><th>위치<br />보기</th></tr>';
			
			
			jQuery("#divTypoonRouteFac").append(Inhtml);
			
			var nidx =0;
			while (containFac.length>0){					
					
					if (containFac[nidx].input_type == '1'){
						Inhtml = '<tr class="rollOverHandmain"  bgcolor="#ffffe0">';	
					}else
					{
						Inhtml = '<tr class="rollOverHandmain"  >';
					}
					Inhtml += '<td>'+containFac[nidx].sido_name +'</td>'; //시도
					Inhtml += '<td>'+containFac[nidx].sigun_name+'</td>'; //시군
					Inhtml += '<td>'+containFac[nidx].fac_type_name+'</td>'; // 종류
					Inhtml += '<td>'+containFac[nidx].fac_name+'</td>'; // 시설명
					//Inhtml += '<td>'+'<a href="#LINK" onclick=javascript:ShowContentsPopup("'+data[nidx].stat_year +'","'+data[nidx].fac_code +'","'+ year +'","'+ data[nidx].fac_type +'","'+ data[nidx].fac_type_name +'")><img alt="내용보기" src="cris/image/btn_view.png" /></a> '+'</td>';
					Inhtml += '<td>'+containFac[nidx].grade+'</td>'; // 등급
					
					if ((containFac[nidx].coordX != '' && containFac[nidx].coordY != '') &&
							(containFac[nidx].coordX != null && containFac[nidx].coordY != null)){
						var p = new Proj4js.Point(containFac[nidx].coordX, containFac[nidx].coordY);
						
						if (containFac[nidx].stat_year == '0'){									
							Inhtml += '<td nowrap="nowrap">'+'<a href="#LINK" onclick="ViewGIS(' + "'" +p.x+ "','" +p.y+"','" + containFac[nidx].fac_code + "' " + ')"><img alt="위치검색" src="cris/image/btn_mappin.png" /></a> '+'</td>'; //위치검색
						}else
						{		
							Inhtml += '<td nowrap="nowrap">'+'<a href="#LINK" onclick="ViewGIS(' + "'" +p.x+ "','" +p.y+"','" + containFac[nidx].fac_code + "' " + ')"><img alt="위치검색" src="cris/image/btn_mappin.png" /></a> '+'</td>'; //위치검색
						}					
					}

					Inhtml += '</tr>';
					jQuery("#divTypoonRouteFac").append(Inhtml);	

					nidx++;
					if (containFac[nidx] == null)
						break;										
			}
		}
	});
}

var indexroute = 0;
//태풍경로상 안전하지 않는 시설물 리스트 조회
function searchUnSafefacilities(){
	var url = locationPath + "/main/selectGisMainUnSafefacilities.do";
	var data = jQuery("form[name=safeCheckVO]").serialize();
	jQuery.ajax({
		url : url,
		type:"POST",
		data : data,
		async:true,
		dataType : "json",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success:function(data){	
			indexroute = 0;
			Typhoonroute=[];//태풍경로
			Typhoonrad=[];//태풍반경 
			searchTyphoonCreatePolygon(data);
			drawTyphoonRouteshow(true);			
		},
		failure:function(req){
			//alert("저장 작업에 실패하였습니다. 다시 시도하여 주시기 바랍니다. 문제가 계속될 경우 시스템 담당자에 문의하시기 바랍니다.");
		}		
    });
}


var duration = 1500;
var radtime =0;
var fTime;
var sTime;
var bAnimationtimecheck = true;
var routespeed = 1;

function flashTyphoon(feature, rad) {
    var start = new Date().getTime();
    var listenerKey=0;

    function animate(event) {
      var vectorContext = event.vectorContext;
      var frameState = event.frameState;
      var flashGeom = feature.getGeometry().clone();
      var elapsed = frameState.time - start;
      var elapsedRatio = elapsed / duration;
      // radius will be 5 at start and 30 at end.
      
    	  
      var radius = ol.easing.easeOut(elapsedRatio) * 100 + 1;
      var opacity = ol.easing.easeOut(1-elapsedRatio)/2;
     
      var rColor = 23;
      var gColor = 45;
      var bColor = 165;

      var cStyle = new ol.style.Style({
    	  
        image: new ol.style.Circle({
          radius: radius,
          snapToPixel: false,
          stroke: new ol.style.Stroke({
            color: 'rgba(' + rColor + ', ' + gColor + ', ' + bColor + ', ' + opacity + ')',
            width: 10 * opacity
          })
        })
      });  
      
      var circleStyle = new ol.style.Style({
  			fill: new ol.style.Fill({
        			color: 'rgba(255, 0, 0, '+opacity+')'
      		}),
  	    	stroke: new ol.style.Stroke({
  	      		color: "#FF0000",
  	      		width: 1
  	    	})
  	  });     
     
      vectorContext.setStyle(cStyle);
      vectorContext.drawGeometry(flashGeom);
          
      if (elapsed > duration) {
        ol.Observable.unByKey(listenerKey);
        return;
      }
      // tell OpenLayers to continue postcompose animation
      map.render();
    }
    listenerKey = map.on('postcompose', animate);
  }

var TyphoonPolygonidx = 0;
var TyphoontimerStartImage = null;

var circletyStyle = new ol.style.Style({
	fill: new ol.style.Fill({
  			color: 'rgba(255, 000, 000, 0.2)'
		}),
    	stroke: new ol.style.Stroke({
      		color: "#FF0000",
      		width: 2
    	}),
    	image: new ol.style.Circle({
      		radius: 4,
      		fill: new ol.style.Fill({
			color: '#ff0000'
      		})
    	})
});

var circletypStyle = new ol.style.Style({
	image: new ol.style.Circle({
  		radius: 2,
  		fill: new ol.style.Fill({
  			color: 'rgba(239,174,180, 0.5)'
  		}),
    	stroke: new ol.style.Stroke({
      		color: "#FF0000",
      		width: 1
    	})
	})
});

var locationPath = "http://" + location.host + "/cris";

var icontyStyle = new ol.style.Style({
	  	image: new ol.style.Icon(/** @type {olx.style.IconOptions} */ ({
    anchor: [0.5, 55],
	    anchorXUnits: 'fraction',
	    anchorYUnits: 'pixels',
	    scale : 0.10,
	    opacity: 0.75,
	    src: locationPath+'/images/gis/TD.gif'
	  	}))
});

var linetyStyle = new ol.style.Style({
	fill: new ol.style.Fill({
			color: 'rgba(239,174,180, 0.2)'
	}),
	stroke: new ol.style.Stroke({
  		//color: "#2237F4",
		color: 'rgba(239,174,180, 1)',//"#ff0000",
  		width: 1
	}),
	image: new ol.style.Circle({
  		radius: 4,
  		fill: new ol.style.Fill({
		color: '#ff0000'
  		})
	})
});

var cfeature;
function drawTyphoonRoute()
{
	if (TyphoonPolygonidx >= Typhoonroute.length) 
	{
		drawTyphoonRouteshow(false);
		return;
	}
	map.getLayer("Typhoon").getSource().clear();
	map.getLayer("vector").getSource().clear();
		
	var cbidx = Typhoonroute.length - TyphoonPolygon.length;
		
	var idx = TyphoonPolygonidx;
	TyphoonPolygonidx++;	
	
	var polygonidx=0;
	for(var i = 0; i < Typhoonroute.length; i++){	
		
		if (i > idx)
			continue;
		
		var circleFeature = new ol.Feature({
			geometry: new ol.geom.Circle(Typhoonroute[i], Typhoonrad[i])
		});

		circleFeature.setStyle(circletyStyle);
		map.getLayer("vector").getSource().addFeature(circleFeature);
		
		var iconFeature = new ol.Feature({
		 	  geometry: new ol.geom.Point(Typhoonroute[i])
		});
		
		if (Typhoonrad[i] < 2)
		{
			iconFeature.setStyle(icontyStyle);
			map.getLayer("vector").getSource().addFeature(iconFeature);	
		}else
		{	
			iconFeature.setStyle(circletypStyle);
			map.getLayer("vector").getSource().addFeature(iconFeature);
			
			if (i == idx){
				if (TyphoonPolygon.length <= polygonidx)
					polygonidx = TyphoonPolygon.length-1;
				
				var tfeature = TyphoonPolygon[polygonidx];
				tfeature.setId("route");
				map.getLayer("Typhoon").getSource().addFeature(tfeature);
				cfeature = tfeature;
			}			
			polygonidx++;			
		}
		if (i == idx)
			flashTyphoon(iconFeature, Typhoonrad[i]);
		if (i==0)
			continue;
		var lineFeature = new ol.Feature({
			geometry: new ol.geom.LineString([Typhoonroute[i-1], Typhoonroute[i]]),
			id : "contactLine"
		});
		
		lineFeature.setStyle(linetyStyle);
		map.getLayer("vector").getSource().addFeature(lineFeature);	
		
		
		
	}
}


function drawTyphoonRouteshow(Typhoonshow)
{
	if (Typhoonshow)
    {
		TyphoonPolygonidx = 0;
		TyphoontimerStartImage = setInterval(drawTyphoonRoute, 300);
    } else
    {
        clearInterval(TyphoontimerStartImage);
        
        TyphoontimerStartImage = null;
        flashTyphoonRoute();
    }		
}

var bChanged = false;
function drawTyphoonRoutehighlight(Typhoonshow)
{
	//var rfeature = map.getLayer("Typhoon").getSource().getFeatureById("route");
	var rfeatures = map.getLayer("Typhoon").getSource().getFeatures();
	
	for(var i = 0; i<rfeatures.length;i++)
	{
		rfeature = rfeatures[i]; 
		
		if (rfeature == null || rfeature.getId() != "route")
			continue;
		
		var fStyle = new ol.style.Style({
			fill: new ol.style.Fill({
	            //color: 'rgba(0,189,255,0.2)'//파랑
				//color: 'rgba(255,255,255,0)'//보라
				//color: 'rgba(255,162,0,0)'//주황
				//color: 'rgba(239,174,180,0)'//혼합
				color: 'rgba(222,237,252,0.2)'//혼합
	          }),
	          stroke: new ol.style.Stroke({
	            //color: '#00bdff',//파랑
	        	//color: '#a800ff',//보라
	        	//color: '#ffba00',//주황
	        	//color: '#d71140',//혼합
	        	color: '#2237F4',//혼합	        	
	            width: 2
	          })
		});

		var sStyle = new ol.style.Style({
			  fill: new ol.style.Fill({
	            //color: 'rgba(0,189,255,0.3)'//파랑
				//color: 'rgba(255,255,255,0.2)'//보라
				//color: 'rgba(255,162,0,0.2)'//주황
				//color: 'rgba(239,174,180,0.2)'//혼합
				color: 'rgba(222,237,252,0.3)'//혼합
	          }),
	          stroke: new ol.style.Stroke({
	            //color: '#0084ff',//파랑
	        	//color: '#9600ff',//보라
	        	//color: '#ffba00',//주황
	        	//color: '#d71140',//혼합  
	        	  color: '#2237F4',//혼합	     
	            width: 3
	          })
		});
		
		if (bChanged){
			rfeature.setStyle(fStyle);	
		}else
		{
			rfeature.setStyle(sStyle);	
		}	
	}
	
	
	//rfeature.set('route', item.Title);
	
	bChanged = !bChanged;
}

function flashTyphoonRoute() {
	var start = new Date().getTime();
    var listenerKey;

    function animate(event) {

      var vectorContext = event.vectorContext;
      var frameState = event.frameState;
      
      var flashGeom = cfeature.getGeometry();
      
      var elapsed = frameState.time - start;
      
      if (elapsed > 20000) {
          ol.Observable.unByKey(listenerKey);
          return;
      }
      
      elapsed = elapsed % 1300;
      
      var elapsedRatio = elapsed / 1300;
      //console.info("elapsedRatio : " + elapsedRatio);
      //return;
      // radius will be 5 at start and 30 at end.
      //var radius = ol.easing.easeInOutBounce(elapsedRatio) * 10 + 5;
      //var opacity = ol.easing.easeInOutBounce(1 - elapsedRatio);
      var opacity_stroke = jQuery.easing.easeOutCirc(elapsedRatio);
      var opacity_fill = jQuery.easing.easeInOutBounce(1-elapsedRatio);      
      
      var fStyle = new ol.style.Style({
			 fill: new ol.style.Fill({
				 //color: 'rgba(255,0,0,'+(1-opacity_fill)/4+')'//혼합
				 //color: 'rgba(190,90,0,'+(1-opacity_fill)/4+')'//혼합
				 color: 'rgba(30,120,245,'+(1-opacity_fill)/3+')'//혼합
	          }),
	          stroke: new ol.style.Stroke({
	        	  color: '#ff0000',
	        	width: 7 * opacity_stroke
	          })
		});

      vectorContext.setStyle(fStyle);
      vectorContext.drawGeometry(flashGeom);

      map.render();
    }
    listenerKey = map.on('postcompose', animate);
}

function getPolarDistance(fPoint, lPoint){
	var dX = lPoint[0] - fPoint[0];
	var dY = lPoint[1] - fPoint[1];
	
	var dDist = Math.sqrt(Math.pow(dX,2) + Math.pow(dY,2));
	var dAngle = 0.0;
	if (dDist == 0.0 )
		dAngle = 0.0;
    else
    if (dX == 0.0 && dY > 0.0) 
    	dAngle = Math.PI / 2;
    else
    if (dX == 0.0 && dY < 0.0) 
    	dAngle = 3 * Math.PI / 2;
    else
    if (dY == 0.0 && dX < 0.0) 
    	dAngle = Math.PI;
	else
	if (dY == 0.0 && dX > 0.0) 
		dAngle = 0.0;
  else
  {
	  dAngle = Math.atan(Math.abs(dY) / Math.abs(dX));
	  
      if (dX < 0.0 && dY > 0.0) 
      	dAngle = Math.PI - dAngle;
      if (dX < 0.0 && dY < 0.0) 
      	dAngle = Math.PI + dAngle;
      if (dX > 0.0 && dY < 0.0) 
      	dAngle = 2 * Math.PI - dAngle;
      if (dAngle < 0.0) 
      	dAngle = dAngle + 2 * Math.PI;
      if (dAngle >= 2 * Math.PI) 
      	dAngle = dAngle - 2 * Math.PI;
  }
	dAngle = HODO(dAngle);
	
	var Result =[];
	Result[0]=dDist;
	Result[1]=dAngle;
	
	return Result;
}

function getCoordinatesIncrease(dDist, dAngle){
	while (dAngle > 360.0){
		dAngle = dAngle - 360.0;
	}
	
	while (dAngle < 0.0){
		dAngle = dAngle + 360.0;
	}
	
	var dX = dDist * Math.cos(RAD(dAngle));     
	var dY = dDist * Math.sin(RAD(dAngle));
	
	var Result =[];
	Result[0]=dX;
	Result[1]=dY;
	
	return Result;
}

function HODO(Ang)
{
  var hodo = Ang * 180 / Math.PI;
  return hodo;
}

function RAD(Ang)
{
  var RAD = Ang * Math.PI / 180;
  return RAD;

}

//현재 시간 기준으로 표시
// 실제 데이터를 표시할 경우 시간 데이터를 가져와서 다시 세팅
	function setRadarTime(timeInterval, currentTime){
		jQuery("#idRadar_timeText *").remove();
		var radarTime = [];
		var date = new Date();
		
		date.setHours(date.getHours() - currentTime);
		 if (timeInterval < 10)
			timeInterval = timeInterval*60;
		 
		date.setMinutes(date.getMinutes() - (date.getMinutes() % 10));	
		
		for (var i = 0; i < 8 ; i++){
			var cDate = new Date(Date.parse(date) - (1000 * 60 * timeInterval * i)); //1분 *	
			radarTime[i] = digitZero(cDate.getHours(),1) + ':' + digitZero(cDate.getMinutes(),1); 			
		}
		
		var Inhtml = '<li onclick="setradar_time(1)">'+radarTime[7]+'</li>';  		
		Inhtml += '<li onclick="setradar_time(2)">'+radarTime[6]+'</li>'; 		
		Inhtml += '<li onclick="setradar_time(3)">'+radarTime[5]+'</li>'; 		
		Inhtml += '<li onclick="setradar_time(4)">'+radarTime[4]+'</li>'; 		
		Inhtml += '<li onclick="setradar_time(5)">'+radarTime[3]+'</li>'; 		
		Inhtml += '<li onclick="setradar_time(6)">'+radarTime[2]+'</li>';	 		
		Inhtml += '<li onclick="setradar_time(7)">'+radarTime[1]+'</li>';	
		Inhtml += '<li onclick="setradar_time(0)">'+radarTime[0]+'</li>';
		
		jQuery("#idRadar_timeText").append(Inhtml);	 	
		radar_stop();
	}
	
	function digitZero(value, digit){
		value = value+'';
		if (value.length >= digit+1)
			return value;
		var zValue = '';
		for (var i = 1;i<=digit;i++){
			zValue += '0';
		}
		return zValue+value;
	}
	
	querySidoData = function(sido, callback) {
	    var data = {
	        apiKey: apiKey,
	        output: 'json',
	        srsName: 'EPSG:900913',
	        pageUnit: 10,
	        filter: 'ctprvn_cd:=:' + sido,
	        emdCd: '',
	        domain: 'http://localhost:8080/total'//location.href
	    }

	    var url = 'http://apis.vworld.kr/2ddata/adsido/data?' + $.param(data);
	    url = encodeURIComponent(url);
	    $.ajax(
	    {
	        type: 'get',
	        url: 'http://map.vworld.kr/proxy.do',
	        dataType: 'json',
	        async: true,
	        cache: false,
	        data: 'url=' + url,
	        success: this.handleQuerySigunData.bind(this, callback),
	        error: function(req)
	        {
	          alert("querySidoData Error : \n\n" + req.responseText);
	        }
	    });
	}	;
	
	handleQuerySigunData = function(callback, json) {
	    if (typeof json.featureCollection === "undefined")
	    {
	        alert("시군도형 없음!");
	        return;
	    }
	    
	    var features = geoJson.readFeatures(json.featureCollection);
	    
	    map.getLayer('sido').getSource().addFeatures(features);

//	    setTimeout(function() {
//	        map.getView().fit(map.getLayer('sido').getSource().getExtent(), map.getSize()); 
//	    }, 0);	    

	    if (typeof callback === "function")
	    {
	        callback();
	    }
	}	;