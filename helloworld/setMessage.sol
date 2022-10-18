//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract setMessageContract {
    // set var massage type string
    string message = "";
    // setMessage Function
    function setMessage(string memory _message) public {
        message = _message;
    }
    // getMesage Function
    function getMessage() public view returns (string memory) {
        return message;
    }
}