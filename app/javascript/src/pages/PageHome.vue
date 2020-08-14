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
import { RepositoryFactory } from "@/repositories/RepositoryFactory";
const moviesRepo = RepositoryFactory.get("movies");

import MoviesList from "@/components/Movie/MoviesList";

export default {
  components: {
    MoviesList,
  },
  data() {
    return {
      movies: [],
      loading: false,
      meta: {
        page: 0,
      },
    };
  },
  methods: {
    async fetchListMovies() {
      const result = await moviesRepo.search({
        page: this.meta.page,
      });

      this.movies = [...this.movies, ...result.data.movies];
      this.meta = result.data.meta;
    },
    loadMore() {
      this.meta.page += 1;
      this.fetchListMovies();
    },
  },
};
</script>

<style>
</style>