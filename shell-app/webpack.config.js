const { merge } = require("webpack-merge");
const singleSpaDefaults = require("webpack-config-single-spa-ts");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const { ModuleFederationPlugin } = require("webpack").container;

module.exports = (webpackConfigEnv, argv) => {
  const orgName = "tecnox";
  const defaultConfig = singleSpaDefaults({
    orgName,
    projectName: "root-config",
    webpackConfigEnv,
    argv,
    disableHtmlGeneration: true,
  });

  return merge(defaultConfig, {
    // modify the webpack config however you'd like to by adding to this object
    output: {
      //publicPath: "http://localhost:3001/",
      libraryTarget: "system",
    },
    plugins: [
      new ModuleFederationPlugin({
        name: "home",
        library: { type: "var", name: "home" },
        // library: { type: "system" },
        // filename: "remoteEntry.js",
        remotes: {
          // 'home-nav': 'navigation',
          // body: "body@http://localhost:3002/remoteEntry.js",
          vueapp: "body",
          angular11ModuleFederation: "angular11ModuleFederation",
          // angular11ModuleFederation:
          //   "angular11ModuleFederation@http://localhost:5000/remoteEntry.js",
          // angularApp: "angularApp@http://localhost:8083/remoteEntry.js",
          angularApp: "angularApp",
        },
        // exposes: {},
        shared: {
          // "@angular/core": { singleton: true, strictVersion: true },
          // "@angular/common": { singleton: true, strictVersion: true },
          // "@angular/router": { singleton: true, strictVersion: true },
        },
      }),
      new HtmlWebpackPlugin({
        inject: false,
        template: "src/index.ejs",
        templateParameters: {
          isLocal: webpackConfigEnv && webpackConfigEnv.isLocal,
          orgName,
        },
      }),
    ],
  });
};
