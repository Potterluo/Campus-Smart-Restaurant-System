<template>
 <div>
   <el-row>
    <div style="text-align: center"> <h1 style="font-size: 28px">欢迎来到郑州大学智慧餐厅</h1></div>
   </el-row>
   <el-row :gutter="10" style="margin-bottom: 10px">
     <el-col :span="8">
       <el-card style="color: #409EFF">
         <div><i class="el-icon-user-solid" /> 在线用户</div>
         <div style="padding: 10px 0; text-align: center; font-weight: bold">
           5
         </div>
       </el-card>
     </el-col>
     <el-col :span="8" style="margin-bottom: 10px">
       <el-card style="color:#67C23A">
         <div><i class="el-icon-user-solid" /> 用户总数</div>
         <div style="padding: 10px 0; text-align: center; font-weight: bold">
           99
         </div>
       </el-card>
     </el-col>
     <el-col :span="8">
       <el-card style="color: #E6A23C">
         <div><i class="el-icon-s-shop" /> 门店总数</div>
         <div style="padding: 10px 0; text-align: center; font-weight: bold">
           233
         </div>
       </el-card>
     </el-col>
   </el-row>
   <el-row style="height: 450px;">
     <el-col :span="6"><div style="width: 200px; "><img src="../assets/meal/001.jpg" style="width: 300px;border-radius: 20px" ></div></el-col>
     <el-col :span="6"><div style="width: 200px; "><img src="../assets/meal/005.jpg" style="width: 300px;border-radius: 20px" ></div></el-col>
     <el-col :span="6"><div style="width: 200px; "><img src="../assets/meal/003.jpg" style="width: 300px;border-radius: 20px" ></div></el-col>
     <el-col :span="6"><div style="width: 200px;"><img src="../assets/头图.jpg" style="width: 300px" ></div></el-col>
   </el-row>
 </div>
</template>

<script>
export default {
  data() {
    return {

    }
}
}
</script>

