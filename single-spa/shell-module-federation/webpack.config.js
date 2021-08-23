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
    uniqueName: "shellModuleFederation",
    publicPath: "auto",
  },
  optimization: {
    runtimeChunk: false,
  },
  resolve: {
    alias: {
      // ...sharedMappings.getAliases(),
    },
  },
  plugins: [
    new ModuleFederationPlugin({
      // For remotes (please adjust)
      // name: "shellModuleFederation",
      // filename: "remoteEntry.js",
      // exposes: {
      //     './Component': './/src/app/app.component.ts',
      // },

      // For hosts (please adjust)
      remotes: {
        angular11ModuleFederation:
          "angular11ModuleFederation@http://localhost:5000/remoteEntry.js",
        mfe1: "mfe1@http://localhost:3000/remoteEntry.js",
      },

      shared: {
        //   "@angular/core": {
        //     singleton: true,
        //     strictVersion: true,
        //     requiredVersion: "auto",
        //   },
        //   "@angular/common": {
        //     singleton: true,
        //     strictVersion: true,
        //     requiredVersion: "auto",
        //   },
        //   "@angular/common/http": {
        //     singleton: true,
        //     strictVersion: true,
        //     requiredVersion: "auto",
        //   },
        //   "@angular/router": {
        //     singleton: true,
        //     strictVersion: true,
        //     requiredVersion: "auto",
        //   },

        ...sharedMappings.getDescriptors(),
      },
    }),
    sharedMappings.getPlugin(),
  ],
};
