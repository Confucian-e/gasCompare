// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Case2 is ERC20 {
    constructor() ERC20('Token', 'T') {
        _mint(msg.sender, 1e26);
    }

    bool private lockBool = false;
    modifier nonReentrantBool {
        require(lockBool == false, 'Reentrancy');
        lockBool = true;
        _;
        lockBool = false;
    }

    uint256 private lockUint12 = 1;
    modifier nonReentrantUint12 {
        require(lockUint12 == 1, 'Reentrancy');
        lockUint12 = 2;
        _;
        lockUint12 = 1;
    }

    uint256 private lockUint01 = 0;
    modifier nonReentrantUint01 {
        require(lockUint01 == 0, 'Reentrancy');
        lockUint12 = 1;
        _;
        lockUint12 = 0;
    }


    function transferReentrantBool() public nonReentrantBool {
        transfer(msg.sender, 1e20);
    }

    function transferReentrantUint12() public nonReentrantUint12 {
        transfer(msg.sender, 1e20);
    }

    function transferReentrantUint01() public nonReentrantUint01 {
        transfer(msg.sender, 1e20);
    }
}