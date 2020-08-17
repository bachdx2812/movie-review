const LIKE_MOVIE = "LIKE_MOVIE";
const DISLIKE_MOVIE = "DISLIKE_MOVIE";
const INCREASE_META_PAGE = "INCREASE_META_PAGE";
const UPDATE_MOVIES = "UPDATE_MOVIES";
const UPDATE_META = "UPDATE_META";

import { RepositoryFactory } from "@/repositories/RepositoryFactory";
const moviesRepo = new RepositoryFactory.get("movies");

export default {
  namespaced: true,
  state: {
    movies: [],
    meta: {
      page: 0,
    },
  },
  actions: {
    async search({ commit, state }, payload) {
      const result = await moviesRepo.search({
        page: state.meta.page,
      });

      const moviesList = [...state.movies, ...result.data.movies];
      commit(UPDATE_MOVIES, moviesList);
      commit(UPDATE_META, result.data.meta);
      // this.movies = [...this.movies, ...result.data.movies];
      // this.meta = result.data.meta;
    },
    toggleSidebar({ commit }, payload) {
      commit(LIKE_MOVIE, payload);
    },
    showSidebar({ commit }, payload) {
      commit(DISLIKE_MOVIE, payload);
    },
    increaseMetaPage({ commit }) {
      commit(INCREASE_META_PAGE);
    },
    async like({ commit }, payload) {
      const result = await moviesRepo.like(payload);

      commit(LIKE_MOVIE, payload);
    },
    async dislike({ commit }, payload) {
      const result = await moviesRepo.dislike(payload);

      commit(DISLIKE_MOVIE, payload);
    },
  },
  mutations: {
    UPDATE_MOVIES(state, payload) {
      state.movies = payload;
    },
    UPDATE_META(state, payload) {
      state.meta = payload;
    },
    INCREASE_META_PAGE(state) {
      state.meta.page += 1;
    },
    LIKE_MOVIE(state) {
      console.log("like");
    },
    DISLIKE_MOVIE(state) {
      console.log("dislike");
    },
  },
};
