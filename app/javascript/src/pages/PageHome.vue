<template>
  <div class="app-body">
    <div class="d-flex px-3 my-3">
      <div class="custom-control custom-radio">
        <input
          type="radio"
          class="custom-control-input"
          id="all"
          v-model="q"
          @input="setQ"
          value="0"
        />
        <label class="custom-control-label" for="all"></label>
      </div>
      <div class="custom-control custom-radio">
        <input
          type="radio"
          class="custom-control-input"
          id="green"
          v-model="q"
          @input="setQ"
          value="1"
        />
        <label class="custom-control-label" for="green"></label>
      </div>
      <div class="custom-control custom-radio">
        <input
          type="radio"
          class="custom-control-input"
          id="orange"
          v-model="q"
          @input="setQ"
          value="2"
        />
        <label class="custom-control-label" for="orange"></label>
      </div>
      <div class="custom-control custom-radio">
        <input
          type="radio"
          class="custom-control-input"
          id="yellow"
          v-model="q"
          @input="setQ"
          value="3"
        />
        <label class="custom-control-label" for="yellow"></label>
      </div>
      <div class="custom-control custom-radio">
        <input
          type="radio"
          class="custom-control-input"
          id="red"
          v-model="q"
          @input="setQ"
          value="4"
        />
        <label class="custom-control-label" for="red"></label>
      </div>
    </div>
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
      condition: {},
      q: 0,
    };
  },
  methods: {
    async search() {
      try {
        this.loading = true;
        const response = await Comics.search({
          page: this.page,
          q: this.condition,
        });
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
    setQ(e) {
      switch (Number(e.target.value)) {
        case 0:
          this.condition = {};
          break;
        case 1:
          this.condition = {
            finished_eq: true,
          };
          break;
        case 2:
          this.condition = {
            finished_eq: false,
            ongoing_eq: false,
            volumes_collected_gt: 0,
          };
          break;
        case 3:
          this.condition = {
            ongoing_eq: true,
            volumes_collected_gt: 0,
          };
          break;
        case 4:
          this.condition = {
            volumes_collected_eq: 0,
          };
          break;
      }

      this.page = 1;
      this.stop = false;
      this.comics = [];
      this.search();
    },
    loadMore() {
      if (this.stop) return;
      this.page++;
      this.search();
    },
  },
};
</script>

<style scoped>
#green.custom-control-input:checked ~ .custom-control-label::before {
  border-color: #8bc34a;
  background-color: #8bc34a;
}

#orange.custom-control-input:checked ~ .custom-control-label::before {
  border-color: #ff9800;
  background-color: #ff9800;
}

#yellow.custom-control-input:checked ~ .custom-control-label::before {
  border-color: #ffc107;
  background-color: #ffc107;
}

#red.custom-control-input:checked ~ .custom-control-label::before {
  border-color: #f44336;
  background-color: #f44336;
}

#green ~ .custom-control-label::before {
  background-color: #8bc34a;
}

#orange ~ .custom-control-label::before {
  background-color: #ff9800;
}

#yellow ~ .custom-control-label::before {
  background-color: #ffc107;
}

#red ~ .custom-control-label::before {
  background-color: #f44336;
}
</style>