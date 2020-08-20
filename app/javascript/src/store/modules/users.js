import { RepositoryFactory } from "@/repositories/RepositoryFactory";
const Users = new RepositoryFactory.get("users");

export default {
  namespaced: true,
  state: {
    username: [],
    loggedIn: false,
  },
  actions: {
    async login({ commit }, payload) {
      await Users.login(payload);
      commit("AUTH_SUCCESS", payload);
    },
    async logout({ commit }) {
      await Users.logout();
      commit("LOGOUT_SUCCESS");
    },
    async register({ commit }, payload) {
      await Users.register(payload);
      commit("REGISTER_SUCCESS", payload);
    },
  },
  mutations: {
    AUTH_SUCCESS(state, payload) {
      state.username = payload.username;
      state.loggedIn = true;
    },
    LOGOUT_SUCCESS(state) {
      state.username = null;
      state.loggedIn = false;
    },
    REGISTER_SUCCESS(state, payload) {
      state.username = payload.username;
      state.loggedIn = true;
    },
  },
};