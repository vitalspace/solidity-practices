// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Create hello world Contract
contract helloWorld {
    // Set Message
    string message = "hello Wolrd";
    // Get Message
    function getHelloWorld() public view returns (string memory) {
        return message;
    }
}
