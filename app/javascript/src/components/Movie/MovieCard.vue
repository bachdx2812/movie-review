<template>
  <li class="movie-item">
    <div class="movie-thumbnail" @click="showVideo = true">
      <img :src="movie.thumbnail" />
    </div>
    <div class="movie-detail">
      <div class="movie-title">{{ movie.title }}</div>
      <div class="movie-subtitle">
        <div class="movie-likes">
          <span
            class="icon like"
            :class="{ active: movie.rate == 'like' }"
            @click="like(movie.id)"
          >{{ movie.like_count }}</span>
          <span
            class="icon dislike"
            :class="{ active: movie.rate == 'dislike' }"
            @click="dislike(movie.id)"
          >{{ movie.dislike_count }}</span>
        </div>
        <div class="movie-date">{{ movie.published_at | dateFilter }}</div>
      </div>
      <div class="movie-author">
        <div class="movie-author-avatar"></div>
        <div class="movie-author-name">
          by
          <strong>{{ movie.username }}</strong>
        </div>
      </div>
      <div class="movie-description">{{ movie.description }}</div>
    </div>
    <MoviePreview :url="movie.youtube_url" v-if="showVideo" @close="showVideo = false"></MoviePreview>
  </li>
</template>

<script>
import MoviePreview from "./MoviePreview";

import { createNamespacedHelpers } from "vuex";
const { mapActions } = createNamespacedHelpers("movies");

export default {
  components: {
    MoviePreview,
  },
  props: {
    movie: Object,
  },
  data() {
    return {
      showVideo: false,
    };
  },
  filters: {
    dateFilter: function (value) {
      return new Date(value).toLocaleDateString("en-UK", {
        year: "numeric",
        month: "long",
        day: "numeric",
      });
    },
  },
  methods: {
    ...mapActions(["like", "dislike"]),
  },
};
</script>

<style lang="scss" scoped>
</style>