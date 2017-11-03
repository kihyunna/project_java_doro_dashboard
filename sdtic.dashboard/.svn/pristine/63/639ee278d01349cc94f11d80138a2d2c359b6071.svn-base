AjaxQuery = function(buseo_code) {
	if (buseo_code == ''){
		//alert('검색조건을 확인하십시오.');
		return;
	}	
	var url = "http://" + location.host + "/fec/fecSptEqpOprCstsLv1.do";
	
    $.ajax(
    {
    	type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: {'bonbuCode' : buseo_code},
        cache: false,
        success: function(data){
        	var arrytunnel = [];
        	var arryelcts_tunnel = [];
        	var arryelcts_office = [];
        	var arryelcts_lamp = [];
        	var arrysvar = [];
        	var arryslp = [];
        	var arrycctv = [];
        	var name = [];
        	
        	$.each(data.data, function(index){
        		var obj = {};
        		obj.TROBLCNT = data.data[index].TROBLCNT;
    			obj.TOTALCNT = data.data[index].TOTALCNT;
    			
        		if (data.data[index].NAME == 'tunnel'){
        			arrytunnel.push(obj);
        			name.push(data.data[index].MTNOF_NM);
        		}else if (data.data[index].NAME == 'elcts_tunnel'){
        			arryelcts_tunnel.push(obj);        			
        		}else if (data.data[index].NAME == 'elcts_office'){
        			arryelcts_office.push(obj); 
        		}else if (data.data[index].NAME == 'elcts_lamp'){
        			arryelcts_lamp.push(obj); 
        		}else if (data.data[index].NAME == 'svar'){
        			arrysvar.push(obj); 
        		}else if (data.data[index].NAME == 'slp'){
        			arryslp.push(obj); 
        		}else if (data.data[index].NAME == 'cctv'){
        			arrycctv.push(obj); 
        		}        		
        	
        	});  
        	
        	$('.ul_table *').remove();
        	var shtml = "";
        	shtml += '<li>';
            shtml += '<dl class="list maki">';
            shtml += '<dt>지사명</dt>';            
        	shtml += setDept(name);
        	
        	shtml += '</dl>';
            shtml += '</li>';
            shtml += '<li>';
            shtml += '<dl class="list maki" >';
            shtml += '<dt>터널</dt>';
            shtml += setTunnel(arrytunnel);
        	
            shtml += '</dl>';
            shtml += '</li>';
            shtml += '<li>';
            shtml += '<dl class="list maki">';
            shtml += '<dt class="tit2tab">전기</dt>';
            shtml += '</dl>';
            shtml += '<dl class="list maki wid_none">';
            shtml += '<dt class="he_25" style="width:100px">터널</dt>';
            shtml += setElcts_tunnel(arryelcts_tunnel);
            
            shtml += '</dl>';
            shtml += '<dl class="list maki wid_none">';
            shtml += '<dt class="he_25" style="width:100px">영업소</dt>';
            shtml += setElcts_office(arryelcts_office);
        	
            shtml += '</dl>';
            shtml += '<dl class="list maki wid_none" >';
            shtml += '<dt class="he_25" style="width:100px">가로등/조명탑</dt>';
            shtml += setElcts_lamp(arryelcts_lamp);
            
            shtml += '</dl>';
            shtml += '</li>';
            shtml += '<li>';
            shtml += '<dl class="list maki" >';
            shtml += '<dt>사면</dt>';
            shtml += setSlope(arryslp);
        	
        	shtml += '</dl>';
            shtml += '</li>';
            shtml += '<li>';
            shtml += '<dl class="list maki" >';
            shtml += '<dt>오수</dt>';
            shtml += setSvar(arrysvar);  
        	
        	shtml += '</dl>';
            shtml += '</li>';
            shtml += '<li>';
            shtml += '<dl class="list maki" >';
            shtml += '<dt>CCTV</dt>';            
            shtml += setCctv(arrycctv); 

            
            shtml += '</dl>';
            shtml += '</li>';
            shtml += '</ul>';
            shtml += '</section>';
            $('.ul_table').append(shtml);
        	
            if ( $.fn.makisu.enabled ) {

                var $maki = $( '.maki' );

                // Create Makisus

                $maki.makisu({
                   selector: 'dd',
                   overlap: 0.6,
                   speed: 0.85,

                });

                // Open all
                
                $( '.list' ).makisu( 'open' );

                // Toggle on click

                $( '.toggle' ).on( 'click', function() {
                   $( '.list' ).makisu( 'toggle' );
                });

                // Disable all links

                $( '.demo a' ).click( function( event ) {
                   event.preventDefault();
                });
        	} else {
        		$('.warning').show();
        	} 

        }
    });
}

function setDept(deptArr){
	var shtml = "";
	//$('#dl_name *').remove();
	//shtml += "<dt>지사명</dt>";
	for(var i = 0;i<8;i++){
		if (i <  deptArr.length)
			shtml += "<dd><a>"+deptArr[i]+"</a></dd>";
		else
			shtml += "<dd><a></a></dd>";
	}
	
	//$('#dl_name').append(shtml);
	return shtml;
}

function setTunnel(valArray){
	var shtml = "";
//	$('#dl_tunnel *').remove();
//	shtml += "<dt>터널</dt>";

	for(var i = 0;i<8;i++){
		if (i <  valArray.length){			
			var trobl = valArray[i].TROBLCNT;
			var total = valArray[i].TOTALCNT;
			if ((total-trobl) == total)
				shtml += '<dd><a>'+total+' / '+total+'</a></dd>';
			else
				shtml += '<dd class="bgPrb"><a>'+(total-trobl)+' / '+total+'</a></dd>';
		}	
		else
			shtml += '<dd><a></a></dd>';
	}
	
//	$('#dl_tunnel').append(shtml);
	return shtml;
}

function setElcts_tunnel(valArray){
	var shtml = '';
//	shtml += '<dt class="he_25" style="width:103px">터널</dt>';

	for(var i = 0;i<8;i++){
		if (i <  valArray.length){			
			var trobl = valArray[i].TROBLCNT;
			var total = valArray[i].TOTALCNT;
			if ((total-trobl) == total)
				shtml += '<dd style="width:103px"><a>'+total+' / '+total+'</a></dd>';
			else
				shtml += '<dd class="bgPrb" style="width:103px"><a>'+(total-trobl)+' / '+total+'</a></dd>';
		}	
		else
			shtml += '<dd style="width:103px"><a></a></dd>';
	}
	
//	$('#dl_elcts_tunnel').html(shtml);
	return shtml;
}

function setElcts_office(valArray){
	var shtml = '';
//	shtml += '<dt class="he_25" style="width:103px">영업소</dt>';

	for(var i = 0;i<8;i++){
		if (i <  valArray.length){			
			var trobl = valArray[i].TROBLCNT;
			var total = valArray[i].TOTALCNT;
			if ((total-trobl) == total)
				shtml += '<dd style="width:103px"><a>'+total+' / '+total+'</a></dd>';
			else
				shtml += '<dd class="bgPrb" style="width:103px"><a>'+(total-trobl)+' / '+total+'</a></dd>';
		}	
		else
			shtml += '<dd style="width:103px"><a></a></dd>';
	}
	
//	$('#dl_elcts_office').html(shtml);
	return shtml;
}

function setElcts_lamp(valArray){
	var shtml = '';
//	shtml += '<dt class="he_25" style="width:103px">가로등/조명탑</dt>';

	for(var i = 0;i<8;i++){
		if (i <  valArray.length){			
			var trobl = valArray[i].TROBLCNT;
			var total = valArray[i].TOTALCNT;
			if ((total-trobl) == total)
				shtml += '<dd style="width:103px"><a>'+total+' / '+total+'</a></dd>';
			else
				shtml += '<dd class="bgPrb" style="width:103px"><a>'+(total-trobl)+' / '+total+'</a></dd>';
		}	
		else
			shtml += '<dd style="width:103px"><a></a></dd>';
	}
	
//	$('#dl_elcts_lamp').html(shtml);
	return shtml;
}

function setSlope(valArray){
	var shtml = "";
//	shtml += "<dt>사면</dt>";

	for(var i = 0;i<8;i++){
		if (i <  valArray.length){			
			var trobl = valArray[i].TROBLCNT;
			var total = valArray[i].TOTALCNT;
			if ((total-trobl) == total)
				shtml += '<dd><a>'+total+' / '+total+'</a></dd>';
			else
				shtml += '<dd class="bgPrb"><a>'+(total-trobl)+' / '+total+'</a></dd>';
		}	
		else
			shtml += '<dd><a></a></dd>';
	}
	
//	$('#dl_slp').html(shtml);
	return shtml;
}

function setSvar(valArray){
	var shtml = "";
//	shtml += "<dt>오수</dt>";

	for(var i = 0;i<8;i++){
		if (i <  valArray.length){			
			var trobl = valArray[i].TROBLCNT;
			var total = valArray[i].TOTALCNT;
			if ((total-trobl) == total)
				shtml += '<dd><a>'+(total-trobl)+' / '+total+'</a></dd>';
			else
				shtml += '<dd class="bgPrb"><a>'+(total-trobl)+' / '+total+'</a></dd>';
		}	
		else
			shtml += '<dd><a></a></dd>';
	}
	
//	$('#dl_svar').html(shtml);
	return shtml;
}

function setCctv(valArray){
	var shtml = "";

	for(var i = 0;i<8;i++){
		if (i <  valArray.length){			
			var trobl = valArray[i].TROBLCNT;
			var total = valArray[i].TOTALCNT;
			if ((total-trobl) == total)
				shtml += '<dd><a>'+(total-trobl)+' / '+total+'</a></dd>';
			else
				shtml += '<dd class="bgPrb"><a>'+(total-trobl)+' / '+total+'</a></dd>';
		}	
		else
			shtml += '<dd><a></a></dd>';
	}

	return shtml;
}
