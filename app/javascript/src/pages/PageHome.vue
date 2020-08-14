<template>
  <div>
    <h1>Movies List</h1>
    <MoviesList :movies="movies" />
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
    };
  },
  created() {
    this.fetchListMovies();
  },
  methods: {
    async fetchListMovies() {
      const result = await moviesRepo.search();

      this.movies = result.data.movies;
    },
  },
};
</script>

<style>
</style>