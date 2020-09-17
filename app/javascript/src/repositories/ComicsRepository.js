import qs from "qs";
import {
  serialize
} from 'object-to-formdata';

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
    const formData = serialize(data);

    return request.post(resource, formData, {
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    });
  },
  update(id, data) {
    const formData = serialize(data);
    formData.append("_method", "put");

    return request.post(resource + "/" + id, formData, {
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    });
  },
  delete(id) {
    return request.delete(resource + "/" + id);
  },
};
