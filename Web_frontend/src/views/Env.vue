<template>
    <div>
      <el-row :gutter="10" style="height: calc(100vh - 120px)">
        <el-col :span="8"><div class="grid-content bg-purple" >
          <div style="text-align: center" >
            <div id="he-plugin-standard" style="text-align: center"></div>
              <!--  vue中引入天气卡片：https://www.csdn.net/tags/NtDakg2sNTMzMzktYmxvZwO0O0OO0O0O.html          -->
            </div>
            <div style="width:420px;height:240px;margin-top: 5px;border-radius: 10px;border: #999999 solid 2px;" ref="echarts1"></div>
             <div style="margin-top: 5px;width: 420px;height:210px;border-radius: 10px;border: #999999 solid 2px;text-align: center">
               <h3 style="margin-left: 15px;text-align: left">预警消息提示</h3>
               <div v-for="(item, index) in messages" :key="item" style="margin-top: 3px">
                 <div style="background-color: #3f214b;border-radius: 15px; color: white;font-size: 14px;
               width:auto;display:inline-block !important; display:inline;">
                   &nbsp;
                   <i class="el-icon-warning" style="color: red"></i>
                   {{item}}&nbsp;&nbsp;&nbsp;</div>
               </div>
             </div>
        </div></el-col>
        <el-col :span="8"><div class="grid-content bg-purple">
          <div style="width: 420px;height: 100px;">
            <el-row :gutter="10">
              <el-col :span="6" ><div class="fang" @click="gohome">
                <div>
                  <i class="el-icon-platform-eleme" style="margin-top: 5px;"></i>
                </div>
                <div>
                  <p>餐厅运营数据</p>
                </div>
              </div></el-col>
              <el-col :span="6"><div class="fang" @click="gostock">
                <div>
                  <i class="el-icon-s-home" style="margin-top: 5px;"></i>
                </div>
                <div>
                  <p>仓储物资管理</p>
                </div>
              </div></el-col>
              <el-col :span="6"><div class="fang" @click="godevice">
                <div>
                  <i class="el-icon-s-opportunity" style="margin-top: 5px;"></i>
                </div>
                <div>
                  <p>餐厅设备管理</p>
                </div>
              </div></el-col>
              <el-col :span="6"><div class="fang">
                <div>
                  <i class="el-icon-s-data" style="margin-top: 5px;"></i>
                </div>
                <div>
                  <p>疫情防控数据</p>
                </div>
              </div></el-col>
            </el-row>
          </div>
          <div style="width:420px;height:200px;margin-top: 5px;border-radius: 10px;border: #999999 solid 2px;" ref="echarts2"></div>
          <div style="width:420px;height:300px;margin-top: 5px;border-radius: 10px;" >
            <h3 style="margin-left: 5px;text-align: left;font-size: 20px">环境信息</h3>
            <div>
              <el-row :gutter="3">
                <el-col :span="6" v-for="(item, index) in infos" :key="item">
                  <div style="height:88px;text-align: left;margin-top: 3px;
                border-radius: 5px;border: #999999 solid 1px;font-size: 9px;">
                  <p style="text-align: center;font-size: 14px;font-weight: 600;background-color: #d3dce6">{{item.name}}</p>
                  <hr>
                  <div style="margin-left: 10px;margin-top: 5px">
                    <div>温度：{{item.temperature}}℃</div>
                    <div>湿度：{{item.humidity}}%</div>
                    <div>火情：{{item.fire}}</div>
                  </div>
                </div></el-col>
              </el-row>
            </div>
          </div>
        </div></el-col>
        <el-col :span="8"><div class="grid-content bg-purple">
          <div style="width:420px;height:300px;margin-top: 5px;border-radius: 10px;border: #999999 solid 2px;" ref="echarts3"></div>
          <div style="margin-top: 5px;width: 420px;height:300px;border-radius: 10px;border: #999999 solid 2px;text-align: center">
            <h3 style="margin-left: 8px;text-align: left">操作日志记录</h3>
            <div v-for="(item, index) in operations" :key="item" style="margin: 3px">
              <div style="background-color: #1c2c80;border-radius: 15px; color: white;font-size: 14px;
               width:auto;display:inline-block !important; display:inline;">
                &nbsp;&nbsp;&nbsp;{{item}}&nbsp;&nbsp;&nbsp;</div>
            </div>
          </div>
        </div></el-col>
      </el-row>
    </div>
</template>

<script>
export default {
  name: "Env",
  data(){
    return{
      messages:["2022-05-04 17:02 温度60高于设定值 NEW",
        "2022-05-04 17:02 湿度80%高于设定值","2022-05-04 17:02 温度60高于设定值",
        "2022-05-04 17:02 湿度80%高于设定值","2022-05-04 17:02 温度60高于设定值",
        "2022-05-04 17:02 湿度80%高于设定值",],
      operations:["2022-05-04 17:02 学生一餐厅打开了前台照明",
        "2022-05-04 17:02 学生二餐厅打开了换气扇",
        "2022-05-04 17:02 学生三餐厅打开了消毒柜",
        "2022-05-04 17:02 美食广场打开了换气扇",
      ],
      infos:[
        {
          name:"学生一餐厅",
          temperature: 25.03,
          humidity: 48,
          fire:"正常",
          color: "#1a8a5d",
        },
        {
          name:"学生二餐厅",
          temperature: 26.09,
          humidity: 52,
          fire:"正常",
        },
        {
          name:"学生三餐厅",
          temperature: 24.38,
          humidity: 46,
          fire:"正常",
        },
        {
          name:"美食广场",
          temperature: 27.97,
          humidity: 61,
          fire:"正常",
        },
        {
          name:"学生一餐厅",
          temperature: 25.03,
          humidity: 48,
          fire:"正常",
        },
        {
          name:"学生一餐厅",
          temperature: 25.03,
          humidity: 48,
          fire:"正常",
        },
        {
          name:"学生一餐厅",
          temperature: 25.03,
          humidity: 48,
          fire:"正常",
        },
        {
          name:"学生一餐厅",
          temperature: 25.03,
          humidity: 48,
          fire:"正常",
        },
        {
          name:"学生一餐厅",
          temperature: 25.03,
          humidity: 48,
          fire:"正常",
        },
        {
          name:"学生一餐厅",
          temperature: 25.03,
          humidity: 48,
          fire:"正常",
        },
        {
          name:"学生一餐厅",
          temperature: 25.03,
          humidity: 48,
          fire:"正常",
        },
        {
          name:"学生一餐厅",
          temperature: 25.03,
          humidity: 48,
          fire:"正常",
        },
      ]
    }
  },

  methods:{
      setChart() {
        let myChart = this.$echarts.init(this.$refs.echarts1);
        // 指定图表的配置项和数据
        let option = {
          title: {
            text: '  设备接入情况'
          },
          tooltip: {
            trigger: 'axis',
            axisPointer: {
              type: 'shadow'
            }
          },
          legend: {},
          grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
          },
          xAxis: {
            type: 'value',
            boundaryGap: [0, 0.01]
          },
          yAxis: {
            type: 'category',
            data: ['故障', '离线', '预警', '在线']
          },
          series: [
            {
              name: '数量',
              type: 'bar',
              data: [9,87,29,188],
              itemStyle: {
                color: "rgba(62, 126, 201, 1)"
              }
            },


          ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option)
        },
      setChart2(){
        let myChart = this.$echarts.init(this.$refs.echarts2);
        // 指定图表的配置项和数据
        let option = {
          title: {
            text: '餐厅一周温度变化'
          },
          tooltip: {
            trigger: 'axis',
            axisPointer: {
              type: 'cross',
              label: {
                backgroundColor: '#6a7985'
              }
            }
          },
          legend: {
            data: ['温度℃']
          },
          toolbox: {
            feature: {
              saveAsImage: {}
            }
          },
          grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
          },
          xAxis: [
            {
              type: 'category',
              boundaryGap: false,
              data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
            }
          ],
          yAxis: [
            {
              type: 'value'
            }
          ],
          series: [
            {
              name: '温度℃',
              type: 'line',
              stack: 'Total',
              areaStyle: {},
              emphasis: {
                focus: 'series'
              },
              data: [28.68,32.46,25.84,28.97,30.24,33.98,24.65]
            },
          ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option)
      },
      setChart3(){
        let myChart = this.$echarts.init(this.$refs.echarts3);
        // 指定图表的配置项和数据
        let option = {
          title:{
            text:"各餐厅营业额统计"
          },
          toolbox: {
            show: true,
            feature: {
              mark: { show: true },
              dataView: { show: true, readOnly: false },
              restore: { show: true },
              saveAsImage: { show: true }
            }
          },
          series: [
            {
              name: 'Nightingale Chart',
              type: 'pie',
              radius: [10, 120],
              center: ['50%', '50%'],
              roseType: 'area',
              itemStyle: {
                borderRadius: 8
              },
              data: [
                { value: 400, name: '学生一餐厅' },
                { value: 380, name: '学生二餐厅' },
                { value: 360, name: '学生三餐厅' },
                { value: 340, name: '美食广场' },
                { value: 320, name: '风华园' },
                { value: 300, name: '聚英园' },
                { value: 280, name: '竞舸园' },
              ]
            }
          ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option)
      },
      gohome(){
        this.$router.push('/home');
      },
      gostock(){
        this.$router.push('/stock');
       },
      godevice(){
        this.$router.push('/device');
      },


},
  mounted() {
    window.WIDGET = {
      "CONFIG": {
        "layout": "1",
        "width": "420",
        "height": "150",
        "background": "1",
        "dataColor": "FFFFFF",
        "borderRadius": "15",
        "key": "e1683196d3f942afbc48f45096e04ca5"
      }
    };
    let script = document.createElement('script');
    script.type='text/javascript';
    script.src='https://widget.qweather.net/standard/static/js/he-standard-common.js?v=2.0';
    document.getElementsByTagName('head')[0].appendChild(script);
    this.setChart();
    this.setChart2();
    this.setChart3();
  }
}
</script>

<style  scoped>

.bg-purple {
  /*border: #043c6b solid 2px;*/
}

.grid-content {
  border-radius: 20px;
  height:  calc(100vh - 100px);
}
.row-bg {
  padding: 10px 0;
  background-color: #f9fafc;
}
.fang{
  border: #043c6b solid 1px;
  height: 95px;
  border-radius: 10px;
  text-align: center;
  font-size: 50px;
  background: #d3dce6;
}
.fang p{
  font-size: 12px;
  font-weight: 700;
}
</style>