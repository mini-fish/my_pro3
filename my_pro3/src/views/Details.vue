<template>
  <div class="details">
    <!-- 顶部导航开始 -->
    <header class="header">
      <mt-header title="商品详情">
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
    <!-- 详情内容开始 -->
    <div class="details_info">
      <div class="info_img">
        <div>
          <img :src="flower_details_info.info_src" />
        </div>
        <div>1/1</div>
      </div>
      <div class="info_title">{{flower_details_info.info_title}}</div>
      <div class="info_price">
        <span>售价：￥{{flower_details_info.info_price_one}}</span>
        <span>
          原价：
          <s>￥{{flower_details_info.info_price_two}}</s>
        </span>
      </div>
      <div class="info_sales">
        <span>销量：</span>
        <span>{{flower_details_info.info_sales}}</span>
      </div>
      <div class="info_meterrials">
        <span>材料：</span>
        <span>{{flower_details_info.info_meterrials}}</span>
      </div>
      <div class="hr"></div>
      <div class="info_details">{{flower_details_info.info_details}}</div>
      <div class="info_details_common">
        <div class="info_number">
          <div>【商品编号】：</div>
          <div>{{flower_details_info.info_number}}</div>
        </div>
        <div class="info_meterrials_two">
          <div>【鲜花材料】：</div>
          <div>{{flower_details_info.info_meterrials}}</div>
        </div>
        <div class="info_pack">
          <div>【鲜花包装】：</div>
          <div>{{flower_details_info.info_pack}}</div>
        </div>
        <div class="info_usage">
          <div>【鲜花用途】：</div>
          <div>{{flower_details_info.info_usage}}</div>
        </div>
        <div class="info_flowers">
          <div>【鲜花花语】：</div>
          <div>{{flower_details_info.info_flowers}}</div>
        </div>
        <div class="info_explanation">
          <div>【配送说明】：</div>
          <div>{{flower_details_info.info_explanation}}</div>
        </div>
      </div>
      <div class="hr"></div>
      <div class="info_manner">
        <div>【配送方式】：</div>
        <div>{{flower_details_info.info_manner}}</div>
      </div>
      <div class="info_represent">{{flower_details_info.info_represent}}</div>
      <div class="hr" style="margin-bottom:60px;margin-top:25px;float:left;"></div>
    </div>
    <!-- 底部选项卡开始 -->
    <div>
      <mt-tabbar class="foot" fixed>
        <div>
          <router-link to="/cart">
            <mt-button @click="setVuexData()">立即购买</mt-button>
          </router-link>
          <router-link to="/cart">
            <mt-button @click="setVuexData()">加入购物车</mt-button>
          </router-link>
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

/* 详情内容开始 */
.info_img {
  position: relative;
}
.info_img img {
  width: 320px;
  height: 292px;
  display: block;
  margin: 0 auto;
}
.info_img div:nth-child(2) {
  height: 30px;
  width: 100%;
  background-color: #fff;
  margin-top: -30px;
  opacity: 0.7;
  position: absolute;
  text-align: center;
  line-height: 30px;
}
.info_title {
  font-size: 14px;
  height: 40px;
  color: #333;
  text-align: left;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  line-height: 40px;
  padding-left: 10px;
}
.info_price {
  font-size: 14px;
  height: 40px;
  text-align: left;
  border-bottom: 1px solid #ccc;
  line-height: 40px;
  padding-left: 10px;
}
.info_price span:nth-child(1) {
  color: #e42b2b;
  margin-right: 20px;
}
.info_price span:nth-child(2) {
  color: #ccc;
}
.info_sales {
  text-align: left;
  padding-left: 10px;
  height: 40px;
  line-height: 40px;
  border-bottom: 1px solid #ccc;
}
.info_sales span:nth-child(1) {
  font-size: 14px;
  color: #000;
}
.info_sales span:nth-child(2) {
  font-size: 12px;
  color: #666;
}
.info_meterrials {
  text-align: left;
  padding-left: 10px;
  height: 40px;
  line-height: 40px;
  border-bottom: 1px solid #ccc;
}
.info_meterrials span:nth-child(1) {
  font-size: 14px;
  color: #000;
}
.info_meterrials span:nth-child(2) {
  font-size: 12px;
  color: #666;
}
/* 分隔线 开始*/
.hr {
  height: 13px;
  background: #f1f1f5;
  border-bottom: 1px solid #e5e5e5;
  border-top: 1px solid #e5e5e5;
  width: 100%;
}
/* 分隔线 结束*/
.info_details {
  text-align: left;
  padding-left: 10px;
  height: 40px;
  line-height: 40px;
  border-bottom: 1px solid #ccc;
  font-size: 14px;
}
.info_details_common {
  font-size: 14px;
  text-align: left;
  color: #666;
  margin-bottom: 5px;
}
.info_number {
  width: 100%;
  height: 26px;
  line-height: 26px;
}
.info_number div {
  float: left;
}
.info_meterrials_two {
  width: 100%;
}
.info_meterrials_two div {
  float: left;
}
.info_meterrials_two div:nth-child(1) {
  width: 100px;
}
.info_meterrials_two div:nth-child(2) {
  width: 255px;
}
.info_pack {
  width: 100%;
  line-height: 26px;
}
.info_pack div {
  float: left;
}
.info_pack div:nth-child(1) {
  width: 100px;
}
.info_pack div:nth-child(2) {
  width: 255px;
}
.info_usage {
  width: 100%;
  line-height: 26px;
}
.info_usage div {
  float: left;
}
.info_usage div:nth-child(1) {
  width: 100px;
}
.info_usage div:nth-child(2) {
  width: 255px;
}
.info_flowers {
  width: 100%;
  line-height: 18px;
}
.info_flowers div {
  float: left;
}
.info_flowers div:nth-child(1) {
  width: 100px;
  height: 72px;
  line-height: 72px;
}
.info_flowers div:nth-child(2) {
  width: 255px;
}
.info_manner {
  width: 100%;
  line-height: 18px;
  font-size: 14px;
  color: #000;
  text-align: left;
}
.info_manner div {
  float: left;
  margin-top: 5px;
}
.info_manner div:nth-child(1) {
  width: 100px;
  line-height: 52px;
  line-height: 52px;
}
.info_manner div:nth-child(2) {
  width: 255px;
  line-height: 26px;
}
.info_represent {
  font-size: 14px;
  color: #e42b2b;
  height: 26px;
  line-height: 26px;
  float: left;
  text-align: left;
  margin-left: 5px;
}
/* 底部选项卡开始 */
.foot {
  width: 100%;
  height: 60px;
  position: fixed;
  background-color: #fff;
  border-top: 1px solid #ccc;
}
.foot div:nth-child(1) {
  margin: 0 auto;
}
.foot button {
  width: 140px;
  height: 30px;
  font-size: 14px;
  font-weight: bold;
  margin-top: 15px;
  color: #fff;
}
.foot button:nth-child(1) {
  background-color: #fba949;
  margin-right: 5px;
}
.foot button:nth-child(2) {
  background-color: #e42b2b;
  margin-left: 5px;
}
/* 底部选项卡结束 */
</style>
<script>
import {mapActions} from 'vuex';
export default {
  data() {
    return {
      flower_details_info: {}
    };
  },
  methods:{
    ...mapActions(['getData']),
    setVuexData(){
      //分发Actions
      this.getData();
      this.$router.push('/cart');
    }
  },
  mounted() {
    //1.获取地址栏中的ID
    let fid = this.$route.params.fid;
    //2.向WEB服务器发送请求
    this.axios.get("/flower_details?fid=" + fid).then(res => {
      this.flower_details_info = res.data.result;
      console.log(res.data.result);
    });
  }
};
</script>