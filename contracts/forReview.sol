// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract ArticleReview {
    uint public articleCount = 0;

    //this is the address of the developement pool that receives the payment for the article
    address payable public poolAddress = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);


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

    //to list all articles deployed so far. 
    function getAllArticles() public view returns (string[] memory, uint[] memory, bool[] memory, uint) {
        if (articleCount == 0) {
            return (new string[](0), new uint[](0), new bool[](0), uint (0));
        }
        // to check if it's empty or not
        // creating arrays to store the values
        string[] memory allIpfsHashes = new string[](articleCount);
        uint[] memory allVersions = new uint[](articleCount);
        bool[] memory allIsReviewed = new bool[](articleCount);
        // iterate through the articles and store the values in above arrays
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
        } // to iterate through all the articles and check if they are reviewed or not

        if (reviewedArticleCount == 0) {
            return (new string[](0), new uint[](0), uint(0));
        }   // if there are no articles reviewed

        string[] memory reviewedIpfsHashes = new string[](reviewedArticleCount);
        uint[] memory reviewedVersions = new uint[](reviewedArticleCount);
        // to store the IPFS hashes and version numbers of all the reviewed articles
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

    //List of all articles that are meant to be reviewed
    function getUnreviewedArticles() public view returns (string[] memory, uint[] memory, uint) {
        uint unreviewedArticleCount = 0;
        // first count number of unreviewed articles
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
        // to store the IPFS hashes and versions of only unreviewed articles
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

    //For reviewers to submit their feedback if author accepts them as reviewer
    function submitReview(string memory _ipfsHash, uint _version, bool _isReviewed) public {
        require(bytes(_ipfsHash).length > 0, "IPFS hash cannot be empty");
        // if IPFS hash is not empty. Loops through articles and checks if the IPFS hash and version number match given arugments
        for (uint i = 1; i <= articleCount; i++) {
            if (keccak256(abi.encodePacked(articles[i].ipfsHash)) == keccak256(abi.encodePacked(_ipfsHash)) && articles[i].version == _version) {
                articles[i].isReviewed = _isReviewed;
            }
        }
    }

    //for authors to accept reviewer's updated article, make changes and create a new version that is linked to the original article on IPFS
    function acceptReview(string memory _ipfsHash, uint _version, string memory _newIpfsHash, uint _newVersion) public {
        require(bytes(_ipfsHash).length > 0, "IPFS hash cannot be empty");
        require(bytes(_newIpfsHash).length > 0, "IPFS hash cannot be empty");
        // if IPFS hash is not empty. Loops through articles and checks if the IPFS hash and version number match given arugments
        for (uint i = 1; i <= articleCount; i++) {
            if (keccak256(abi.encodePacked(articles[i].ipfsHash)) == keccak256(abi.encodePacked(_ipfsHash)) && articles[i].version == _version) {
                articles[i].isReviewed = false;
                articleCount++;
                articles[articleCount] = Article(msg.sender, _newIpfsHash, _newVersion, false);
            }
        }
    }

    //function to check if an article is reviewed or not
    function isReviewed(string memory _ipfsHash, uint _version) public view returns (bool) {
        require(bytes(_ipfsHash).length > 0, "IPFS hash cannot be empty");
        // compares given IPFS hash and version number with the IPFS hash and version number of this particular articles
        for (uint i = 1; i <= articleCount; i++) {
            if (keccak256(abi.encodePacked(articles[i].ipfsHash)) == keccak256(abi.encodePacked(_ipfsHash)) && articles[i].version == _version) {
                return articles[i].isReviewed;
            }
        }
    }

    //function to purchase an article (based on IPFS hash)(and only if isReviewed=True) and split the payment between the author who gets 80% of payment, the reviewers who get 15% of payment further split equally based on the number of reviewers and the platform which gets 5% of payment into a specific address on metamask
    
    address payable platform = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    
    function purchaseArticle(string memory _ipfsHash, uint _version) public payable {
        require(bytes(_ipfsHash).length > 0, "IPFS hash cannot be empty");
        require(msg.value > 0, "Value must be greater than 0");
        // if IPFS hash is not empty. Loops through articles and checks if the IPFS hash and version number match given arugments
        for (uint i = 1; i <= articleCount; i++) {
            if (keccak256(abi.encodePacked(articles[i].ipfsHash)) == keccak256(abi.encodePacked(_ipfsHash)) && articles[i].version == _version) {
                address payable author = payable(address(uint160(articles[i].owner)));
                uint authorAmount = (msg.value * 80) / 100;
                author.transfer(authorAmount);
                // 80% to author
                uint reviewerAmount = (msg.value * 15) / 100;
                uint reviewerCount = 0;
                for (uint j = 1; j <= articleCount; j++) {
                    if (keccak256(abi.encodePacked(articles[j].ipfsHash)) == keccak256(abi.encodePacked(_ipfsHash)) && articles[j].version == _version && articles[j].isReviewed) {
                        reviewerCount++;
                    }
                }
                // 15% to reviewers, and below loop splits the 15% equally among the reviewers
                uint reviewerShare = reviewerAmount / reviewerCount;
                for (uint j = 1; j <= articleCount; j++) {
                    if (keccak256(abi.encodePacked(articles[j].ipfsHash)) == keccak256(abi.encodePacked(_ipfsHash)) && articles[j].version == _version && articles[j].isReviewed) {
                        address payable reviewer = payable(address(uint160(articles[j].owner)));
                        reviewer.transfer(reviewerShare);
                    }
                }
                // 5% to platform (in this case, the platform is the address of the development fund)
                uint platformAmount = (msg.value * 5) / 100;
                platform.transfer(platformAmount);
                
            }
        }
    }

} 
