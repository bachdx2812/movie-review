<template>
  <form class="form" @submit.prevent="executeRegister">
    <h2>Register</h2>
    <div class="error-message" v-if="error">{{ error }}</div>
    <input class="input" v-model="username" placeholder="Username" required />
    <input class="input" v-model="password" type="password" placeholder="Password" required />
    <input
      class="input"
      v-model="confirm_password"
      type="password"
      ref="confirm_password"
      placeholder="Confirmation Password"
      required
      @input="validatePassword"
    />
    <button class="button">Create your account</button>
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
      confirm_password: "",
      error: "",
    };
  },
  methods: {
    ...mapActions(["register"]),
    validatePassword() {
      if (this.password != this.confirm_password) {
        this.$refs.confirm_password.setCustomValidity(
          "Confirmation password doesn't match!"
        );
      } else {
        this.$refs.confirm_password.setCustomValidity("");
      }
    },
    async executeRegister() {
      try {
        this.error = "";
        await this.register({
          username: this.username,
          password: this.password,
        });
        this.$root.$refs.loginModal.hide();
      } catch(e) {
        this.error = "Register failed!";
      }
    },
  },
};
</script>

<style>
</style>