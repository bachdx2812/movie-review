<template>
  <li class="movie-item">
    <div class="movie-thumbnail" @click="showPreview">
      <img v-lazy="movie.thumbnail" />
    </div>
    <div class="movie-detail">
      <div class="movie-title">{{ movie.title }}</div>
      <div class="movie-subtitle">
        <div class="movie-likes">
          <span
            :id="`like_${movie.id}`"
            class="icon like"
            :class="{ active: movie.rate == 'like', readonly: readonly }"
            @click="likeMovie(movie.id)"
          >{{ movie.like_count }}</span>
          <span
           :id="`dislike_${movie.id}`"
            class="icon dislike"
            :class="{ active: movie.rate == 'dislike', readonly: readonly }"
            @click="dislikeMovie(movie.id)"
          >{{ movie.dislike_count }}</span>
        </div>
        <div class="movie-date">{{ movie.created_at | dateFilter }}</div>
      </div>
      <div class="movie-author" v-if="!readonly">
        <div class="movie-author-avatar"></div>
        <div class="movie-author-name">
          by
          <strong>{{ movie.username }}</strong>
        </div>
      </div>
      <div class="movie-description">{{ movie.description }}</div>
    </div>
    <MoviePreview :movie="movie" v-if="showVideo" @close="hidePreview" />
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
    readonly: Boolean,
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
    async likeMovie(movieId) {
      try {
        if (this.movie.rate == "like" || this.readonly) return;
        await this.like(movieId);
      } catch (e) {
        switch (e.response?.status) {
          case 401:
            this.$root.$refs.loginModal.show();
            break;
        }
      }
    },
    async dislikeMovie(movieId) {
      try {
        if (this.movie.rate == "dislike" || this.readonly) return;
        await this.dislike(movieId);
      } catch (e) {
        switch (e.response?.status) {
          case 401:
            this.$root.$refs.loginModal.show();
            break;
        }
      }
    },
    showPreview() {
      this.showVideo = true;
      document.body.style.overflow = "hidden";
    },
    hidePreview() {
      setTimeout(() => {
        this.showVideo = false;
        document.body.style.overflow = "auto";
      }, 100);
    },
  },
};
</script>

<style lang="scss" scoped>
</style>