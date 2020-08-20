<template>
  <ul class="movie-list">
    <MovieCard v-for="movie in movies" :key="movie.id" :movie="movie" :readonly="readonly" />
  </ul>
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
    readonly: {
      type: Boolean,
      required: false,
      default: false,
    },
  },
};
</script>
