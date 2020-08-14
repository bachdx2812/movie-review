<template>
  <div>{{ movies }}</div>
</template>

<script>
export default {
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