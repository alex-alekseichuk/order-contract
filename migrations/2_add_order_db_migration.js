const OrderDatabase = artifacts.require("OrderDatabase");
const Client = artifacts.require("Client");
module.exports = async function(deployer) {
  await deployer.deploy(OrderDatabase);
  await deployer.deploy(Client, OrderDatabase.address);
};
