import { createApp } from "vue";
import Header from "./About.vue";

export default (selector) => {
  createApp(Header).mount(selector);
};
