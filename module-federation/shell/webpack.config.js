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
    uniqueName: "cxspoc",
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
      name: "cxspoc",
      filename: "remoteEntry.js",
      exposes: {
        "./MainModule": "./src/bootstrap.ts",
      },

      // For hosts (please adjust)
      remotes: {
        VueAppRemote: "VueApp@http://localhost:6002/remoteEntry.js",
      },

      shared: share({
        "@angular/core": {
          singleton: false,
          strictVersion: false,
          requiredVersion: "auto",
        },
        "@angular/common": {
          singleton: false,
          strictVersion: false,
          requiredVersion: "auto",
        },
        "@angular/common/http": {
          singleton: false,
          strictVersion: false,
          requiredVersion: "auto",
        },
        "@angular/router": {
          singleton: false,
          strictVersion: false,
          requiredVersion: "auto",
        },

        //   "@angular/core": { requiredVersion: '12.0.0' },
        // "@angular/common": { requiredVersion: '12.0.0' },
        // "@angular/common/http": { requiredVersion: '12.0.0' },
        // "@angular/router": { requiredVersion: '12.0.0' },
        vue: {
          singleton: true,
          strictVersion: true,
          requiredVersion: "auto",
        },
        "vue-router": {
          singleton: true,
          strictVersion: true,
          requiredVersion: "auto",
        },
        ...sharedMappings.getDescriptors(),
      }),
    }),
    sharedMappings.getPlugin(),
  ],
};
