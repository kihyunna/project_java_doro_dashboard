AjaxQuery = function() {		
	var url = "http://" + location.host + "/mainSptSensor.do";
	
    $.ajax(
    {
    	type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: {},
        cache: false,
        success: function(data){ 
        	$.each(data.data, function(index){ 
        		setData(data.data[index].NAME, data.data[index].TROBLCNT, data.data[index].TOTALCNT);
        	});  
        	
        	$.each(data.mdt, function(index){ 
        		setData(data.mdt[index].NAME, data.mdt[index].TROBLCNT, data.mdt[index].TOTALCNT, false);
        	}); 
        },
        error: function(req)        
        {          	
          
        }
    });
};

function setData(objName, troblCnt, totalCnt, bMdt){
	//게이지
	var div_obj = $('#div_'+objName);	
	var per = parseInt(((totalCnt-troblCnt)/totalCnt)*100);
	if (bMdt == false)
		per = parseInt((troblCnt/totalCnt)*100);
	div_obj.css("width",per+"%"); 
	
	//tr 색상 변경
	var tr_obj = $('#tr_'+objName);
	if (per <= 70){
		tr_obj.attr('class','tpWrn');
		if (bMdt == false)
			tr_obj.attr('class','');
	}
	
	//td갯수
	var td_obj = $('#td_'+objName);
	
	td_obj.html('<span class="numPrb">'+numberWithCommas(totalCnt-troblCnt)+'</span>/'+numberWithCommas(totalCnt));
	if (bMdt == false)
		td_obj.html('<span class="numPrb">'+numberWithCommas(troblCnt)+'</span>/'+numberWithCommas(totalCnt));
}

function numberWithCommas(x) { return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); }
