<template>
<div style="width: 500px;margin-left: 350px;font-size: 26px;margin-top: 20px;
    border: #999999 solid 2px;border-radius: 15px;padding: 20px;box-shadow: #999999 10px 10px 30px 5px">
  <el-form ref="form" :model="form" label-width="80px">
    <el-form-item label="订购人">
      <el-input v-model="form.customer" disabled></el-input>
    </el-form-item>
    <el-form-item label="商铺位置">
      <el-input v-model="form.address" disabled></el-input>
    </el-form-item>
    <el-form-item label="联系方式">
      <el-input v-model="form.phone" disabled></el-input>
    </el-form-item>
    <el-form-item label="配送方式">
      <el-select v-model="form.delivery" placeholder="请选择配送方式">
        <el-option label="餐厅配送" value="餐厅配送"></el-option>
        <el-option label="个人取货" value="个人取货"></el-option>
      </el-select>
    </el-form-item>
<!--    <el-form-item label="活动时间">
      <el-col :span="11">
        <el-date-picker type="date" placeholder="选择日期" v-model="form.date1" style="width: 100%;"></el-date-picker>
      </el-col>
      <el-col class="line" :span="2">-</el-col>
      <el-col :span="11">
        <el-time-picker placeholder="选择时间" v-model="form.date2" style="width: 100%;"></el-time-picker>
      </el-col>
    </el-form-item>
    <el-form-item label="即时配送">
      <el-switch v-model="form.delivery"></el-switch>
    </el-form-item>
    <el-form-item label="活动性质">
      <el-checkbox-group v-model="form.type">
        <el-checkbox label="美食/餐厅线上活动" name="type"></el-checkbox>
        <el-checkbox label="地推活动" name="type"></el-checkbox>
        <el-checkbox label="线下主题活动" name="type"></el-checkbox>
        <el-checkbox label="单纯品牌曝光" name="type"></el-checkbox>
      </el-checkbox-group>
    </el-form-item>
    <el-form-item label="特殊资源">
      <el-radio-group v-model="form.resource">
        <el-radio label="线上品牌商赞助"></el-radio>
        <el-radio label="线下场地免费"></el-radio>
      </el-radio-group>
    </el-form-item>-->
    <el-form-item label="所需货品">
      <el-input type="textarea" v-model="form.goods" placeholder="格式示例：大米*50Kg；西红柿*10Kg"></el-input>
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
  name: "SubmitForm",
  data() {
    return {
      serverIp: serverIp,
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      form: {
        customer: '',
        address:'',
        phone:'',
        delivery: '个人取货',
        goods: '',
        tag:'未完成',
      }
    }
  },
  created() {
    this.getUser().then(res => {
      console.log(res)
      this.form.customer=res.nickname
      this.form.address=res.address
      this.form.phone=res.phone
    })
  },
  methods: {
    onSubmit() {
      if(this.form.goods){
        if(this.form.delivery=='餐厅配送'){
          this.form.tag='待配送'
        }
        console.log('submit!');
        console.log(this.form);
        this.save();
      }else {
        this.$message({
          message: '请勿提交空订单',
          type: 'warning'
        });
      }

    },
    onCancel(){
      this.form.delivery='';
      this.form.goods='';
    },
    async getUser() {
      return (await this.request.get("/user/username/" + this.user.username)).data
    },
    save() {
      request.post("/form", this.form).then(res => {
        if (res) {
          this.$message.success("提交成功")
          this.dialogFormVisible = false
        } else {
          this.$message.error("提交失败")
        }
      })

    },
  }
}
</script>

<style scoped>

</style>