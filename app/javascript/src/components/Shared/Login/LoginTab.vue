<template>
  <form class="form" @submit.prevent="login">
    <h2>Sign in to continue</h2>
    <div class="error-message" v-if="error">{{ error }}</div>
    <input class="input" v-model="username" placeholder="Username" required />
    <input class="input" v-model="password" type="password" placeholder="Password" />
    <button class="button">Login</button>
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
      error: "",
    };
  },
  methods: {
    async login() {
      try {
        this.error = "";
        await Users.login({ username: this.username, password: this.password });
        window.location.reload();
      } catch {
        this.error = "Login failed!";
      }
    },
  },
};
</script>

<style>
</style>