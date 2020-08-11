require("@rails/ujs").start();
require("@rails/activestorage").start();
require("channels");

import Vue from "vue/dist/vue.esm";
import "../styles/application.scss";

require.context("../images", true);
require.context("../fonts", true);

document.addEventListener("DOMContentLoaded", () => {
  const vue = new Vue({
    el: "#app",
    components: {
    },
  });
});
