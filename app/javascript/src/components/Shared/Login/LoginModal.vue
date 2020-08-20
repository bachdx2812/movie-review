<template>
  <div class="modal" v-if="visible">
    <div class="modal-content">
      <div class="modal-close" @click="hide">x</div>
      <div class="modal-header">
        <div class="modal-header-tab" :class="{ active: login }" @click="login = true">Login</div>
        <div class="modal-header-tab" :class="{ active: !login }" @click="login = false">Register</div>
      </div>
      <div class="modal-body">
        <LoginTab v-if="login"></LoginTab>
        <RegisterTab v-else></RegisterTab>
      </div>
    </div>
    <div class="modal-shadow" @click="visible = false"></div>
  </div>
</template>

<script>
import LoginTab from "./LoginTab";
import RegisterTab from "./RegisterTab";

export default {
  components: {
    LoginTab,
    RegisterTab,
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
    }
  }
};
</script>

<style>
</style>