<template>
  <div class="app-header">
    <div class="box-left">
      <a class="logo" href="/"></a>
    </div>
    <div class="box-right">
      <ul class="menu" v-if="signedIn">
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
              <a href="/users/sign_out" data-method="delete">Logout</a>
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
export default {
  props: {
    signedIn: Boolean,
    username: String,
  },
  methods: {
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