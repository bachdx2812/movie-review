<template>
  <div>
    <img :src="movie.thumbnail" />
    <span>{{ movie.title }}</span>
    <span>{{ movie.description }}</span>
    <span>{{ movie.like_count }}</span>
    <span>{{ movie.dislike_count }}</span>
    <span>
      <button @click="like(movie.id)">like</button>
      <button @click="dislike(movie.id)">dislike</button>
    </span>
  </div>
</template>

<script>
import { createNamespacedHelpers } from "vuex";
const { mapActions } = createNamespacedHelpers("movies")

export default {
  props: {
    movie: {
      type: Object,
      required: true,
    },
  },
  methods: {
    ...mapActions([
      "like", "dislike"
    ]),
  },
};
</script>

<style>
</style>