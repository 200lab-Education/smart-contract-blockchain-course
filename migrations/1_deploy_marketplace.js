const NFTMarketplace = artifacts.require("NFTMarketplace");
const Env = require("../env");

module.exports = function (deployer) {
    deployer.deploy(
        NFTMarketplace,
        Env.get("NFT_ADDRESS"),
        Env.get("FEE_DECIMAL"),
        Env.get("FEE_RATE"),
        Env.get("FEE_RECIPIENT")
    );
};
