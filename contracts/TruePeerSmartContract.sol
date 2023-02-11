// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract TruePeer {
    uint256 public paperPrice;
    address payable public author;
    address payable[] public reviewers;
    constructor() {
        paperPrice = 20000000000000000000; // 20 MATIC 
        author = payable(msg.sender);
        reviewers = new address payable[](0);
    }

    function buyPaper() public payable {
        require(msg.value >= paperPrice, "Insufficient funds");
        uint256 buyerPayment = msg.value;
        uint256 authorEarnings = buyerPayment * 80 / 100;
        uint256 reviewerEarnings = (buyerPayment * 15 / 100) / reviewers.length;
        uint256 developmentPool = buyerPayment * 5 / 100;

        author.transfer(authorEarnings);
        for (uint256 i = 0; i < reviewers.length; i++) {
            reviewers[i].transfer(reviewerEarnings);
        }

        address payable developmentFund = address(0x1234567890123456789012345678901234567890);
        developmentFund.transfer(developmentPool);
    }

    function addReviewer(address payable _reviewer) public {
        require(msg.sender == author, "Only the author can add reviewers");
        reviewers.push(_reviewer);
    }
}
