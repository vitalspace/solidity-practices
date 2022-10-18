// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract multiplicationContract {
    // Set result  var
    uint result;
    // Set Foo mult
    function mulFoo (uint _a, uint _b) public {
        result = _a * _b;
    }
    // Get Result Foo
    function getResult () public view returns (uint) {
        return result;
    }
}