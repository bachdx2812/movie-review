<template>
  <div class="modal fade show" v-if="visible" ref="modal">
    <div class="modal-dialog modal-dialog-scrollable">
      <form class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Add Comic</h5>
          <button type="button" class="close" @click="hide">
            <span>&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label>Image</label>
            <img
              :src="image"
              width="120"
              height="180"
              class="d-block mb-3"
              style="object-fit: contain"
            />
            <input type="file" class="form-control" @change="setFile" required />
          </div>
          <div class="form-group">
            <label>Title</label>
            <input class="form-control" required v-model="data.title" />
          </div>
          <div class="form-group">
            <label>Copyright Title</label>
            <input class="form-control" required v-model="data.copyright_title" />
          </div>
          <div class="form-group">
            <label>Author</label>
            <input class="form-control" required v-model="data.author" />
          </div>
          <div class="form-group">
            <label>Publisher</label>
            <select class="form-control" required v-model="data.publisher_id">
              <option v-for="item in publishers" :key="item.id" :value="item.id">{{item.name}}</option>
            </select>
          </div>
          <div class="form-group">
            <label>Year</label>
            <div class="input-group">
              <input
                type="number"
                inputmode="numeric"
                class="form-control"
                required
                v-model="data.year_start"
              />
              <input type="number" inputmode="numeric" class="form-control" v-model="data.year_end" />
            </div>
          </div>
          <div class="form-group">
            <label>Volumes</label>
            <div class="input-group">
              <input
                type="number"
                inputmode="numeric"
                class="form-control"
                required
                v-model="data.volumes_collected"
              />
              <input
                type="number"
                inputmode="numeric"
                class="form-control"
                required
                v-model="data.volumes_total"
              />
              <div class="input-group-append">
                <span class="input-group-text">
                  <div class="custom-control custom-checkbox">
                    <input
                      type="checkbox"
                      class="custom-control-input"
                      id="ongoing"
                      v-model="data.ongoing"
                    />
                    <label class="custom-control-label" for="ongoing">Ongoing</label>
                  </div>
                </span>
                <span class="input-group-text">
                  <div class="custom-control custom-checkbox">
                    <input
                      type="checkbox"
                      class="custom-control-input"
                      id="finished"
                      v-model="data.finished"
                    />
                    <label class="custom-control-label" for="finished">Finished</label>
                  </div>
                </span>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary" @click.prevent="save">Save</button>
          <button type="button" class="btn btn-secondary" @click="hide">Close</button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import { RepositoryFactory } from "@/repositories/RepositoryFactory";
const Comics = new RepositoryFactory.get("comics");
const Publishers = new RepositoryFactory.get("publishers");

export default {
  data() {
    return {
      visible: false,
      data: {
        title: "",
        copyright_title: "",
        thumbnail: {},
        author: "",
        publisher_id: 1,
        year_start: "",
        year_end: "",
        volumns_collected: 0,
        volumns_total: 0,
        ongoing: false,
        finished: false,
      },
      publishers: [],
      editId: null,
      image: null,
      file: null,
    };
  },
  async created() {
    const response = await Publishers.search();
    this.publishers = response.data;
  },
  methods: {
    show(comic) {
      if (comic) {
        this.data = comic;
        this.editId = comic.id;
        this.image = this.data.thumbnail.url;
      }

      this.visible = true;
      document.body.classList.add("modal-open");
    },
    hide() {
      this.$refs.modal.classList.remove("show");
      setTimeout(() => {
        this.visible = false;
        this.data = {
          title: "",
          copyright_title: "",
          thumbnail: {},
          author: "",
          publisher_id: 1,
          year_start: "",
          year_end: "",
          volumns_collected: 0,
          volumns_total: 0,
          ongoing: false,
          finished: false,
        };
        this.editId = null;
        this.file = null;
        this.image = null;
        document.body.classList.remove("modal-open");
      }, 300);
    },
    setFile(event) {
      const file = event.target.files[0];
      this.file = file;
      if (file) {
        const reader = new FileReader();
        const vm = this;
        reader.onload = (e) => {
          vm.image = e.target.result;
        };
        reader.readAsDataURL(file);
      }
    },
    async save() {
      try {
        const data = Object.assign({}, this.data);
        if (this.file) data.thumbnail = this.file;

        if (this.editId) {
          await Comics.update(this.editId, data);
        } else {
          await Comics.create(data);
        }
        window.location.reload();
      } catch (e) {
        alert(e.message);
      }
    },
  },
};
</script>
