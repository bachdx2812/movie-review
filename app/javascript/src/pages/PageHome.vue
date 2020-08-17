<template>
  <div>
    <h1>Movies List</h1>
    <div
      v-infinite-scroll="loadMore"
      infinite-scroll-disabled="loading"
      infinite-scroll-distance="10"
    >
      <MoviesList :movies="movies" />
    </div>
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
      loading: false,
    };
  },
  computed: {
    ...mapState(["movies"]),
  },
  methods: {
    ...mapActions(["search", "increaseMetaPage"]),
    loadMore() {
      this.increaseMetaPage();
      this.search();
    },
  },
};
</script>

<style>
</style>