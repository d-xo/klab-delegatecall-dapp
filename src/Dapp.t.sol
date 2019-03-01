pragma solidity ^0.5.0;

import "ds-test/test.sol";

import "./Dapp.sol";

contract DappTest is DSTest {
    Caller caller;

    function setUp() public {
        caller = new Caller();
    }

    function test_delegate() public {
        caller.delegate();
        assertEq(caller.val(), 1);
    }
}
