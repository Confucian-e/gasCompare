// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "openzeppelin-contracts/contracts/access/Ownable.sol";
import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract MetaCoin is ERC20, Ownable {
    constructor() ERC20("MetaCoin", "MC") {
        _mint(_msgSender(), 1e26);
    }

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }
}