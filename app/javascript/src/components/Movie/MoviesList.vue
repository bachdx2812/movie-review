<template>
  <div>
    <MovieCard v-for="movie in movies" :key="movie.id" :movie="movie" />
  </div>
</template>

<script>
import MovieCard from "@/components/Movie/MovieCard";

export default {
  components: {
    MovieCard,
  },
  props: {
    movies: {
      type: Array,
      required: true,
      default: () => [],
    },
  },
};
</script>

<style>
</style>