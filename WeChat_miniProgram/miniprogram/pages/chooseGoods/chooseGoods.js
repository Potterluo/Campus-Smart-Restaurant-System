// pages/chooseGoods/chooseGoods.js

const app = getApp();

Page({

  /**
   * 页面的初始数据
   */
  data: {
    radio: false,
    youhui: 0.03,
    totalPrice1: 0,
    totalPrice2: 0,

    // food
    food1: [
      {
        "name": "鱼香肉丝",
        "price": 10,
        "num": 0,
        "img": "../../icons/相机.png"
      },
      {
        "name": "小炒肉",
        "price": 10,
        "num": 0,
        "img": "../../icons/相机.png"
      },
      {
        "name": "一品超炒鸡",
        "price": 15,
        "num": 0,
        "img": "../../icons/相机.png"
      }
      
    ],
    food2: [
      {
        "name": "炒面",
        "price": 8,
        "num": 0,
        "img": "../../icons/相机.png"
      },
      {
        "name": "三鲜米线",
        "price": 8,
        "num": 0,
        "img": "../../icons/相机.png"
      },
      {
        "name": "热干面",
        "price": 10,
        "num": 0,
        "img": "../../icons/相机.png"
      }
      
    ]
  },
  // 自定义事件
  checkboxChange1(e){
    var that = this
    console.log(e.detail.value)
    app.food1 = e.detail.value
    // console.log(this.data.radio)
    var array = e.detail.value
    var sum = 0
    sum = array.forEach(function(e){
      // console.log(parseInt(e.match(/\d+/g)) + sum)
      sum += parseInt(e.match(/\d+/g))
      that.setData({
        totalPrice1: sum
      })
      app.total1 = sum
    })
  },
  checkboxChange2(e){
    var that = this
    console.log(e.detail.value)
    app.food2 = e.detail.value 
    var array = e.detail.value
    var sum = 0
    sum = array.forEach(function(e){
      // console.log(parseInt(e.match(/\d+/g)) + sum)
      sum += parseInt(e.match(/\d+/g))
      that.setData({
        totalPrice2: sum
      })
      app.total2 = sum
    })
  },
  radioChange(){
    var status = this.data.radio
    if(status){
      // 取消全选
      this.setData({
        radio: false
      })
    }else{
      // 全选
      this.setData({
        radio: true
      })
    }
  },
  // 选好了
  chooseOk(){
    // 返回上一页
    wx.navigateBack({
      delta: 1,
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