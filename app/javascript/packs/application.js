require("@rails/ujs").start();
require("@rails/activestorage").start();
require("channels");

import Vue from "vue/dist/vue.esm";
import "bootstrap/dist/css/bootstrap.min.css";
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

Vue.directive("centered-image", {
  bind: function (el, binding) {
    el.onload = function (event) {
      if (event.path?.length) {
        const img = event.path[0];
        if (img.height / img.width <= 1.5) {
          el.classList.add(binding.value || "landscape");
        } else {
          el.classList.remove(binding.value || "landscape");
        }
      }
    }
  }
})

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
