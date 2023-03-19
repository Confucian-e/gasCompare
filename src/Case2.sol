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


    uint256 private lockUint = 1;
    modifier nonReentrantUint {
        require(lockUint == 1, 'Reentrancy');
        lockUint = 2;
        _;
        lockUint = 1;
    }


    function transferReentrantBool() public nonReentrantBool {
        transfer(msg.sender, 1e20);
    }

    function transferReentrantUint() public nonReentrantUint {
        transfer(msg.sender, 1e20);
    }
}