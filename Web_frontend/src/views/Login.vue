<template>
  <div class="wrapper">
    <div
        style="margin: 150px auto; background-color: rgba(255,255,255,0.7); width: 350px; height: 360px; padding: 20px; border-radius: 15px">
      <div style="margin: 20px 0; text-align: center; font-size: 24px"><b>校园智慧餐厅</b></div>
      <el-form :model="user" :rules="rules" ref="userForm">
        <el-form-item prop="username">
          <el-input size="medium" style="margin: 10px 0" prefix-icon="el-icon-user" v-model="user.username"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input size="medium" style="margin: 10px 0" prefix-icon="el-icon-lock" show-password
                    v-model="user.password"></el-input>
        </el-form-item>
        <el-form-item >
          <div style="display: flex">
            <el-input size="medium" style="margin: 10px 0;width: 70%" prefix-icon="el-icon-key" v-model="user.validCode"></el-input>
            <ValidCode @input="createValidCode" />
          </div>

        </el-form-item>
        <el-form-item style="margin: 10px 0; text-align: right">
          <el-button type="warning" size="small" autocomplete="off" @click="$router.push('/register')">注册</el-button>
          <el-button type="primary" size="small" autocomplete="off" @click="login">登录</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import {setRoutes} from "@/router";
import ValidCode from "@/components/ValidCode";

export default {
  name: "Login",
  components: {ValidCode},
  data() {
    return {
      user: {},
      validCode:'',
      form:{},
      rules: {
        username: [
          {required: true, message: '请输入用户名', trigger: 'blur'},
          {min: 3, max: 10, message: '长度在 3 到 5 个字符', trigger: 'blur'}
        ],
        password: [
          {required: true, message: '请输入密码', trigger: 'blur'},
          {min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur'}
        ],
        validCode:[
          {required: true, message: '请输入验证码', trigger: 'blur'},
        ]
      }
    }
  },
  methods: {
    login() {
      this.$refs['userForm'].validate((valid) => {
        if (valid) {  // 表单校验合法
          if (!this.user.validCode) {
            this.$message.error("请填写验证码")
            return
          }
          if(this.user.validCode.toLowerCase() !== this.validCode.toLowerCase()) {
            console.log(this.user.validCode)
            console.log(this.validCode)
            this.$message.error("验证码错误")
            return
          }
          this.request.post("/user/login", this.user).then(res => {
            if (res.code === '200') {
              localStorage.setItem("user", JSON.stringify(res.data))  // 存储用户信息到浏览器
              localStorage.setItem("menus", JSON.stringify(res.data.menus))  // 存储用户信息到浏览器
              // 动态设置当前用户的路由
              setRoutes()
              this.$message.success("登录成功")

              if (res.data.role === 'ROLE_STUDENT') {
                this.$router.push("/front/home")
              } else {
                this.$router.push("/")
              }
            } else {
              this.$message.error(res.msg)
            }
          })
        }
      });
    },
    createValidCode(data){
      console.log(data);
      this.validCode=data;
    }
  }
}
</script>

<style>
.wrapper {
  height: 100vh;
  /*background-image: linear-gradient(to bottom right, #43CBFF, #9708CC);*/
  background-image: url("../assets/bg1.jpg");
  background-size: cover;
  overflow: hidden;
}
</style>
