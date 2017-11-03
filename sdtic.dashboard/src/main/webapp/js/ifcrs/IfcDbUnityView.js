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
					width: 10,
				}
			},
			axisTick: {           
				length :15,      
				lineStyle: {     
					color: 'auto'
				}
			},
			splitLine: {           
				length :20,         
				lineStyle: {       
					color: 'auto'
				}
			},
			title : {
				textStyle: {     
					//DISK 폰트 및 색상
					fontWeight: 'bolder',
					fontSize: 20,
					fontStyle: 'italic',
					color: '#ccc'
				}
			},
			detail : {   
				textStyle: {      
					fontWeight: 'bolder'
				}
			},
			data:[{value: 0, name: 'DISK'}]
		},
		{
			name:'CPU',
			type:'gauge',
			center : ['18%', '65%'],   
			radius : '50%',
			min:0,
			max:100,
			endAngle:45,
			splitNumber:5,
			axisLine: {           
				lineStyle: {    
					width: 8
				}
			},
			axisTick: {            
				length :12,        
				lineStyle: {       
					color: 'auto'
				}
			},
			splitLine: {           
				length :20,         
				lineStyle: {
					color: 'auto'
				}
			},
			pointer: {
				width:5
			},
			title : {
				offsetCenter: [0, '-30%'],       
				textStyle: {      
					//CPU 폰트 및 색상
					fontWeight: 'bolder',
					fontStyle: 'italic',
					color: '#ccc'
				}
			},
			detail : {     
				textStyle: {    
					fontWeight: 'bolder',
					color: '#ccc'
				}
			},
			data:[{value: 0, name: 'CPU'}]
		},
		{
			name:'MEMORY',
			type:'gauge',
			center : ['82%', '65%'],   
			radius : '50%',
			min:0,
			max:100,
			startAngle:140,
			splitNumber:5,
			axisLine: {           
				lineStyle: {
					width: 8
				}
			},
			axisTick: {            
				splitNumber: 5,
				length :10,        
				lineStyle: {       
					color: 'auto'
				}
			},
			splitLine: {           
				length :20,         
				lineStyle: {       
					width:3,
					//게이지 수치 바 색상
					color: 'auto'
				}
			},
			pointer: {
				width:5
			},
			title : {
				offsetCenter: [0, '-30%'],       
				textStyle: {      
					//MEMORY 폰트 및 색상
					fontWeight: 'bolder',
					fontStyle: 'italic',
					color: '#ccc'
				}
			},
			detail : {
				offsetCenter: [0, '30%'],      
				textStyle: {    
					fontWeight: 'bolder',
					color: '#ccc'
				}
			},
			data:[{value: 0, name: 'MEMORY'}]
		}
	]
};