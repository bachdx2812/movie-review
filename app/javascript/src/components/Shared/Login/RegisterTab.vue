<template>
  <form class="form" @submit.prevent="register">
    <h2>Register</h2>
    <input class="input" v-model="username" placeholder="Username" required />
    <span class="error-message" v-if="error.username">{{ error.username[0] }}</span>
    <input class="input" v-model="password" type="password" placeholder="Password" required />
    <span class="error-message" v-if="error.password">{{ error.password[0] }}</span>
    <input
      class="input"
      v-model="password_confirmation"
      ref="password_confirmation"
      type="password"
      placeholder="Confirmation Password"
      @input="validatePassword"
      required
    />
    <span
      class="error-message"
      v-if="error.password_confirmation"
    >{{ error.password_confirmation[0] }}</span>

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
      password_confirmation: "",
      error: {},
    };
  },
  methods: {
    validatePassword() {
      if (this.password != this.password_confirmation) {
        this.$refs.password_confirmation.setCustomValidity(
          "Confirmation password doesn't match!"
        );
      } else {
        this.$refs.password_confirmation.setCustomValidity("");
      }
    },
    async register() {
      try {
        this.error = "";
        await Users.register({
          username: this.username,
          password: this.password,
          password_confirmation: this.password_confirmation,
        });
        window.location.reload();
      } catch (e) {
        this.error = e.response.data;
      }
    },
  },
};
</script>

<style>
</style>