const commonConfig = require("./webpack.common");

const devConfig = {
  ...commonConfig,
  //   devServer: {
  //     port: 3000,
  //   },
  devtool: "inline-source-map",
};

module.exports = devConfig;
