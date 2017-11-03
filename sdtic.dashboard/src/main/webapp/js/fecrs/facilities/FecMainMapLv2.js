Proj4js.defs["EPSG:5186"] = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +units=m +no_defs";
var map;
var _layers;
var proj900913 = new Proj4js.Proj('EPSG:900913');
//Google Mercator: 구글지도/빙지도/야후지도/OSM 등 에서 사용중인 좌표계 - EPSG:3857(공식), EPSG:900913(통칭)
var proj4326 = new Proj4js.Proj('EPSG:4326'); //WGS84 경위도 
var proj5186 = new Proj4js.Proj('EPSG:5186');

var locationPath = "http://" + location.host + "/";
var apiKey = "11B20A59-5179-3019-9E5E-AF43EC81AF4B"; // localhost:8080/

var geoJson = new ol.format.GeoJSON();

	var MdtGrade1Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIcon_MDT_grd01.png',
	    scale: 0.8
	  }))		  
	});
	
	var MdtGrade2Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIcon_MDT_grd02.png',
	    scale: 0.8
	  }))		  
	});
	
	var MdtGrade3Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIcon_MDT_grd03.png',
	    scale: 0.8
	  }))		  
	});

	var tunnelGrade1Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIco_tunnel_grd01.png',
	    scale: 0.8
	  }))		  
	});
	
	var tunnelGrade2Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIco_tunnel_grd02.png',
	    scale: 0.8
	  }))		  
	});
	
	var tunnelGrade3Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIco_tunnel_grd03.png',
	    scale: 0.8
	  }))		  
	});
	
	var slopeGrade1Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIco_slope_grd01.png',
	    scale: 0.8
	  }))		  
	});
	var slopeGrade2Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIco_slope_grd02.png',
	    scale: 0.8
	  }))		  
	});
	var slopeGrade3Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIco_slope_grd03.png',
	    scale: 0.8
	  }))		  
	});	
	
	var electronicGrade1Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIco_electronic_grd01.png',
	    scale: 0.8
	  }))		  
	});	
	var electronicGrade2Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIco_electronic_grd02.png',
	    scale: 0.8
	  }))		  
	});	
	var electronicGrade3Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIco_electronic_grd03.png',
	    scale: 0.8
	  }))		  
	});	
	
	var pltwtrGrade1Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIco_pltwtr_grd01.png',
	    scale: 0.8
	  }))		  
	});
	var pltwtrGrade2Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIco_pltwtr_grd02.png',
	    scale: 0.8
	  }))		  
	});
	var pltwtrGrade3Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIco_pltwtr_grd03.png',
	    scale: 0.8
	  }))		  
	});
	
	var brineGrade1Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIco_brine_grd01.png',
	    scale: 0.8
	  }))		  
	});
	var brineGrade2Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src: '/images/fecrs/grade/mIco_brine_grd02.png',
	    scale: 0.8
	  }))		  
	});
	var brineGrade3Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src:  '/images/fecrs/grade/mIco_brine_grd03.png',
	    scale: 0.8
	  }))		  
	});
	
	var CCTVGrade1Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src:  '/images/fecrs/grade/mIcon_CCTV_grd01.png',
	    scale: 0.8
	  }))		  
	});
	
	var CCTVGrade2Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src:  '/images/fecrs/grade/mIcon_CCTV_grd02.png',
	    scale: 0.8
	  }))		  
	});
	
	var CCTVGrade3Style = new ol.style.Style({
	    image: new ol.style.Icon(({
	    anchor: [0.5, 0.5],
		anchorXUnits: 'fraction',
	    anchorYUnits: 'fraction',
	    opacity: 1,
	    src:  '/images/fecrs/grade/mIcon_CCTV_grd03.png',
	    scale: 0.8
	  }))		  
	});
	
	var AIMSPath = "http://172.16.167.67:8808/mapserver2016/";// 운영
			
	_layers = [
		new infra.layer.VworldHybrid({visible:true}),
		new infra.layer.MapGuideMap({
			name: "bonbu",			
			visible:true,	
			mapDefinition:'Library://GoogleTM/TIC_FS/Maps/bonbu.MapDefinition',	
			serverPath : AIMSPath,
			serverVersion : 2016
		}),		
		new infra.layer.MapGuideMap({
			name: "road",
			visible:true,
			mapDefinition:'Library://GoogleTM/TIC_FS/Maps/road.MapDefinition',
			serverPath : AIMSPath,
			serverVersion : 2016
		}), 
        new ol.layer.Vector({
            name: 'building',
            source: new ol.source.Vector({}),
            visible: true
        }),
        new ol.layer.Vector({
            name: 'brine',
            source: new ol.source.Vector({}),
            visible: true
        }),
        new ol.layer.Vector({
            name: 'pltwtr',
            source: new ol.source.Vector({}),
            visible: true
        }),
        new ol.layer.Vector({
            name: 'slope',
            source: new ol.source.Vector({}),
            visible: true
        }),
        new ol.layer.Vector({
            name: 'cctv',
            source: new ol.source.Vector({}),
            visible: true
        }),
        new ol.layer.Vector({
            name: 'electronic',
            source: new ol.source.Vector({}),       
            visible: true
        }),
        new ol.layer.Vector({
            name: 'tunnel',
            source: new ol.source.Vector({}),
            visible: true
        }),
        new ol.layer.Vector({
            name: 'mdt',
            source: new ol.source.Vector({}),
            visible: true
        })
	];

   	
   	var extent = [13867518.905289,3911131.974575,14625774.635093,4764781.167161];
    extent[0] -= 2000000;
    extent[1] -= 2000000;
    extent[2] += 2000000;
    extent[3] += 2000000;    
   
    var resolutions = [
		501.96981025128,
		455.98490512564,
		402.99245256282,
		351.49622628141,
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
           target: 'map',
           layers: _layers,
           viewExtent: extent,
           viewResolutions: resolutions,
           controls : ol.control.defaults({
               attribution : false,
               zoom : false,
               rotate : false,
           }),
//           interactions : ol.interaction.defaults({altShiftDragRotate:false, pinchRotate:false}),
           pointColor: [255,0,0],           
    });
    
    map.on('click', function(evt) {
    	var p = new Proj4js.Point(evt.coordinate[0], evt.coordinate[1]);
        Proj4js.transform(proj900913,proj4326, p);
       	p.x = (p.x).toFixed(8);
       	p.y = (p.y).toFixed(8);
       	
       	// 수정,삭제 페이지 이동forEachFeatureAtCoordinateDirect
  	  	var feature = map.forEachFeatureAtPixel(evt.pixel,function(feature, layer) { 
	  	  	var hdqr_nm = feature.hdqr_nm; 
			if (feature.hdqr_nm == undefined)
				return feature;
			var mtnof_nm = feature.mtnof_nm; 
		  		var fclts_name = feature.fclts_name; 
		  		
		  		var content = hdqr_nm+ ' ' +mtnof_nm +' '+ fclts_name ;
		  		var sHtml='<div style="overflow-y:auto; height:100%; width:100%">';
		  		for (var i = 0; i < feature.content.length; i++){  	  			
		  			sHtml += "일시: "+ feature.event_time[i] +'<br>';
		  			sHtml += "  - "+ feature.content[i] +"  "+feature.recover[i]+'<br><br>';
		  		}
		  		sHtml += '</div>';
		  		
		  		$("#divDeptPopup").html(hdqr_nm+ ' ' +mtnof_nm);
		  		$("#divFacPopup").html(fclts_name);  	  		
		  		$("#divContentPopup").html(sHtml);
		  	
	  	  	$("#divPopup").animate({
			    left: "15"
			}, 1000,function(){});
	  	  	
	   		return feature;
  	  	});
    });

    map.getInteractions().forEach(function(interaction) {
	  if (interaction instanceof ol.interaction.DragPan) {
//	    interaction.setActive(false);		  
	  };
	  
	  if (interaction instanceof ol.interaction.MouseWheelZoom) {
//  	    interaction.setActive(false);
  	  };
	  
	}, this);
         
    function getDeptCoordAjax(val){
    	var url = "http://" + location.host + "/fecGetDeptAjax.do";
    	
    	$.ajax({
    	        	type: 'post',
    	            url: url,
    	            dataType: 'json',
    	            async: true,
    	            data: {'deptCode' : val},
    	            cache: false,
    	            success: function(data){    
    	            	map.getLayer("building").getSource().clear();
    	            	$.each(data.dept, function(index){  
    	            		
    	            		var buildingFeature = new ol.Feature({
    	        				geometry: new ol.geom.Point([data.dept[index].ggtm_x,data.dept[index].ggtm_y,50])
    	        			});
    	            		
    	        		    var sStyle = function (feature, res) { 
    	        				return new ol.style.Style({
    	        			 	  	image: new ol.style.Icon( ({    			   
    	        			 	  		anchor: [0.5, 0.5],
    	        					    scale : 1.4,					    
    	        				 	    anchorXUnits: 'fraction',
    	        				 	    anchorYUnits: 'fraction',//'pixels',
    	        				 	    opacity: 1,
    	        				 	    src: '/images/fecrs/icoHQ03.png'			 	    
    	        					}))			

    	        				});    	
    	        		    };
    	        		    
    	        		    buildingFeature.setStyle(sStyle);
    	        		    map.getLayer("building").getSource().addFeature(buildingFeature);
    	        		    
    	        		    map.getView().animate({
    	        		 	       center: [data.dept[index].ggtm_x,data.dept[index].ggtm_y],
    	        		 	       duration: 2000
	        		 	     });     
	        		 	     
	        		 	     map.getView().animate({
	        		 	       zoom: 4,
	        		 	       duration: 1000
	        		 	     }, {
	        		 	       zoom: 6 ,
	        		 	       duration: 1000      
	        		 	     });
    	        		 	
    	            	});   
    	            },
    	            error: function(req)
    	            {
    	                //alert("Error : \n\n" + req.responseText);
    	            }
    	      });
	}    
    
    function getJisaCodeAjax(val){
    	var url = "http://" + location.host + "/fecJisaCodeAjax.do";
    	
    	$.ajax({
    	        	type: 'post',
    	            url: url,
    	            dataType: 'json',
    	            async: true,
    	            data: {'deptCode' : val},
    	            cache: false,
    	            success: function(data){   
    	            	var select_obj = $('#SelectJisa');
    	            	select_obj.find('option').remove();
    	            	
    	            	$.each(data.Jisacode, function(index){
    	            		var selected = '';
    	            		if (index == 0){
    	            			deptcode = data.Jisacode[index].CODE;
    	            			selected = "selected";
    	            		}
    	            		select_obj.append('<option value=' + data.Jisacode[index].CODE + ' '+selected+'>' + data.Jisacode[index].NAME + '</option>');
    	            	});  
    	            	
    	            	SelectDept(deptcode);
    	            },
    	            error: function(req)
    	            {
    	            }
    	      });
	}  
    
    var effectTunnelFeatures = [];
    function AjaxQueryEventTunnel(val){
    	var url = "http://" + location.host + "/fecGetEventTunnelAjax.do";
    	
    	$.ajax({
	        	type: 'post',
	            url: url,
	            dataType: 'json',
	            async: true,
	            data: {'deptCode' : val},
	            cache: false,
	            success: function(data){  
	            	if (data.features.length == 0){
	            		showTunnelCount(0);
	            		effectTunnelFeatures = [];
	            		closeTunnelEventEffect();
		            	
	            		map.getLayer("tunnel").getSource().clear();
	            		return;
	            	}
	            	
	            	var old_fclts_name = '';
	            	var cur_fclts_name = 'fac';
	            	var idx_fclts_name = 0;
	            	var tunnelEventFeatures = [];
	            	var feature = null;
	            	effectTunnelFeatures = [];
	            	var tunnelTroblCount =0;
	            	var tunnelRecoverCount =0;
	            	
	            	var fea_content = [];
        			var fea_event_time = [];
        			var fea_recover = [];
        			
        			closeTunnelEventEffect(); 
        			
        			var xcord = 0;
            		var ycord = 0;
            		
            		var recover_content = [];
            		var exist_trobl = false;
            		
	            	$.each(data.features, function(index){  
	            		if (old_fclts_name != data.features[index].fclts_name){
	            			old_fclts_name = data.features[index].fclts_name;
	            			if (feature != null)
	            			{
	            				feature.content = fea_content;
	            				feature.event_time = fea_event_time;
	            				feature.recover = fea_recover;
	            				tunnelEventFeatures.push(feature);
	            			}
	            			
	            			fea_content = [];
	            			fea_event_time = [];
	            			fea_recover = [];
	            			
	            			recover_content = [];
	            			exist_trobl = false;
	            			
	            			var xcord = data.features[index].xcord;
		            		var ycord = data.features[index].ycord;
		            		if (data.features[index].coord_type == 2){
		            			var p = new Proj4js.Point(xcord,ycord);
			                    Proj4js.transform(proj4326, proj900913, p);		                    
			                    xcord = p.x
			                    ycord = p.y; 
		            		}
		            		
	            			feature = new ol.Feature({
		            			geometry: new ol.geom.Point([xcord, ycord])
		            		});
	            			
	            			feature.hdqr_nm = data.features[index].hdqr_nm;
	            			feature.mtnof_nm = data.features[index].mtnof_nm;
	            			feature.fclts_name = data.features[index].fclts_name;
	            			
	            			fea_content.push(data.features[index].content);
	            			fea_event_time.push(data.features[index].event_time);
	            			
	            			
	            			var strRecover = '';
	            			strRecover = '복구';	            			
	            			
	            			if (data.features[index].recover == 0){
	            				effectTunnelFeatures.push([xcord, ycord]);
	            				strRecover = '장애';
	            				tunnelTroblCount++;
	            				exist_trobl = true;
	            			}else
	            			{
	            				tunnelRecoverCount++;
	            				recover_content.push(data.features[index].content);
	            			}
	            			
	            			fea_recover.push(strRecover);
	            			feature.setStyle(tunnelGrade1Style);
	            		}else
	            		{
	            			fea_content.push(data.features[index].content);
	            			fea_event_time.push(data.features[index].event_time);
	            			
	            			if (data.features[index].recover == 0){
	            				fea_recover.push('장애');
	            				var bTrobl = true;
	            				
	            				for(var i=0 ; i<recover_content.length;i++)
	            				{
	            					if (recover_content[i] == data.features[index].content){
	            						bTrobl == false;
	            						break;
	            					}
	            				}
	            				
	            				if (bTrobl == true && exist_trobl == false){
	            					effectTunnelFeatures.push([xcord, ycord]);
	            					exist_trobl = true;
	            				}
	            			}else
	            			{
	            				fea_recover.push('복구');
	            				recover_content.push(data.features[index].content);
	            			}
	            		}		            		
		            		
	            	});
	            	
	            	feature.content = fea_content;
    				feature.event_time = fea_event_time;
    				feature.recover = fea_recover;
	            	tunnelEventFeatures.push(feature);
	            	map.getLayer("tunnel").getSource().clear();
	            	map.getLayer("tunnel").getSource().addFeatures(tunnelEventFeatures);
	            	if (map.getLayer("tunnel").getVisible() == true)
	            		showTunnelEventEffect(effectTunnelFeatures); 
	            	showTunnelCount(tunnelTroblCount+tunnelRecoverCount);
	            },
	            error: function(req)
	            {
	            }
	        });
    }
    

    var effectElctsFeatures = [];
    function AjaxQueryEventElcts(val){
    	var url = "http://" + location.host + "/fecGetEventElctsAjax.do";
    	
    	$.ajax({
	        	type: 'post',
	            url: url,
	            dataType: 'json',
	            async: true,
	            data: {'deptCode' : val},
	            cache: false,
	            success: function(data){   
	            	if (data.features.length == 0){
	            		showElctsCount(0);
	            		effectElctsFeatures = [];
	            		closeElctsEventEffect(); 
		            	
	            		map.getLayer("electronic").getSource().clear();
	            		return;
	            	}
	            
	            	var old_fclts_name = '';
	            	var cur_fclts_name = 'fac';
	            	var ElctsEventFeatures = [];
	            	var feature = null;
	            	effectElctsFeatures = [];
	            	var elctsTroblCount = 0;
	            	var elctsRecoverCount = 0;
	            	
	            	var fea_content = [];
        			var fea_event_time = [];
        			var fea_recover = [];
	            	
        			closeElctsEventEffect();  
        			
        			var xcord = 0;
            		var ycord = 0;
            		
            		var recover_content = [];
            		var exist_trobl = false;
            		
	            	$.each(data.features, function(index){  

	            		if (old_fclts_name != data.features[index].fclts_name){
	            			old_fclts_name = data.features[index].fclts_name;
	            			if (feature != null)
	            			{
	            				feature.content = fea_content;
	            				feature.event_time = fea_event_time;
	            				feature.recover = fea_recover;
	            				ElctsEventFeatures.push(feature);
	            			}
	            			
	            			fea_content = [];
	            			fea_event_time = [];
	            			fea_recover = [];
	            			
	            			recover_content = [];
	            			exist_trobl = false;
	            			
	            			var xcord = data.features[index].xcord;
		            		var ycord = data.features[index].ycord;
		            		if (data.features[index].coord_type == 2){
		            			var p = new Proj4js.Point(xcord,ycord);
			                    Proj4js.transform(proj4326, proj900913, p);		                    
			                    xcord = p.x
			                    ycord = p.y; 
		            		}
		            		
	            			feature = new ol.Feature({
		            			geometry: new ol.geom.Point([xcord, ycord])
		            		});
	            			
	            			feature.hdqr_nm = data.features[index].hdqr_nm;
	            			feature.mtnof_nm = data.features[index].mtnof_nm;
	            			feature.fclts_name = data.features[index].fclts_name;
	            			
	            			fea_content.push(data.features[index].content);
	            			fea_event_time.push(data.features[index].event_time);
	            			
	            			
	            			var strRecover = '';
	            			strRecover = '복구';	            			
	            			
	            			if (data.features[index].recover == 0){
	            				effectElctsFeatures.push([xcord, ycord]);
	            				strRecover = '장애';
	            				elctsTroblCount++;
	            				exist_trobl = true;
	            			}else
	            			{
	            				elctsRecoverCount++;
	            				recover_content.push(data.features[index].content);
	            			}
	            			
	            			fea_recover.push(strRecover);
	            			feature.setStyle(electronicGrade1Style);
	            		}else
	            		{
	            			
	            			fea_content.push(data.features[index].content);
	            			fea_event_time.push(data.features[index].event_time);
	            			
	            			if (data.features[index].recover == 0){
	            				fea_recover.push('장애');
	            				var bTrobl = true;
	            				
	            				for(var i=0 ; i<recover_content.length;i++)
	            				{
	            					if (recover_content[i] == data.features[index].content){
	            						bTrobl == false;
	            						break;
	            					}
	            				}
	            				
	            				if (bTrobl == true && exist_trobl == false){
	            					effectElctsFeatures.push([xcord, ycord]);
	            					exist_trobl = true;
	            				}
	            			}else
	            			{
	            				fea_recover.push('복구');
	            				recover_content.push(data.features[index].content);
	            			}
	            		}		            		
		            		
	            	});
	            	
	            	feature.content = fea_content;
    				feature.event_time = fea_event_time;
    				feature.recover = fea_recover;
	            	ElctsEventFeatures.push(feature);
	            	map.getLayer("electronic").getSource().clear();
	            	map.getLayer("electronic").getSource().addFeatures(ElctsEventFeatures);
	            	if (map.getLayer("electronic").getVisible() == true)
	            		showElctsEventEffect(effectElctsFeatures); 
	            	showElctsCount(elctsTroblCount+elctsRecoverCount);
	            },
	            error: function(req)
	            {
	            }

	        });
    }
    	
    var effectSvarFeatures = [];
    function AjaxQueryEventSvar(val){
    	var url = "http://" + location.host + "/fecGetEventSvarAjax.do";
    	
    	$.ajax({
	        	type: 'post',
	            url: url,
	            dataType: 'json',
	            async: true,
	            data: {'deptCode' : val},
	            cache: false,
	            success: function(data){   

	            	if (data.features.length == 0){
	            		showSvarCount(0);
	            		effectSvarFeatures = [];
	            		closeSvarEventEffect();	  
		            	
	            		map.getLayer("pltwtr").getSource().clear();
	            		return;
	            	}
	            		            	
	            	var old_fclts_name = '';
	            	var cur_fclts_name = 'fac';
	            	var SvarEventFeatures = [];
	            	var feature = null;
	            	effectSvarFeatures = [];
	            	var svarTroblCount = 0;
	            	var svarRecoverCount = 0;
	            	
	            	var fea_content = [];
        			var fea_event_time = [];
        			var fea_recover = [];
	            	
        			closeSvarEventEffect();	   
        			
        			var xcord = 0;
            		var ycord = 0;
            		
            		var recover_content = [];
            		var exist_trobl = false;
            		
	            	$.each(data.features, function(index){  
	            		
	            		if (old_fclts_name != data.features[index].fclts_name){
	            			old_fclts_name = data.features[index].fclts_name;
	            			if (feature != null)
	            			{
	            				feature.content = fea_content;
	            				feature.event_time = fea_event_time;
	            				feature.recover = fea_recover;
	            				SvarEventFeatures.push(feature);
	            			}
	            			
	            			fea_content = [];
	            			fea_event_time = [];
	            			fea_recover = [];
	            			
	            			recover_content = [];
	            			exist_trobl = false;
	            			
	            			var xcord = data.features[index].xcord;
		            		var ycord = data.features[index].ycord;
		            		if (data.features[index].coord_type == 2){
		            			var p = new Proj4js.Point(xcord,ycord);
			                    Proj4js.transform(proj4326, proj900913, p);		                    
			                    xcord = p.x
			                    ycord = p.y; 
		            		}
		            		
	            			feature = new ol.Feature({
		            			geometry: new ol.geom.Point([xcord, ycord])
		            		});
	            			
	            			feature.hdqr_nm = data.features[index].hdqr_nm;
	            			feature.mtnof_nm = data.features[index].mtnof_nm;
	            			feature.fclts_name = data.features[index].fclts_name;
	            			
	            			fea_content.push(data.features[index].content);
	            			fea_event_time.push(data.features[index].event_time);	            			
	            			
	            			var strRecover = '';
	            			strRecover = '복구';	            			
	            			
	            			if (data.features[index].recover == 0){
	            				effectSvarFeatures.push([xcord, ycord]);
	            				strRecover = '장애';
	            				svarTroblCount++;
	            				exist_trobl = true;
	            			}else
	            			{
	            				svarRecoverCount++;
	            				recover_content.push(data.features[index].content);
	            			}
	            			
	            			fea_recover.push(strRecover);
	            			feature.setStyle(pltwtrGrade1Style);
	            		}else
	            		{
	            			fea_content.push(data.features[index].content);
	            			fea_event_time.push(data.features[index].event_time);
	            			
	            			if (data.features[index].recover == 0){
	            				fea_recover.push('장애');
	            				var bTrobl = true;
	            				
	            				for(var i=0 ; i<recover_content.length;i++)
	            				{
	            					if (recover_content[i] == data.features[index].content){
	            						bTrobl == false;
	            						break;
	            					}
	            				}
	            				
	            				if (bTrobl == true && exist_trobl == false){
	            					effectSvarFeatures.push([xcord, ycord]);
	            					exist_trobl = true;
	            				}
	            			}else
	            			{
	            				fea_recover.push('복구');
	            				recover_content.push(data.features[index].content);
	            			}
	            		}		            		
		            		
	            	});
	            	
	            	feature.content = fea_content;
    				feature.event_time = fea_event_time;
    				feature.recover = fea_recover;
	            	SvarEventFeatures.push(feature);
	            	map.getLayer("pltwtr").getSource().clear();
	            	map.getLayer("pltwtr").getSource().addFeatures(SvarEventFeatures);
	            	if (map.getLayer("pltwtr").getVisible() == true)
	            		showSvarEventEffect(effectSvarFeatures); 
	            	showSvarCount(svarTroblCount+svarRecoverCount);
	            },
	            error: function(req)
	            {
	            }
	            
	        });
    }
    
    var effectSlopeFeatures = [];
    function AjaxQueryEventSlope(val){
    	var url = "http://" + location.host + "/fecGetEventSlopeAjax.do";
    	
    	$.ajax({
	        	type: 'post',
	            url: url,
	            dataType: 'json',
	            async: true,
	            data: {'deptCode' : val},
	            cache: false,
	            success: function(data){  
       	
	            	if (data.features.length == 0){
	            		showSlopeCount(0);
	            		effectSlopeFeatures = [];
	            		closeSlopeEventEffect();  
		            	
	            		map.getLayer("slope").getSource().clear();
	            		return;
	            	}
	            	
	            	var old_fclts_name = '';
	            	var cur_fclts_name = 'fac';
	            	var SlopeEventFeatures = [];
	            	var feature = null;
	            	effectSlopeFeatures= [];
	            	var slopeTroblCount = 0;
	            	var slopeRecoverCount = 0;
	            	
	            	var fea_content = [];
        			var fea_event_time = [];
        			var fea_recover = [];
	            	
        			closeSlopeEventEffect(); 
	        		
	            	$.each(data.features, function(index){  

	            		if (old_fclts_name != data.features[index].fclts_name){
	            			old_fclts_name = data.features[index].fclts_name;
	            			if (feature != null)
	            			{
	            				feature.content = fea_content;
	            				feature.event_time = fea_event_time;
	            				feature.recover = fea_recover;
	            				SlopeEventFeatures.push(feature);
	            			}
	            			
	            			fea_content = [];
	            			fea_event_time = [];
	            			fea_recover = [];
	            			
	            			var xcord = data.features[index].xcord;
		            		var ycord = data.features[index].ycord;
		            		if (data.features[index].coord_type == 2){
		            			var p = new Proj4js.Point(xcord,ycord);
			                    Proj4js.transform(proj4326, proj900913, p);		                    
			                    xcord = p.x
			                    ycord = p.y; 
		            		}   
		            		
	            			feature = new ol.Feature({
		            			geometry: new ol.geom.Point([xcord, ycord])
		            		});
	            			
	            			feature.hdqr_nm = data.features[index].hdqr_nm;
	            			feature.mtnof_nm = data.features[index].mtnof_nm;
	            			feature.fclts_name = data.features[index].fclts_name;
	            			
	            			fea_content.push(data.features[index].content);
	            			fea_event_time.push(data.features[index].event_time);
	            			
	            			
	            			var strRecover = '';
	            			strRecover = '복구';	            			
	            			
	            			if (data.features[index].recover == 0){
	            				effectSlopeFeatures.push([xcord, ycord]);
	            				strRecover = '장애';
	            				slopeTroblCount++;
	            			}else
	            			{
	            				slopeRecoverCount++;
	            			}
	            			
	            			fea_recover.push(strRecover);
	            			feature.setStyle(slopeGrade1Style);
	            		}else
	            		{
	            			fea_content.push(data.features[index].content);
	            			fea_event_time.push(data.features[index].event_time);
	            			
	            			if (data.features[index].recover == 0){
	            				fea_recover.push('장애');
	            			}else
	            			{
	            				fea_recover.push('복구');
	            			}
	            		}		            		
		            		
	            	});
	            	
	            	feature.content = fea_content;
    				feature.event_time = fea_event_time;
    				feature.recover = fea_recover;
	            	SlopeEventFeatures.push(feature);
	            	map.getLayer("slope").getSource().clear();
	            	map.getLayer("slope").getSource().addFeatures(SlopeEventFeatures);
	            	if (map.getLayer("slope").getVisible() == true)
	            		showSlopeEventEffect(effectSlopeFeatures); 
	            	showSlopeCount(slopeTroblCount+slopeRecoverCount);
	            },
	            error: function(req)
	            {
	            	
	            }
	        });
    }   
    
    function AjaxQueryEventCctv(val){
    	var url = "http://" + location.host + "/fecGetEventCctvAjax.do";
    	
    	$.ajax({
	        	type: 'post',
	            url: url,
	            dataType: 'json',
	            async: true,
	            data: {'deptCode' : val},
	            cache: false,
	            success: function(data){  	            	
       	
	            	if (data.features.length == 0){
	            		showCctvCount(0);
		            	
	            		map.getLayer("cctv").getSource().clear();
	            		return;
	            	}
	            	
	            	var old_fclts_name = '';
	            	var cur_fclts_name = 'fac';
	            	var CctvEventFeatures = [];
	            	var feature = null;
	            	var cctvTroblCount = 0;
	            	var cctvRecoverCount = 0;
	            	
	            	var fea_content = [];
        			var fea_event_time = [];
        			var fea_recover = [];
	            	
	        		
	            	$.each(data.features, function(index){  

	            		if (old_fclts_name != data.features[index].fclts_name){
	            			old_fclts_name = data.features[index].fclts_name;
	            			if (feature != null)
	            			{
	            				feature.content = fea_content;
	            				feature.event_time = fea_event_time;
	            				feature.recover = fea_recover;
	            				CctvEventFeatures.push(feature);
	            			}
	            			
	            			fea_content = [];
	            			fea_event_time = [];
	            			fea_recover = [];
	            			
	            			var xcord = data.features[index].xcord;
		            		var ycord = data.features[index].ycord;
		            		if (data.features[index].coord_type == 2){
		            			var p = new Proj4js.Point(xcord,ycord);
			                    Proj4js.transform(proj4326, proj900913, p);		                    
			                    xcord = p.x
			                    ycord = p.y; 
		            		}   
		            		
	            			feature = new ol.Feature({
		            			geometry: new ol.geom.Point([xcord, ycord])
		            		});
	            			
	            			feature.hdqr_nm = data.features[index].hdqr_nm;
	            			feature.mtnof_nm = data.features[index].mtnof_nm;
	            			feature.fclts_name = data.features[index].fclts_name;
	            			
	            			fea_content.push(data.features[index].content);
	            			fea_event_time.push(data.features[index].event_time);
	            			
	            			
	            			var strRecover = '';
	            			strRecover = '복구';	            			
	            			
	            			if (data.features[index].recover == 0){
	            				effectSlopeFeatures.push([xcord, ycord]);
	            				strRecover = '장애';
	            				cctvTroblCount++;
	            			}else
	            			{
	            				cctvRecoverCount++;
	            			}
	            			
	            			fea_recover.push(strRecover);
	            			feature.setStyle(CCTVGrade1Style);
	            		}else
	            		{
	            			fea_content.push(data.features[index].content);
	            			fea_event_time.push(data.features[index].event_time);
	            			
	            			if (data.features[index].recover == 0){
	            				fea_recover.push('장애');
	            			}else
	            			{
	            				fea_recover.push('복구');
	            			}
	            		}		            		
		            		
	            	});
	            	
	            	feature.content = fea_content;
    				feature.event_time = fea_event_time;
    				feature.recover = fea_recover;
    				CctvEventFeatures.push(feature);
	            	map.getLayer("cctv").getSource().clear();
	            	map.getLayer("cctv").getSource().addFeatures(CctvEventFeatures);
	            	showCctvCount(cctvTroblCount+cctvRecoverCount);
	            },
	            error: function(req)
	            {
	            }
	        });
    }   
    
    function AjaxQueryEventMdt(val){    
    	var url = "http://" + location.host + "/fecGetEventMdtAjax.do";
    	
    	$.ajax({
	        	type: 'post',
	            url: url,
	            dataType: 'json',
	            async: true,
	            data: {'deptCode' : val},
	            cache: false,
	            success: function(data){  	            	
       	
	            	if (data.features.length == 0){
	            		showMdtCount(0);
		            	
	            		map.getLayer("mdt").getSource().clear();
	            		return;
	            	}
	            	
	            	var old_fclts_name = '';
	            	var cur_fclts_name = 'fac';
	            	var MdtEventFeatures = [];
	            	var feature = null;
	            	var mdtTroblCount = 0;
	            	var mdtRecoverCount = 0;
	            	
	            	var fea_content = [];
        			var fea_event_time = [];
        			var fea_recover = [];
	            	
	        		
	            	$.each(data.features, function(index){  

	            		if (old_fclts_name != data.features[index].fclts_name){
	            			old_fclts_name = data.features[index].fclts_name;
	            			if (feature != null)
	            			{
	            				feature.content = fea_content;
	            				feature.event_time = fea_event_time;
	            				feature.recover = fea_recover;
	            				MdtEventFeatures.push(feature);
	            			}
	            			
	            			fea_content = [];
	            			fea_event_time = [];
	            			fea_recover = [];
	            			
	            			var xcord = data.features[index].xcord;
		            		var ycord = data.features[index].ycord;
		            		if (data.features[index].coord_type == 3){
		            			var p = new Proj4js.Point(xcord,ycord);
			                    Proj4js.transform(proj5186, proj900913, p);		                    
			                    xcord = p.x
			                    ycord = p.y; 
		            		}   
		            		
	            			feature = new ol.Feature({
		            			geometry: new ol.geom.Point([xcord, ycord])
		            		});
	            			
	            			feature.hdqr_nm = data.features[index].hdqr_nm;
	            			feature.mtnof_nm = data.features[index].mtnof_nm;
	            			feature.fclts_name = data.features[index].fclts_name;
	            			
	            			fea_content.push(data.features[index].content);
	            			fea_event_time.push(data.features[index].event_time);
	            			
	            			
	            			var strRecover = '';
	            			strRecover = '';	            			
	            			
	            			if (data.features[index].recover == 0){
	            				effectSlopeFeatures.push([xcord, ycord]);
	            				strRecover = '';
	            				mdtTroblCount++;
	            			}else
	            			{
	            				mdtRecoverCount++;
	            			}
	            			
	            			fea_recover.push(strRecover);
	            			if (data.features[index].grade < 85)
	            				feature.setStyle(MdtGrade1Style);
	            			else if (data.features[index].grade >= 85 && data.features[index].grade < 95)
	            				feature.setStyle(MdtGrade2Style);
	            			else 
	            				feature.setStyle(MdtGrade3Style);
	            		}else
	            		{
	            			fea_content.push(data.features[index].content);
	            			fea_event_time.push(data.features[index].event_time);
	            			
	            			if (data.features[index].recover == 0){
	            				fea_recover.push('');
	            			}else
	            			{
	            				fea_recover.push('');
	            			}
	            		}		            		
		            		
	            	});
	            	
	            	feature.content = fea_content;
    				feature.event_time = fea_event_time;
    				feature.recover = fea_recover;
    				MdtEventFeatures.push(feature);
	            	map.getLayer("mdt").getSource().clear();
	            	map.getLayer("mdt").getSource().addFeatures(MdtEventFeatures);
	            	showMdtCount(mdtTroblCount+mdtRecoverCount);
	            },
	            error: function(req)
	            {
	            }
	        });
    }   
       
// 이벤트 효과
var duration1 = 2000;
var duration2 = 2500;
var duration3 = 3000;
function flash_fst(Coord) {
	var start = new Date().getTime();
    var listenerKey;        
    
    function animate(event) {
    	var vectorContext = event.vectorContext;
        var frameState = event.frameState;
        var multiCoord = Coord;
        var flashGeom = new ol.geom.MultiPoint(multiCoord);
        var elapsed = frameState.time - start;
        var elapsedRatio = elapsed / duration1;
        // radius will be 5 at start and 30 at end.
        var radius = ol.easing.easeOut(elapsedRatio) * 15 + 5;
        var opacity = ol.easing.easeOut(1 - elapsedRatio);   

        var style = new ol.style.Style({
          image: new ol.style.Circle({
            radius: radius,
            snapToPixel: false,
            stroke: new ol.style.Stroke({
              color: 'rgba(255, 0, 0, ' + opacity + ')',
              width: 0.25 + opacity
            })
          })
        });

        vectorContext.setStyle(style);
        vectorContext.drawGeometry(flashGeom);
        if (elapsed > duration1) {
            ol.Observable.unByKey(listenerKey);
            return;
          }
      map.render();
    }
    listenerKey = map.on('postcompose', animate);
}

function flash_sec(Coord) {
	var start = new Date().getTime();
    var listenerKey;
    
    
    function animate(event) {
    	var vectorContext = event.vectorContext;
        var frameState = event.frameState;
        var multiCoord = Coord;
        var flashGeom = new ol.geom.MultiPoint(multiCoord);
        var elapsed = frameState.time - start;
        var elapsedRatio = elapsed / duration2;
        // radius will be 5 at start and 30 at end.
        var radius = ol.easing.easeOut(elapsedRatio) * 20 + 10;
        var opacity = ol.easing.easeOut(1 - elapsedRatio);        

        var style = new ol.style.Style({
          image: new ol.style.Circle({
            radius: radius,
            snapToPixel: false,
            stroke: new ol.style.Stroke({
              color: 'rgba(255, 0, 0, ' + opacity + ')',
              width: 0.25 + opacity
            })
          })
        });

        vectorContext.setStyle(style);
        vectorContext.drawGeometry(flashGeom);
        if (elapsed > duration2) {
            ol.Observable.unByKey(listenerKey);
            return;
          }
      map.render();
    }
    listenerKey = map.on('postcompose', animate);
}

function flash_thr(Coord) {
	var start = new Date().getTime();
    var listenerKey;    
    
    function animate(event) {
    	var vectorContext = event.vectorContext;
        var frameState = event.frameState;
        var multiCoord = Coord;
        var flashGeom = new ol.geom.MultiPoint(multiCoord);
        var elapsed = frameState.time - start;
        var elapsedRatio = elapsed / duration3;
        // radius will be 5 at start and 30 at end.
        var radius = ol.easing.easeOut(elapsedRatio) * 25 + 15;
        var opacity = ol.easing.easeOut(1 - elapsedRatio);        

        var style = new ol.style.Style({
          image: new ol.style.Circle({
            radius: radius,
            snapToPixel: false,
            stroke: new ol.style.Stroke({
              color: 'rgba(255, 0, 0, ' + opacity + ')',
              width: 0.25 + opacity
            })
          })
        });

        vectorContext.setStyle(style);
        vectorContext.drawGeometry(flashGeom);
        
        if (elapsed > duration3) {
            ol.Observable.unByKey(listenerKey);
            return;
          }

      map.render(); 
      
    }
    listenerKey = map.on('postcompose', animate);
}

function showTunnelEventEffect(coord){
	if (coord.length == 0)
		return;
	flash_fst(coord);		
	flash_sec(coord);	
	flash_thr(coord);	
	
	arryTunnelEventInstance[arryTunnelEventInstance.length] = setInterval($.proxy(function () {
		flash_fst(coord);		
		flash_sec(coord);	
		flash_thr(coord);
	}, this), 3000);
}

function closeTunnelEventEffect(){
	for (var nIndex = 0; nIndex < arryTunnelEventInstance.length;nIndex++){
		clearInterval(arryTunnelEventInstance[nIndex]);        			
	}  
	
	arryTunnelEventInstance=[];  
}

function showElctsEventEffect(coord){
	if (coord.length == 0)
		return;
	flash_fst(coord);		
	flash_sec(coord);	
	flash_thr(coord);
	
	arryElctsEventInstance[arryElctsEventInstance.length] = setInterval($.proxy(function () {
		flash_fst(coord);		
		flash_sec(coord);	
		flash_thr(coord);
	}, this), 3000);
}

function closeElctsEventEffect(){
	for (var nIndex = 0; nIndex < arryElctsEventInstance.length;nIndex++){
		clearInterval(arryElctsEventInstance[nIndex]);        			
	}  
	
	arryElctsEventInstance=[]; 
}

function showSvarEventEffect(coord){
	if (coord.length == 0)
		return;
	flash_fst(coord);		
	flash_sec(coord);	
	flash_thr(coord);
	
	arrySvarEventInstance[arrySvarEventInstance.length] = setInterval($.proxy(function () {
		flash_fst(coord);		
		flash_sec(coord);	
		flash_thr(coord);
	}, this), 3000);
}

function closeSvarEventEffect(){
	for (var nIndex = 0; nIndex < arrySvarEventInstance.length;nIndex++){
		clearInterval(arrySvarEventInstance[nIndex]);        			
	}  
	
	arrySvarEventInstance=[]; 
}

function showSlopeEventEffect(coord){
	if (coord.length == 0)
		return;
	flash_fst(coord);		
	flash_sec(coord);	
	flash_thr(coord);
	
	arrySlopeEventInstance[arrySlopeEventInstance.length] = setInterval($.proxy(function () {
		flash_fst(coord);		
		flash_sec(coord);	
		flash_thr(coord);
	}, this), 3000);
}

function closeSlopeEventEffect(){
	for (var nIndex = 0; nIndex < arrySlopeEventInstance.length;nIndex++){
		clearInterval(arrySlopeEventInstance[nIndex]);        			
	}  
	arrySlopeEventInstance=[]; 
}

function showEventEffect(coord){
	flash_fst(coord);		
	flash_sec(coord);	
	flash_thr(coord);
}

function showMdtCount(val){
	$("#spanMdt").text(val);
}

function showTunnelCount(val){
	$("#spanTunnel").text(val);
}

function showElctsCount(val){
	$("#spanElcts").text(val);
}

function showSvarCount(val){
	$("#spanSvar").text(val);
}

function showCctvCount(val){
	$("#spanCctv").text(val);
}

function showSlopeCount(val){
	$("#spanSlope").text(val);
}

