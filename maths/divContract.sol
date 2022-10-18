// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0;

contract divContract {
    // Set Var Result
    uint result;
    // Set foo Div
    function divFoo (uint _a, uint _b) public {
        result = _a / _b;
    }
    // Get Result Foo
    function getResult() public view returns (uint) {
        return result;
    }
}