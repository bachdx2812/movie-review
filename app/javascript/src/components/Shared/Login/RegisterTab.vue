<template>
  <form class="form" @submit.prevent="register">
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
import { RepositoryFactory } from "@/repositories/RepositoryFactory";
const Users = new RepositoryFactory.get("users");

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
    validatePassword() {
      if (this.password != this.confirm_password) {
        this.$refs.confirm_password.setCustomValidity(
          "Confirmation password doesn't match!"
        );
      } else {
        this.$refs.confirm_password.setCustomValidity("");
      }
    },
    async register() {
      try {
        this.error = "";
        await Users.register({
          username: this.username,
          password: this.password,
        });
        window.location.reload();
      } catch(e) {
        this.error = "Register failed!";
      }
    },
  },
};
</script>

<style>
</style>