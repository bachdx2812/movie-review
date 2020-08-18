import qs from "qs";

import request from "@/repositories/request";
const resource = "movies";

export default {
  search(params) {
    const paramsSerializer = (params = {}) =>
      qs.stringify(params, { arrayFormat: "brackets" });

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
};
