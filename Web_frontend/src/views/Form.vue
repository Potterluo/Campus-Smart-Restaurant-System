<template>
  <div style="width: 100%;font-size: 26px">
    <div style="">
      <el-input style="width: 200px" prefix-icon="el-icon-search" placeholder="请输入商家" size="mini" v-model="customer"></el-input>
      <el-button  class="ml-5" type="primary" size="mini" @click="load" >搜索</el-button>
    </div>
    <div>
      <el-table
          ref="filterTable"
          :data="tableData"
          style="width: 100%"
          stripe>
        <el-table-column prop="id" label="订单编号" width="180"></el-table-column>
        <el-table-column prop="customer" label="订货商家" width="120"></el-table-column>
        <el-table-column prop="date" label="订单完成日期" sortable width="180" column-key="date" :formatter="formatterdate"></el-table-column>
        <el-table-column prop="address" label="商家位置" width="180"></el-table-column>
        <el-table-column prop="goods" label="所需货物"></el-table-column>
        <el-table-column prop="tag" label="状态" width="100"
            :filters="[{ text: '待配送', value: '待配送' }, { text: '已完成', value: '已完成' }]"
            :filter-method="filterTag"
            filter-placement="bottom-end">
          <template slot-scope="scope">
            <el-tag
                :type="scope.row.tag === '已完成' ? 'success' : 'warning'"
                disable-transitions>{{scope.row.tag}}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="80">
          <template slot-scope="scope">
            <el-button @click="completeClick(scope.row)" type="text" size="small">完成</el-button>
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
  data() {
    return {
      currentPage: 1,
      tableData: [],
      form: [],
      total: 0,
      date:'',
      pageNum: 1,
      pageSize: 15,
      customer: ''
    }
  },
  methods: {
    load() {
      request.get("/form/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          customer: this.customer,
        }
      }).then(res => {
        console.log(res)
        this.tableData = res.records
        this.total = res.total
      })
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },

    completeClick(row) {
      row.tag="已完成"
      this.form = row
      this.save()
    },
    save() {
      request.post("/form", this.form).then(res => {
        if (res) {
          this.$message.success("修改成功")
          this.dialogFormVisible = false
          console.log(this.form)
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
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
      var fmt = "yyyy-MM-dd";
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
  created() {
    this.load()
  }
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