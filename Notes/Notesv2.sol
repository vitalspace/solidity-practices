//SPDX-License-Identifier:MIT
pragma solidity >=0.7.0;

contract NotesContract {
    uint256 public notesCounter = 0;
    struct Note {
        uint256 id;
        string title;
        string description;
        uint256 createdAt;
    }

    event noteCreated(
        uint256 id,
        string title,
        string description,
        uint256 createdAt
    );

    mapping(uint256 => Note) notes;

    constructor() {
        createNote("Genesis", "Hello Genesis");
    }

    function createNote(string memory _title, string memory _description)
        public
    {
        notesCounter++;
        notes[notesCounter] = Note(
            notesCounter,
            _title,
            _description,
            block.timestamp
        );

        emit noteCreated(notesCounter, _title, _description, block.timestamp);
    }

    function getNotes(uint256 _id) public view returns (Note memory) {
        return notes[_id];
    }
}
