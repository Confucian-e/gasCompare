// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "forge-std/Test.sol";
import "../src/Case3.sol";

contract TestCase3 is Test {
    Case3 case3;

    function setUp() public {
        case3 = new Case3();
    }

    function test_setAmountRequire() public {
        vm.expectRevert();
        case3.setAmountRequire(100);
    }

    function test_setAmountRevert() public {
        vm.expectRevert();
        case3.setAmountRevert(100);
    }
}