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
layoutEngine.activate();
start();
