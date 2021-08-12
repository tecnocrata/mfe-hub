import { registerApplication, start } from "single-spa";
import {
  constructApplications,
  constructRoutes,
  constructLayoutEngine,
} from "single-spa-layout";
import microfrontendLayout from "./microfrontend-layout.html";
// import singleSpaHtml from "single-spa-html";

// const webComponentApp = singleSpaHtml({
//   template: (props) =>
//     `<react-contact-list attr="${props.attr}"></react-contact-list>`,
// });

const routes = constructRoutes(microfrontendLayout);
const applications = constructApplications({
  routes,
  loadApp(app) {
    // console.log("ESTO HAY dentro app", app);
    // if (app.name == "body") return;
    return System.import(app.name);
  },
});
const layoutEngine = constructLayoutEngine({ routes, applications });

applications.forEach(registerApplication);
registerApplication({
  name: "vue-module-federation",
  // @ts-ignore
  app: () => import("vueapp/body"),
  activeWhen: ["/vuejs-module-federation"],
});
// registerApplication({
//   name: "name",
//   app: webComponentApp,
//   activeWhen: ["/react-webcomponent"],
//   // activeWhen: () => true
// });
registerApplication({
  name: "@example/cookie-consent",
  app: () => System.import("@example/cookie-consent"),
  activeWhen: ["/react-webcomponent"],
});
layoutEngine.activate();
start();
