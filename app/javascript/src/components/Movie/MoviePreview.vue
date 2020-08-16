<template>
  <div class="movie-preview" @click.stop="$emit('close')">
    <iframe
      width="800"
      height="500"
      :src="url"
      frameborder="0"
      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
      allowfullscreen
    ></iframe>
  </div>
</template>

<script>
export default {
  props: {
    url: String,
  },
};
</script>

<style>
</style>