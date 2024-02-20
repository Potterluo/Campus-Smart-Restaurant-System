<template>
<div>
    <el-row :gutter="10" style="margin-bottom: 60px">
      <el-col :span="2">
        <img src="../assets/测温.png" style="width: 100px;margin-top: 10px">
      </el-col>

        <el-col :span="4"  v-for="(item, index) in alarm" :key="item">
          <el-card style="color: #F56C6C">
            <div><i class="el-icon-money" /> 异常体温警报</div>
            <div style="padding: 10px 0; text-align: center; font-weight: bold">
              {{item.location}} {{item.temperature}} ℃
            </div>
            <div style=" text-align: center" :formatter="formatterdate">
              <div>{{item.time | format('MM月DD日 HH时mm分') }}</div>
<!--         时间日期格式化方法     https://www.csdn.net/tags/OtDagg2sNzE3MDktYmxvZwO0O0OO0O0O.html-->
            </div>
          </el-card>
        </el-col>

  </el-row>
    <el-row>
      <div style="margin-left: 10px">
        <el-table
            :data="tableData"
            style="width: 100%"
            :row-class-name="tableRowClassName">
          <el-table-column prop="id" label="序号" width="100"></el-table-column>
          <el-table-column prop="time" label="测温时间" width="300" :formatter="formatterdate"></el-table-column>
          <el-table-column prop="location" label="测温位置" width="300"></el-table-column>
          <el-table-column prop="temperature" label="测温数值" width="300"></el-table-column>
          <el-table-column prop="status" label="备注" ></el-table-column>
        </el-table>
        <div class="block" style="text-align: right;margin-top: 5px;margin-right: 80px">
          <el-pagination
              @current-change="handleCurrentChange"
              :current-page.sync="currentPage"
              :page-size="pageSize"
              layout="prev, pager, next, jumper"
              :total="total">
          </el-pagination>
        </div>
      </div>

    </el-row>
</div>
</template>

<script>
import request from "@/utils/request";
export default {
  name: "BodyTemp",
  data() {
    return {
      currentPage: 1,
      total: 0,
      date:'',
      pageNum: 1,
      pageSize: 10,
      tableData: [],
      sat:'',
      alarm:[

      ],
    }
  },
  methods: {
    tableRowClassName(row) {
      /*console.log(row)*/
      for(let [key, value] of Object.entries(row)){
        this.sat=value.status
        /*this.alarm=[]*/
        if(value.status==='异常'){
          this.sat=''
          if(this.alarm.length<5){
            var arr = []
            arr.push(value)
            for (var i = 0; i < arr.length; i++) {
              if (this.alarm.indexOf(arr[i]) === -1) {
                this.alarm.push(arr[i])
              }
            }
          }
          return 'danger-row'
        }else if(value.status==='正常'){
          this.sat=''
          return 'success-row'
        }else {
          this.sat=''
          return 'info-row'
        }
      }

    },
    load() {
      request.get("/temp/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
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
  filters: {
    /**
     *格式化时间文本
     * @param {Date} time 时间
     * @param {String} format 文本格式
     *  Y 表示年份
     *  M 表示月份
     *  D 表示某日
     *  h 表示小时
     *  m 表示分
     *  s 表示秒
     *  w 表示星期几
     */
    format(time, format = 'YYYY-MM-DD HH:mm:ss') {
      let date = new Date(time)
      let o = {
        'M+': date.getMonth() + 1,
        'D+': date.getDate(),
        'H+': date.getHours(),
        'm+': date.getMinutes(),
        's+': date.getSeconds(),
        'w': '日一二三四五六'.charAt(date.getDay())
      };

      format = format.replace(/Y{4}/, date.getFullYear()).replace(/Y{2}/, date.getFullYear().toString().substring(2));

      let k, reg
      for (k in o) {
        reg = new RegExp(k);
        /* eslint no-use-before-define:0 */
        format = format.replace(reg, match);
      }
      function match(m) {
        return m.length === 1 ? o[k] : ('00' + o[k]).substr(('' + o[k]).length);
      }

      return format;
    }
  },
  created() {
    this.load()
  }
}
</script>

<style>
.el-table .info-row {
  /*background: #cccdc8;*/
}

.el-table .success-row {
  background: #f0f9eb;
}

.el-table .danger-row {
  background: #fff0f0;
}

</style>

