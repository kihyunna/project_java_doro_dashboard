<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>예약업무 Tracking process</title>
		<meta name="description" content="A responsive, magazine-like website layout with a grid item animation effect when opening the content" />
		<meta name="keywords" content="grid, layout, effect, animated, responsive, magazine, template, web design" />	
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/bucrs/normalize.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/bucrs/style2_1.css" />
    <!-- including ECharts file -->
    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script src="${contextPath}/js/bucrs/modernizr.custom.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
    <script type="text/javascript">
        $(window).load(function(){
           
            Etime();
            dataNameaaaaa(0);
            dataNameTimer();
        });
    </script>
   
</head>
<body>
    <!-- prepare a DOM container with width and height -->
    <!-- height 수정-->
    <div id="main" style="width:350px; height:240px; float: left"> </div>
    <script type="text/javascript">
        // based on prepared DOM, initialize echarts instance
        var myChart = echarts.init(document.getElementById('main'),'dark');
        var colors= ['#61a0a8', '#d48265', '#91c7ae', '#ca8622'];
        
        var arryDataName = ['시설처','설계처','건설처','교통센터','도로처'];
		var dataName = '';
         var data = [{
            value: 36,
            name: 'SMS'
        }, {
            value: 57,
            name: 'Mail'
        }, {
            value: 99,
            name: '사내메신저'
        }, {
            value: 22,
            name: '팝업'
        }];
        option = {
            //backgroundColor: '#fff',
            title: {
                text: '     7월\n 발송건수',
                //subtext: '2017년 7월',
                x: '35%',
                y: '40%',
                textStyle: {
                    fontWeight: 'bold',
                    fontSize: 14,
                    color: '#fff'
                }
            },
            tooltip: {
                show: false,
                trigger: 'item',
                formatter: "value"
            },
           /* legend: {
                orient: 'horizontal',
                bottom: '10%',
                data: ['SMS', 'Mail', '사내메신저', '팝업']
            },*/
            series: [{
                type: 'pie',
                selectedMode: 'single',
                radius: ['25%', '76%'],
                center: ['46%', '50%'],
                color: ['#61a0a8', '#d48265', '#91c7ae', '#ca8622'],

                label: {
                    normal: {
                        position: 'inner',
                        formatter: '{b}\n{c}건',
                        
                        textStyle: {
                            color: '#fff',
                            fontWeight: 'bold',
                            fontFamily: 'sans-serif',
                            fontSize: 14
                        }
                    },
                    emphasis: {
                     show: true,
                     textStyle: {
                         color: '#fff',
                         fontFamily: 'sans-serif',
                         fontSize: '18',
                         fontWeight: 'bold'
                     }
                 }
                },
                    itemStyle: {
                    normal: {
                        borderWidth: 2,
                        borderColor: '#ffffffff',
                    },
                    emphasis: {
                        borderWidth: 0,
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)',

                    }
                },
                data: data
            }]
        };
                                                  
            myChart.setOption(option);
          

           function Etime(){
                var count = 0;
                setInterval(function () {
                myChart.dispatchAction({
                    type: 'downplay',
                    seriesIndex: 0
                });
                myChart.dispatchAction({
                    type: 'highlight',
                    seriesIndex: 0,
                    dataIndex: (count++) % 4
                });
            }, 2000);
        }


       
            
            
        // use configuration item and data specified to show chart
   
    var isVisible = true;

    function timer(){
        setInterval(function (){
            setVisible();
        },5000);
    }
    
	function dataNameaaaaa(cnt){
    	
    	dataName = arryDataName[cnt];
    	
    	option1.title.text = dataName;
    	
    	myChart1.setOption(option1);
    	
    }
    
    function dataNameTimer(){
    	var cnt = 1;
    	
    	setInterval(function (){
    		dataNameaaaaa(cnt);
            cnt++;
            
            if(cnt > 4){
            	cnt = 0;
            }
        },10000);
    	
    }
    
    
    
    
    </script>
       
      <!--width 변경-->
		<div class="container" style="position:absolute; left:310px; width:550px; float: left">			
			<div id="theGrid" class="main">
				<section class="grid">
                    <!-- 카테고리 추가-->
				    <a id="itemCategory" class="itemGroup" href="#">
						<div class="group group--preview" id="tRanking1">순위</div>
						<div class="group group--preview" id="departMent1">부서</div>
						<div class="group group--preview" id="totalData1">전송량</div>
						<div class="group group--preview" id="yRanking1">전날순위</div>
						<div class="groupdummy"></div>
					</a>
					<!-- 카테고리 추가-->
					<a id="gridItem1" class="grid__item" href="#">
						<div class="title title--preview" id="tRanking1">1</div>
						<div class="title title--preview" id="departMent1">시설처</div>
						<div class="title title--preview" id="totalData1">37</div>
						<div class="title title--preview" id="yRanking1">
							<table>
                                <tr style="height: inherit">
                                   <td style="width: 50%" align="right">2( </td>
                                   <td style="width: 50%"><img id="rankingImg1" src="${contextPath}/images/bucrs/uparrow.png" width="20px" height="15px"> )</td>
                                </tr>
                        	</table>
						</div>
						<div class="loader"></div>
					</a>
					<a id="gridItem2" class="grid__item" href="#">
						<div class="title title--preview" id="tRanking1">2</div>
						<div class="title title--preview" id="departMent1">설계처</div>
						<div class="title title--preview" id="totalData1">34</div>
						<div class="title title--preview" id="yRanking1">
							<table>
                                <tr style="height: inherit">
                                   <td style="width: 50%" align="right">1( </td>
                                   <td style="width: 50%"><img id="rankingImg2" src="${contextPath}/images/bucrs/downarrow.png" width="20px" height="15px"> )</td>
                                </tr>
                            </table>
						</div>
						<div class="loader"></div>
					</a>
					<a id="gridItem3" class="grid__item" href="#">
						<div class="title title--preview" id="tRanking1">3</div>
						<div class="title title--preview" id="departMent1">건설처</div>
						<div class="title title--preview" id="totalData1">33</div>
						<div class="title title--preview" id="yRanking1">
							<table>
                                <tr style="height: inherit">
                                   <td style="width: 50%" align="right">3( </td>
                                   <td style="width: 50%"><img id="rankingImg3" src="${contextPath}/images/bucrs/minus.png" width="20px" height="15px"> )</td>
                                </tr>
                            </table>
                        </div>
						<div class="loader"></div>
					</a>
					<a id="gridItem4" class="grid__item" href="#">
						<div class="title title--preview" id="tRanking1">4</div>
						<div class="title title--preview" id="departMent1">교통센터</div>
						<div class="title title--preview" id="totalData1">28</div>
						<div class="title title--preview" id="yRanking1">
							<table>
                            <tr style="height: inherit">
                               <td style="width: 50%" align="right">15( </td>
                               <td style="width: 50%"><img id="rankingImg4" src="${contextPath}/images/bucrs/uparrow.png" width="20px" height="15px"> )</td>
                            </tr>
                            </table>
						</div>
						<div class="loader"></div>
					</a>
					<a id="gridItem5" class="grid__item" href="#">
						<div class="title title--preview" id="tRanking1">5</div>
						<div class="title title--preview" id="departMent1">도로처</div>
						<div class="title title--preview" id="totalData1">25</div>
						<div class="title title--preview" id="yRanking1">
							<table>
                            <tr style="height: inherit">
                               <td style="width: 50%" align="right">4(</td>
                               <td style="width: 50%"><img id="rankingImg5" src="${contextPath}/images/bucrs/downarrow.png" width="20px" height="15px"> )</td>
                            </tr>
                            </table>
						</div>
						<div class="loader"></div>
					</a>
				</section>
				<section class="content">
					<div class="scroll-wrap">					    <!--width, height 값 변경-->
						<div class="content__item" id="lineChart1" style="width:580px; height:240px; top: 5px;"> </div>
						<div class="content__item" id="lineChart2" style="width:580px; height:240px; top: 5px;"> </div>
						<div class="content__item" id="lineChart3" style="width:580px; height:240px; top: 5px;"> </div>
						<div class="content__item" id="lineChart4" style="width:580px; height:240px; top: 5px;"> </div>
						<div class="content__item" id="lineChart5" style="width:580px; height:240px; top: 5px;"> </div>						
					</div>
				</section>
			</div>
		</div><!-- /container -->
		<script src="${contextPath}/js/bucrs/classie.js"></script>
        <script type="text/javascript">
            var bodyEl = document.body,
                docElem = window.document.documentElement,
                support = { transitions: Modernizr.csstransitions },
                // transition end event name
                transEndEventNames = { 'WebkitTransition': 'webkitTransitionEnd', 'MozTransition': 'transitionend', 'OTransition': 'oTransitionEnd', 'msTransition': 'MSTransitionEnd', 'transition': 'transitionend' },
                transEndEventName = transEndEventNames[ Modernizr.prefixed( 'transition' ) ],
                onEndTransition = function( el, callback ) {
                    var onEndCallbackFn = function( ev ) {
                        if( support.transitions ) {
                            if( ev.target != this ) return;
                            this.removeEventListener( transEndEventName, onEndCallbackFn );
                        }
                        if( callback && typeof callback === 'function' ) { callback.call(this); }
                    };
                    if( support.transitions ) {
                        el.addEventListener( transEndEventName, onEndCallbackFn );
                    }
                    else {
                        onEndCallbackFn();
                    }
                },
                gridEl = document.getElementById('theGrid'),
                gridItemsContainer = gridEl.querySelector('section.grid'),
                contentItemsContainer = gridEl.querySelector('section.content'),
                gridItems = gridItemsContainer.querySelectorAll('.grid__item'),
                contentItems = contentItemsContainer.querySelectorAll('.content__item'),
                current = -1,
                lockScroll = false, xscroll, yscroll,
                isAnimating = false;
            var item1 = document.getElementById('gridItem1');
            var item2 = document.getElementById('gridItem2');
            var item3 = document.getElementById('gridItem3');
            var item4 = document.getElementById('gridItem4');
            var item5 = document.getElementById('gridItem5');
            var toggleOn = true;
            var i = 1;
            
            
            
            var myChart1 = echarts.init(document.getElementById('lineChart1'),'dark');
            //var myChart2 = echarts.init(document.getElementById('lineChart2'),'dark');
            //var myChart3 = echarts.init(document.getElementById('lineChart3'),'dark');
            //var myChart4 = echarts.init(document.getElementById('lineChart4'),'dark');
            //var myChart5 = echarts.init(document.getElementById('lineChart5'),'dark');
            //주간 발송 라인차트    
            option1 = {
                color: colors,
                title: {
                    text: '',
                    left: '40%',
                    top:'3%',
                    textStyle: {
                        color: '#fff'
                    }
                },
                tooltip: {
                    trigger: 'axis'
                },
                grid: {
                    left: '0%',
                    right: '10%',
                    top: '20%',
                    bottom: '45px',
                    containLabel: true
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['일','월','화','수','목','금','토'],
                    axisLabel: {
                        textStyle: {
                            color: '#fff'
                        },
                    }
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        textStyle: {
                            color: '#fff'
                        },
                    }
                },
                series: [
                    {
                        name:'SMS',
                        type:'line',
                        data:[0, 31, 22, 25, 29, 20, 0]
                    },
                    {
                        name:'E-mail',
                        type:'line',
                        data:[0, 15, 20, 25, 34, 10, 0]
                    },
                    {
                        name:'사내메신저',
                        type:'line',
                        data:[0, 9, 10, 11, 8, 7, 0]
                    },
                    {
                        name:'Popup',
                        type:'line',
                        data:[0, 3, 4, 2, 1, 5, 0]
                    }
                ]
            };   
            myChart1.setOption(option1);
            
             
            $(window).load(function(){
                setTimeout(function() {
                   changeBorderCol(); 
                },1500);
                setInterval(function() {
                    if(toggleOn) {
                        if(i==1) {
                            rotatePage(item1);
                        }else if(i==2) {
                            rotatePage(item2);
                        }else if(i==3) {
                            rotatePage(item3);
                        }else if(i==4) {
                            rotatePage(item4);
                        }else if(i==5) {
                            rotatePage(item5);
                        }
                        toggleOn = false;
                    } else {
                        if(i==1) {
                            $("#gridItem1").css("border", "rgba(74, 74, 74, 0.075) solid 1px");
                            hideContent(item1);
                            setTimeout(function() {
                               changeBorderCol(); 
                            },1500);
                        }else if(i==2) {
                            $("#gridItem2").css("border", "rgba(74, 74, 74, 0.075) solid 1px");
                            hideContent(item2);
                            setTimeout(function() {
                               changeBorderCol(); 
                            },1500);
                        }else if(i==3) {
                            $("#gridItem3").css("border", "rgba(74, 74, 74, 0.075) solid 1px");
                            hideContent(item3);
                            setTimeout(function() {
                               changeBorderCol(); 
                            },1500);
                        }else if(i==4) {
                            $("#gridItem4").css("border", "rgba(74, 74, 74, 0.075) solid 1px");
                            hideContent(item4);
                            setTimeout(function() {
                               changeBorderCol(); 
                            },1500);
                        }else if(i==5) {
                            $("#gridItem5").css("border", "rgba(74, 74, 74, 0.075) solid 1px");
                            hideContent(item5);
                            setTimeout(function() {
                               changeBorderCol(); 
                            },1500);
                        }
                        toggleOn = true;
                        if(i >= 5){
                            i = 1;
                        } else {
                            i++;
                        }
                    }
                },5000);
            });
            
            function getViewport( axis ) {
                var client, inner;
                if( axis === 'x' ) {
                    client = docElem['clientWidth'];
                    inner = window['innerWidth'];
                }
                else if( axis === 'y' ) {
                    client = docElem['clientHeight'];
                    inner = window['innerHeight'];
                }

                return client < inner ? inner : client;
            }
            function scrollX() { return window.pageXOffset || docElem.scrollLeft; }
            function scrollY() { return window.pageYOffset || docElem.scrollTop; }
            
            function rotatePage(item) {
				if(isAnimating) {
					return false;
				}
				isAnimating = true;
				// simulate loading time..
				classie.add(item, 'grid__item--loading');
				setTimeout(function() {
					classie.add(item, 'grid__item--animate');
					// reveal/load content after the last element animates out (todo: wait for the last transition to finish)
					setTimeout(function() { loadContent(item); }, 500);
				}, 1000);
			}
            
            function loadContent(item) {
                // add expanding element/placeholder 
                var dummy = document.createElement('div');
                dummy.className = 'placeholder';

                // set the width/heigth and position
                dummy.style.WebkitTransform = 'translate3d(' + (item.offsetLeft - 5) + 'px, ' + (item.offsetTop - 5) + 'px, 0px) scale3d(' + item.offsetWidth/gridItemsContainer.offsetWidth + ',' + item.offsetHeight/getViewport('y') + ',1)';
                dummy.style.transform = 'translate3d(' + (item.offsetLeft - 5) + 'px, ' + (item.offsetTop - 5) + 'px, 0px) scale3d(' + item.offsetWidth/gridItemsContainer.offsetWidth + ',' + item.offsetHeight/getViewport('y') + ',1)';

                // add transition class 
                classie.add(dummy, 'placeholder--trans-in');

                // insert it after all the grid items
                gridItemsContainer.appendChild(dummy);

                // body overlay
                classie.add(bodyEl, 'view-single');

                setTimeout(function() {
                    // expands the placeholder
                    dummy.style.WebkitTransform = 'translate3d(-5px, ' + (scrollY() - 5) + 'px, 0px)';
                    dummy.style.transform = 'translate3d(-5px, ' + (scrollY() - 5) + 'px, 0px)';
                    // disallow scroll
                    window.addEventListener('scroll', noscroll);
                }, 25);

                onEndTransition(dummy, function() {
                    // add transition class 
                    classie.remove(dummy, 'placeholder--trans-in');
                    classie.add(dummy, 'placeholder--trans-out');
                    // position the content container
                    contentItemsContainer.style.top = scrollY() + 'px';
                    // show the main content container
                    classie.add(contentItemsContainer, 'content--show');
                    // show content item:
                    classie.add(contentItems[i-1], 'content__item--show');
                    // sets overflow hidden to the body and allows the switch to the content scroll
                    classie.addClass(bodyEl, 'noscroll');

                    isAnimating = false;
                });
            }
            
            function noscroll() {
                if(!lockScroll) {
                    lockScroll = true;
                    xscroll = scrollX();
                    yscroll = scrollY();
                }
                window.scrollTo(xscroll, yscroll);
            }
            
            function hideContent(item) {
                var gridItem = gridItems[i-1], contentItem = contentItems[i-1];

                classie.remove(contentItem, 'content__item--show');
                classie.remove(contentItemsContainer, 'content--show');
                classie.remove(bodyEl, 'view-single');

                setTimeout(function() {
                    var dummy = gridItemsContainer.querySelector('.placeholder');

                    classie.removeClass(bodyEl, 'noscroll');

                    dummy.style.WebkitTransform = 'translate3d(' + item.offsetLeft + 'px, ' + item.offsetTop + 'px, 0px) scale3d(' + item.offsetWidth/gridItemsContainer.offsetWidth + ',' + item.offsetHeight/getViewport('y') + ',1)';
                    dummy.style.transform = 'translate3d(' + item.offsetLeft + 'px, ' + item.offsetTop + 'px, 0px) scale3d(' + item.offsetWidth/gridItemsContainer.offsetWidth + ',' + item.offsetHeight/getViewport('y') + ',1)';

                    onEndTransition(dummy, function() {
                        // reset content scroll..
                        contentItem.parentNode.scrollTop = 0;
                        gridItemsContainer.removeChild(dummy);
                        classie.remove(gridItem, 'grid__item--loading');
                        classie.remove(gridItem, 'grid__item--animate');
                        lockScroll = false;
                        window.removeEventListener( 'scroll', noscroll );
                    });

                    // reset current
                    current = -1;
                }, 25);
            }
            
            ////////////////////border 색변경 함수 추가////////////////////////////
            function changeBorderCol(){
                 if(i==1) {
                    $("#gridItem1").css("border", "#fff solid 1px");                  
                }else if(i==2) {
                    $("#gridItem2").css("border", "#fff solid 1px");
                }else if(i==3) {
                    $("#gridItem3").css("border", "#fff solid 1px");
                }else if(i==4) {
                    $("#gridItem4").css("border", "#fff solid 1px");
                }else if(i==5) {
                    $("#gridItem5").css("border", "#fff solid 1px");
                }
            }

        </script>
</body>
</html>