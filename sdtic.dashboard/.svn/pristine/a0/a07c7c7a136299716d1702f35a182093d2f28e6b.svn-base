AjaxQuery = function(DeptCode) {
	if (DeptCode == ''  ){
		//alert('검색조건을 확인하십시오.');
		return;
	}
		
	var url = "http://" + location.host + "/fec/FecSptMap.do";	
		
	$.ajax(
    {
    	type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: {'DeptCode' : DeptCode},
        cache: false,
        success: function(data){ 
        	$('#mdt').html(0);
        	$('#tunnel').html(0);
        	$('#elcty').html(0);
        	$('#slope').html(0);
        	$('#pltwtrProcess').html(0);
        	$('#cctv').html(0);
	        $.each(data.data, function(index){

	        	if (data.data[index].name =='tunnel'){
	        		$('#tunnel').html(data.data[index].cnt);
	        	} else if (data.data[index].name =='elcty'){
	        		$('#elcty').html(data.data[index].cnt);
	        	} else if (data.data[index].name =='slope'){
	        		$('#slope').html(data.data[index].cnt);
	        	} else if (data.data[index].name =='pltwtrProcess'){
	        		$('#pltwtrProcess').html(data.data[index].cnt);
	        	} else if (data.data[index].name =='cctv'){
	        		$('#cctv').html(data.data[index].cnt);
	        	} 
	        	
	        });
	        
	        $.each(data.mdt, function(index){

	        	if (data.mdt[index].name =='mdt'){
	        		$('#mdt').html(data.mdt[index].cnt);
	        	}
	        	
	        });
	        
	        
        },
        error: function(req)
        {
        	
        }
        
        
    });
};
		
