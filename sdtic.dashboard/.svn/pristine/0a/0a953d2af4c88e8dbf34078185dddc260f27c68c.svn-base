var DeptName = '';
var DeptJson = '';
var MaxListCount = 0;
var CurrentListIdx = 0;
  

function getDeptOption(sVal){
	if (sVal == '2'){
		DeptName = '강원본부';
		DeptJson = 'kangwon';		
	}else if (sVal == '7'){
		DeptName = '경북본부';
		DeptJson = 'kyeongbuk';	
	}else if (sVal == '8'){
		DeptName = '경남본부';
		DeptJson = 'kyeongnam';	
	}else if (sVal == '1'){
		DeptName = '수도권본부';
		DeptJson = 'kyeonggi';	
	}else if (sVal == '3'){
		DeptName = '충북본부';
		DeptJson = 'chungbuk';	
	}else if (sVal == '4'){
		DeptName = '충남본부';
		DeptJson = 'chungnam';	
	}else if (sVal == '5'){
		DeptName = '전북본부';
		DeptJson = 'jeonbuk';	
	}else if (sVal == '6'){
		DeptName = '전남본부';
		DeptJson = 'jeonnam';	
	}else{
		DeptName = '수도권본부';
		DeptJson = 'kyeonggi';	
	}
	
}
	

AjaxQuery = function(buseo_code, fac_code, locationPath) {
	if (buseo_code == '' || fac_code == '' ){
		//alert('검색조건을 확인하십시오.');
		return;
	}
		
	getDeptOption(buseo_code);
	var url = "http://" + location.host + "/fecMDTOperLv2.do";
	
    $.ajax(
    {
    	type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: {'deptCode' : buseo_code, 'facCode' : fac_code },
        cache: false,
        success: function(data){  
        	var data_Oper = {};
        	var data_Trobl = [];     	
        	        	
        	for (var nidx = 0; nidx<mapError.length;nidx++){
        		if (mapError[nidx].deptCode == buseo_code)
        			data_Oper = mapError[nidx];
        	}
        	
        	for (var nidx = 0; nidx<mapInfo.length;nidx++){
        		if (mapInfo[nidx].deptCode == buseo_code)
        			data_Trobl.push(mapInfo[nidx]);
        	}
        	
        	var troblCount = data_Trobl.length-4;        	
        	
        	if (troblCount < 1)
        		troblCount = 1;
        	        	
        	timeInterval = Math.round(10000 / troblCount);
        	if (timeInterval > 1500)
        		timeInterval = 1500;        	
        		
        	var sHtml = setMdtRatio(data_Oper);     		
    		
    		$('#idTable_mdt  *').remove();
    		$('#idTable_mdt').append(sHtml);

        },
        error: function(req)
        {
            
        }
    });
};

function setMdtRatio(data){	
	
	var sHtml = '';
	sHtml += '<table class="tblWgt" summary="수신율별로 금일과 전일의 운행차량 댓수를 보여 준다.">';	
	sHtml += '<caption>수신율별 운행차량</caption>';
	sHtml += '<colgroup>';
	sHtml += '	<col width="100px" />';
	sHtml += '	<col width="130px" />';
	sHtml += '	<col width="130px" />';
	sHtml += '</colgroup>';
	sHtml += '<thead>';
	sHtml += '	<tr>';
	sHtml += '		<th scope="col">수신율</th>';
	sHtml += '		<th scope="col">운행차량(전일)</th>';
	sHtml += '		<th scope="col">운행차량(금일)</th>	';				
	sHtml += '	</tr>';
	sHtml += '</thead>';
	sHtml += '<tbody>';
	sHtml += '	<tr class="tpG">';
	sHtml += '		<th scope="row">95% 이상</th>';					
	sHtml += '		<td>'+data.nrmltBfrt+'</td>';
	sHtml += '		<td>'+data.nrmltToday+'</td>';
	sHtml += '	</tr>';
	sHtml += '	<tr class="tpY">';
	sHtml += '		<th scope="row">85~94%</th>';
	sHtml += '		<td>'+data.warnBfrt+'</td>';
	sHtml += '		<td>'+data.warnToday+'</td>';
	sHtml += '	</tr>';
	sHtml += '	<tr class="tpR">';
	sHtml += '		<th scope="row">85% 이하</th>';
	sHtml += '		<td>'+data.troblBfrt+'</td>';
	sHtml += '		<td>'+data.troblToday+'</td>';
	sHtml += '	</tr>';
	sHtml += '</tbody>';
	sHtml += '</table>';

	return sHtml;
}

var mapError = [];
function createData(){
	
	mapError.push({deptCode:'1',deptNm:'수도권본부',nrmltToday:'1',warnToday:'2',troblToday:'1',nrmltBfrt:'2',warnBfrt:'1',troblBfrt:'0'});
	mapError.push({deptCode:'2',deptNm:'강원본부',nrmltToday:'2',warnToday:'2',troblToday:'0',nrmltBfrt:'0',warnBfrt:'1',troblBfrt:'1'});
	mapError.push({deptCode:'3',deptNm:'충북본부',nrmltToday:'3',warnToday:'2',troblToday:'1',nrmltBfrt:'2',warnBfrt:'1',troblBfrt:'2'});
	mapError.push({deptCode:'4',deptNm:'충남본부',nrmltToday:'1',warnToday:'1',troblToday:'0',nrmltBfrt:'1',warnBfrt:'2',troblBfrt:'0'});
	mapError.push({deptCode:'5',deptNm:'전북본부',nrmltToday:'2',warnToday:'2',troblToday:'1',nrmltBfrt:'2',warnBfrt:'0',troblBfrt:'1'});
	mapError.push({deptCode:'6',deptNm:'전남본부',nrmltToday:'3',warnToday:'2',troblToday:'0',nrmltBfrt:'1',warnBfrt:'0',troblBfrt:'0'});
	mapError.push({deptCode:'7',deptNm:'경북본부',nrmltToday:'1',warnToday:'2',troblToday:'2',nrmltBfrt:'0',warnBfrt:'1',troblBfrt:'0'});
	mapError.push({deptCode:'8',deptNm:'경남본부',nrmltToday:'2',warnToday:'1',troblToday:'0',nrmltBfrt:'1',warnBfrt:'0',troblBfrt:'0'});

}