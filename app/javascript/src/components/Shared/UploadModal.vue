<template>
  <div class="modal" v-if="visible">
    <div class="modal-content">
      <div class="modal-header">
        <form class="form" @submit.prevent="getVideoInfo">
          <h2>Enter Youtube URL</h2>

          <div class="flex">
            <input class="input" v-model="url" required />
            <button class="button" :disabled="!url">Preview</button>
          </div>
        </form>
      </div>

      <div class="modal-body" v-if="data">
        <div class="form">
          <div class="movie-item column">
            <div class="movie-thumbnail">
              <img :src="data.thumbnail" />
            </div>
            <div class="movie-detail">
              <div class="movie-title">{{ data.title }}</div>
              <div class="movie-subtitle">
                <div class="movie-date">{{ data.published_at | dateFilter }}</div>
              </div>
              <div class="movie-description">{{ data.description }}</div>
            </div>
          </div>
        </div>
      </div>

      <div class="modal-footer" v-if="sharable">
        <form class="form" @submit.prevent="uploadVideo">
          <button class="button">Share</button>
        </form>
      </div>
    </div>
    <div class="modal-shadow" @click="hide"></div>
  </div>
</template>

<script>
import { RepositoryFactory } from "@/repositories/RepositoryFactory";
const Movies = new RepositoryFactory.get("movies");

export default {
  data() {
    return {
      visible: false,
      url: "",
      data: null,
      sharable: false,
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
    show() {
      this.visible = true;
    },
    hide() {
      this.visible = false;
      this.url = "";
      this.data = null;
      this.sharable = false;
    },
    async getVideoInfo() {
      try {
        const response = await Movies.getYoutubeInfo(this.url);
        this.data = response.data;
        this.sharable = true;
      } catch (e) {
        this.data = null;
        this.sharable = false;
      }
    },
    async uploadVideo() {
      try {
        await Movies.upload(this.data);
        window.location.reload();
      } catch (e) {
        console.log(e);
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.movie-item {
  margin: 0;
}

.movie-thumbnail {
  width: 100%;
  padding-top: 75%;
  background: black;

  &::before {
    display: none !important;
  }
}

.movie-detail {
  padding: 15px 0;
  width: 100%;
  height: auto;
}

.input {
  margin: 0;
}
</style>