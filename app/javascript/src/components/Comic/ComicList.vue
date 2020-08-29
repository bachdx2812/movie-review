<template>
  <ul class="d-flex flex-wrap p-0">
    <ComicItem v-for="comic in comics" :key="comic.id" :comic="comic" />
  </ul>
</template>

<script>
import ComicItem from "@/components/Comic/ComicItem";

export default {
  components: {
    ComicItem,
  },
  props: {
    comics: {
      type: Array,
      required: true,
      default: () => [],
    },
  },
};
</script>
