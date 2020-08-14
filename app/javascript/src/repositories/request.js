import axios from "axios";
import { csrfToken } from "@rails/ujs";

const baseURL = "api";

const request = axios.create({
  baseURL: `/${baseURL}`,
  headers: {
    "X-Requested-With": "XMLHttpRequest",
    "X-CSRF-TOKEN": csrfToken(),
  },
});

export default request;