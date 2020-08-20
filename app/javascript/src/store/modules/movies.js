const LIKE_MOVIE = "LIKE_MOVIE";
const DISLIKE_MOVIE = "DISLIKE_MOVIE";
const INCREASE_META_PAGE = "INCREASE_META_PAGE";
const UPDATE_MOVIES = "UPDATE_MOVIES";
const UPDATE_META = "UPDATE_META";
const TOGGLE_LOADING = "TOGGLE_LOADING";

import { RepositoryFactory } from "@/repositories/RepositoryFactory";
const moviesRepo = new RepositoryFactory.get("movies");

export default {
  namespaced: true,
  state: {
    loading: false,
    movies: [],
    meta: {
      page: 0,
    },
  },
  actions: {
    async search({ commit, state }, payload) {
      try {
        commit(TOGGLE_LOADING, true);

        const result = await moviesRepo.search({
          page: state.meta.page,
        });

        const moviesList = [...state.movies, ...result.data.movies];
        commit(UPDATE_MOVIES, moviesList);
        commit(UPDATE_META, result.data.meta);
      } catch (err) {
        console.log(err);
      } finally {
        commit(TOGGLE_LOADING, false);
      }
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
    TOGGLE_LOADING(state, payload) {
      state.loading = payload;
    },
    UPDATE_MOVIES(state, payload) {
      state.movies = payload;
    },
    UPDATE_META(state, payload) {
      state.meta = payload;
    },
    INCREASE_META_PAGE(state) {
      if (state.meta) state.meta.page += 1;
    },
    LIKE_MOVIE(state, payload) {
      const likedMovie = state.movies.find((m) => m.id === payload);

      if (likedMovie.rate == "dislike" && likedMovie.dislike_count > 0) {
        likedMovie.dislike_count -= 1;
      }
      likedMovie.rate = "like";
      likedMovie.like_count += 1;
    },
    DISLIKE_MOVIE(state, payload) {
      const likedMovie = state.movies.find((m) => m.id === payload);

      if (likedMovie.rate == "like" && likedMovie.like_count > 0) {
        likedMovie.like_count -= 1;
      }
      likedMovie.rate = "dislike";
      likedMovie.dislike_count += 1;
    },
  },
};
