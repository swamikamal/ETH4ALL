// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract TruePeerSmartContract {
    pragma solidity ^0.8.0;

contract TruePeer {
    uint256 public paperPrice;
    address public author;
    address[] public reviewers;

    constructor() public {
        paperPrice = 20000000000000000000; // 20 MATIC
        author = msg.sender;
        reviewers = new address[](0);
    }

    function buyPaper() public payable {
        require(msg.value >= paperPrice, "Insufficient funds");
        uint256 buyerPayment = msg.value;
        uint256 authorEarnings = buyerPayment.mul(80).div(100);
        uint256 reviewerEarnings = buyerPayment.mul(15).div(100) / reviewers.length;
        uint256 developmentPool = buyerPayment.mul(5).div(100);

        author.transfer(authorEarnings);
        for (uint256 i = 0; i < reviewers.length; i++) {
            reviewers[i].transfer(reviewerEarnings);
        }

        address developmentFund = address(0x1234567890123456789012345678901234567890);
        developmentFund.transfer(developmentPool);
    }

    function addReviewer(address _reviewer) public {
        require(author == msg.sender, "Only the author can add reviewers");
        reviewers.push(_reviewer);
    }
}

}