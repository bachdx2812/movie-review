<template>
  <div class="app-body">
    <div class="container">
      <div class="sorts">
        <label class="radio">
          <input type="radio" v-model="orderby" value="created_at" @change="sort" />
          <span>Newest</span>
        </label>
        <label class="radio">
          <input type="radio" v-model="orderby" value="like_count" @change="sort" />
          <span>Most liked</span>
        </label>
        <label class="radio">
          <input type="radio" v-model="orderby" value="dislike_count" @change="sort" />
          <span>Most disliked</span>
        </label>
      </div>
    </div>
    <div
      v-infinite-scroll="loadMore"
      infinite-scroll-disabled="loading"
      infinite-scroll-distance="10"
    >
      <MoviesList :movies="movies" />
    </div>
    <transition name="fade1s">
      <div class="loading" v-if="loading"></div>
    </transition>
  </div>
</template>

<script>
import { createNamespacedHelpers } from "vuex";
const { mapState, mapActions } = createNamespacedHelpers("movies");

import MoviesList from "@/components/Movie/MoviesList";

export default {
  components: {
    MoviesList,
  },
  data() {
    return {
      orderby: "created_at",
    };
  },
  computed: {
    ...mapState(["movies", "meta", "loading"]),
  },
  methods: {
    ...mapActions(["search", "increaseMetaPage", "sortBy"]),
    loadMore() {
      if (!this.meta || this.meta.page >= this.meta.pages) {
        return;
      }
      this.increaseMetaPage();
      this.search();
    },
    sort() {
      this.sortBy(this.orderby);
    },
  },
};
</script>

<style>
</style>