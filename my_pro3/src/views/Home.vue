<template>
  <div class="home">
    <!-- 顶部导航开始 -->
    <header>
      <mt-header>
        <span slot="left" class="img1">
          <router-link to="/">
            <img src="../assets/index/logo.png" />
          </router-link>
        </span>
        <span slot="right" class="img2">
          <router-link to="/">
            <img src="../assets/index/search_list.png" />
          </router-link>
        </span>
        <span slot="right" class="img2">
          <router-link to="/">
            <img src="../assets/index/cart.png" />
          </router-link>
        </span>
        <span slot="right" class="img2" v-if="this.$store.state.isLogined == 0">
          <router-link to="/login">
            <img src="../assets/index/me.png" />
          </router-link>
        </span>
        <span slot="right" class="shortcut" v-else>
          <!-- 欢迎:{{this.$store.state.uname}}, -->
          <mt-button type="primary" @click="logout">注销</mt-button>
        </span>
      </mt-header>
    </header>
    <!-- 顶部导航结束 -->

    <!-- 轮播图开始 -->
    <div class="swipe">
      <mt-swipe>
        <mt-swipe-item v-for="(img,i) of imgs" :key="i">
          <img :src="img.src" />
        </mt-swipe-item>
      </mt-swipe>
    </div>
    <!-- 轮播图结束 -->

    <!-- 菜单栏开始 -->
    <div class="menu_top">
      <ul>
        <li class="bg1">
          <img src="../assets/index/flower_1.png" />
          <span>鲜花</span>
        </li>
        <li class="bg2">
          <img src="../assets/index/cake_1.png" />
          <span>鲜花</span>
        </li>
        <li class="bg3">
          <img src="../assets/index/flowersong_1.png" />
          <span>鲜花</span>
        </li>
        <li class="bg4">
          <img src="../assets/index/businessFlower_1.png" />
          <span>鲜花</span>
        </li>
      </ul>
    </div>
    <div class="menu_bottom">
      <ul>
        <li class="bg5">
          <img src="../assets/index/giftsBasket_1.png" />
          <span>鲜花</span>
        </li>
        <li class="bg6">
          <img src="../assets/index/toys_1.png" />
          <span>鲜花</span>
        </li>
        <li class="bg7">
          <img src="../assets/index/gifts_1.png" />
          <span>鲜花</span>
        </li>
        <li class="bg8">
          <img src="../assets/index/Plant_1.png" />
          <span>鲜花</span>
        </li>
      </ul>
    </div>
    <!-- 菜单栏结束 -->
    <div class="hr"></div>
    <!-- 商品列表开始 -->
    <!-- 第一层鲜花开始 -->
    <h3 class="title">热卖鲜花</h3>
    <div class="level_one">
      <div v-for="(item,i) of flower_list" :key="i">
        <router-link :to="`/flower_details/${item.href}`">
          <img :src="item.src" />
          <span>{{item.title}}</span>
          <span class="text_color">￥{{item.price}}</span>
        </router-link>
      </div>
      <div>点击查看更多&gt;</div>
    </div>
    <!-- 第一层鲜花结束 -->
    <div class="hr"></div>
    <!-- 第二层蛋糕开始 -->
    <h3 class="title">生日蛋糕</h3>
    <div class="level_one">
      <div v-for="(item,i) of cake_list" :key="i">
        <img :src="item.src" />
        <span>{{item.title}}</span>
        <span class="text_color">￥{{item.price}}</span>
      </div>
      <div>点击查看更多&gt;</div>
    </div>
    <!-- 第二层蛋糕结束 -->
    <div class="hr"></div>
    <!-- 第三层礼品开始 -->
    <h3 class="title">礼品</h3>
    <div class="level_one">
      <div v-for="(item,i) of gift_list" :key="i">
        <img :src="item.src" />
        <span>{{item.title}}</span>
        <span class="text_color">￥{{item.price}}</span>
      </div>
      <div class="level_one_foot">点击查看更多&gt;</div>
    </div>
    <!-- 第三层礼品结束 -->
    <div class="hr"></div>
    <!-- 商品列表结束 -->

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
/* 顶部导航开始 */
header {
  background-color: #e42b2b;
}
.img1 img {
  height: 30px;
}
.img2 img {
  height: 24px;
  margin-left: 15px;
}
.shortcut{
  margin-left: 10px;
}
/* 顶部导航结束 */

/* 轮播图开始 */
.swipe {
  height: 175px;
  width: 100%;
  margin: 0;
  padding: 0;
}
.swipe img {
  height: 175px;
  width: 100%;
  margin: 0;
  padding: 0;
}
/* 轮播图结束 */

/* 菜单栏开始 */
.menu_top ul {
  display: flex;
  justify-content: space-around;
  height: 90px;
  margin-bottom: 10px;
}
.menu_top ul li {
  width: 46px;
  height: 46px;
  border-radius: 50%;
  display: block;
  margin-top: 20px;
}
.menu_top ul li img {
  width: 26px;
  height: 26px;
  display: block;
  margin-left: 10px;
  margin-top: 10px;
  margin-bottom: 20px;
}
.menu_top .bg1 {
  background-color: #fb8585;
}
.menu_top .bg2 {
  background-color: #d68ece;
}
.menu_top .bg3 {
  background-color: #bda9c3;
}
.menu_top .bg4 {
  background-color: #979cac;
}
.menu_bottom ul {
  display: flex;
  justify-content: space-around;
  height: 90px;
  margin-bottom: 10px;
}
.menu_bottom ul li {
  width: 46px;
  height: 46px;
  border-radius: 50%;
  display: block;
  margin-top: 10px;
}
.menu_bottom ul li img {
  width: 26px;
  height: 26px;
  display: block;
  margin-left: 10px;
  margin-top: 10px;
  margin-bottom: 20px;
}
.menu_bottom .bg5 {
  background-color: #f6b656;
}
.menu_bottom .bg6 {
  background-color: #74cbf8;
}
.menu_bottom .bg7 {
  background-color: #cebfa6;
}
.menu_bottom .bg8 {
  background-color: #a5cfd1;
}
/* 菜单栏结束 */
.hr {
  height: 13px;
  background: #f1f1f5;
  border-bottom: 1px solid #e5e5e5;
  border-top: 1px solid #e5e5e5;
  width: 100%;
  position: relative;
}

/* 商品列表开始  */
h3 {
  font-size: 18px;
  font-weight: bold;
  color: #666;
  text-align: left;
  margin: 15px 0px 10px 30px;
}
.level_one {
  width: 320px;
  height: 506px;
  margin: 0 auto;
}
.level_one a {
  text-decoration: none;
}
.level_one div {
  float: left;
  width: 147px;
  height: 220px;
  border: 1px solid #ccc;
  border-radius: 8px;
}
.level_one div:nth-child(1) {
  margin: 10px 0px;
}
.level_one div:nth-child(2) {
  margin: 10px 0px;
}
.level_one div:nth-child(1) {
  margin-right: 10px;
}
.level_one div:nth-child(3) {
  margin-right: 10px;
}
.level_one img {
  width: 138px;
  height: 152px;
}
.level_one span {
  display: block;
  width: 100%;
  height: 18px;
  overflow: hidden;
  font-size: 14px;
  color: #666;
  margin: 8px 0px;
}
.level_one .text_color {
  color: #e42b2b;
}
.level_one div:nth-child(5) {
  width: 96%;
  height: 30px;
  border-radius: 0;
  line-height: 30px;
  color: #666;
  font-size: 14px;
  /* margin: 0 auto; */
  margin-top: 10px;
}
.level_one_foot {
  margin-bottom: 60px;
}
/* 商品列表结束  */

/* 底部选项卡开始 */
.foot {
  width: 100%;
  height: 60px;
  position: fixed;
  background-color: rgba(0, 0, 0, 0.8);
}
.foot div:nth-child(1) {
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
  data() {
    return {
      imgs: [],
      flower_list: [],
      cake_list: [],
      gift_list: []
    };
  },
  methods: {
    logout() {
      this.$store.commit("logout");
    }
  },
  mounted() {
    //轮播图接口
    this.axios.get("/carousel").then(result => {
      this.imgs = result.data;
    });
    //第一层列表接口
    this.axios.get("/flower").then(result => {
      this.flower_list = result.data;
    });
    // 第二层列表接口
    this.axios.get("/cake").then(result => {
      this.cake_list = result.data;
    });
    // 第三层列表接口
    this.axios.get("/gift").then(result => {
      this.gift_list = result.data;
    });
  }
};
</script>

