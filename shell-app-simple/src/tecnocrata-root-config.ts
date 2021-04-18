import { registerApplication, start } from "single-spa";

registerApplication({
  name: "@single-spa/welcome",
  app: () =>
    System.import(
      "https://unpkg.com/single-spa-welcome/dist/single-spa-welcome.js"
    ),
  activeWhen: ["/"],
});

registerApplication({
  name: "@tecnox/angular-application",
  app: () => System.import("http://localhost:4202/main.js"),
  activeWhen: ["/angular-application"],
});

console.log("Loading Module Federation!");

// registerApplication(
//   "body",
//   // @ts-ignore
//   () => import("body"),
//   (location) => location.pathname.startsWith("/vuejs-module-federation")
// );

registerApplication({
  name: "vue-module-federation",
  // @ts-ignore
  // app: () => import("http://localhost:3002/remoteEntry.js"),
  app: () => import("vueapp/body"),
  activeWhen: ["/vuejs-module-federation"],
});

// registerApplication({
//   name: "@tecnocrata/navbar",
//   app: () => System.import("@tecnocrata/navbar"),
//   activeWhen: ["/"]
// });

start({
  urlRerouteOnly: true,
});
