require("@rails/ujs").start();
require("@rails/activestorage").start();
require("channels");

import Vue from "vue/dist/vue.esm";
import "../styles/application.scss";

require.context("../images", true);
require.context("../fonts", true);

import infiniteScroll from "vue-infinite-scroll";
Vue.use(infiniteScroll);

import loadingImg from "images/loading.svg";
import VueLazyload from "vue-lazyload";
Vue.use(VueLazyload, {
  preLoad: 1.3,
  loading: loadingImg,
  attempt: 1
})
Vue.use(VueLazyload);

import store from "@/store";

document.addEventListener("DOMContentLoaded", () => {
  const vue = new Vue({
    el: "#app",
    store: store,
    components: {
      PageHome: () => import("@/pages/PageHome"),
      AppHeader: () => import("@/components/Shared/AppHeader"),
      LoginModal: () => import("@/components/Shared/Login/LoginModal"),
      UploadModal: () => import("@/components/Shared/UploadModal"),
      PageMyMovies: () => import("@/pages/PageMyMovies"),
    },
  });
});
