// pages/dingdingRoom/dingdingRoom.js

const app = getApp();

Page({

  /**
   * 页面的初始数据
   */
  data: {
    dingDanInfo:[
      {
        Address: "",
        Send: "自营(1单)",
        Discount: "暂无可用",
        Choose: "暂无选择",
        redBag: "暂无可用"
      }
    ],
    totalPrice: 0,
    Choose: "暂无选择",
    // 展示我的订单
    display: false,
    // 随机数字
    random: "",
    // 创建时间
    time: ""
  },
  // 自定义函数
  radioChange(e){
      console.log(e)
  },
  commitDingDan(){
    var that = this
    wx.showToast({
      title: '提交成功',
      icon: 'success',
      duration: 2000,
      success(res){
        that.setData({
          display: true
        })
      }
    })
  },
  chooseFood(){
    wx.navigateTo({
      url: '../../pages/chooseGoods/chooseGoods',
    })
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
    console.log(app.total1)
    console.log(app.total2)
    console.log(app.food1)
    console.log(app.food2)

    var time = new Date()
    var hour = time.getHours()
    var minute = time.getMinutes()
    if(minute < 10){
      minute = 0 + "" + minute
    }
    time = hour + ":" + minute

    var random = ""
    for(var i=0; i<7; i++){
      random += Math.floor(Math.random()*10).toString()
    }
    console.log(random)

    var food1 = ""
    for(var i=0; i<app.food1.length; i++){
      food1 = food1 + app.food1[i] + ";"
    }
    var food2 = ""
    for(var i=0; i<app.food2.length; i++){
      food2 = food2 + app.food2[i] + ";"
    }
    var food = ""
    food = food1 + food2

    if(app.total1 || app.total2){
      this.setData({
        totalPrice: (app.total1 + app.total2),
        Choose: food,
        random: random,
        time: time
      })

      var date
      var tt = new Date()
      var year = tt.getFullYear()
      var month = tt.getMonth() + 1
      var day = tt.getDay()
      var second = tt.getSeconds()
      date = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second

      if(app.total1){
        // 发送请求数据库
        wx.request({
          url: 'http://localhost:9090/order',
          method: "POST",
          dataType: 'json',
          data: {
            student:'杜晓龙',
            address:'学生二餐厅1号窗口',//例：学生二餐厅一号窗口
            money: app.total1,
            diets: food1,
            remakes:'正常',
            time: date
          }
        })
      }

      if(app.total2){
        // 发送请求数据库
        wx.request({
          url: 'http://localhost:9090/order',
          method: "POST",
          dataType: 'json',
          data: {
            student:'杜晓龙',
            address:'学生二餐厅2号窗口',//例：学生二餐厅一号窗口
            money: app.total2,
            diets: food2,
            remakes:'正常',
            time: date
          }
        })
      }
    }
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