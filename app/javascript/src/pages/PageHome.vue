<template>
  <div class="app-body">
    <div
      v-infinite-scroll="loadMore"
      infinite-scroll-disabled="loading"
      infinite-scroll-distance="10"
    >
      <ComicList :comics="comics" />
    </div>
    <transition name="fade1s">
      <div class="loading" v-if="loading"></div>
    </transition>
  </div>
</template>

<script>
import { RepositoryFactory } from "@/repositories/RepositoryFactory";
const Comics = new RepositoryFactory.get("comics");

import ComicList from "@/components/Comic/ComicList";

export default {
  components: {
    ComicList,
  },
  data() {
    return {
      loading: false,
      comics: [],
      page: 0,
      stop: false,
    };
  },
  methods: {
    async search() {
      try {
        this.loading = true;
        const response = await Comics.search({ page: this.page });
        this.comics = [...this.comics, ...response.data.comics];
        if (response.data.comics.length < 10) {
          this.stop = true;
        }
      } catch {
        this.stop = true;
      } finally {
        this.loading = false;
      }
    },
    loadMore() {
      if (this.stop) return;
      this.page++;
      this.search();
    },
  },
};
</script>

<style>
</style>