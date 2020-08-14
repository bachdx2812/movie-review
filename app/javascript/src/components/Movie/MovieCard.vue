<template>
  <div>
    <img :src="movie.thumbnail" />
    <span>{{ movie.title }}</span>
    <span>{{ movie.description }}</span>
    <span>{{ movie.like_count }}</span>
    <span>{{ movie.dislike_count }}</span>
  </div>
</template>

<script>
export default {
  props: {
    movie: {
      type: Object,
      required: true,
    },
  },
};
</script>

<style>
</style>