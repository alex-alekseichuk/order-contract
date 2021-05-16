// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

/**
 * The contract to register the orders and change their status.
 */
contract OrderDatabase is AccessControl {
    using Counters for Counters.Counter;
    struct Order {
        uint32 createdAt; // TODO: maybe it needs `uint`, because `block.timestamp` is `uint`?
        address client;
        uint amount;
        uint status; // TODO: would it be better to use some `enum` instead of `uint` for the status?
    }

    Counters.Counter private _nextOrderKey;
    mapping (uint => Order) private _orders;

    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    constructor() {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    // Create an order record
    // TODO: make clear what does it mean:
    //   `in the form of the difference between the transferred ETH and the order's amount.` ?
    function createAnOrder(uint amount) public returns (uint) {
        Order storage order = _orders[_nextOrderKey.current()];
        order.createdAt = uint32(block.timestamp);
        order.client = msg.sender;
        order.status = 0;
        order.amount = amount;
        uint orderKey = _nextOrderKey.current();
        _nextOrderKey.increment();
        return orderKey;
    }

    modifier onlyAdmin() {
        require(hasRole(ADMIN_ROLE, msg.sender), "Unauthorized");
        _;
    }

    // TODO: would it be better to introduce second argument to specify the status instead of the hardcoded const?
    function setOrderStatus(uint orderKey) onlyAdmin public {
        _orders[orderKey].status = 1;
    }

    function getOrderStatus(uint orderKey) public view returns (uint) {
        return _orders[orderKey].status;
    }

    function grantAdminRole(address _address) public {
        grantRole(ADMIN_ROLE, _address);
    }

    function revokeAdminRole(address _address) public {
        revokeRole(ADMIN_ROLE, _address);
    }
}
