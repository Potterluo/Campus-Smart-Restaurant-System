// pages/healthyIndex/healthyIndex.js
import * as echarts from '../../ec-canvas/echarts';

// function initChart(canvas, width, height, dpr) {
//   chart = echarts.init(canvas, null, {
//     width: width,
//     height: height,
//     devicePixelRatio: dpr // new
//   });
//   canvas.setChart(chart);

//   // var option = {
//   //   backgroundColor: "#ffffff",
//   //   title:[
//   //     {
//   //       text: `{name|还可摄入}\n{val|` + 2224 + `}\n{name|推荐预算 2224}`,
//   //       top: 'center',
//   //       left: 'center',
//   //       textStyle: {
//   //         rich: {
//   //           name: {
//   //             fontSize: 11,
//   //             color: '#aaaaaa',
//   //           },
//   //           val: {
//   //             fontSize: 18,
//   //             color: '#000000',
//   //             padding: [8,0],
//   //             fontWeight: 600
//   //           }
//   //         }
//   //       }
//   //     }
//   //   ],
//   //   series: [{
//   //     type: 'pie',
//   //     center: ['50%', '50%'],
//   //     radius: ['70%', '90%'],
//   //     label: {
//   //       normal: {
//   //           show: false,
//   //       },
//   //     },
//   //     labelLine: {
//   //       normal: {
//   //           show: false
//   //       }
//   //     },
//   //     data: [{
//   //       value: 55,
//   //       name: '北京',
//   //       itemStyle: {color: '#dddddd'}
//   //     }, {
//   //       value: 30,
//   //       name: '武汉',
//   //       itemStyle: {color: 'green'}
//   //     }],
//   //   }]
//   // };

//   // chart.setOption(option);
//   return chart;
// }

Page({

  /**
   * 页面的初始数据
   */
  data: {
    // 饮食摄入
    foodEnergy: 0,
    // 运动消耗
    sportsEnergy: 0,

    topDate: '今天',
    ec: {
      // onInit: initChart
      // 将 lazyLoad 设为 true 后，需要手动初始化图表
      lazyLoad: true
    },
    food: [
      {
        title: '早餐',
        totalEnergy: 556,
        list:[
          {
            name: '鸡蛋',
            src: '../../icons/健康.png',
            num: 1,
            cal: 73
          },
          
        ]
      },
      {
        title: '午餐',
        totalEnergy: 556,
        list:[
          {
            name: '米饭',
            src: '../../icons/健康.png',
            num: 1,
            cal: 73
          },
        ]
      },
      {
        title: '晚餐',
        totalEnergy: 556,
        list:[
          {
            name: '饼夹菜',
            src: '../../icons/健康.png',
            num: 1,
            cal: 73
          },
        ]
      }
    ],
    sports:[
      {
        title: '运动',
        totalEnergy: 90,
        list: [
          {
            name: '走路(慢)',
            src: '../../icons/健康.png',
            num: 1,
            cal: 90
          }
        ]
      }
    ]
  },
  toLeft(){
    var date = this.data.topDate
    if(date == '今天'){
      this.setData({
        topDate: '昨天'
      })
    }else if(date == '昨天'){
      this.setData({
        topDate: '前天'
      })
    }
  },
  toRight(){
    var date = this.data.topDate
    if(date == '前天'){
      this.setData({
        topDate: '昨天'
      })
    }else if(date == '昨天'){
      this.setData({
        topDate: '今天'
      })
    }
  },
  chooseDate(){
    var date = new Date()
    var month = date.getMonth() + 1
    var day = date.getDay()
  },
  bindDateChange: function(e) {
    // console.log('picker发送选择改变，携带值为', e.detail.value)
    var topDate = new String(e.detail.value)
    // console.log(topDate.substr(5,topDate.length+1))
    var topDate = topDate.substr(5,topDate.length+1)
    this.setData({
      topDate: topDate
    })
  },
  toChooseFood(e){
    // console.log(e.currentTarget.dataset.type)
    var type = e.currentTarget.dataset.type
    wx.showLoading({
      title: '加载中',
    })
    setTimeout(() => {
        wx.hideLoading({
          success: (res) => {
            wx.navigateTo({
              url: '../../pages/order/order?type=' + type,
            })
          },
          fail: (res) => {},
          complete: (res) => {},
        })
    }, 500);
    
  },
  toChooseSports(){
    wx.showLoading({
      title: '加载中',
    })
    setTimeout(() => {
        wx.hideLoading({
          success: (res) => {
            wx.navigateTo({
              url: '../addSports/addSports',
            })
          },
          fail: (res) => {},
          complete: (res) => {},
        })
    }, 500);
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    // 还可摄入
    var remind = 2224
    // 运动总能量
    var foodEnergy = 0
    // 运动总能量
    var sportsEnergy = 0
    // 请求数据库
    var that = this
    var db = wx.cloud.database()
    db.collection("zaocan").get().then(res=>{
      console.log(res.data)
      if(res.data){

        // 计算总能量
        var array = res.data
        var totalCal = 0
        array.forEach(function(e){
          totalCal += e.cal
          foodEnergy += e.cal
        })

        that.setData({
          ["food[0].totalEnergy"]: totalCal,
          ["food[0].list"]: res.data,
          foodEnergy: foodEnergy
        })
        remind = remind -foodEnergy
        let chartComponent = this.selectComponent("#mychart-dom-pie")
        chartComponent.init((canvas, width, height, dpr)=>{
          // 获取组件的 canvas、width、height 后的回调函数
          // 在这里初始化图表
          const chart = echarts.init(canvas, null, {
            width: width,
            height: height,
            devicePixelRatio: dpr // new
          });
          // 设置参数的方法
          // //调用设定EChart报表状态的函数，并且把从后端拿到的数据传过去
          that.setOption(chart, remind, foodEnergy, sportsEnergy)
          // 注意这里一定要返回 chart 实例，否则会影响事件处理等
          return chart;
        })
      }
    })
    db.collection("wucan").get().then(res=>{
      console.log(res.data)
      if(res.data){

        // 计算总能量
        var array = res.data
        var totalCal = 0
        array.forEach(function(e){
          totalCal += e.cal,
          foodEnergy += e.cal
        })

        that.setData({
          ["food[1].totalEnergy"]: totalCal,
          ["food[1].list"]: res.data,
          foodEnergy: foodEnergy
        })
        remind = remind - foodEnergy
        let chartComponent = this.selectComponent("#mychart-dom-pie")
        chartComponent.init((canvas, width, height, dpr)=>{
          // 获取组件的 canvas、width、height 后的回调函数
          // 在这里初始化图表
          const chart = echarts.init(canvas, null, {
            width: width,
            height: height,
            devicePixelRatio: dpr // new
          });
          // 设置参数的方法
          // //调用设定EChart报表状态的函数，并且把从后端拿到的数据传过去
          that.setOption(chart, remind, foodEnergy, sportsEnergy)
          // 注意这里一定要返回 chart 实例，否则会影响事件处理等
          return chart;
        })
      }
    })
    db.collection("wancan").get().then((res)=>{
      console.log(res.data)
      if(res.data){
        // 计算总能量
        var array = res.data
        var totalCal = 0
        array.forEach(function(e){
          totalCal += e.cal,
          foodEnergy += e.cal
        })

        that.setData({
          ["food[2].totalEnergy"]: totalCal,
          ["food[2].list"]: res.data,
          foodEnergy: foodEnergy
        })
        remind = remind -foodEnergy
        let chartComponent = this.selectComponent("#mychart-dom-pie")
        chartComponent.init((canvas, width, height, dpr)=>{
          // 获取组件的 canvas、width、height 后的回调函数
          // 在这里初始化图表
          const chart = echarts.init(canvas, null, {
            width: width,
            height: height,
            devicePixelRatio: dpr // new
          });
          // 设置参数的方法
          // //调用设定EChart报表状态的函数，并且把从后端拿到的数据传过去
          that.setOption(chart, remind, foodEnergy, sportsEnergy)
          // 注意这里一定要返回 chart 实例，否则会影响事件处理等
          return chart;
        })
      }
    })

    // 运动
    db.collection("yundong").get().then((res)=>{
      console.log(res.data)
      if(res.data){
        // 计算总能量
        var array = res.data
        var totalCal = 0
        array.forEach(function(e){
          totalCal += e.cal
        })

        that.setData({
          ["sports[0].totalEnergy"]: totalCal,
          ["sports[0].list"]: res.data,
          sportsEnergy: totalCal
        })
        sportsEnergy = totalCal
        remind = remind + totalCal
        let chartComponent = this.selectComponent("#mychart-dom-pie")
        chartComponent.init((canvas, width, height, dpr)=>{
          // 获取组件的 canvas、width、height 后的回调函数
          // 在这里初始化图表
          const chart = echarts.init(canvas, null, {
            width: width,
            height: height,
            devicePixelRatio: dpr // new
          });
          // 设置参数的方法
          // //调用设定EChart报表状态的函数，并且把从后端拿到的数据传过去
          that.setOption(chart, remind, foodEnergy, sportsEnergy)
          // 注意这里一定要返回 chart 实例，否则会影响事件处理等
          return chart;
        })
      }
    })

    // ///////////////// echarts
    // let chartComponent = this.selectComponent("#mychart-dom-pie")
    // chartComponent.init((canvas, width, height, dpr)=>{
    //   // 获取组件的 canvas、width、height 后的回调函数
    //   // 在这里初始化图表
    //   const chart = echarts.init(canvas, null, {
    //     width: width,
    //     height: height,
    //     devicePixelRatio: dpr // new
    //   });
    //   // 设置参数的方法
    //   // //调用设定EChart报表状态的函数，并且把从后端拿到的数据传过去
    //   that.setOption(chart, remind)
    //   // 注意这里一定要返回 chart 实例，否则会影响事件处理等
    //   return chart;
    // })
  },

  // 设置参数的方法
  setOption(chart, remind, foodEnergy, totalCal){
    console.log(remind, foodEnergy, totalCal)
    var option = {
    backgroundColor: "#ffffff",
    title:[
      {
        text: `{name|还可摄入}\n{val|` + remind + `}\n{name|推荐预算 2224}`,
        top: 'center',
        left: 'center',
        textStyle: {
          rich: {
            name: {
              fontSize: 11,
              color: '#aaaaaa',
            },
            val: {
              fontSize: 18,
              color: '#000000',
              padding: [8,0],
              fontWeight: 600
            }
          }
        }
      }
    ],
    series: [{
      type: 'pie',
      center: ['50%', '50%'],
      radius: ['70%', '90%'],
      label: {
        normal: {
            show: false,
        },
      },
      labelLine: {
        normal: {
            show: false
        }
      },
      data: [{
        value: foodEnergy,
        name: '消耗',
        itemStyle: {color: 'green'}
      }, {
        value: totalCal + 2224,
        name: '剩余',
        itemStyle: {color: '#dddddd'}
      }],
    }]
  };

  chart.setOption(option);
  },
  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})