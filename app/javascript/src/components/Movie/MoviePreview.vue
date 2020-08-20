<template>
  <div class="movie-preview">
    <span class="close" @click.stop="$emit('close')">x</span>

    <iframe
      width="800"
      height="500"
      :src="`${movie.embed_url}?version=3&autoplay=1&showinfo=0`"
      frameborder="0"
      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
      allowfullscreen
    ></iframe>

    <div class="movie-item">
      <div class="movie-detail">
        <div class="movie-title">{{ movie.title }}</div>
        <div class="movie-subtitle">
          <div class="movie-likes">
            <span class="icon like" :class="{ active: movie.rate == 'like' }">{{ movie.like_count }}</span>
            <span
              class="icon dislike"
              :class="{ active: movie.rate == 'dislike' }"
            >{{ movie.dislike_count }}</span>
          </div>
          <div class="movie-date">{{ movie.published_at | dateFilter }}</div>
        </div>
        <div class="movie-author">
          <div class="movie-author-name">
            by
            <strong>{{ movie.username }}</strong>
          </div>
        </div>
        <div class="movie-description">{{ movie.description }}</div>
      </div>
    </div>

    <div class="movie-background" @click.stop="$emit('close')"></div>
  </div>
</template>

<script>
export default {
  props: {
    movie: Object,
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
@media (max-width: 799px) {
  iframe {
    width: 600px;
    height: 400px;
    background: black;
  }
}

@media (max-width: 599px) {
  iframe {
    width: 100vw;
    height: 75vw;
    min-height: 75vw;
  }

  .movie-author {
    padding: 10px 0;
  }
}
</style>