// pages/addComment/addComment.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    src: '../../icons/相机.png',
    cloudImg: '',
    tags: [
      "美食分享",
      "光盘打卡",
      "运动健身",
      "今日小确幸",
      "一件小事"
    ]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },
  // 自定义函数
  // 获取发表内容
  bindFormSubmit: function(e) {
    var that = this
    // 获取日期
    var time = new Date()
    var mouth = time.getMonth() + 1
    var day = time.getDay() + 8
    time = mouth + "月" + day + "日"
    console.log(time)
    // 获取标签
    var index = (Math.floor(Math.random()*10)) % 5
    console.log(index)
    // 发布输入内容
    // console.log(e.detail.value['comCon'])
    if(e.detail.value['comCon']===""){
      wx.showToast({
        title: '内容不能为空',
        icon: 'error',
        duration: 2000,
        success(res){
          return
        }
      })
    }else{
      // 上传图片到云端
      wx.cloud.uploadFile({
        cloudPath:'my_' + new Date().getTime() + "_" +  Math.floor(Math.random()*1000) + ".jpg",
        filePath: that.data.src
      }).then(res => {
        // get resource ID
        console.log(res.fileID)
        // 上传发布内容
      var db = wx.cloud.database()
      db.collection("user").add({
        data: {
          // 参数信息
          userImg: 'cloud://dxl-001-8g05gsvs94fc6c28.6478-dxl-001-8g05gsvs94fc6c28-1301859847/shot/shot.jpg',
          userName: '梦飞幻翼',
          publishTime: time,
          tag: that.data.tags[index],
          praise: false,
          content: e.detail.value['comCon'],
          uploadImg: res.fileID
        },
        success: (res)=>{
          console.log("ajsfhjaskfja")
          wx.showToast({
            title: '发布成功',
            icon: 'success',
            duration: 2000
          })
          wx.switchTab({
            url: '../communityIndex/communityIndex',
          })
        }
      })
      }).catch(error => {
        // handle error
        console.log("上传失败")
      })

    }
  },
  // 上传照片视频
  uploadImg(){
    var that = this
    // console.log(111)
    // https://developers.weixin.qq.com/miniprogram/dev/api/media/video/wx.chooseMedia.html
    wx.chooseMedia({
      mediaType: ['image','video'],
      sourceType: ['album', 'camera'],
      maxDuration: 30,
      camera: 'back',
      success(res) {
        // 临时文件路径
        console.log(res)
        console.log(res.tempFiles[0].tempFilePath)
        var tempFile = res.tempFiles[0].tempFilePath
        that.setData({
          src: tempFile
        })
      }
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