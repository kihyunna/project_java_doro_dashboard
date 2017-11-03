AjaxQuery = function(buseo_code, fac_code, locationPath) {
	if (buseo_code == '' || fac_code == '' ){
		//alert('검색조건을 확인하십시오.');
		return;
	}
		
	var url = "http://" + location.host + "/fec/fecSptEqpOprCstsMain.do";
	
    $.ajax(
    {
    	type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: {'buseo_code' : buseo_code, 'fac_code' : fac_code },
        cache: false,
        success: function(data){
        	$.each(data, function(index){
//        		sHtml += '<tr>'; 
//        		sHtml += '<td class="center">'+nCnt+'</td>'; 
//        		sHtml += '<td class="center">'+data[index].data1+'</td>';        		 
//        		sHtml += '<td class="right">'+getCommaSuso(data[index].area,0)+'</td>'; 
//        		sHtml += '<td class="right">'+getCommaSuso(data[index].ratio,2)+'</td>'; 
//        		sHtml += '</tr>';
        	
        	});          	

        	//setTimeout(tRefresh,10000);
        	
        	if (buseo_code == 1)
        	{
        		rRefresh();	
        	}else
        	{
        		tRefresh();	
        	}	
        	
        	setTimeout(function(){$( '.list' ).makisu( 'toggle' )}, 9000);
        	
        }
    });
}

function tRefresh(){
    $('.ul_table *').remove();
    var shtml = "";
    shtml += '<li>';
    shtml += '<dl class="list maki">';
    shtml += '<dt>지사명</dt>';
    shtml += '<dd><a href="#">구미</a></dd>';
    shtml += '<dd><a href="#">대구</a></dd>';
    shtml += '<dd><a href="#">군위</a></dd>';
    shtml += '<dd><a href="#">상주</a></dd>';
    shtml += '<dd><a href="#">영천</a></dd>';
    shtml += '<dd><a href="#">고령</a></dd>';
    shtml += '<dd><a href="#">영주</a></dd>';
    shtml += '<dd><a href="#">성주</a></dd>';
    shtml += '</dl>';
    shtml += '</li>';
    shtml += '<li>';
    shtml += '<dl class="list maki" >';
    shtml += '<dt>터널</dt>';
    shtml += '<dd><a href="#">24 / 24</a></dd>';
    shtml += '<dd><a href="#"><font>32 </font>/ 34</a></dd>';
    shtml += '<dd><a href="#">25 / 25</a></dd>';
    shtml += '<dd><a href="#">31 / 31</a></dd>';
    shtml += '<dd><a href="#"><font>21 </font>/ 22</a></dd>';
    shtml += '<dd><a href="#">15 / 15</a></dd>';
    shtml += '<dd><a href="#">36 / 36</a></dd>';
    shtml += '<dd><a href="#">21 / 21</a></dd>';
    shtml += '</dl>';
    shtml += '</li>';
    shtml += '<li>';
    shtml += '<dl class="list maki">';
    shtml += '<dt class="tit2tab">전기</dt>';
    shtml += '<dd class="tit0tab"></dd>';
    shtml += '</dl>';
    shtml += '<dl class="list maki wid_none">';
    shtml += '<dt class="he_25">영업소</dt>';
    shtml += '<dd><a href="#">9 / 9</a></dd>';
    shtml += '<dd><a href="#">7 / 7</a></dd>';
    shtml += '<dd><a href="#">10 / 10</a></dd>';
    shtml += '<dd><a href="#"><font>7 </font>/ 8</a></dd>';
    shtml += '<dd><a href="#">11 / 11</a></dd>';
    shtml += '<dd><a href="#">13 / 13</a></dd>';
    shtml += '<dd><a href="#">9 / 9</a></dd>';
    shtml += '<dd><a href="#">14 / 14</a></dd>';
    shtml += '</dl>';
    shtml += '<dl class="list maki wid_none">';
    shtml += '<dt class="he_25">가로등</dt>';
    shtml += '<dd><a href="#">234 / 234</a></dd>';
    shtml += '<dd><a href="#">164 / 164</a></dd>';
    shtml += '<dd><a href="#">329 / 329</a></dd>';
    shtml += '<dd><a href="#">112 / 112</a></dd>';
    shtml += '<dd><a href="#">243 / 243</a></dd>';
    shtml += '<dd><a href="#">451 / 451</a></dd>';
    shtml += '<dd><a href="#">326 / 326</a></dd>';
    shtml += '<dd><a href="#">112 / 112</a></dd>';
    /*shtml += '</dl>';
    shtml += '<dl class="list maki wid_none" >';
    shtml += '<dt class="he_25">조명탑</dt>';
    shtml += '<dd><a href="#"><font>98 </font>/ 99</a></dd>';
    shtml += '<dd><a href="#">55 / 55</a></dd>';
    shtml += '<dd><a href="#">67 / 67</a></dd>';
    shtml += '<dd><a href="#">43 / 43</a></dd>';
    shtml += '<dd><a href="#">32 / 32</a></dd>';
    shtml += '<dd><a href="#">72 / 72</a></dd>';
    shtml += '<dd><a href="#">21 / 21</a></dd>';
    shtml += '<dd><a href="#"><font>98 </font>/ 99</a></dd>';
    shtml += '</dl>';*/
    shtml += '</li>';
    shtml += '<li>';
    shtml += '<dl class="list maki" >';
    shtml += '<dt>오수</dt>';
    shtml += '<dd><a href="#">54 / 54</a></dd>';
    shtml += '<dd><a href="#">23 / 23</a></dd>';
    shtml += '<dd><a href="#">56 / 56</a></dd>';
    shtml += '<dd><a href="#">31 / 31</a></dd>';
    shtml += '<dd><a href="#"><font>45 </font>/ 47</a></dd>';
    shtml += '<dd><a href="#">25 /25</a></dd>';
    shtml += '<dd><a href="#">13 / 13</a></dd>';
    shtml += '<dd><a href="#">32 / 32</a></dd>';
    shtml += '</dl>';
    shtml += '</li>';
/*    shtml += '<li>';
    shtml += '<dl class="list maki" >';
    shtml += '<dt>염수분사</dt>';
    shtml += '<dd><a href="#">13 / 13</a></dd>';
    shtml += '<dd><a href="#">6 / 6</a></dd>';
    shtml += '<dd><a href="#">10 / 10</a></dd>';
    shtml += '<dd><a href="#">10 / 10</a></dd>';
    shtml += '<dd><a href="#">11 / 11</a></dd>';
    shtml += '<dd><a href="#">13 / 13</a></dd>';
    shtml += '<dd><a href="#">15 / 15</a></dd>';
    shtml += '<dd><a href="#">15 / 15</a></dd>';
    shtml += '</dl>';
    shtml += '</li>';*/
    shtml += '<li>';
    shtml += '<dl class="list maki" >';
    shtml += '<dt>사면</dt>';
    shtml += '<dd ><a href="#">26 / 26</a></dd>';
    shtml += '<dd ><a href="#"><font>45 </font>/ 46</a></dd>';
    shtml += '<dd ><a href="#">63 / 63</a></dd>';
    shtml += '<dd ><a href="#">51 / 51</a></dd>';
    shtml += '<dd ><a href="#">74 / 74</a></dd>';
    shtml += '<dd ><a href="#">64 / 64</a></dd>';
    shtml += '<dd ><a href="#">65 / 65</a></dd>';
    shtml += '<dd ><a href="#">51 / 51</a></dd>';
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

function rRefresh(){
    $('.ul_table *').remove();
    var shtml = "";
    shtml += '<li>';
    shtml += '<dl class="list maki">';
    shtml += '<dt>지사명</dt>';
    shtml += '<dd><a href="#">원주</a></dd>';
    shtml += '<dd><a href="#">대관령</a></dd>';
    shtml += '<dd><a href="#">홍천</a></dd>';
    shtml += '<dd><a href="#">충주</a></dd>';
    shtml += '<dd><a href="#">춘천</a></dd>';
    shtml += '<dd><a href="#">강릉</a></dd>';
    shtml += '<dd><a href="#">제천</a></dd>';
    shtml += '<dd><a href="#"></a></dd>';
    shtml += '</dl>';
    shtml += '</li>';
    shtml += '<li>';
    shtml += '<dl class="list maki" >';
    shtml += '<dt>터널</dt>';
    shtml += '<dd><a href="#">112 / 112</a></dd>';
    shtml += '<dd><a href="#"><font>119 </font>/ 120</a></dd>';
    shtml += '<dd><a href="#"><font>120 </font>/ 123</a></dd>';
    shtml += '<dd><a href="#">92 / 92</a></dd>';
    shtml += '<dd><a href="#"><font>110 </font>/ 112</a></dd>';
    shtml += '<dd><a href="#">67 / 67</a></dd>';
    shtml += '<dd><a href="#">21 / 21</a></dd>';
    shtml += '<dd><a href="#"></a></dd>';
    shtml += '</dl>';
    shtml += '</li>';
    shtml += '<li>';
    shtml += '<dl class="list maki">';
    shtml += '<dt class="tit2tab">전기</dt>';
    shtml += '<dd class="tit0tab"></dd>';
    shtml += '</dl>';
    shtml += '<dl class="list maki wid_none">';
    shtml += '<dt class="he_25">영업소</dt>';
    shtml += '<dd><a href="#">13 / 13</a></dd>';
    shtml += '<dd><a href="#">6 / 6</a></dd>';
    shtml += '<dd><a href="#">10 / 10</a></dd>';
    shtml += '<dd><a href="#"><font>12 </font>/ 13</a></dd>';
    shtml += '<dd><a href="#">11 / 11</a></dd>';
    shtml += '<dd><a href="#">13 / 13</a></dd>';
    shtml += '<dd><a href="#">15 / 15</a></dd>';
    shtml += '<dd><a href="#"></a></dd>';
    shtml += '</dl>';
    shtml += '<dl class="list maki wid_none">';
    shtml += '<dt class="he_25">가로등</dt>';
    shtml += '<dd><a href="#"><font>798 </font>/ 812</a></dd>';
    shtml += '<dd><a href="#"><font>211 </font>/ 212</a></dd>';
    shtml += '<dd><a href="#">329 / 329</a></dd>';
    shtml += '<dd><a href="#">112 / 112</a></dd>';
    shtml += '<dd><a href="#"><font>402 </font>/ 412</a></dd>';
    shtml += '<dd><a href="#">612 / 612</a></dd>';
    shtml += '<dd><a href="#">112 / 112</a></dd>';
    shtml += '<dd><a href="#"></a></dd>';
    shtml += '</dl>';
    /*shtml += '<dl class="list maki wid_none" >';
    shtml += '<dt class="he_25">조명탑</dt>';
    shtml += '<dd><a href="#">89 / 89</a></dd>';
    shtml += '<dd><a href="#">43 / 43</a></dd>';
    shtml += '<dd><a href="#"><font>98 </font>/ 99</a></dd>';
    shtml += '<dd><a href="#"><font>85 </font>/ 89</a></dd>';
    shtml += '<dd><a href="#">43 / 43</a></dd>';
    shtml += '<dd><a href="#">72 / 72</a></dd>';
    shtml += '<dd><a href="#">21 / 21</a></dd>';
    shtml += '<dd><a href="#"></a></dd>';
    shtml += '</dl>';*/
    shtml += '</li>';
    shtml += '<li>';
    shtml += '<dl class="list maki" >';
    shtml += '<dt>오수</dt>';
    shtml += '<dd><a href="#">112 / 112</a></dd>';
    shtml += '<dd><a href="#">120 / 120</a></dd>';
    shtml += '<dd><a href="#">123 / 123</a></dd>';
    shtml += '<dd><a href="#">92 / 92</a></dd>';
    shtml += '<dd><a href="#"><font>110 </font>/ 112</a></dd>';
    shtml += '<dd><a href="#">67 / 67</a></dd>';
    shtml += '<dd><a href="#">21 / 21</a></dd>';
    shtml += '<dd><a href="#"></a></dd>';
    shtml += '</dl>';
    shtml += '</li>';
    /*shtml += '<li>';
    shtml += '<dl class="list maki" >';
    shtml += '<dt>염수분사</dt>';
    shtml += '<dd><a href="#">13 / 13</a></dd>';
    shtml += '<dd><a href="#">6 / 6</a></dd>';
    shtml += '<dd><a href="#">10 / 10</a></dd>';
    shtml += '<dd><a href="#"><font>12 </font>/ 13</a></dd>';
    shtml += '<dd><a href="#">11 / 11</a></dd>';
    shtml += '<dd><a href="#">13 / 13</a></dd>';
    shtml += '<dd><a href="#">15 / 15</a></dd>';
    shtml += '<dd><a href="#"></a></dd>';
    shtml += '</dl>';
    shtml += '</li>';*/
    shtml += '<li>';
    shtml += '<dl class="list maki" >';
    shtml += '<dt>사면</dt>';
    shtml += '<dd ><a href="#">26 / 26</a></dd>';
    shtml += '<dd ><a href="#">52 / 52</a></dd>';
    shtml += '<dd ><a href="#">63 / 63</a></dd>';
    shtml += '<dd ><a href="#">51 / 51</a></dd>';
    shtml += '<dd ><a href="#"><font>34 </font>/ 35</a></dd>';
    shtml += '<dd ><a href="#">87 / 87</a></dd>';
    shtml += '<dd ><a href="#">65 / 65</a></dd>';
    shtml += '<dd ><a href="#"></a></dd>';
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