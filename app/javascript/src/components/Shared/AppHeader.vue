<template>
  <div class="app-header">
    <a v-if="loggedIn" @click="executeLogout()">Logout</a>
    <a v-else @click="showModal()">Login</a>
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
  },
};
</script>

<style>
</style>