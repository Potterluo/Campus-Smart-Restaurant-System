// pages/addSports/addSports.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    sportsList:[
      {
        name: '走路',
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/Sports/走路1.png',
        cal: 89,
        num: 0,
        
      },
      {
        name: '跑步(慢)',
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/Sports/跑步（慢）.png',
        cal: 387,
        num: 0
      },
      {
        name: '跑步(快)',
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/Sports/跑步（快）.png',
        cal: 535,
        num: 0
      },
      {
        name: '跳绳',
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/Sports/跳绳.png',
        cal: 408,
        num: 0
      },
      {
        name: '健身操',
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/Sports/舞蹈2.png',
        cal: 352,
        num: 0
      },
      {
        name: '篮球',
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/Sports/篮球.png',
        cal: 387,
        num: 0
      },
      {
        name: '足球',
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/Sports/足球.png',
        cal: 422,
        num: 0
      },
      {
        name: '乒乓球',
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/Sports/乒乓球.png',
        cal: 211,
        num: 0
      },
      {
        name: '羽毛球',
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/Sports/羽毛球.png',
        cal: 316,
        num: 0
      },
      {
        name: '排球',
        src: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/Sports/排球.png',
        cal: 331,
        num: 0
      },
    ]
  },
  subNum(e){
    // console.log(e.currentTarget.dataset.index)
    var index = e.currentTarget.dataset.index
    if(this.data.sportsList[index].num > 0){
      this.setData({
        ["sportsList[" + index + "].num"]: (this.data.sportsList[index].num-1)
      })
    }
  },
  addNum(e){
    var index = e.currentTarget.dataset.index
    this.setData({
      ["sportsList[" + index + "].num"]: (this.data.sportsList[index].num+1)
    })
  },
  Finished(){

    wx.showLoading({
      title: '添加中',
    })
    // 添加入数据库
    var array = this.data.sportsList
    array.forEach(function(e){
      if(e.num > 0){
        var db = wx.cloud.database()
        db.collection("yundong").add({
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