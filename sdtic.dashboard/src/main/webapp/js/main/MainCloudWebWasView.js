var hours = ['00', '01', '02', '03', '04', '05', 
             '06', '07', '08', '09', '10', '11',
	         '12', '13', '14', '15', '16', '17',
	         '18', '19', '20', '21', '22', '23', '24'];

var prfGubun = ['TPS', '평균응답시간', '동시접속자', '액티브서비스'];

var dataTmp0 = new Array();
var dataTmp1 = new Array();
var dataTmp2 = new Array();
var dataTmp3 = new Array();

var timeLineData = new Array();

var data = {};

var option = {
    baseOption: {
        //차트 배경색
        //backgroundColor: '#000',
        title: [],
        color: ['#c23531','#2f4554', '#61a0a8', '#d48265', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570', '#c4ccd3'],
        timeline: {
            show: true,
            axisType: 'category',
            autoPlay: true,
            left: 'center',
            top: '75%',
            left: '15%',
            width: '80%',
            currentIndex: 0,
            playInterval: 10000,
            label: {
                normal: {
                    show: true,
                    interval: 'auto'
                },
            },
            data: [],
        }
    },
    options: []
};
