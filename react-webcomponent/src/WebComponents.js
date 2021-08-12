import defineElement from "./custom-element";
import { ContactList } from "./contact-list/ContactList";
import singleSpaHtml from "single-spa-html";

defineElement(
  ContactList,
  "react-contact-list",
  ["headerText", "contacts"],
  ["onContactSelected"]
);

const htmlLifecycles = singleSpaHtml({
  template: "<react-contact-list></react-contact-list>",
});

export const bootstrap = htmlLifecycles.bootstrap;
export const mount = htmlLifecycles.mount;
export const unmount = htmlLifecycles.unmount;
