<template>
  <div>
    <el-row :gutter="10">
      <el-col :span="4" v-for="(item, index) in goods" :key="item" >
        <el-card style="height: 240px;width: 100%" shadow="hover">
          <div>
            <div style="text-align: center">
              <img :src="item.src ? item.src : src" class="image" style=" width: 150px;height: 140px;">
            </div>
            <div style="text-align: center;color:#22a7f2;font-weight: 550">
              <p>{{item.name}}</p>
            </div>
            <div style="font-size: 10px;text-align: center">数量：{{item.num}}&nbsp;&nbsp;&nbsp;规格：{{item.size}}</div>
            <div style="text-align: center;height: 30px">
              <el-button slot="reference" type="success" size="mini" @click="InStorage(index)">入库</el-button>
              &nbsp;
              <el-button type="warning" size="mini" @click="OutStorage(index)">出库</el-button>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <el-dialog
        title="入库操作"
        :visible.sync="dialogVisible"
        width="25%"
        :modal="false">
      <span>请输入入库数量：</span>
      <el-input-number v-model="addNum" label="描述文字"></el-input-number>
      <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="AddStorage()">确 定</el-button>
  </span>
    </el-dialog>

    <el-dialog
        title="出库操作"
        :visible.sync="dialogVisible1"
        width="25%"
        :modal="false">
      <span>请输入出库数量：</span>
      <el-input-number v-model="addNum" label="描述文字"></el-input-number>
      <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible1 = false">取 消</el-button>
    <el-button type="primary" @click="DescStorage()">确 定</el-button>
  </span>
    </el-dialog>

  </div>

</template>

<script>
export default {
  name: "Stock",
  data(){
    return{
      src: require("../assets/error.jpg"),
      test: 1,
      currentDate: new Date(),
      dialogVisible: false,
      dialogVisible1: false,
      url: '../assets/error.jpg',
      addNum:0,
      address:-1,
      goods: [
        {
          name: "大米",
          num: 800,
          size:"50Kg",
          src: require('../assets/食材/大米.jpg')
        },
        {
          name: "面粉",
          num: 760,
          size:"50Kg",
          src: require('../assets/食材/面粉.jpg')
        },
        {
          name: "面条",
          num: 600,
          size:"40Kg",
          src: require('../assets/食材/面条.jpg')
        },
        {
          name: "鸡肉",
          num: 240,
          size:"20Kg",
          src: require('../assets/食材/鸡肉.jpg')
        },
        {
          name: "猪肉",
          num: 360,
          size:"30Kg",
          src: require('../assets/食材/猪肉.jpg')
        },
        {
          name: "西红柿",
          num: 90,
          size:"15Kg",
          src: require('../assets/食材/西红柿.jpg')
        },
        {
          name: "土豆",
          num: 240,
          size:"20Kg",
          src: require('../assets/食材/土豆.jpg')
        },
        {
          name: "大米",
          num: 800,
          size:"50Kg",
        },
        {
          name: "大米",
          num: 800,
          size:"50Kg",
        },
        {
          name: "大米",
          num: 800,
          size:"50Kg",
        },
        {
          name: "大米",
          num: 800,
          size:"50Kg",
        },
        {
          name: "大米",
          num: 800,
          size:"50Kg",
        },
        {
          name: "大米",
          num: 800,
          size:"50Kg",
        },
        {
          name: "大米",
          num: 800,
          size:"50Kg",
        },
        {
          name: "大米",
          num: 800,
          size:"50Kg",
        },
        {
          name: "大米",
          num: 800,
          size:"50Kg",
        },



      ]

    }
  },
  methods:{
    InStorage(index){
      this.dialogVisible=true
      this.address=index
    },
    AddStorage(){
      this.goods[this.address].num=this.goods[this.address].num+this.addNum
      this.dialogVisible=false
      this.address=-1
      if(this.addNum){
        this.$message({
          message: '入库成功',
          type: 'success'
        });
      }else{
        this.$message({
          message: '未进行操作',
          type: 'info'
        });
      }
      this.addNum=0
    },
    OutStorage(index){
      this.dialogVisible1=true
      this.address=index
    },
    DescStorage(){
      this.goods[this.address].num=this.goods[this.address].num-this.addNum
      this.dialogVisible1=false
      this.address=-1
      if(this.addNum){
        this.$message({
          message: '出库成功',
          type: 'success'
        });
      }else{
        this.$message({
          message: '未进行操作',
          type: 'info'
        });
      }
      this.addNum=0
    },

  },
  created() {

  }
}
</script>

<style scoped>
.time {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.button {
  padding: 0;
  float: right;
}

.image {
  width: 100%;
  display: block;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both
}
</style>