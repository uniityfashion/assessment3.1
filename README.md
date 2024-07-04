Voting Contract
===============

This is a simple voting contract written in Solidity. It allows users to vote for one of two candidates, and the owner of the contract can end the voting period.

Contract Overview
----------------

The contract has the following properties:

* `owner`: The address of the owner of the contract, set to the sender of the contract deployment transaction.
* `votingEnded`: A boolean indicating whether the voting period has ended.
* `hasVoted`: A mapping of addresses to booleans, indicating whether each address has voted.
* `votes`: A mapping of candidate IDs to vote counts.

The contract has the following functions:

### `vote(uint256 candidate)`

Allows a user to vote for a candidate. The function checks that:

* The voting period has not ended.
* The candidate ID is valid (either 1 or 2).
* The user has not already voted.

If the checks pass, the function increments the vote count for the candidate and marks the user as having voted.

### `endVoting()`

Allows the owner of the contract to end the voting period. The function checks that:

* The caller is the owner of the contract.
* The voting period has not already ended.

If the checks pass, the function sets `votingEnded` to `true`.

### `getTotalVotes(uint256 candidate)`

Returns the total number of votes for a candidate. The function checks that the candidate ID is valid (either 1 or 2).

### `testAssert()`

A test function that asserts that the vote counts for both candidates are non-negative.

Deployment
----------

To deploy this contract, simply compile and deploy it to your preferred Ethereum network.

Testing
-------

You can test this contract using Remix IDE.

License
-------

This contract is licensed under the MIT License.
