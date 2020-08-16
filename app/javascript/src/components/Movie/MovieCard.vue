<template>
  <li class="movie-item">
    <div class="movie-thumbnail" @click="showVideo = true">
      <img :src="movie.thumbnail" />
    </div>
    <div class="movie-detail">
      <div class="movie-title">{{ movie.title }}</div>
      <div class="movie-subtitle">
        <div class="movie-likes">
          <span class="icon like" :class="{ active: movie.like_type == 1 }">{{ movie.like_count }}</span>
          <span
            class="icon dislike"
            :class="{ active: movie.like_type == 2 }"
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
};
</script>

<style lang="scss" scoped>
</style>