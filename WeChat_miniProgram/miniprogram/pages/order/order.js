// pages/order/order.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // type:早餐....
    type: "",

    foodList: [
      {
        name: '鸡蛋',
        cal: 139,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/鸡蛋.jpg'
      },
      {
        name: '牛奶',
        cal: 70,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/牛奶.jpg'
      },
      {
        name: '水煎包',
        cal: 166,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/水煎包.jpg'
      },
      {
        name: '绿豆薏米粥',
        cal: 94,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/绿豆薏米粥.jpg'
      },
      {
        name: '千层饼',
        cal: 319,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/千层饼.jpg'
      },
      {
        name: '米饭',
        cal: 116,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/米饭.jpg'
      },
      {
        name: '胡辣汤',
        cal: 58,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/牛肉胡辣汤.jpg'
      },
      {
        name: '苹果',
        cal: 53,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/苹果.jpg'
      },
      {
        name: '豆浆',
        cal: 31,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/豆浆.jpg'
      },
      {
        name: '馒头',
        cal: 223,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/馒头.jpg'
      },
      {
        name: '燕麦片',
        cal: 338,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/燕麦片.jpg'
      },
      {
        name: '包子',
        cal: 227,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/大肉包子.jpg'
      },
      {
        name: '鱼香肉丝',
        cal: 88,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/鱼香肉丝.jpg'
      },
      {
        name: '青椒炒肉',
        cal: 92,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/青椒炒肉.jpg'
      },
      {
        name: '小炒肉',
        cal: 196,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/小炒肉.jpg'
      },
      {
        name: '番茄炒蛋',
        cal: 71,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/番茄炒蛋.jpg'
      },
      {
        name: '炸酱面',
        cal: 284,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/炸酱面.jpg'
      },
      {
        name: '烩面',
        cal: 287,
        num: 0,
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/foodList/烩面.jpg'
      },
    ]
  },
  subNum(e){
    // console.log(e.currentTarget.dataset.index)
    var index = e.currentTarget.dataset.index
    if(this.data.foodList[index].num > 0){
      this.setData({
        ["foodList[" + index + "].num"]: (this.data.foodList[index].num-1)
      })
    }
  },
  addNum(e){
    var index = e.currentTarget.dataset.index
    this.setData({
      ["foodList[" + index + "].num"]: (this.data.foodList[index].num+1)
    })
  },
  Finished(){
    var type = this.data.type
    if(type == "早餐"){
      this.addData("zaocan")
    }else if(type == "午餐"){
      this.addData("wucan")
    }else{
      this.addData("wancan")
    }
    
  },

  // 添加数据库
  addData(type){
    wx.showLoading({
      title: '添加中',
    })
    // 添加入数据库
    var array = this.data.foodList
    array.forEach(function(e){
      if(e.num > 0){
        var db = wx.cloud.database()
        db.collection(type).add({
          data: {
            "name": e.name,
            "cal": e.cal * e.num,
            "num": e.num,
            "src": e.src
          }
        }).then(res=>{
          console.log(res)
          wx.hideLoading({
            success: (res) => {
              wx.navigateBack({
                delta: 1,
              })
            },
          })
        })
      }
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // 早中晚餐
    console.log(options.type)
    this.setData({
      type: options.type
    })
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