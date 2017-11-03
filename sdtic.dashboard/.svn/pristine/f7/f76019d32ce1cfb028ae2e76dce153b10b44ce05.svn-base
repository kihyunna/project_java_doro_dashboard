var DeptName = '';
var DeptJson = '';
var MaxListCount = 0;
var CurrentListIdx = 0;

AjaxQuery = function(buseo_code, fac_code, locationPath) {
	if (buseo_code == '' || fac_code == '' ){
		//alert('검색조건을 확인하십시오.');
		return;
	}
		
	var url = "http://" + location.host + "/fec/fecElctyFcltsLv2.do";
	
    $.ajax(
    {
    	type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: {'deptCode' : buseo_code, 'facCode' : fac_code },
        cache: false,
        success: function(data){ 
        	
        		var eHtml = '';
        		var eStyle= 'display:none;height:0px;';
        		var count = 0;
        		$.each(data.Trobl, function(index){
        			count++;
        			if (count>5)
        				eHtml += '<ul id="ul'+count+'" style="'+eStyle+'">';	
        			else
        				eHtml += '<ul id="ul'+count+'" >';
        			eHtml += '<li class="leftPos" >'+data.Trobl[index].elctyFcltyNm+'</li>';	
        			eHtml += '<li class="middlePos" style="width:70px;"><img src="/images/fecrs/Q'+data.Trobl[index].troblCn+'.png" width="30"></li>';	
        			eHtml += '<li class="rightPos"><img src="/images/fecrs/Q'+data.Trobl[index].occrrncTime+'.png" width="30"></li>';
        			eHtml += '</ul>';
        			
        			
	        	});  
        		var idx = count+1;
        		if (count < 5){
        			for (idx;idx<=5;idx++){
        				eHtml += '<ul id="u'+idx+'" style="">';	
            			eHtml += '<li class="leftPos" ></li>';	
            			eHtml += '<li class="middlePos" style="width:117px;"></li>';	
            			eHtml += '<li class="rightPos" ></li>';	
            			eHtml += '</ul>';
            			count++;
        			}
        			
        		}
        		
        		MaxListCount = count;
        		CurrentListIdx = 0;        		
            
    		
    		$('#idTable_inform  *').remove();
    		$('#idTable_inform').append(eHtml);
    		
    		$( "#idDiv" ).fadeIn( "slow", function() {
    			
    		});
    		
//            refresh();
//			myChart.setOption(Options);
							
			setTimeout($.proxy(function () {
				ChangeRow();
			}, this), 1500);
        },
        error: function(req)
        {
            //alert("Error : \n\n" + req.responseText);
        }
    });
};


