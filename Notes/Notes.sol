// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0;
pragma experimental ABIEncoderV2;

contract notes {
    address public professor;
    constructor () {
        professor = msg.sender;
    }
    // Mapping to relationate the hash with id from user
    mapping(bytes32 => uint) Notes;
    // Array to save student revisions
    string [] revisiones;
    // Events
    event alumno_evaluado(bytes32, uint);
    event evento_revision(string);
    // Evaluate Foo
    function evaluate(string memory _id, uint _nota) public justProfessor(msg.sender) {
        // String to hash
        bytes32 hash_id = keccak256(abi.encodePacked(_id));
        // Relationship between the hash of the student's identification and his grade
        Notes[hash_id] = _nota;
        // Emit event
        emit alumno_evaluado(hash_id, _nota);
    }
    modifier justProfessor(address _direccion){
        // It is required that the address entered is the same as the owner of the contract
        require(_direccion == professor, "You don't have permissions to execute this function.");
        _;
    }
    // GetNotesById Foo
    function getNotesById(string memory _id) public view returns (uint) {
        bytes32 hash_id = keccak256(abi.encodePacked(_id));
        uint nota_alumno = Notes[hash_id];
        return nota_alumno;
    }
    // requestRevision Foo
    function requestRevision(string memory _id) public {
        // Save revision
        revisiones.push(_id);
        // Emit Event
        emit evento_revision(_id);
    }
    // get Request Foo
    function getRequest() public view justProfessor(msg.sender) returns (string [] memory) {
        // Return all request
        return revisiones;   
    }
}