// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "forge-std/Test.sol";
import "../src/Case3.sol";

contract TestCase3 {
    Case3 case3;

    function setUp() public {
        case3 = new Case3();
    }

    function testFail_setAmountRequire() public {
        case3.setAmountRequire(100);
    }

    function testFail_setAmountRevert() public {
        case3.setAmountRevert(100);
    }
}