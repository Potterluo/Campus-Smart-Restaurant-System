<template>
<!-- ESP32CAM IP地址可在路由器中查看，端口不变；图片宽高 320*240
http://192.168.0.152:81/stream-->
  <div style="font-size: 28px;">
    <h1 style="text-align: center">餐厅安保监控</h1>
    <el-row  style="height: 300px;width: 100%">
      <el-col :span="8">
        <div class="grid-content" style="text-align: center;font-size: 24px" >
          <div><img  src="../assets/error.jpg"></div>
          <div>学生三餐厅监控一</div>
        </div>
      </el-col>
      <el-col :span="8"><div class="grid-content" style="text-align: center;font-size: 24px" >
        <div><img src="http://192.168.0.152:81/stream"></div>
        <div>学生三餐厅监控二</div>
      </div></el-col>
      <el-col :span="8">
        <div class="grid-content" style="text-align: center;font-size: 24px" >
          <div><img  src="../assets/error.jpg"></div>
          <div>学生三餐厅监控三</div>
        </div>
      </el-col>
    </el-row>

    <el-row  style="height: 300px;width: 100%">
      <el-col :span="8">
        <div class="grid-content" style="text-align: center;font-size: 24px" >
          <div><img  src="../assets/error.jpg"></div>
          <div>学生二餐厅监控一</div>
        </div>
      </el-col>
      <el-col :span="8"><div class="grid-content" style="text-align: center;font-size: 24px" >
        <div><img src="../assets/error.jpg"></div>
        <div>学生二餐厅监控二</div>
      </div></el-col>
      <el-col :span="8">
        <div class="grid-content" style="text-align: center;font-size: 24px" >
          <div><img  src="../assets/error.jpg"></div>
          <div>学生二餐厅监控三</div>
        </div>
      </el-col>
    </el-row>

  </div>
</template>

<script>
export default {
  name: "Video"
}
</script>

<style scoped>
.el-row {
  margin-bottom: 20px;
  height: 100px;
  width: 100vh;
  /*border: indianred solid 1px;*/
}
.el-col {
  border-radius: 4px;
  height: 100%;
  /*border: indianred solid 1px;*/
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}

</style>