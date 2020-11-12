<template>
  <div>
    <!-- 顶部导航开始 -->
    <header class="header">
      <mt-header title="购物车">
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

    <!-- 购物车物品开始 -->
    <p v-for="(product,index) of products" :key="index">
      商品名称:{{products.info_title}},
      商品售价:{{products.info_price_one}}
    </p>
    <!-- 购物车物品结束 -->

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