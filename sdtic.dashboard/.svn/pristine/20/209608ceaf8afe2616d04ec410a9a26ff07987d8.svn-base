var labelTop = {
    normal : {
        label : {
            show : true,
            position : 'center',
            formatter : '{b}',
            textStyle: {
                baseline : 'bottom'
            }
        },
        labelLine : {
            show : false
        }
    }
};
var labelFromatter = {
    normal : {
        label : {
            formatter : function (params){
                return 100 - params.value + '%'
            },
            textStyle: {
                baseline : 'top'
            }
        }
    },
}
var labelBottom = {
    normal : {
        color: '#ddd',
        label : {
            show : true,
            position : 'center'
        },
        labelLine : {
            show : false
        }
    },
    emphasis: {
        color: 'rgba(0,0,0,0)'
    }
};
var radius = ['40%', '60%'];
option = {
    legend: {
        show: false
    },
    toolbox: {
        show : false
    },
    color: [
            '#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80',
            '#8d98b3','#e5cf0d','#97b552','#95706d','#dc69aa',
            '#07a2a4','#9a7fd1','#588dd5','#f5994e','#c05050',
            '#59678c','#c9ab00','#7eb00a','#6f5553','#c14089'
           ],
    series : [
        {
            type : 'pie',
            center : ['20%', '70%'],
            radius : radius,
            itemStyle : labelFromatter,
            data : [
                {name:'CPU', value:0, itemStyle : labelTop},
                {name:'', value:0,itemStyle : labelBottom}
            ]
        },
        {
            type : 'pie',
            center : ['50%', '70%'],
            radius : radius,
            itemStyle : labelFromatter,
            data : [
                {name:'MEMORY', value:0, itemStyle : labelTop},
                {name:'', value:0,itemStyle : labelBottom}
            ]
        },
        {
            type : 'pie',
            center : ['80%', '70%'],
            radius : radius,
            itemStyle : labelFromatter,
            data : [
                {name:'DISK', value:0, itemStyle : labelTop},
                {name:'', value:0,itemStyle : labelBottom}
            ]
        }
    ]
};