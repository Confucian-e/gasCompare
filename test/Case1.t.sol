// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "forge-std/Test.sol";
import "../src/Case1.sol";

contract TestCase is Test {
    uint256 constant amount = 1e20;
    uint256 constant times = 100;
    Case1 case1;

    function setUp() public {
        case1 = new Case1();
    }

    function test_PushOrder1() public {
        case1.pushOrder1(amount);
    }

    function test_PushOrder2() public {
        case1.pushOrder2(amount);
    }

    function test_PushOrder1Loop() public {
        case1.pushOrder1Loop(amount, times);
    }

    function test_PushOrder2Loop() public {
        case1.pushOrder2Loop(amount, times);
    }
}