
AjaxQuery = function(buseo_code, fac_code, locationPath) {
	if (buseo_code == '' || fac_code == '' ){
		//alert('검색조건을 확인하십시오.');
		return;
	}
		
	var url = "http://" + location.host + "/fec/fecTunnelDetailLv2.do";
	
    $.ajax(
    {
    	type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: {'deptCode' : buseo_code, 'facCode' : fac_code },
        cache: false,
        success: function(data){        	
    		

        },
        error: function(req)
        {
            //alert("Error : \n\n" + req.responseText);
        }
    });
};

