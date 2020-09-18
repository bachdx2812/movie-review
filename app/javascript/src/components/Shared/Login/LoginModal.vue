<template>
  <div class="modal" v-if="visible">
    <div class="modal-content">
      <div class="modal-close" @click="hide">x</div>
      <div class="modal-body">
        <LoginTab v-if="login"></LoginTab>
      </div>
    </div>
    <div class="modal-shadow" @click="visible = false"></div>
  </div>
</template>

<script>
import LoginTab from "./LoginTab";

export default {
  components: {
    LoginTab,
  },
  data() {
    return {
      login: true,
      visible: false,
    };
  },
  methods: {
    show() {
      this.visible = true;
      this.login = true;
      document.body.style.overflow = "hidden";
    },
    hide() {
      this.visible = false;
      document.body.style.overflow = "auto";
    },
  },
};
</script>

<style>
</style>