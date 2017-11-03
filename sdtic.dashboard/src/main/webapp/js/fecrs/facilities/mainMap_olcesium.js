var map;
var _layers;
var proj900913 = new Proj4js.Proj('EPSG:900913');
//Google Mercator: 구글지도/빙지도/야후지도/OSM 등 에서 사용중인 좌표계 - EPSG:3857(공식), EPSG:900913(통칭)
var proj4326 = new Proj4js.Proj('EPSG:4326'); //WGS84 경위도 
//EPSG:4019, EPSG:4737 (Korean 2000) - GRS80 경위도
var proj5186 = new Proj4js.Proj('EPSG:5186'); //*중부원점(GRS80)-falseY:60000
// EPSG:5185 - 서부, EPSG:5187- 동부, EPSG:5188 - 동해
var proj5174 = new Proj4js.Proj('EPSG:5174'); //*보정된 중부원점(Bessel) 오래됨 - KLIS
//EPSG:5173- 서부, EPSG:5175 - 제주, EPSG:5176 - 동부,  EPSG:5177 - 동해

var locationPath = "http://" + location.host + "";

//var apiKey = "70422590-7C48-39EF-A154-5BFED346C4A4"; // 183.100.246.83:8080/
var apiKey = "11B20A59-5179-3019-9E5E-AF43EC81AF4B"; // localhost:8080/
//var apiKey = "BBE6AFED-3CFC-34D2-802F-3E18CC6C0AD1"; // 192.168.218.6:8080/fec/

var geoJson = new ol.format.GeoJSON();

//이벤트 오류 제거용 선언
var _facVectorLayer = null;

var array_tunnel = [];
var array_slope = [];
var array_electronic = [];

array_tunnel.push([127.1419,37.6156]);
array_tunnel.push([127.1655,37.5731]);
array_tunnel.push([127.2451,37.4781]);
array_tunnel.push([126.6438,37.4046]);
array_tunnel.push([127.0567,37.0247]);
array_tunnel.push([127.9929,37.4131]);
array_tunnel.push([128.3062,37.5430]);
array_tunnel.push([128.6764,37.9640]);
array_tunnel.push([128.3025,37.7615]);
array_tunnel.push([128.0567,38.0247]);
array_tunnel.push([128.6462,38.0438]);
array_tunnel.push([129.0911,37.3346]);
array_tunnel.push([126.5839,36.5250]);
array_tunnel.push([127.9865,36.8145]);
array_tunnel.push([127.5120,36.1216]);
array_tunnel.push([127.0874,34.8156]);
array_tunnel.push([127.1075,36.0095]);
array_tunnel.push([127.5506,35.4866]);
array_tunnel.push([127.6563,35.8750]);
array_tunnel.push([128.6630,35.9130]);
array_tunnel.push([128.9224,35.9017]);
array_tunnel.push([128.1922,35.7943]);
array_tunnel.push([128.5877,36.3978]);

array_slope.push([127.058397,37.442990]);
array_slope.push([126.960433,37.704140 ]);
array_slope.push([126.783969,37.174976 ]);
array_slope.push([127.309735,37.400352 ]);
array_slope.push([127.784353,37.834401]);
array_slope.push([127.772001,37.775815]);
array_slope.push([127.937857,37.750121]);
array_slope.push([128.054993,37.250461]);
array_slope.push([126.619838,36.851966]);
array_slope.push([126.596332,36.180233]);
array_slope.push([127.187371,36.499724]);
array_slope.push([127.166918,36.798967]);
array_slope.push([126.795454,36.021372]);
array_slope.push([127.104586,36.068246]);
array_slope.push([127.589861,35.716118]);
array_slope.push([127.325617,35.468297]);
array_slope.push([126.534292,35.263758]);
array_slope.push([126.563361,34.737547]);
array_slope.push([127.030374,35.246430]);
array_slope.push([127.506784,35.030259]);
array_slope.push([128.834622,35.974192]);
array_slope.push([128.200203,36.461517]);
array_slope.push([128.581499,36.390094]);
array_slope.push([128.209401,36.158584]);
array_slope.push([127.804683,34.993742]);
array_slope.push([129.247619,35.376663]);
array_slope.push([128.794374,35.528235]);
array_slope.push([128.478531,35.535499]);

array_electronic.push([126.880938,37.238067]);
array_electronic.push([127.095327,37.209778]);
array_electronic.push([127.205360,37.258533]);
array_electronic.push([127.396972,37.272337]);
array_electronic.push([128.288494,37.529982]);
array_electronic.push([127.818885,37.299452]);
array_electronic.push([128.632880,38.055105]);
array_electronic.push([129.095592,37.512794]);
array_electronic.push([127.895057,36.882995]);
array_electronic.push([127.627672,36.994552]);
array_electronic.push([127.493326,36.766061]);
array_electronic.push([127.245951,36.475407]);
array_electronic.push([126.735397,35.674923]);
array_electronic.push([126.945333,35.679728]);
array_electronic.push([127.038866,35.834751]);
array_electronic.push([127.651114,35.972280]);
array_electronic.push([126.818369,35.240884]);
array_electronic.push([126.503299,34.953416]);
array_electronic.push([126.875945,35.610389]);
array_electronic.push([127.110118,34.813926]);
array_electronic.push([128.269505,35.708584]);
array_electronic.push([129.197200,35.763432]);
array_electronic.push([128.327783,36.134658]);
array_electronic.push([128.540175,36.831825]);
array_electronic.push([127.784068,35.542522]);
array_electronic.push([127.939867,35.313911]);
array_electronic.push([128.977682,35.228151]);
array_electronic.push([128.498809,35.525654]);


var draw = new ol.interaction.Draw({
    type: /** @type {ol.geom.GeometryType} */ ('LineString')
});


//jQuery(document).ready(function() {
	var dragAndDropInteraction = new ol.interaction.DragAndDrop({
	  formatConstructors: [
	    ol.format.GPX,
	    ol.format.GeoJSON,
	    ol.format.IGC,
	    ol.format.KML,
	    ol.format.TopoJSON
	  ]
	});

	dragAndDropInteraction.on('addfeatures', function(event) {
	    var vectorSource = new ol.source.Vector({
	    	features: event.features,
	    	projection: event.projection
	    });
	    
	    map.getLayers().push(new ol.layer.Vector({
	    	source: vectorSource,
	    	style: styleFunction
	    }));
	    var view = map.getView();
	    view.fitExtent(
	    	vectorSource.getExtent(), /** @type {ol.Size} */ (map.getSize())
	    );
	});
	
	var sidoStyle = new ol.style.Style({
	    fill: new ol.style.Fill({
	        color: 'rgba(255, 53, 32, 0.1)'
	    }),
	    stroke: new ol.style.Stroke({
	        //color: 'rgba(255, 128, 0, 1)',
	        color: 'rgba(255, 53, 32, 1)',
	        width: 2,
	        //lineDash: [4]
	    }),
	    //image: new ol.style.Circle({
	    //    radius: 3,
	    //    fill: new ol.style.Fill({
	    //        color: '#ffcc33'
	    //    })
	    //})
	});

	var textFeature = new ol.Feature({
	  geometry: new ol.geom.Point([14080662.5015, 4166838.987])
	});


	var iconStyle = new ol.style.Style({
	  image: new ol.style.Icon(/** @type {olx.style.IconOptions} */ ({
	    anchor: [0.5, 46],
	    anchorXUnits: 'fraction',
	    anchorYUnits: 'pixels',
	    opacity: 0.75,
	    src: '/js/fecrs/facilities/cesium/origine/data/icon.png'
	  })),
	  text: new ol.style.Text({
	    text: '사면 이벤트',
	    textAlign: 'center',
	    textBaseline: 'middle',
	    stroke: new ol.style.Stroke({
	      color: 'magenta',
	      width: 3
	    }),
	    fill: new ol.style.Fill({
	      color: 'rgba(0, 0, 155, 0.3)'
	    })
	  })
	});
	
	var tunnel_iconStyle = new ol.style.Style({
		  image: new ol.style.Icon(({
		    anchor: [0.5, 0.5],
		    anchorXUnits: 'fraction',
		    anchorYUnits: 'fraction',
		    opacity: 1,
		    src: '/images/fecrs/tunnel_icon.png',
		    scale: 0.1
		  }))		  
		});
	
	var slope_iconStyle = new ol.style.Style({
		  image: new ol.style.Icon(({
		    anchor: [0.5, 0.5],
		    anchorXUnits: 'fraction',
		    anchorYUnits: 'fraction',
		    opacity: 0.75,
		    src: '/images/fecrs/big-owl.jpg',
		    scale: 0.08
		  }))		  
		});
	
	var electronic_iconStyle = new ol.style.Style({
		  image: new ol.style.Icon(({
		    anchor: [0.5, 0.5],
		    anchorXUnits: 'fraction',
		    anchorYUnits: 'fraction',
		    opacity: 0.75,
		    src: '/images/fecrs/electronic_icon.png',
		    scale: 0.1
		  }))		  
		});

	textFeature.getGeometry().set('altitudeMode', 'clampToGround');
	textFeature.setStyle(iconStyle);

	var vectorSource2 = new ol.source.Vector({
	 features: [textFeature]
	});
	var imageVectorSource = new ol.source.ImageVector({
	 source: vectorSource2
	});
	var vectorLayer2 = new ol.layer.Image({
	 source: imageVectorSource
	});
	
//var aimslayer = new infra.layer.MapGuideMap({
//	name: "test_bonbu",			
//	visible:true,	
//	mapDefinition:'Library://GoogleTM/HI_Nex-Man/Maps/test_bonbu.MapDefinition',			
//	autoRefreshInterval: 1000 * 60 * 3,
//	//serverPath : "http://183.100.246.83:8008/mapserver2016/",
//	//serverPath : "http://192.168.218.8:8008/mapserver2016/",
//	serverPath : "http://itfsvr.iptime.org:10201/mapserver2016/",
//	serverVersion : 2016
//	//mapCommandUrl: "http://rnd.krinfra.co.kr/AIMSApp/Handler.ashx"
//});

	_layers = [
		new infra.layer.VworldSatellite({visible:false}),
		//new infra.layer.VworldBase({visible:true}),
		//new infra.layer.VworldHybrid({visible:false}),
		new infra.layer.MapGuideMap({
			name: "test_bonbu",			
			visible:true,	
			mapDefinition:'Library://GoogleTM/HI_Nex-Man/Maps/test_bonbu.MapDefinition',			
			autoRefreshInterval: 1000 * 60 * 3,
			serverPath : "http://itfsvr.iptime.org:10201/mapserver2016/",
			serverVersion : 2016
		}),
		new infra.layer.MapGuideMap({
			name: "test_road",
			visible:true,
			mapDefinition:'Library://GoogleTM/HI_Nex-Man/Maps/test_road.MapDefinition',
			autoRefreshInterval: 1000 * 60 * 3,
			serverPath : "http://itfsvr.iptime.org:10201/mapserver2016/",
			serverVersion : 2016
		}), 		
		new infra.layer.MapGuideMap({
			name: "gangwon_map",
			visible:false,
			mapDefinition:'Library://GoogleTM/HI_Nex-Man/Maps/Gangwon_map.MapDefinition',
			autoRefreshInterval: 1000 * 60 * 3,
			serverPath : "http://itfsvr.iptime.org:10201/mapserver2016/",
			serverVersion : 2016
		}) ,
		new infra.layer.MapGuideMap({
			name: "gyeongbuk_map",
			visible:false,
			mapDefinition:'Library://GoogleTM/HI_Nex-Man/Maps/Gyeongbuk_map.MapDefinition',
			autoRefreshInterval: 1000 * 60 * 3,
			serverPath : "http://itfsvr.iptime.org:10201/mapserver2016/",
			serverVersion : 2016
		}) ,
	    new ol.layer.Vector({
	        name: 'sido',
	        source: new ol.source.Vector({}),
	        style: sidoStyle,
	        visible: true
	    })   ,
	    new ol.layer.Vector({
            name: 'tunnel',
            source: new ol.source.Vector({}),
            style: tunnel_iconStyle,
            visible: true
        }),
        new ol.layer.Vector({
            name: 'electric',
            source: new ol.source.Vector({}),
            style: electronic_iconStyle,
            visible: true
        }),
        new ol.layer.Vector({
            name: 'slope',
            source: new ol.source.Vector({}),
            style: slope_iconStyle,
            visible: true
        }),
        new ol.layer.Vector({
            name: 'building',
            source: new ol.source.Vector({}),
            visible: true
        }),
        vectorLayer2
	];

   	
   	var extent = [13867518.905289,3911131.974575,14625774.635093,4764781.167161];
    extent[0] -= 2000000;
    extent[1] -= 2000000;
    extent[2] += 2000000;
    extent[3] += 2000000;    
   
    var resolutions = [
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
	];    	 

    var map = new infra.Map({
    	   interactions: ol.interaction.defaults().extend([dragAndDropInteraction]),
           target: 'map',
           layers: _layers,
           viewExtent: extent,
           viewResolutions: resolutions,
           pointColor: [255,0,0],
    });
  //14213400.862804638,4377632.058197232
    map.getView().setCenter([14213400.862804638,4360632.058197232]);
    function makeRandom(min, max){
	    var RandVal = Math.random() * (max- min) + min;
	    return Math.floor(RandVal);
    }
       
    setTimeout($.proxy(function () {
       	showBuildings();
   	}, this), 4000);        
//       
    map.getView().animate({
           zoom: 3
    });  

//});  	
    
    
	
	function showFacilities(){	
		
		
		if (fac_kind>2)
			fac_kind = 0;
		
		if (fac_box_top > 150)
			fac_box_top = 59;
		else
			fac_box_top += 54;
		
		$('#idFacBox').animate({ top : fac_box_top+"px" },200);	
		
		

		eventFinish = false;
		map.getLayer("tunnel").getSource().clear();
		map.getLayer("slope").getSource().clear();
		map.getLayer("electric").getSource().clear();
		
		if (fac_kind == 1){
			var trans_coord = [];
			for(var arridx=0;arridx < array_tunnel.length;arridx++){
				var p = new Proj4js.Point(array_tunnel[arridx][0],array_tunnel[arridx][1]);
				Proj4js.transform(proj4326, proj900913, p);
				trans_coord.push([p.x,p.y]);
				var tFeature = new ol.Feature({
					geometry: new ol.geom.Point([p.x,p.y,50])
				});
				tFeature.setStyle(tunnel_iconStyle);
				map.getLayer("tunnel").getSource().addFeature(tFeature);				
			}	
			
			map.getLayer("tunnel").setVisible(true);
			map.getLayer("slope").setVisible(false);
			map.getLayer("electric").setVisible(false);
			
			flashEvent(trans_coord, '터널');
			$('#idFac_1').attr('class','fac_warning');
			$('#idFac_2').attr('class','fac_normal');
			$('#idFac_3').attr('class','fac_normal');			

		}else if (fac_kind == 2){
			var trans_coord = [];
			for(var arridx=0;arridx < array_slope.length;arridx++){
				var p = new Proj4js.Point(array_slope[arridx][0],array_slope[arridx][1]);
				Proj4js.transform(proj4326, proj900913, p);
				trans_coord.push([p.x,p.y]);	
				var sFeature = new ol.Feature({
					geometry: new ol.geom.Point([p.x,p.y,50])
				});
				
				sFeature.setStyle(slope_iconStyle);
				map.getLayer("slope").getSource().addFeature(sFeature);				
			}	
			
			map.getLayer("tunnel").setVisible(false);
			map.getLayer("slope").setVisible(true);
			map.getLayer("electric").setVisible(false);
			flashEvent(trans_coord, '사면');
			$('#idFac_1').attr('class','fac_normal');
			$('#idFac_2').attr('class','fac_warning');
			$('#idFac_3').attr('class','fac_normal');
		}else
		{
			var trans_coord = [];
			for(var arridx=0;arridx < array_electronic.length;arridx++){
				var p = new Proj4js.Point(array_electronic[arridx][0],array_electronic[arridx][1]);
				Proj4js.transform(proj4326, proj900913, p);
				trans_coord.push([p.x,p.y]);	
				var eFeature = new ol.Feature({
					geometry: new ol.geom.Point([p.x,p.y,50])
				});
				eFeature.setStyle(electronic_iconStyle);
				map.getLayer("electric").getSource().addFeature(eFeature);				
			}		
			
			map.getLayer("tunnel").setVisible(false);
			map.getLayer("slope").setVisible(false);
			map.getLayer("electric").setVisible(true);
			flashEvent(trans_coord, '전기');
			$('#idFac_1').attr('class','fac_normal');
			$('#idFac_2').attr('class','fac_normal');
			$('#idFac_3').attr('class','fac_warning');
		}	
	}   
       
	function showBuildings(){
		var building_point = [];
		eventFinish = false;
//		eventFinish = false;
//		'경기지역본부': [127.1548,37.5143],					                
//	    '경기차량1': ,
//	    '경기차량2': [,
//	    '경기차량3': ,					                
//	    '경기차량4': ,	
//	    '경기차량5': ,				                
//	    '강원지역본부': [127.9520,37.3997],
//	    '강원차량1': ,
//	    '강원차량2': ,
//	    '강원차량3': ,  					                
//	    '강원차량4': ,					                					                	
//	    '강원차량5': ,	
//	    '강원차량6': ,	
//	    '강원차량7': ,  					                
//	    '충청지역본부': [127.4484,36.3622],
//	    '충청차량1': ,
//	    '충청차량2': ,
//	    '충청차량3': ,					                
//	    '중부지역본부': [127.0899,37.3377],
//	    '호남지역본부': [126.8866,35.2607],
//	    '호남차량1': ,
//	    '호남차량2': ,
//	    '호남차량3': ,
//	    '호남차량4': ,
//	    '경북지역본부': [128.5377,35.9350],
//	    '경북차량1': ,
//	    '경북차량2': ,
//	    '경북차량3': ,
//	    '경북차량4': ,
//	    '경남지역본부': [128.7010,35.2847],					                					                
//	    '본사': [128.1890,36.1289]	
		
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
			
//			var buildingFeature = new ol.Feature({
//				geometry: new ol.geom.Point([p.x,p.y]),
//				id : "building"
//			});
			
			//var buildingFeature = new ol.Feature(new ol.geom.Point([p.x,p.y]));
			var buildingFeature = new ol.Feature({
				geometry: new ol.geom.Point([p.x,p.y,50])
			});
			var locationPath1 = "http://" + location.host + "";
			var sStyle = function (feature, res) { 
				return new ol.style.Style({
			 	  	image: new ol.style.Icon( ({    			   
			 	  		anchor: [0.5, 0.5],
					    scale : 0.03,
				 	    anchorXUnits: 'fraction',
				 	    anchorYUnits: 'fraction',//'pixels',
				 	    opacity: 1,
				 	    src: '/images/fecrs/building.png'			 	    
					}))			
				
				//,
					//text: createTextStyle(feature, res)
				});    	
		    };
			
//			var sStyle = new ol.style.Style({
//		        image: new ol.style.Circle({
//		          radius: 100,
//		          snapToPixel: false,
//		          stroke: new ol.style.Stroke({
//		            color: 'rgba(255,0,0,1)',
//		            width: 0.25 + 1
//		          })
//		        })
//		      });
		    
		    buildingFeature.setStyle(sStyle);
		    map.getLayer("building").getSource().addFeature(buildingFeature);
			
		    
		}
		//map.getLayer('sido').getSource().clear();	
//		querySidoData('11');
//		querySidoData('27'); //대구
//		querySidoData('26');
//		querySidoData('29');
//		querySidoData('30');
//		querySidoData('31');
//		querySidoData('28');
//		querySidoData('41');
//		querySidoData('42'); //강원	
//		querySidoData('43');
//		querySidoData('44');	
//		querySidoData('47');
//		querySidoData('46');
//		querySidoData('45');	
//		querySidoData('48');	
//		querySidoData('36');	
		
	}      
       

/*var ol2d = new ol.Map({
  layers: [
    new ol.layer.Tile({
      source: new ol.source.OSM()
    })
  ],
  controls: ol.control.defaults({
    attributionOptions: /** @type {olx.control.AttributionOptions} *//* ({
      collapsible: false
    })
  }),
  target: 'map',
  view: new ol.View({
    center: ol.proj.transform([25, 20], 'EPSG:4326', 'EPSG:3857'),
    zoom: 3
  })
});*/

var ol3d = new olcs.OLCesium({
  map: map,
  target: 'map3d'  
});

var scene = ol3d.getCesiumScene();
var terrainProvider = new Cesium.CesiumTerrainProvider({
  url : '//assets.agi.com/stk-terrain/world',
  requestVertexNormals: true
});
scene.terrainProvider = terrainProvider;
ol3d.setEnabled(true);
//scene.morphToColumbusView();
ol3d.enableAutoRenderLoop();

var camera = ol3d.getCamera();


