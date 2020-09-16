<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>
        后台管理系统
    </title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no" />
    <link rel="stylesheet" href="static/css/x-admin.css">
    <link rel="stylesheet" href="https://www.jq22.com/jquery/bootstrap-3.3.4.css">
</head>
<body>
<style type="text/css">
    legend { display: block; width:100px; border-bottom:0px; font-family: "Microsoft YaHei","Helvetica Neue";}
    legend a{ color:#666;} legend a:hover{ text-decoration:none;}
    .layui-table{ font-family: "Microsoft YaHei","Helvetica Neue";}
</style>
<div class="x-body">
    <blockquote class="layui-elem-quote">
        <sapn>admin</sapn>欢迎使用社区管理系统！
        <span class="f-14">v1.0</span> &nbsp;&nbsp; 登录次数：
        <sapn style="font-family: 'yjsz';font-size: 2rem">
            68
        </sapn>&nbsp;&nbsp; 登陆时间：
        <span style="color: #FF5722; font-family: 'yjsz';font-size: 2rem" id="login_time"></span>
    </blockquote>
    <div class="row">
        <div class="col-xs-6 col-sm-4 col-md-2">
            <section class="panel bgys">
                <div class="symbol bgcolor-blue ">
                    <i class="fa iconfont"></i>

                </div>
                <div class="value tab-menu" bind="1">
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="社区人员总数"><i class="iconfont " data-icon=""></i> <h1>76721</h1> </a>
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="社区人员总数"> <i class="iconfont " data-icon=""></i><span>社区人员总数</span></a>
                </div>
            </section>


        </div>
        <div class="col-xs-6 col-sm-4 col-md-2 ">
            <section class="panel bgys">
                <div class="symbol bgcolor-commred">
                    <i class="fa fa-handshake-o"></i>
                </div>
                <div class="value tab-menu" bind="1">
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="正在举行的会议总数"> <i class="iconfont " data-icon=""></i> <h1>56</h1> </a>
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="正在举行的会议总数"> <i class="iconfont " data-icon=""></i><span>正在举行的会议总数</span></a>
                </div>
            </section>

        </div>
        <div class="col-xs-6 col-sm-4 col-md-2 ">
            <section class="panel bgys">
                <div class="symbol bgcolor-dark-green">
                    <i class="fa  iconfont"></i>
                </div>

                <div class="value tab-menu" bind="1">
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="已举行的会议总数"> <i class="iconfont " data-icon=""></i> <h1>123</h1> </a>
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="已举行的会议总数"> <i class="iconfont " data-icon=""></i><span>已举行的会议总数</span></a>
                </div>

            </section>
        </div>
        <div class="col-xs-6 col-sm-4 col-md-2 ">
            <section class="panel bgys">
                <div class="symbol bgcolor-yellow-green">
                    <i class="fa fa-cubes iconfont"></i>
                </div>
                <div class="value tab-menu" bind="1">
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="发布活动总数"> <i class="iconfont " data-icon=""></i> <h1>3827</h1> </a>
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="发布活动总数"> <i class="iconfont " data-icon=""></i><span>发布活动总数</span></a>
                </div>
            </section>
        </div>

    </div>
    <fieldset class="layui-elem-field layui-field-title site-title">
        <legend><a name="default">数据统计</a></legend>
    </fieldset>
    <!--相关统计-->
    <div class="row">
        <div class="col-sm-4">
            <section class="panel">
                <div class="panel-heading">
                    一周统计
                </div>
                <div class="panel-body">
                    <div class="echarts" id="main" style="height:300px; height:350px"></div>
                    <!-- <div class="col-sm-6"></div>-->
                    <!--<div class="col-sm-6"><div class="echarts" id="years" style="height:300px; height:350px"></div></div>-->
                </div>
            </section>
        </div>
        <div class="col-sm-4">
            <section class="panel">
                <div class="panel-heading">
                    会议开展部门数量统计
                </div>
                <div class="panel-body">
                    <div class="echarts" id="area" style="height:300px; height:350px"></div>
                </div>
            </section>
        </div>
        <div class="col-sm-4">
            <section class="panel">
                <div class="panel-heading">
                    年度会议次数统计
                </div>
                <div class="panel-body">
                    <div class="echarts" id="years" style="height:300px; height:350px"></div>
                </div>
            </section>
        </div>
        <div class="col-sm-12">
            <section class="panel">
                <div class="panel-heading">
                    服务器信息
                </div>
                <div class="panel-body">
                    <!--<div class="echarts" id="product" style="height:300px; height:350px"></div>-->
                    <table class="table table-border table-bordered table-bg mt-20">
                        <thead>
                        <tr>
                            <th colspan="4" scope="col">阿里云服务器部署</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </section>

            <div class="layui-footer footer footer-demo">
                <div class="layui-main">
                    <p> Copyright &copy;2017  All Rights Reserved.</p>
                </div>
            </div>

        </div>


    </div>
</div>

<script type="text/javascript" src="static/js/layui2.0/layui.js"></script>
<script src="https://www.jq22.com/jquery/echarts-4.2.1.min.js"></script>
<script type="text/javascript" src="static/js/jquery.min.js" ></script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    let date = new Date();
    let minutes = date.getMinutes();
    minutes = minutes>9?minutes:'0'+minutes;
    let month = date.getMonth()+1;
    month = month>9?month:'0'+month;
    let day = date.getDate();
    day = day>9?day:'0'+day;
    let second = date.getSeconds();
    second = second >9?second:'0'+second;
    let hour = date.getHours();
    hour = hour >9?hour:'0'+hour;
    let public_time = date.getFullYear() + '-'+month+'-'+day + ' ' + hour + ':' + minutes + ':' + second;

    $("#login_time").text(public_time);

    // 指定图表的配置项和数据
    var option = {
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['举行会议','发布公告','人员登录量','管理员登陆记录']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        color: ['#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',

            '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',

            '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'],
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            //boundaryGap: false,
            data:["2018-02-26","2018-02-27","2018-02-28","2018-03-01","2018-03-02","2018-03-03","2018-03-04"]
        },
        yAxis: {
            type: 'value',
            //boundaryGap: false,
            //data:['1','2','3','4','5','6','7']
        },

        series: [
            {
                name:'举行会议',
                type:'line',
                stack: '总量',
                data:[5,3,6,8,3,2,4]                },
            {
                name:'发布公告',
                type:'line',
                stack: '总量',
                data:[2,4,6,5,6,7,8]                },
            {
                name:'人员登录量',
                type:'line',
                stack: '总量',
                data:[3,5,8,2,4,9,10]                },
            {
                name:'管理员登陆记录',
                type:'line',
                stack: '总量',
                data:[5,6,8,7,9,10,1]                }
        ]
    };


    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<script type="text/javascript">
    // 指定图表的配置项和数据
    var myChart = echarts.init(document.getElementById('area'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '会议机构统计',
            subtext: '会议机构发布量',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        itemStyle: {
            normal: {

                //好，这里就是重头戏了，定义一个list，然后根据所以取得不同的值，这样就实现了，

                color: function(params) {

                    // build a color map as your need.

                    var colorList = [

                        '#f36f8a','#B5C334','#FCCE10','#E87C25','#27727B',

                        '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',

                        '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'

                    ];

                    return colorList[params.dataIndex]

                },

                //以下为是否显示，显示位置和显示格式的设置了

                label: {

                    show: true,

                    position: 'top',

//                             formatter: '{c}'

                    formatter: '{b}\n{c}'

                }

            }

        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['社区机构', '物业服务部门', '业主委员会']
        },
        series: [{

            name: '部门类型',
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            data: [

                {value: 19, name: '社区机构'} ,
                {value: 5, name: '物业服务部门'} ,
                {value: 6, name: '业主委员会'} ,
            ],
            itemStyle: {
                emphasis: {
                    shadowBlur: 20,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('years'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '会议开展次数年度统计',
            subtext: '月计算',
            x: 'center'
        },
        //color: ['#3398DB'],

        tooltip: {
            trigger: 'axis',
            axisPointer: { // 坐标轴指示器，坐标轴触发有效
                type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [{
            type: 'category',
            data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
            axisTick: {
                alignWithLabel: true
            }
        }],
        yAxis: [{
            type: 'value'
        }],
        series: [{
            name: '发布量',
            itemStyle: {

                normal: {

                    //好，这里就是重头戏了，定义一个list，然后根据所以取得不同的值，这样就实现了，

                    color: function(params) {

                        // build a color map as your need.

                        var colorList = [

                            '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',

                            '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',

                            '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'

                        ];

                        return colorList[params.dataIndex]

                    },

                    //以下为是否显示，显示位置和显示格式的设置了

                    label: {

                        show: true,

                        position: 'top',

//                             formatter: '{c}'

                        formatter: '{c}\n{b}'

                    }

                }

            },
            type: 'bar',
            barWidth: '60%',
            data: [10, 8, 12, 14, 10, 6, 8, 7, 15, 9, 5, 6]
        }]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>