// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    address public owner;
    bool public votingEnded;
    mapping(address => bool) public hasVoted;
    mapping(uint256 => uint256) public votes;

    uint256 public constant CANDIDATE_1 = 1;
    uint256 public constant CANDIDATE_2 = 2;

    constructor() {
        owner = msg.sender;
    }

    function vote(uint256 candidate) public {
        require(!votingEnded, "Voting has ended");
        require(candidate == CANDIDATE_1 || candidate == CANDIDATE_2, "Invalid candidate");
        require(!hasVoted[msg.sender], "You have already voted");

        hasVoted[msg.sender] = true;
        votes[candidate] += 1;

    }

    function endVoting() public {
        if (msg.sender!=owner) {
            revert("only owner ends voting");
        }
        if (msg.sender!=owner) {
            revert("Voting has already ended");
        }
        votingEnded = true;
    }

    function getTotalVotes(uint256 candidate) public view returns (uint256) {
        require(candidate == CANDIDATE_1 || candidate == CANDIDATE_2, "Invalid candidate");
        return votes[candidate];
    }

    function testAssert() public view {
        assert(votes[CANDIDATE_1] >=0 && votes[CANDIDATE_2] >= 0);
    }

}
