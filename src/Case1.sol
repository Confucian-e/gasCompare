// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Case1 {
    struct Order {
        uint256 amount;
        uint256 endTime;
    }

    mapping (address => Order[]) userOrder1;

    mapping (address => uint256) userOrderLen;
    mapping (address => mapping (uint256 => Order)) userOrder2;

    uint256 constant lockTime = 10 minutes;

    // ============================ 添加一次 Order ============================

    function pushOrder1(uint256 _amount) public {
        Order memory newOrder = Order(_amount, block.timestamp + lockTime);
        Order[] storage orders = userOrder1[msg.sender];
        orders.push(newOrder);
    }

    function pushOrder2(uint256 _amount) public {
        Order memory newOrder = Order(_amount, block.timestamp + lockTime);
        uint256 len = userOrderLen[msg.sender];
        userOrder2[msg.sender][len] = newOrder;
        userOrderLen[msg.sender]++;
    }

    // ============================ 添加多次 Order ============================

    function pushOrder1Loop(uint256 _amount, uint256 times) public {
        Order[] storage orders = userOrder1[msg.sender];
        Order memory newOrder = Order(_amount, block.timestamp + lockTime);
        for(uint256 i; i < times; i++) {
            orders.push(newOrder);
        }
    }

    function pushOrder2Loop(uint256 _amount, uint256 times) public {
        Order memory newOrder = Order(_amount, block.timestamp + lockTime);
        for(uint256 i; i < times; i++) {
            uint256 len = userOrderLen[msg.sender];
            userOrder2[msg.sender][len] = newOrder;
        }
        userOrderLen[msg.sender] += times;
    }
}