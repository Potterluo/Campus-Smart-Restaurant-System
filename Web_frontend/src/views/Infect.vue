<template>
<div>
  <el-row><el-button type="primary" round icon="el-icon-remove" style="margin-bottom: 5px" @click="clear">重置状态</el-button></el-row>
  <el-row :gutter="10" style="margin-bottom: 60px;">
    <el-col :span="3" v-for="(item, index) in device1" :key="item" style="text-align: center;margin-top: 5px">
      <el-card style="color: #409EFF">
        <div><i class="el-icon-s-promotion" /> {{item.name}}</div>
        <div style="padding: 10px 0; text-align: center; font-weight: bold">
          已消毒
        </div>
      </el-card>
    </el-col>
  </el-row>
  <el-row :gutter="10" style="margin-bottom: 60px">
    <el-col :span="3" v-for="(item, index) in device2" :key="item" style="text-align: center;margin-top: 5px">
      <el-card style="color: #F56C6C">
        <div><i class="el-icon-lock" /> {{item.name}}</div>
        <div style="padding: 10px 0; text-align: center; font-weight: bold">
          未消毒
        </div>
      </el-card>
    </el-col>
  </el-row>
</div>
</template>

<script>
import request from "@/utils/request";
export default {
  name: "Infect",
  data(){
    return{
      device1:[],
      device2:[],
      device:[],
      device3:[],
    }
  },
  methods:{
    load(){
      request.get("/device").then(res => {
        console.log(res)
        this.device=res
        for (let index in this.device)
        {
          if(this.device[index].sat=='已消毒'){
            this.device1.push(this.device[index])
          }else {
            this.device2.push(this.device[index])
          }
        }
      })


    },
    clear(){
      for (let index in this.device)
      {
        this.device[index].sat="未消毒"
        console.log(this.device[index])
        request.post("/device", this.device[index]).then(res => {
          if (res) {

            this.$forceUpdate()
          } else {
            this.$message.error("重置失败")
          }
        })
      }
      this.$message.success("重置成功")
      this.device1=[]
      this.device2=[]
      this.load()
    }

  },
  created() {
    this.load()

  },
  beforeDestroy() {
    clearInterval(this.timer);
  },

}
</script>

<style scoped>

</style>