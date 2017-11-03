var DeptName = '';
var DeptJson = '';
var MaxListCount = 0;
var CurrentListIdx = 0;
var breaktimer = false;
AjaxQuery = function(DeptCode) {
	if (DeptCode == ''  ){
		//alert('검색조건을 확인하십시오.');
		return;
	}
	breaktimer = true;
	if (timeoutObj != null){
		clearTimeout(timeoutObj);
		timeoutObj = null;
	}
	var url = "http://" + location.host + "/FecEventListLv2.do";
	
    $.ajax(
    {
    	type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: {'DeptCode' : DeptCode },
        cache: false,
        success: function(data){ 
        	
        		var eHtml = '';
        		var eStyle= 'display:none;height:0px;';
        		var count = 0;
        		$.each(data.data, function(index){
        			count++;
        			if (count>4)
        				eHtml += '<ul id="ul'+count+'" style="'+eStyle+'">';	
        			else
        				eHtml += '<ul id="ul'+count+'" >';
        			eHtml += '<li class="leftPos" >'+data.data[index].event_time+'</li>';	
        			eHtml += '<li class="middlePos">'+data.data[index].kubun+'</li>';
        			eHtml += '<li class="middlePos" style="width:250px;">'+data.data[index].fclts_name+'</li>';	
        			eHtml += '<li class="rightPos">'+data.data[index].content+'</li>';
        			eHtml += '</ul>';        			
	        	});          		
        		var idx = count+1;
        		if (count < 4){
        			for (idx;idx<=4;idx++){
        				eHtml += '<ul id="u'+idx+'" style="">';	
            			eHtml += '<li class="leftPos" ></li>';	
            			eHtml += '<li class="middlePos"></li>';	
            			eHtml += '<li class="middlePos" style="width:250px;"></li>';
            			eHtml += '<li class="rightPos" ></li>';	
            			eHtml += '</ul>';
            			count++;
        			}
        			
        		}
        		
        		MaxListCount = count;
        		CurrentListIdx = 0;        		
            
    		
    		$('#idTable_inform  *').remove();
    		$('#idTable_inform').html(eHtml);
							
			setTimeout($.proxy(function () {
				breaktimer = false;
				ChangeRow();
			}, this), 3000);
        },
        error: function(req)
        {
            //alert("Error : \n\n" + req.responseText);
        }
    });
};
