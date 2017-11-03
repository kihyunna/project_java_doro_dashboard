var DeptName = '';
var DeptJson = '';
var MaxListCount = 0;
var CurrentListIdx = 0;

AjaxQuery = function(buseo_code, fac_code, locationPath) {
	if (buseo_code == '' || fac_code == '' ){
		//alert('검색조건을 확인하십시오.');
		return;
	}
		
	var url = "http://" + location.host + "/FecSlopeDetailLv2.do";
	
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
        		$.each(Trobl, function(index){
        			count++;
        			if (count>5)
        				eHtml += '<ul id="ul'+count+'" style="'+eStyle+'">';	
        			else
        				eHtml += '<ul id="ul'+count+'" >';
        			eHtml += '<li class="leftPos" >'+Trobl[index].slopeNm+'</li>';	
        			eHtml += '<li class="middlePos" style="width:70px;"><img src="/images/fecrs/icoNmlCb'+Trobl[index].gateway+'.png" width="16px"></li>';	
        			eHtml += '<li class="middlePos"><img src="/images/fecrs/icoNmlCb'+Trobl[index].sensor+'.png" width="16px"></li>';
        			eHtml += '<li class="rightPos">'+Trobl[index].impactMax+'</li>';
        			eHtml += '</ul>';        			
        			
	        	});  
        		var idx = count+1;
        		if (count < 5){
        			for (idx;idx<=5;idx++){
        				eHtml += '<ul id="u'+idx+'" style="">';	
            			eHtml += '<li class="leftPos" ></li>';	
            			eHtml += '<li class="middlePos"></li>';	
            			eHtml += '<li class="middlePos"></li>';	
            			eHtml += '<li class="rightPos" ></li>';	
            			eHtml += '</ul>';
            			count++;
        			}
        			
        		}
        		
        		MaxListCount = count;
        		CurrentListIdx = 0;        		
            
    		
    		$('#idTable_inform  *').remove();
    		$('#idTable_inform').append(eHtml);
    		
    		$( "#idDiv" ).fadeIn( "fast", function() {
    			
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

var Trobl = [];
function createData(){
	Trobl.push({deptCode:'1',slopeNm:'ㄱㄴ사면',gateway:'0',sensor:'0',impactMax:'712',impactAvg:'712'});
	Trobl.push({deptCode:'1',slopeNm:'ㅅㅇ사면',gateway:'0',sensor:'0',impactMax:'263',impactAvg:'263'});
	Trobl.push({deptCode:'1',slopeNm:'ㅇㅇ사면',gateway:'0',sensor:'0',impactMax:'83',impactAvg:'83'});
//	Trobl.push({deptCode:'1',slopeNm:'ㅁㄴ휴게소',gateway:'0',filter:'0',pump:'1',elctrnValve:'0',ph:'9.4'});
//	Trobl.push({deptCode:'1',slopeNm:'ㅈㅇ휴게소',gateway:'0',filter:'0',pump:'0',elctrnValve:'0',ph:'7.04'});	
}
