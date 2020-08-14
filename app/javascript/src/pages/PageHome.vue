<template>
  <div>
    <h1>Movies List</h1>
    <MoviesList />
  </div>
</template>

<script>
import { RepositoryFactory } from "@/repositories/RepositoryFactory";
const moviesRepo = RepositoryFactory.get("movies");

import MoviesList from "@/components/Movie/MoviesList";

export default {
  components: [MoviesList],
  created() {
    this.fetchListMovies();
  },
  methods: {
    async fetchListMovies() {
      await moviesRepo.search();
    },
  },
};
</script>

<style>
</style>