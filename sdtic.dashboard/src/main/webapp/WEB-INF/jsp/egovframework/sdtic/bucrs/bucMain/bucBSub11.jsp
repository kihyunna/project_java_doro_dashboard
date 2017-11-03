<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8" />
</head>
<script>
</script>
<body>
<style>
#gridTbl tr, td, th {
        border:1px solid white;
        border-collapse:collapse;
        font-size: 20px;
        background-color: rgba( 131, 161, 206, 0.05);
        font-family: NanumGothic;

}
#gridTbl tr{
    height: 40px;
}
#gridTbl th{
    font-size: 22px;
}

#test1{
    font-size :20px;

}
#jrolling{

        background-color: rgba( 131, 161, 206, 0.05);
}


</style>
    <script type="text/javascript" src="${contextPath}/js/bucrs/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="${contextPath}/js/bucrs/jrolling/jquery.syaku.rolling.js"></script>
    <script type="text/javascript" src="${contextPath}/js/bucrs/jrolling/jquery.liMarquee.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
<script type="text/javascript">
$(window).load(function(){

    timer();
    divDate();


});
function math_random(){
   var foo = new Array();

         for(var i = 0 ; i<7;i++){
            foo[i] = Math.floor(Math.random()*100 )+1;
            $('#Rd'+i).text(foo[i]);
         }


 }
 function timer(){
    window.setInterval("math_random()",5000);
 }
 function divDate(){
     var today = new Date();

     var month = today.getMonth()+1;
     var day = today.getDate();
     var year = today.getFullYear();

    $('#tr_d').text(year + "-" + month + "-" + day);



}



</script>


 <body>
    <div id="tracking" style="width:930px; height:160px;">
    <table id="gridTbl2" width ="920px;" cellspacing="0">
        <tr width ="920px;">
            <td align="right"><div id="tr_d"></div></td>
         </tr>
     </table>
        <table id="gridTbl" width ="920px;" cellspacing="0" rules="rows" frame="void">
        <tr>
			<th></th>
			<th>미처리</th>
			<th>Warning MSG</th>
		</tr>
		<tr>
			<td align="center">설계처</td>
			<td align="center"><div id = Rd1>11</div></td>
			<td align="center"><div id = Rd2>10</div></td>
		</tr>
		<tr>
			<td align="center">설계처</td>
			<td align="center"><div id = Rd3>4</div></td>
			<td align="center"><div id = Rd4>5</div></td>
		</tr>
		<tr>
			<td align="center">건설사업단</td>
			<td align="center"><div id = Rd5>7</div></td>
			<td align="center"><div id = Rd6>7</div></td>
		</tr>
		</table>
    </div>
    <br>
    <div style="top: 195px; POSITION:absolute;">
    <font face="돋움" size="5px" color="#525657">
      <b>
         <div id="jrolling" valign='center' style="width:920px;height:30px;">
         </div>
      </b>
   </font>
   </div>

</body>
</html>