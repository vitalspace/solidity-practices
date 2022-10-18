//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract addContract {
    // Set var type unit
    uint256 result;

    // Set foo Sum
    function add(uint256 _a, uint256 _b) public {
        result = _a + _b;
    }

    // Set foo getAddResult
    function getAddResult() public view returns (uint256) {
        return result;
    }
}
