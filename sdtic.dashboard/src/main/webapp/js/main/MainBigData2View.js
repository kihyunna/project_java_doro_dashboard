var option = {
	//차트 배경색
	//backgroundColor: '',
	tooltip : {
		show: false,
		formatter: ""
	},
	toolbox : {
		show : false,
		feature : {
			mark : {show: true},
			restore : {show: true},
			saveAsImage : {show: true}
		}
	},
	grid : {
		top: 10,
		left: 10,
		right: 10,
		bottom: 10
	},
	series : [
		{
			name:'DISK',
			type:'gauge',
			center : ['50%', '55%'],  
			min:0,
			max:100,
			splitNumber:10,
			radius: '100%',
			axisLine: {           
				lineStyle: {   
					width: 4
				}
			},
			axisTick: {           
				length :5,      
				lineStyle: {     
					color: 'auto'
				}
			},
			axisLabel: {
				show: true,
				textStyle: {
					fontSize: 2
				}
			},
			splitLine: {           
				length :8,         
				lineStyle: {       
					color: 'auto'
				}
			},
			title : {
				textStyle: {     
					fontWeight: 'bolder',
					fontSize: 10,
					fontStyle: 'italic',
					color: '#ccc'
				}
			},
			detail : { 
				textStyle: {   
					fontSize: 24,
					fontWeight: 'bolder'
				}
			},
			data:[{value: 0, name: 'DISK'}]
		},
		{
			name:'CPU',
			type:'gauge',
			center : ['20%', '65%'],   
			radius : '60%',
			min:0,
			max:100,
			endAngle:45,
			splitNumber:5,
			axisLine: {           
				lineStyle: {    
					width: 3
				}
			},
			axisTick: {            
				length :6,        
				lineStyle: {       
					color: 'auto'
				}
			},
			axisLabel: {
				show: false
			},
			splitLine: {           
				length :10,         
				lineStyle: {
					color: 'auto'
				}
			},
			pointer: {
				width:3
			},
			title : {
				offsetCenter: [0, '-30%'],       
				textStyle: {
					fontSize: 3,
					fontWeight: 'bolder',
					fontStyle: 'italic',
					color: '#ccc'
				}
			},
			detail : {     
				textStyle: {   
					fontSize: 14,
					fontWeight: 'bolder',
					color: '#ccc'
				}
			},
			data:[{value: 0, name: 'CPU'}]
		},
		{
			name:'MEMORY',
			type:'gauge',
			center : ['80%', '65%'],   
			radius : '60%',
			min:0,
			max:100,
			startAngle:140,
			splitNumber:5,
			axisLine: {           
				lineStyle: {    
					width: 3
				}
			},
			axisTick: {            
				splitNumber: 5,
				length :5,        
				lineStyle: {       
					color: 'auto'
				}
			},
			axisLabel: {
				show: false
			},
			splitLine: {           
				length :10,         
				lineStyle: {       
					width:2,
					color: 'auto'
				}
			},
			pointer: {
				width:3
			},
			title : {
				offsetCenter: [0, '-30%'],       
				textStyle: {
					fontSize: 3,
					fontWeight: 'bolder',
					fontStyle: 'italic',
					color: '#ccc'
				}
			},
			detail : {     
				textStyle: {    
					fontSize: 14,
					fontWeight: 'bolder',
					color: '#ccc'
				}
			},
			data:[{value: 0, name: 'MEMORY'}]
		}
	]
};