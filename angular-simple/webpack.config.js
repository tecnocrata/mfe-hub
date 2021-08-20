const path = require("path");
const webpack = require("webpack");
const CleanWebpackPlugin = require("clean-webpack-plugin");
const ContextReplacementPlugin = require("webpack/lib/ContextReplacementPlugin");

module.exports = {
  entry: {
    // 'root-application': 'src/root-application/root-application.js',
    index: "src/app2.js",
    "common-dependencies": [
      // We want just one version of angular, so we put it into the common dependencies
      "core-js/client/shim.min.js",
      "reflect-metadata",
    ],
  },
  output: {
    publicPath: "/dist/",
    filename: "[name].js",
    path: path.resolve(__dirname, "dist"),
  },
  module: {
    rules: [
      {
        test: /\.js?$/,
        exclude: [path.resolve(__dirname, "node_modules")],
        loader: "babel-loader",
      },
      {
        test: /\.tsx?$/,
        loader: "ts-loader",
      },
    ],
  },
  node: {
    fs: "empty",
  },
  resolve: {
    modules: [__dirname, "node_modules"],
  },
  optimization: {
    splitChunks: {
      name: "common-dependencies.js",
    },
  },
  plugins: [
    new CleanWebpackPlugin(["dist"]),
    new ContextReplacementPlugin(
      /(.+)?angular(\\|\/)core(.+)?/,
      path.resolve(__dirname, "../")
    ),
  ],
  devtool: "source-map",
  externals: [],
  devServer: {
    historyApiFallback: true,
    port: 5002,
  },
};
