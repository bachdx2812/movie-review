<template>
  <div>
    <img :src="movie.thumbnail" />
    <span>{{ movie.title }}</span>
    <span>{{ movie.description }}</span>
    <span>{{ movie.like_count }}</span>
    <span>{{ movie.dislike_count }}</span>
    <span>
      <button @click="like">like</button>
      <button @click="dislike">dislike</button>
    </span>
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
  methods: {
    async like() {},
    async dislike() {},
  },
};
</script>

<style>
</style>