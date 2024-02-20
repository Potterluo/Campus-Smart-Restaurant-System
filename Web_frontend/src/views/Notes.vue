<template>
<div>
  <el-row :gutter="10" style="margin-bottom: 60px;">
    <el-col :span="3" v-for="(item, index) in device" :key="item" style="text-align: center;margin-top: 5px"  >
      <el-card style="color: #67C23A">
        <div><i class="el-icon-s-promotion" /> {{item.name}}</div>
        <div style="padding: 10px 0; text-align: center; font-weight: bold">
          {{item.sat}}
        </div>
        <el-button type="success" round @click="ChangSat(index)">完成消毒</el-button>
      </el-card>
    </el-col>
  </el-row>
</div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "Notes",
  data(){
    return{
      device:[],
    }
  },

  created(){
    this.load()

  },
  methods:{
    ChangSat(index){
      if(this.device[index].sat=="未消毒"){
        this.device[index].sat="已消毒"
        console.log(this.device[index])
        request.post("/device", this.device[index]).then(res => {
          if (res) {
            this.$message.success("切换成功")
            this.load()
          } else {
            this.$message.error("切换失败")
          }
        })
        this.load()
      }else {
        this.$message.warning("无需切换")
      }

    },
    load(){
      request.get("/device").then(res => {
        console.log(res)
        this.device=res
      })
    },


  }

}
</script>

<style scoped>

</style>