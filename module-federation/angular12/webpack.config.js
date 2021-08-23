const ModuleFederationPlugin = require("webpack/lib/container/ModuleFederationPlugin");
const mf = require("@angular-architects/module-federation/webpack");
const path = require("path");
const share = mf.share;

const sharedMappings = new mf.SharedMappings();
sharedMappings.register(path.join(__dirname, "tsconfig.json"), [
  /* mapped paths to share */
]);

module.exports = {
  output: {
    uniqueName: "angular12",
    publicPath: "auto",
  },
  optimization: {
    runtimeChunk: false,
  },
  resolve: {
    alias: {
      ...sharedMappings.getAliases(),
    },
  },
  plugins: [
    new ModuleFederationPlugin({
      // For remotes (please adjust)
      name: "angular12",
      filename: "remoteEntry.js",
      exposes: {
        // "./PlayEditor":
        //   "./src/app/editors/play-editor/play-editor.component.ts",
        "./EditorsModule": "./src/app/editors/editors.module.ts",
      },

      // For hosts (please adjust)
      // remotes: {
      //     "mfe1": "mfe1@http://localhost:3000/remoteEntry.js",

      // },

      shared: share({
        "@angular/core": {
          singleton: true,
          strictVersion: true,
          requiredVersion: "auto",
        },
        "@angular/common": {
          singleton: true,
          strictVersion: true,
          requiredVersion: "auto",
        },
        "@angular/common/http": {
          singleton: true,
          strictVersion: true,
          requiredVersion: "auto",
        },
        "@angular/router": {
          singleton: true,
          strictVersion: true,
          requiredVersion: "auto",
        },

        ...sharedMappings.getDescriptors(),
        // "@angular/core": { singleton: true, strictVersion: true },
        // "@angular/common": { singleton: true, strictVersion: true },
        // "@angular/router": { singleton: true, strictVersion: true },
        // // "components-lib": { singleton: true, eager: true, requiredVersion: false, import: "/Users/scott/cxone/cxone-suite/app1-angular-12.0.0/node_modules/components-lib"}
        // "components-lib": { singleton: true, strictVersion: true, requiredVersion: false }
        // // ...sharedMappings.getDescriptors()
      }),
    }),
    sharedMappings.getPlugin(),
  ],
};
