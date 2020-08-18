require("@rails/ujs").start();
require("@rails/activestorage").start();
require("channels");

import Vue from "vue/dist/vue.esm";
import "../styles/application.scss";

import infiniteScroll from "vue-infinite-scroll";
Vue.use(infiniteScroll);

require.context("../images", true);
require.context("../fonts", true);

import store from "@/store";

document.addEventListener("DOMContentLoaded", () => {
  const vue = new Vue({
    el: "#app",
    store: store,
    components: {
      PageHome: () => import("@/pages/PageHome"),
    },
  });
});
