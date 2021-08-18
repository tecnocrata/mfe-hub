import { registerApplication, start } from "single-spa";
import {
  constructApplications,
  constructRoutes,
  constructLayoutEngine,
} from "single-spa-layout";
import microfrontendLayout from "./microfrontend-layout.html";

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
//   name: "angular11-module-federation",
//   // @ts-ignore
//   app: () => import("angular11ModuleFederation/FModule"),
//   activeWhen: ["/a11-module-federation"],
// });
registerApplication({
  name: "angularApp",
  // @ts-ignore
  app: () => import("angularApp/ApplicationPage"),
  activeWhen: ["/a11-module-federation"],
});
layoutEngine.activate();
start();
