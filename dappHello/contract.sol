// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

contract hello {
    string message = "Hello World this is a message from Blockchain Ganache.";
    function getMessage() public view returns (string memory) {
        return message;
    }
}