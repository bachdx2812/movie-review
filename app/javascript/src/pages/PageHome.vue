<template>
  <div class="app-body">
    <div
      v-infinite-scroll="loadMore"
      infinite-scroll-disabled="loading"
      infinite-scroll-distance="10"
    >
      <MoviesList :movies="movies" />
    </div>
    <transition name="fade1s">
      <div class="loading" v-if="loading"></div>
    </transition>
  </div>
</template>

<script>
import { createNamespacedHelpers } from "vuex";
const { mapState, mapActions } = createNamespacedHelpers("movies");

import MoviesList from "@/components/Movie/MoviesList";

export default {
  components: {
    MoviesList,
  },
  data() {
    return {
      // loading: false,
    };
  },
  computed: {
    ...mapState(["movies", "meta", "loading"]),
  },
  methods: {
    ...mapActions(["search", "increaseMetaPage"]),
    loadMore() {
      if (!this.meta || this.meta.page >= this.meta.pages) {
        return;
      }
      this.increaseMetaPage();
      this.search();
    },
  },
};
</script>

<style>
</style>