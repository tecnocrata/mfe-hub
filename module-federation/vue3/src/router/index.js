import { createWebHistory, createRouter } from "vue-router";
import Home from "../components/Home.vue";
import About from "../components/About.vue";

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/about",
    name: "About",
    component: About,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
// import Vue from "vue";
// import VueRouter from "vue-router";
// import Home from "../components/Home.vue";

// Vue.use(VueRouter);

// const routes = [
//   {
//     path: "/",
//     name: "Home",
//     component: Home,
//   },
//   {
//     path: "/about",
//     name: "About",
//     component: () =>
//       import(/* webpackChunkName: "about" */ "../components/About.vue"),
//   },
// ];

// const router = new VueRouter({
//   mode: "history",
//   routes,
// });

// export default router;
