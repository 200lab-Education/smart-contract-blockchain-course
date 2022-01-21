const Marketplace = artifacts.require("Marketplace");
const Env = require("../env");

module.exports = function (deployer) {
    deployer.deploy(
        Marketplace,
        Env.get("NFT_ADDRESS"),
        Env.get("FEE_DECIMAL"),
        Env.get("FEE_RATE"),
        Env.get("FEE_RECIPIENT")
    );
};
