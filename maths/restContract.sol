// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

contract resContract {
    // Set Var Result
    uint result;
    // Set Foo rest 
    function rest(uint _a, uint _b) public {
        result = _a % _b;
    }
    // Get Result Foo
    function getResult() public view returns (uint) {
        return result;
    }

}