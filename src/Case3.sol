// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Case3 {
    uint256 amount;
    error InvalidAmount(string message);

    function setAmountRequire(uint256 _amount) public {
        require(amount > 100, 'Amount should exceed 100');
        amount = _amount;
    }

    function setAmountRevert(uint256 _amount) public {
        if(_amount <= 100) revert InvalidAmount('Amount should exceed 100');
        amount = _amount;
    }
}