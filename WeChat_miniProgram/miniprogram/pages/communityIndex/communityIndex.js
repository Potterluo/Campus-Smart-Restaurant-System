// pages/communityIndex/communityIndex.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    background: ["../../images/lb01.jpg", "../../images/lb02.jpg","../../images/lb03.jpg",],
    indicatorDots: true,
    vertical: false,
    autoplay: true,
    interval: 2000,
    duration: 500,
    current: 0,

    praiseImg:'../../icons/可爱的 (1).png',

    userInfo:[
      {
        userImg: '../../images/shot.jpg',
        userName: '梦飞幻翼',
        publishTime: "4月6日",
        tag: "美食分享",
        praise: true,
        content: "端起盘子,香气就扑鼻而来大块的鱼肉鲜美爽滑加上软糯豆腐，爽脆的豆芽还有浸透汤汁的豆皮、金针菇最大程度上刺激了味蕾。",
        uploadImg: '../../images/1.jpg'
      },
    ]
  },
// 轮播图滑动
  swiperChange(event){
    // console.log(event)
    if(event.detail.current === this.data.background.length){
      this.setData({
        current: 0
      })
    }
  },
// 点赞
  changePraise(event){
    // console.log(event.currentTarget.dataset.index)
    let index = event.currentTarget.dataset.index
    let status = !(this.data.userInfo[index].praise)

    this.setData({
      ["userInfo[" + index + "].praise"]: status
    })
    
  },
  // 添加评论
  addComment(){
    wx.navigateTo({
      // 可以添加参数
      url: '../../pages/addComment/addComment',
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
    // 请求数据库
    var that = this
    var db = wx.cloud.database()
    db.collection("user").get().then(res=>{
      console.log(res.data)
      var array = res.data
      array = array.reverse()
      that.setData({
        userInfo: array
      })
    })
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