<template>
  <div style="width: 100%;">
    <div style="">
      <el-input style="width: 200px" prefix-icon="el-icon-search" placeholder="请输入商铺名称" size="mini" v-model="address"></el-input>
      &nbsp;
      <el-button  class="ml-5" type="primary" size="mini" @click="load" >搜索</el-button>
    </div>
    <div>
      <el-table
          ref="filterTable"
          :data="tableData"
          style="width: 100%"
          stripe>
        <el-table-column prop="id" label="交易编号" width="180"></el-table-column>
        <el-table-column prop="time" label="交易时间"  width="180" :formatter="formatterdate"></el-table-column>
        <el-table-column prop="address" label="交易地点" width="150"></el-table-column>
        <el-table-column prop="money" label="交易金额" width="150"></el-table-column>
        <el-table-column prop="student" label="消费人员" width="150"></el-table-column>
        <el-table-column prop="diets" label="选购餐品" width="150"></el-table-column>
        <el-table-column
            prop="remakes"
            label="备注">
          <template slot-scope="scope">
            <el-tag
                :type="scope.row.remakes === '正常' ? 'success' : 'danger'"
                disable-transitions>{{scope.row.remakes}}</el-tag>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="block" style="text-align: right;margin-top: 5px">
      <el-pagination
          @current-change="handleCurrentChange"
          :current-page.sync="currentPage"
          :page-size="pageSize"
          layout="prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "AllOrders",
  data() {
    return {
      currentPage:1,
      tableData: [],
      total:0,
      pageNum:1,
      pageSize:15,
      address:''
    }
  },
  methods:{
    load(){
      console.log("Hello")
      request.get("/order/page",{
        params:{
          pageNum:this.pageNum,
          pageSize:this.pageSize,
          address:this.address,
        }
      }).then(res => {
        console.log(res)
        this.tableData = res.records
        this.total = res.total
      })
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum=pageNum
      this.load()
    },
    formatterdate(row, column){
      let data = row[column.property]
      if(data == null) {
        return null
      }
      let date = new Date(data);
      var o = {
        "M+" : date.getMonth()+1,                 //月份
        "d+" : date.getDate(),                    //日
        "h+" : date.getHours(),                   //小时
        "m+" : date.getMinutes(),                 //分
        "s+" : date.getSeconds(),                 //秒
        "q+" : Math.floor((date.getMonth()+3)/3), //季度
        "S"  : date.getMilliseconds()             //毫秒
      };
      var fmt = "yyyy-MM-dd hh:mm:ss";
      if(/(y+)/.test(fmt)) {
        fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));
      }
      for(var k in o) {
        if(new RegExp("("+ k +")").test(fmt)){
          fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        }
      }
      return fmt ;

    }

  },
  created(){
    this.load()
    this.timer = setInterval(() => {
      this.load(); //你的方法
    }, 2000);
  },
  beforeDestroy() {
    clearInterval(this.timer);
  },
}
</script>

<style scoped>
.el-table .warning-row {
  background: oldlace;
}

.el-table .success-row {
  background: #f0f9eb;
}
</style>