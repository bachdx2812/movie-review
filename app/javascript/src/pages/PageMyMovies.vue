<template>
  <div class="app-body">
    <div class="container">
      <h1>My Movies</h1>
    </div>
    <div
      v-infinite-scroll="loadMore"
      infinite-scroll-disabled="loading"
      infinite-scroll-distance="10"
    >
      <MoviesList :movies="movies" readonly />
    </div>
  </div>
</template>

<script>
import { RepositoryFactory } from "@/repositories/RepositoryFactory";
const Movies = new RepositoryFactory.get("movies");
import MoviesList from "@/components/Movie/MoviesList";

export default {
  components: {
    MoviesList,
  },
  data() {
    return {
      loading: false,
      page: 0,
      movies: [],
      stopScroll: false,
    };
  },
  methods: {
    async search() {
      if (this.stopScroll) return;
      const result = await Movies.getMyMovies({ page: this.page });
      this.movies = [...this.movies, ...result.data.movies];
      if (
        !result.data.meta?.per_page ||
        result.data.movies.length < result.data.meta.per_page
      ) {
        this.stopScroll = true;
      }
    },
    loadMore() {
      this.page++;
      this.search();
    },
  },
};
</script>

<style>
</style>