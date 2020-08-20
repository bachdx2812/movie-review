import qs from "qs";

import request from "@/repositories/request";
const resource = "movies";

const paramsSerializer = (params = {}) => qs.stringify(params, { arrayFormat: "brackets" });

export default {
  search(params) {
    return request.get(`${resource}/search.json`, {
      params,
      paramsSerializer,
    });
  },
  like(movieId) {
    return request.post(`${resource}/${movieId}/like`);
  },
  dislike(movieId) {
    return request.post(`${resource}/${movieId}/dislike`);
  },
  getYoutubeInfo(url) {
    return request.get(`${resource}/youtube`, {
      params: { url }
    })
  },
  upload(data) {
    return request.post(resource, data);
  },
  getMyMovies(params) {
    return request.get(`${resource}/my`, {
      params,
      paramsSerializer,
    });
  }
};
