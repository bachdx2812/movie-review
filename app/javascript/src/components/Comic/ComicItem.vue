<template>
  <li class="comic-item">
    <div class="inner" @click="open">
      <div class="thumbnail">
        <img :src="comic.thumbnail.url" v-centered-image />
        <div class="status" :class="status">
          {{comic.volumes_collected}}/{{comic.volumes_total}}
          <template v-if="comic.ongoing">+</template>
        </div>
      </div>
      <div class="detail">
        <div class="publisher">
          <img :src="comic.publisher.logo" />
          <span>{{year}}</span>
        </div>
        <div class="name">
          <div class="title">{{comic.copyright_title}}</div>
          <div class="author">{{comic.author}}</div>
        </div>
      </div>
    </div>
  </li>
</template>

<script>
export default {
  props: {
    comic: Object,
  },
  computed: {
    status: function () {
      if (this.comic.finished) return "green";
      if (this.comic.volumes_collected == 0) return "red";
      if (this.comic.ongoing) return "yellow";
      return "orange";
    },
    year: function () {
      if (!this.comic.year_end) {
        return this.comic.year_start + "-";
      }

      if (this.comic.year_start == this.comic.year_end) {
        return this.comic.year_start;
      }

      return this.comic.year_start + "-" + this.comic.year_end;
    },
  },
  methods: {
    open: function () {
      if (this.$root.$refs.header.signedIn) {
        this.$root.$refs.uploadModal.show(this.comic);
      } else {
        this.$root.$refs.loginModal.show();
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.comic-item {
  width: 187.5px;
  overflow: hidden;
  padding: 7px;
  font-size: 12px;

  .inner {
    display: flex;
    flex-direction: column;
    background: white;

    .thumbnail {
      position: relative;
      width: 100%;
      padding-top: 150%;
      overflow: hidden;

      > img {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 100%;

        &.landscape {
          width: auto;
          height: 100%;
        }
      }

      .status {
        background: #f44336;
        position: absolute;
        top: 5px;
        right: 5px;
        border-radius: 5px;
        padding: 5px;
        color: white;

        &.green {
          background: #8bc34a;
        }

        &.yellow {
          background: #ffc107;
        }

        &.orange {
          background: #ff9800;
        }
      }
    }

    .detail {
      display: flex;
      padding: 10px;
      flex-flow: column;

      .publisher {
        display: flex;
        align-items: center;
        font-size: 12px;
        line-height: 15px;
        color: black;
        margin-right: 7px;
        margin-bottom: 5px;

        > img {
          width: 15px;
          margin-right: 5px;
        }

        span {
          white-space: nowrap;
        }
      }

      .name {
        .title {
          font-size: 14px;
          font-weight: bold;
        }
      }
    }
  }
}
</style>