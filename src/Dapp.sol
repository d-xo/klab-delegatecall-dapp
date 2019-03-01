pragma solidity ^0.5.0;

contract Caller {
    uint public val = 0;
    Callee callee;

    function delegate() public {
        callee = new Callee();
        (bool success, bytes memory resp) = address(callee).delegatecall(abi.encodeWithSignature("call()"));
        require(success);

        uint delta;
        assembly {
            delta := mload(add(resp, 32))
        }

        val += delta;
    }
}

contract Callee {
    function call() public pure returns (uint) {
        return 1;
    }
}
