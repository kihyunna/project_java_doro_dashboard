var DeptName = '';
var DeptJson = '';
var MaxListCount = 0;
var CurrentListIdx = 0;
  

AjaxQuery = function(buseo_code, fac_code, locationPath) {
	if (buseo_code == '' || fac_code == '' ){
		//alert('검색조건을 확인하십시오.');
		return;
	}
		
	var url = "http://" + location.host + "/FecMDTOperTroblLv2.do";
		
    $.ajax(
    {
    	type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: {'deptCode' : buseo_code, 'facCode' : fac_code },
        cache: false,
        success: function(data){ 
        	
        	var data_Trobl = [];  
        	
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

    		var eHtml = setMdtInfo(data_Trobl);  
   
    		
    		$('#idTable_inform  *').remove();
    		$('#idTable_inform').append(eHtml);
    		
    		$( "#idDiv" ).fadeIn( "fast", function() {    			
    			ChangeRow();	
    		});
    		
        },
        error: function(req)
        {
            
        }
    });
};

function setMdtInfo(data){
	var eHtml = '';
	var eStyle= 'display:none;height:0px;';
	var count = 0;
	$.each(data, function(index){
		$( "#idDiv" ).fadeOut( "fast", function() {});
		count++;
		if (count>5)
			eHtml += '<ul id="ul'+count+'" style="height:37px;width:295px;'+eStyle+'">';	
		else
			eHtml += '<ul id="ul'+count+'" style="height:37px;width:295px;">';
		eHtml += '<li class="leftPos" >'+data[index].mdtId+'</li>';	
		eHtml += '<li class="middlePos">'+data[index].mdtLastLc+'</li>';	
		eHtml += '<li class="rightPos" >'+data[index].ratio+'</li>';	
		eHtml += '</ul>';
		
	});  
	var idx = count+1;
	if (count < 5){
		for (idx;idx<=5;idx++){
			eHtml += '<ul id="u'+idx+'" style="height:37px;width:295px;">';	
			eHtml += '<li class="leftPos" ></li>';	
			eHtml += '<li class="middlePos"></li>';	
			eHtml += '<li class="rightPos" ></li>';	
			eHtml += '</ul>';
			count++;
		}		
	}	
	MaxListCount = count;
	CurrentListIdx = 0; 
	
	return eHtml;
}

var mapError = [];
var mapInfo = [];
function createData(){
	mapInfo.push({deptCode:'1',deptNm:'인천지사',mdtId:'경기33가1234',mdtOpert:'',mdtLastLc:'AVMS(구)',ratio:'99%'});
	mapInfo.push({deptCode:'1',deptNm:'시흥지사',mdtId:'경기33허0974',mdtOpert:'',mdtLastLc:'AVMS(구)',ratio:'99%'});
	mapInfo.push({deptCode:'1',deptNm:'군포지사',mdtId:'경기23허0842',mdtOpert:'',mdtLastLc:'AVMS(구)',ratio:'99%'});
	mapInfo.push({deptCode:'1',deptNm:'화성지사',mdtId:'경기23허0444',mdtOpert:'',mdtLastLc:'AVMS(신)',ratio:'99%'});
	mapInfo.push({deptCode:'1',deptNm:'수원지사',mdtId:'경기11허2345',mdtOpert:'',mdtLastLc:'A2000S',ratio:'99%'});
	mapInfo.push({deptCode:'1',deptNm:'경기광주지사',mdtId:'경기12능3242',mdtOpert:'',mdtLastLc:'AVMS(신)',ratio:'99%'});
	mapInfo.push({deptCode:'1',deptNm:'동서울지사',mdtId:'서울32너2345',mdtOpert:'',mdtLastLc:'AVMS(신)',ratio:'99%'});
	mapInfo.push({deptCode:'1',deptNm:'동서울지사',mdtId:'서울92마2098',mdtOpert:'',mdtLastLc:'AVMS(구)',ratio:'99%'});
	mapInfo.push({deptCode:'1',deptNm:'화성지사',mdtId:'경기23나1023',mdtOpert:'',mdtLastLc:'AVMS(구)',ratio:'99%'});
}