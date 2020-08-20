import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
Vue.use(Vuex);

import movies from './modules/movies.js'

const store = new Vuex.Store({
  namespace: true,
  modules: {
    movies,
  }
});

export default store;