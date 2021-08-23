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

// console.log("Loading Module Federation!");

registerApplication({
  name: "vue-module-federation",
  // @ts-ignore
  app: () => import("vueapp/body"),
  activeWhen: ["/vuejs-module-federation"],
});

registerApplication({
  name: "angular11-module-federation",
  // @ts-ignore
  app: () => import("angular11ModuleFederation/FModule"),
  activeWhen: ["/a11-module-federation"],
});

// registerApplication({
//   name: "@tecnocrata/navbar",
//   app: () => System.import("@tecnocrata/navbar"),
//   activeWhen: ["/"]
// });

start({
  urlRerouteOnly: true,
});
