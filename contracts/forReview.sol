// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract ArticleReview {
    uint public articleCount = 0;


    struct Article {
        address owner;
        string ipfsHash;
        uint version;
        bool isReviewed;
    }

    mapping (uint => Article) private articles;

    event DeployArticleToPool(string ipfsHash, uint version);

    function addArticle( string memory _ipfsHash, uint _version) public {
        require(bytes(_ipfsHash).length > 0, "IPFS hash cannot be empty");

        articleCount++;
        articles[articleCount] = Article(msg.sender, _ipfsHash, _version, false);

    }
    function getMyArticles() public view returns (string[] memory, uint[] memory, bool[] memory, uint) {
    uint myArticleCount = 0;
    for (uint i = 1; i <= articleCount; i++) {
        if (articles[i].owner == msg.sender) {
            myArticleCount++;
        }
        
    }

    if (myArticleCount == 0) {
        return (new string[](0), new uint[](0), new bool[](0), uint (0));
    }

    string[] memory myIpfsHashes = new string[](myArticleCount);
    uint[] memory myVersions = new uint[](myArticleCount);
    bool[] memory myIsReviewed = new bool[](myArticleCount);

    uint j = 0;
    for (uint i = 1; i <= articleCount; i++) {
        if (articles[i].owner == msg.sender) {
            myIpfsHashes[j] = articles[i].ipfsHash;
            myVersions[j] = articles[i].version;
            myIsReviewed[j] = articles[i].isReviewed;
            j++;
        }
    }

    return (myIpfsHashes, myVersions, myIsReviewed, myArticleCount);


    } 

    //to list all articles helps to display all the articles available for review
    function getAllArticles() public view returns (string[] memory, uint[] memory, bool[] memory, uint) {
    if (articleCount == 0) {
        return (new string[](0), new uint[](0), new bool[](0), uint (0));
    }

    string[] memory allIpfsHashes = new string[](articleCount);
    uint[] memory allVersions = new uint[](articleCount);
    bool[] memory allIsReviewed = new bool[](articleCount);

    for (uint i = 1; i <= articleCount; i++) {
        allIpfsHashes[i-1] = articles[i].ipfsHash;
        allVersions[i-1] = articles[i].version;
        allIsReviewed[i-1] = articles[i].isReviewed;
    }

    return (allIpfsHashes, allVersions, allIsReviewed, articleCount);
    }

    //List of all articles that are ready for sale
    function getReviewedArticles() public view returns (string[] memory, uint[] memory, uint) {
        uint reviewedArticleCount = 0;
        for (uint i = 1; i <= articleCount; i++) {
            if (articles[i].isReviewed) {
                reviewedArticleCount++;
            }
        }

        if (reviewedArticleCount == 0) {
            return (new string[](0), new uint[](0), uint(0));
        }

        string[] memory reviewedIpfsHashes = new string[](reviewedArticleCount);
        uint[] memory reviewedVersions = new uint[](reviewedArticleCount);

        uint j = 0;
        for (uint i = 1; i <= articleCount; i++) {
            if (articles[i].isReviewed) {
                reviewedIpfsHashes[j] = articles[i].ipfsHash;
                reviewedVersions[j] = articles[i].version;
                j++;
            }
        }

        return (reviewedIpfsHashes, reviewedVersions, reviewedArticleCount);
    }

    //List of all articles that are to be reviewed
    function getUnreviewedArticles() public view returns (string[] memory, uint[] memory, uint) {
        uint unreviewedArticleCount = 0;
        for (uint i = 1; i <= articleCount; i++) {
            if (!articles[i].isReviewed) {
                unreviewedArticleCount++;
            }
        }

        if (unreviewedArticleCount == 0) {
            return (new string[](0), new uint[](0), uint(0));
        }

        string[] memory unreviewedIpfsHashes = new string[](unreviewedArticleCount);
        uint[] memory unreviewedVersions = new uint[](unreviewedArticleCount);

        uint j = 0;
        for (uint i = 1; i <= articleCount; i++) {
            if (!articles[i].isReviewed) {
                unreviewedIpfsHashes[j] = articles[i].ipfsHash;
                unreviewedVersions[j] = articles[i].version;
                j++;
            }
        }

        return (unreviewedIpfsHashes, unreviewedVersions, unreviewedArticleCount);
    }

} 
