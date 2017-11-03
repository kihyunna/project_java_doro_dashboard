<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8" />
<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/bucrs/anime.js"></script>

</head>

<body>
    <div id="main" style="width:460px;height:150px; background:#a3a3a3;">
		<table >
			<tr style="height:145px;">
				<td style="width:160px;" align='center'>
					<table>
						<tr>
							<td><center><img src="${contextPath}/images/bucrs/plan.png" width="120px" height="100px"></center></td>
						</tr>
						<tr>
							<td align='center' valign='top'><font face="돋움" size="4px" color="#FFFFFF"><b>설계</b></font></td>
						</tr>
					</table>
				</td>
				<td style="width:300px;" >
					<table>
						<tr >
							<td style="width:190px;" align='right'>
								<font face="돋움" size="4px" color="#FFFFFF">
									<b>
										금일 누적 접속자 
									</b>
								</font>
							</td>
							<td style="width:70px;" align='right'>
								<font face="돋움" size="4px" color="#FFFFFF">
									<b>
										<div id="JSobjectProp">
											10000
										</div>
									</b>
								</font>

							</td>
							<td style="width:10px;">
								<font face="돋움" size="4px" color="#FFFFFF">
									<b>
										명
									</b>
								</font>
							</td>
							<td style="width:30px;">
							</td>

						</tr>
						
						<tr style="height:35px;">
							<td colspan="3" align='center'>
								<font face="돋움" size="4px" color="#FFFFFF">
									<b>
										설계도서 납품
									</b>
								</font>
							</td>
							<td style="width:30px;">
							</td>

						</tr>
						<tr>
							<td colspan="3" align='right'>
								<font face="돋움" size="10px" color="#FFFFFF">
									<b>
										<div id="data1">56 %</div>
									</b>
								</font>
							</td>
							<td style="width:30px;">
							</td>

						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
    <script type="text/javascript">
		
		$(window).load(function() {
    		//randomCnt();
			timerStart();
			selecttimer();
    	});
    	
    	function randomCnt(){
			
    		var randdomdata = Math.floor(Math.random()*10)+1;
			var randdomdata1 = Math.floor(Math.random()*3)+1;

			var prop1 = parseInt($('#JSobjectProp').text()) + randdomdata;

			var myObject = { prop1: 0 };
			var JSobjectProp = anime({
				targets: myObject,
				prop1: prop1,
				easing: 'linear',
				round: 1,
				update: function() {
					var el = document.querySelector('#JSobjectProp');
				
					var jsonString = JSON.stringify(myObject).replace('{"prop1":','').replace('"}','').replace('"','');
				
					el.innerHTML = jsonString;
				}
			});
			

			var test2 = $('#data1').text().split(" ");

			var test3 = parseInt(test2[0]) + randdomdata1;

			if(test3 < 100){
				$('#data1').text(test3 +" "+ test2[1]);
			}else{
				$('#data1').text(100 +" "+ test2[1]);
			}

    	}

		function timerStart(){
			window.setInterval("randomCnt()",3000);
		}
		
		function selecttimer(){
			
			window.setInterval("divColorChange()",100);
			
		}
		
		function divColorChange(){
			
			var today = new Date();
			
			var second = today.getSeconds();
			
			if(second<15){
				var divid = document.getElementById("main");
				
				divid.style.backgroundColor = "#4f81bd";
			}else{
				
				var divid = document.getElementById("main");
				
				divid.style.backgroundColor = "#a3a3a3";
			}
			
			
		}
		
		

    </script>
</body>
</html>