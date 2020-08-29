import qs from "qs";

import request from "@/repositories/request";
const resource = "comics";

const paramsSerializer = (params = {}) => qs.stringify(params, { arrayFormat: "brackets" });

export default {
  search(params) {
    return request.get(resource + ".json", {
      params,
      paramsSerializer,
    });
  },
  create(data) {
    return request.post(resource, data);
  },
  update(id, data) {
    return request.put(resource + "/" + id, data);
  },
  delete(id) {
    return request.post(resource + "/" + id);
  },
};
