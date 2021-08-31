// const ModuleFederationPlugin = require("webpack/lib/container/ModuleFederationPlugin");
const { ModuleFederationPlugin } = require("webpack").container;
const htmlWebpackPlugin = require("html-webpack-plugin");
const path = require("path");
const outputPath = path.resolve(__dirname, "dist");
const { VueLoaderPlugin } = require("vue-loader");

module.exports = {
  entry: "./src/app.js",
  cache: false,

  mode: "development",
  devtool: "source-map",

  optimization: {
    minimize: false,
  },

  output: {
    publicPath: "http://localhost:6002/",
    // libraryTarget: "system",
  },

  resolve: {
    extensions: [".jsx", ".js", ".json", ".ts", ".tsx", ".vue"],
  },

  devServer: {
    contentBase: outputPath,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "*",
      "Access-Control-Allow-Methods": "*",
    },
  },

  module: {
    rules: [
      {
        test: /\.s[ac]ss$/i,
        use: [
          "vue-style-loader",
          "style-loader",
          "css-loader",
          "postcss-loader",
          "sass-loader",
        ],
      },
      {
        test: /\.vue$/,
        loader: "vue-loader",
      },
      {
        test: /\.js$/,
        loader: "babel-loader",
      },
      {
        test: /\.tsx?$/,
        loader: "ts-loader",
        options: {
          appendTsSuffixTo: [/\.vue$/],
        },
        exclude: /node_modules/,
      },
    ],
  },

  plugins: [
    new VueLoaderPlugin(),
    new ModuleFederationPlugin({
      name: "VueApp",
      library: { type: "var", name: "VueApp" },
      filename: "remoteEntry.js",
      // remotes: {},
      exposes: {
        "./body": "./src/app",
        "./mountAbout": "./src/components/about",
        "./mountApp": "./src/app-remote",
      },
      // shared: ["vue", "vue-router", "single-spa-vue"], //"single-spa",
    }),
    // new htmlWebpackPlugin({
    //   template: path.resolve(__dirname, "public", "index.html"),
    //   favicon: "./public/favicon.ico",
    // }),
  ],
};
