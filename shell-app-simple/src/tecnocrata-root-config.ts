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

// registerApplication({
//   name: "@tecnocrata/navbar",
//   app: () => System.import("@tecnocrata/navbar"),
//   activeWhen: ["/"]
// });

start({
  urlRerouteOnly: true,
});
