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
  name: "cookie-consent",
  app: () => System.import("cookie-consent"),
  activeWhen: ["/react-webcomponent"],
});

registerApplication({
  name: "angular11-module-federation",
  // @ts-ignore
  app: () => import("angular11ModuleFederation/FModule"),
  activeWhen: ["/a11-module-federation"],
});
// registerApplication({
//   name: "angularApp",
//   // @ts-ignore
//   app: () => import("angularApp/ApplicationPage"),
//   activeWhen: ["/a11-module-federation"],
// });
layoutEngine.activate();
start();
