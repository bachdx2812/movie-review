import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
Vue.use(Vuex);

import createPersistedState from "vuex-persistedstate";
import movies from './modules/movies.js'
import users from './modules/users.js'

const store = new Vuex.Store({
  namespace: true,
  plugins: [createPersistedState({
    key: "movies-data-store",
  })],
  modules: {
    movies,
    users
  }
});

export default store;