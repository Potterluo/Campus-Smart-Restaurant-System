<template>
  <div style="width: 500px;margin-left: 350px;font-size: 26px;margin-top: 20px;
    border: #999999 solid 2px;border-radius: 15px;padding: 20px;box-shadow: #999999 10px 10px 30px 5px">
    <el-form ref="form" :model="form" label-width="80px">
      <el-form-item label="订购人">
        <el-input v-model="form.student" ></el-input>
      </el-form-item>
      <el-form-item label="商铺位置">
        <el-input v-model="form.address" ></el-input>
      </el-form-item>
      <el-form-item label="价格">
        <el-input v-model="form.money" ></el-input>
      </el-form-item>
      <el-form-item label="所选菜品">
        <el-input v-model="form.diets" ></el-input>
      </el-form-item>
      <el-form-item >
        <div style="text-align: right">
          <el-button type="primary" @click="onSubmit">下单</el-button>
          <el-button @click="onCancel">取消</el-button>
        </div>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import {serverIp} from "../../public/config";
import request from "@/utils/request";
export default {
  name: "SubmitOrder",
  data() {
    return {
      form: {
        student:'',
        address:'',
        money:'',
        diets:'',
        remakes:'正常',
        time:''
      }
    }
  },
  created() {

  },
  methods: {
    onSubmit() {
      if(this.form.time=this.$dayjs(new Date()).format("YYYY-MM-DD HH:mm:ss")){
        console.log(this.form.time)
        request.post("/order", this.form).then(res => {
          if (res) {
            this.$message.success("提交成功")
          } else {
            this.$message.error("提交失败")
          }
        })
      }

    },
    onCancel() {
      this.form = ''
    },
    save() {

    },

  }
}
</script>

<style scoped>

</style>