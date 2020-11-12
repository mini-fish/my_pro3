import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios';
import qs from 'qs';
import router from '../router';
Vue.use(Vuex)

export default new Vuex.Store({
  //物品
  state: {
    products: [],
    //标识用户是否已经登录
    isLogined:localStorage.getItem('isLogined') ? localStorage.getItem('isLogined') : 0,
    uname:localStorage.getItem('uname') ? localStorage.getItem('uname') : ''
  },
  //搬运工
  mutations: {
    //---------添加商品------
    // addProduct(state, payload) {
    //   state.products.push(payload);
    // },

    //---------登录------
    logined(state, payload) {
      state.isLogined = 1;
      // state.uname = payload.uname;
      // localStorage.setItem('uname', payload.uname);
    },
    //---------注销------
    logout(state) {
      state.isLogined = 0;
      // state.uname = '';
      // localStorage.removeItem('isLogined');
    }
  },
  //拉货的汽车
  actions: {
    // -------购物车---------
    getData(aaa) {
      //1.获取地址栏中的ID
      let fid = this.$route.params.fid;
      //2.向WEB服务器发送请求
      axios.get("/flower_details?fid=" + fid).then(res => {
        let results = res.data.result;
        aaa.commit('addProduct', results);
      });
    },

    //--------用户登录--------
    login(context, payload) {
      //发送异步请求
      axios.post('/login', qs.stringify(payload)).then(res => {
        console.log(res.data);
        //用户登录成功
        if (res.data.code == 1) {
          //提交Mutations
          context.commit('logined', res.data);
          localStorage.setItem('isLogined', '1');
          router.push('/');
        } else {
          // this.$messagebox("登录提示", "用户名或密码错误");
          window.alert('用户登录失败');
        }
      });
    }
  },
  modules: {
  }
})
