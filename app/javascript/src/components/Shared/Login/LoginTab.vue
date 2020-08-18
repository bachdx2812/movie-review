<template>
  <form class="form" @submit.prevent="executeLogin">
    <h2>Sign in to continue</h2>
    <div class="error-message" v-if="error">{{ error }}</div>
    <input name="username" class="input" v-model="username" placeholder="Username" required />
    <input name="password" class="input" v-model="password" type="password" placeholder="Password" />
    <button class="button">Login</button>
  </form>
</template>

<script>
import { createNamespacedHelpers } from "vuex";
const { mapActions } = createNamespacedHelpers("users");

export default {
  data() {
    return {
      username: "",
      password: "",
      error: "",
    };
  },
  methods: {
    ...mapActions(["login"]),
    async executeLogin() {
      try {
        this.error = "";
        await this.login({ username: this.username, password: this.password });
        this.$root.$refs.loginModal.hide();
      } catch {
        this.error = "Login failed!";
      }
    },
  },
};
</script>

<style>
</style>