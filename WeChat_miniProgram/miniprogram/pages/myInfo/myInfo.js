// pages/myInfo/myInfo.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    userInfo: {
      nickname: '梦飞幻翼',
      address: '男生宿舍2号楼',
      email: '123456789@zzu.edu.cn',
      tel: '13268732797'
    }
  },
  inputNickname(e){
    this.setData({
      ['userInfo.nickname']: e.detail.value
    })
  },
  inputAddress(e){
    this.setData({
      ['userInfo.address']: e.detail.value
    })
  },
  inputEmail(e){
    this.setData({
      ['userInfo.email']: e.detail.value
    })
  },
  inputTel(e){
    this.setData({
      ['userInfo.tel']: e.detail.value
    })
  },
  submit(){
    console.log(this.data.userInfo)
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