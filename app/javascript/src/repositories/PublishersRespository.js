import qs from "qs";

import request from "@/repositories/request";
const resource = "publishers";

const paramsSerializer = (params = {}) => qs.stringify(params, { arrayFormat: "brackets" });

export default {
  search(params) {
    return request.get(resource + ".json", {
      params,
      paramsSerializer,
    });
  },
};
