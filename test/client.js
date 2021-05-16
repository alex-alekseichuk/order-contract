const BN = web3.utils.BN;
const OrderDatabase = artifacts.require("OrderDatabase");
const Client = artifacts.require("Client");

contract("Client", function (accounts) {
  it("should create an order and set its status", async function() {
    const orderDatabase = await OrderDatabase.deployed();
    const client = await Client.deployed();

    await orderDatabase.grantAdminRole(client.address);

    const orderKey = await client.createAnOrder.call(new BN(7));
    let status = await client.getOrderStatus(orderKey);
    assert.equal(status, 0);
    await client.setOrderStatus(orderKey);
    status = await client.getOrderStatus(orderKey);
    assert.equal(status, 1);
  });
});
