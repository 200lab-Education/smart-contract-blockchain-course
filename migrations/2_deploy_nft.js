const MyNFT = artifacts.require("MyNFT");
const Env = require("../env");

module.exports = function (deployer) {
  deployer.deploy(MyNFT);
};
