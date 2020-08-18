<template>
  <div class="app-header">
    <div class="box-left">
      <a class="logo" href="/"></a>
    </div>
    <div class="box-right">
      <ul class="menu" v-if="loggedIn">
        <li>
          <span>
            <small>Hi</small>
            {{ username }}
          </span>
          <ul class="dropdown-menu">
            <li>
              <a href="/my_movies">My Movies</a>
            </li>
            <li>
              <a href @click="executeLogout()">Logout</a>
            </li>
          </ul>
        </li>
        <li class="upload">
          <a @click.prevent="showUploadModal()">Share Movie</a>
        </li>
      </ul>
      <ul class="menu" v-else>
        <li @click="showModal()">Login/Register</li>
      </ul>
    </div>
  </div>
</template>

<script>
import { createNamespacedHelpers } from "vuex";
const { mapActions, mapState } = createNamespacedHelpers("users");

export default {
  props: {
    user: Object,
  },
  computed: {
    ...mapState(["loggedIn", "username"]),
  },
  methods: {
    ...mapActions(["logout"]),
    async executeLogout() {
      await this.logout();
      window.location.reload();
    },
    showModal() {
      this.$root.$refs.loginModal.show();
    },
    showUploadModal() {
      this.$root.$refs.uploadModal.show();
    },
  },
};
</script>

<style>
</style>