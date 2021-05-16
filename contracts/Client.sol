// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

import "./OrderDatabase.sol";

contract Client {
    OrderDatabase orderDatabase;

    constructor(address orderDataBaseAddress) {
        orderDatabase = OrderDatabase(orderDataBaseAddress);
    }

    function createAnOrder(uint amount) public returns (uint) {
        return orderDatabase.createAnOrder(amount);
    }

    function setOrderStatus(uint orderKey) public {
        return orderDatabase.setOrderStatus(orderKey);
    }

    function getOrderStatus(uint orderKey) public view returns (uint) {
        return orderDatabase.getOrderStatus(orderKey);
    }
}