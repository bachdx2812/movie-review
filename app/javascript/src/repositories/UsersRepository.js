import request from "@/repositories/request";
const resource = "users";

export default {
  register(info) {
    return request.post(`${resource}/register.json`, info);
  },
  login(info) {
    return request.post(`${resource}/login.json`, info);
  },
  logout() {
    return request.delete(`${resource}/logout.json`);
  },
};
