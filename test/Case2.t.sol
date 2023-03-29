// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "forge-std/Test.sol";
import "../src/Case2.sol";

contract TestCase2 is Test {
    Case2 case2;
    
    function setUp() public {
        case2 = new Case2();
    }

    function test_transferReentrantBool() public {
        case2.transferReentrantBool();
    }

    function test_transferReentrantUint01() public {
        case2.transferReentrantUint01();
    }

    function test_transferReentrantUint12() public {
        case2.transferReentrantUint12();
    }
}