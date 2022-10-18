// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract subContract {
    // Set result var
    uint result;
    // Set foo rest
    function sub(uint _a, uint _b) public {
        result = _a - _b; 
    }
    // Set foo getResult
    function getResult() public view returns (uint) {
        return result;
    }
}