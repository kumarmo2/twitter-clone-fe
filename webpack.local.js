const commonConfig = require("./webpack.common");
const path = require("path");

const buildPath = path.resolve(__dirname, "dist");

const devConfig = {
  ...commonConfig,
  output: {
    filename: "[name].[contenthash:6].js",
    path: buildPath,
  },
  devServer: {
    port: 3000,
  },
  devtool: "inline-source-map",
};

module.exports = devConfig;
