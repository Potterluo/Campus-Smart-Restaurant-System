<template>
  <div style="height: calc(100vh - 60px);" >
    <div style="height: 600px;">
      <el-row :gutter="20" style="width: 1260px;height: 600px">
        <el-col :span="6" >
          <el-row style="height: 300px;width: 300px">
            <div style="width:300px;height:300px;" ref="echarts01"></div>
          </el-row>
          <el-row style="height: 300px;width: 300px">
            <div style="width:300px;height:300px;" ref="echarts02"></div>
          </el-row>
        </el-col>
        <el-col :span="6" style="">
          <el-row style="height: 300px;width: 300px;text-align: center">
            <div><img :src="cardImgList[this.index]" style="height: 200px;margin-top: 40px" @click="changeImg"></div>
          </el-row>
          <el-row style="height: 300px;width: 300px;text-align: center">
            <div><img src="../assets/温度计.png" style="height: 200px;margin-top: 40px" ></div>
          </el-row>
        </el-col>
        <el-col :span="12" >
          <div style="width:600px;height:300px;" ref="chart3" ></div>
          <div style="width:600px;height:300px;" ref="chart4"></div>
        </el-col>
      </el-row>
    </div>


  </div>
</template>

<script>
import request from "@/utils/request";
export default {
  name: "Stenv",
  data(){
    return{
      temperature01: 25.68,
      Humidity01: 0.6,

      cardImgList: [require('../assets/alarm.jpg'),require('../assets/alarm.gif')],
      index: 0,
    }
  },
  mounted () {
    this.load();
    //this.setChart01();
    // this.setChart02();
    this.getImg();
    this.loaded();

  },

  created() {
    this.load(); //你的方法
    this.timer = setInterval(() => {
      this.load(); //你的方法
    }, 10000);
  },
  methods: {
    setChart01() {
      let myChart = this.$echarts.init(this.$refs.echarts01);
      // 指定图表的配置项和数据
      let option = {
        title: {
          text: '  温度信息'
        },
        series: [
          {
            type: 'gauge',
            center: ['50%', '60%'],
            startAngle: 200,
            endAngle: -20,
            min: 0,
            max: 40,
            splitNumber: 8,
            itemStyle: {
              color: '#FFAB91'
            },
            progress: {
              show: true,
              width: 30
            },
            pointer: {
              show: false
            },
            axisLine: {
              lineStyle: {
                width: 30
              }
            },
            axisTick: {
              distance: -45,
              splitNumber: 5,
              lineStyle: {
                width: 2,
                color: '#999'
              }
            },
            splitLine: {
              distance: -52,
              length: 14,
              lineStyle: {
                width: 3,
                color: '#999'
              }
            },
            axisLabel: {
              distance: 0,
              color: '#999',
              fontSize: 16
            },
            anchor: {
              show: false
            },
            title: {
              show: false
            },
            detail: {
              valueAnimation: true,
              width: '60%',
              lineHeight: 40,
              borderRadius: 8,
              offsetCenter: [0, '-15%'],
              fontSize: 36,
              fontWeight: 'bolder',
              formatter: '{value} °C',
              color: 'auto'
            },
            data: [
              {
                value: this.temperature01
              }
            ]
          },
          {
            type: 'gauge',
            center: ['50%', '60%'],
            startAngle: 200,
            endAngle: -20,
            min: 0,
            max: 60,
            itemStyle: {
              color: '#FD7347'
            },
            progress: {
              show: true,
              width: 8
            },
            pointer: {
              show: false
            },
            axisLine: {
              show: false
            },
            axisTick: {
              show: false
            },
            splitLine: {
              show: false
            },
            axisLabel: {
              show: false
            },
            detail: {
              show: false
            },
            data: [
              {
                value: 20
              }
            ]
          }
        ]
      };
      myChart.setOption(option)
    },
    setChart02(){
      let myChart = this.$echarts.init(this.$refs.echarts02);
      // 指定图表的配置项和数据
      let option = {
        title: {
          text: '  湿度信息'
        },
        series: [
          {
            type: 'gauge',
            startAngle: 200,
            endAngle: -20,
            min: 0,
            max: 1,
            splitNumber: 8,
            axisLine: {
              lineStyle: {
                width: 6,
                color: [
                  [0.25, '#FF6E76'],
                  [0.5, '#FDDD60'],
                  [0.75, '#58D9F9'],
                  [1, '#7CFFB2']
                ]
              }
            },
            pointer: {
              icon: 'path://M12.8,0.7l12,40.1H0.7L12.8,0.7z',
              length: '12%',
              width: 20,
              offsetCenter: [0, '-60%'],
              itemStyle: {
                color: 'auto'
              }
            },
            axisTick: {
              length: 12,
              lineStyle: {
                color: 'auto',
                width: 2
              }
            },
            splitLine: {
              length: 20,
              lineStyle: {
                color: 'auto',
                width: 5
              }
            },
            axisLabel: {
              color: '#464646',
              fontSize: 18,
              distance: -60,
              formatter: function (value) {
                if (value === 0.875) {
                  return '湿润';
                } else if (value === 0.625) {
                  return '较湿';
                } else if (value === 0.375) {
                  return '较干';
                } else if (value === 0.125) {
                  return '干燥';
                }
                return '';
              }
            },
            title: {
              offsetCenter: [0, '-20%'],
              fontSize: 20
            },
            detail: {
              fontSize: 36,
              offsetCenter: [0, '0%'],
              valueAnimation: true,
              formatter: function (value) {
                return Math.round(value * 100) + '%';
              },
              color: 'auto'
            },
            data: [
              {
                value: this.Humidity01,
                name: ''
              }
            ]
          }
        ]
      };
      myChart.setOption(option);
    },
    setChart3(){
      let myChart = this.$echarts.init(this.$refs.chart3);
      // 指定图表的配置项和数据
      let option  = {
        color: ['#ffab91'],
        title: {
          text: '温度变化曲线  ℃'
        },

        xAxis: {
          type: 'category',
          data: ['7:00','8:00','9:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00']
        },
        yAxis: [
          {
            type: 'value',
            interval:5,
            min:0,
            max:40
          }
        ],
        series: [
          {
            data: [16.63,18.82,20.35,25.68,26.08,32.98,33.08,32.87,28.05,29.08,30.05,26.85,22,65],
            type: 'line',
            smooth: true
          }
        ]
      };
      myChart.setOption(option);
    },
    setChart4(){
      let myChart = this.$echarts.init(this.$refs.chart4);
      // 指定图表的配置项和数据
      let option  = {
        color: ['#58d9f9'],
        title: {
          text: '湿度变化曲线 %'
        },

        xAxis: {
          type: 'category',
          data: ['7:00','8:00','9:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00']
        },
        yAxis: [
          {
            type: 'value',
            interval:5,
            min:20,
            max:60
          }
        ],
        series: [
          {
            data: [44,48,45,54,53,38,43,34,46,50,39,47,35],
            type: 'line',
            smooth: true
          }
        ]
      };
      myChart.setOption(option);
    },



    getImg(){
      this.$refs.divRef.style.background = "url(" + require("../assets/bg1.jpg") + ")"
    },
    changeImg(){
      this.index=(this.index+1)%2
    },
    async load() {
      await request.get("/stenv").then(res => {
        // console.log(res)
        // console.log(res.records[0].temperature)
        // console.log(res.records[0].humidity)
        this.temperature01 = res.records[0].temperature
        this.Humidity01= res.records[0].humidity
        this.index= (res.records[0].fire)%2
      })
      this.setChart01();
      this.setChart02();
      this.setChart3();
      this.setChart4();
    },
  },

}

</script>

<style scoped>

</style>