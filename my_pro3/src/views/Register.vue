<template>
    <div class="register">
            <!-- 顶部导航开始 -->
    <header class="header">
      <mt-header title="注册">
        <span slot="left" class="img1">
          <router-link to>
            <img @click="$router.back(-1)" src="../assets/details/left.png" />
          </router-link>
        </span>
        <span slot="right" class="img2">
          <router-link to="/">
            <img src="../assets/details/home.png" />
          </router-link>
        </span>
      </mt-header>
    </header>
    <!-- 顶部导航结束 -->

<!-- 表单区域开始 -->
    <div>
        <mt-field 
          type="text" 
          placeholder="请输入用户名"
          :attr="{maxlength:15}"
          v-model="uname"
          :state="unameState"
          @blur.native.capture="checkUname"
          class="forms_one">
          
        </mt-field>   

        <mt-field 
          type="password" 
          placeholder="请输入密码"
          :attr="{maxlength:20}"
          v-model="upwd"
          :state="upwdState"
          @blur.native.capture="checkUpwd"
          class="forms_two">
        </mt-field>   

        <mt-field 
          type="password" 
          placeholder="请再次输入密码"
          :attr="{maxlength:20}"
          v-model="conupwd"
          :state="conupwdState"
          @blur.native.capture="checkConupwd"
          class="forms_three">
        </mt-field>   

        <mt-button class="btn" type="primary" size="large" @click="handle">免费注册</mt-button>    
    </div>
    <!-- 表单区域结束 -->
    
    <!-- 底部选项卡开始 -->
    <div>
      <mt-tabbar class="foot" fixed>
        <div>
          <mt-button type="danger">在线咨询</mt-button>
          <span>|</span>
          <mt-button type="primary">微信客服</mt-button>
        </div>
      </mt-tabbar>
    </div>
    <!-- 底部选项卡结束 -->
    </div>
</template>
<style scoped>
/* 顶部导航栏开始 */
header {
  background-color: #e42b2b;
}
/* 表单区开始 */
.forms_one {
  width: 94%;
  margin: 0 auto;
  height: 40px;
  border-radius: 5px;
  margin-top: 15px;
  border: 1px solid #ccc;
}
.forms_two,.forms_three {
  width: 94%;
  margin: 0 auto;
  height: 40px;
  border-radius: 5px;
  margin-top: 10px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
}
.btn{
  width: 94%;
  height: 40px;
  margin: 0 auto;
  border-radius: 5px;
  margin-top: 10px;
  background-color: #e42b2b;
}
/* 表单区结束 */

/* 底部选项卡开始 */
.foot {
  width: 100%;
  height: 60px;
  position: fixed;
  background-color: rgba(0, 0, 0, 0.8);
  
}
.foot div:nth-child(1){
  margin: 0 auto;
}
.foot button {
  width: 110px;
  height: 30px;
  font-size: 14px;
  font-weight: normal;
  margin-top: 15px;
}
.foot span {
  color: #fff;
  margin: 0 10px;
  height: 60px;
  line-height: 60px;
}
/* 底部选项卡结束 */
</style>
<script>
export default {
  data(){
    return {
      // 用户名
      uname:'',
      // 密码
      upwd:'',
      // 确认密码
      conupwd:'',
      // 用户名的状态
      unameState:'',
      // 密码的状态
      upwdState:'',
      // 确认密码的状态
      conupwdState:''
    }
  },
  methods:{
    //校验用户名
    checkUname(){  
      let unameRegExp = /^[0-9a-zA-Z_]{6,20}$/;
      if(unameRegExp.test(this.uname)){
        this.unameState = 'success';
        return true;
      } else {
        this.unameState = 'error';
        this.$toast({
          message:"用户名为必填项",
          position:"top",
          duration:"2000"
        });
        return false;
      }
    },
    //校验密码
    checkUpwd(){
      //密码的正则表达式
      let upwdRegExp = /^[0-9A-Za-z]{8,20}$/;
      if(upwdRegExp.test(this.upwd)){
        return true;
      } else {
        this.$toast({
          message:"密码必须为字母、数字的组合体",
          position:"top",
          duration:"2000"
        });
        return false;
      }
    },
    //校验确认密码
    checkConupwd(){
      if(this.upwd != this.conupwd){
        this.$toast({
          message:"两次密码不一致",
          position:"top",
          duration:"2000"
        });
        return false;
      } else {
        return true;
      }
    },
    handle(){
      if(this.checkUname() && this.checkUpwd() && this.checkConupwd()){
        //该将获取到的信息提交到WEB服务器
        this.axios.post('/reg','uname=' + this.uname + '&upwd=' + this.upwd).then(res=>{
            //用户注册成功
            if(res.data.code == 1){
                this.$router.push('/login');
            } else{
                this.$messagebox('注册提示','用户名已经占用');
            }
        });
      }
    }
  }
}
</script>