### 社区页：

在发布动态内容后，动态首页可以正常显示。（获取存储用户头像，上传图片）

### 订餐页面：

（收货地址绑定用户写死不可改；餐品选购自动计算价格；提交订单通过访问接口实现;提交订单后下面显示状态

```javascript
form: {
        student:'',
        address:'',//例：学生二餐厅一号窗口
        money:'',
        diets:'',
        remakes:'正常',
        time:'',//YY-MM-DD hh:mm:ss
      }
request.post("/order", this.form).then(res => {
          if (res) {
            this.$message.success("提交成功")
          } else {
            this.$message.error("提交失败")
          }
        })
```

### 健康页面：

数据绑定日期（可不实现）

饮食摄入/运动消耗/环形图随所选餐品变化

早餐/午餐/午餐运动随所选餐品变化

