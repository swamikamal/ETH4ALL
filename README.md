
  # Eth4All Hackathon - ScholarSwapRealm - Please find attached demo video.

  In this project, we built a Decentralized Peer Review system to publish, review and purchase academic articles.
  
  3 actors - Buyer, author, peer reviewers
  
  Say, Prakyath is a PhD student at JNU. He wants to buy a research paper on a topic, say Climate Change. So he goes to a decentralized exchange called ScholarSwapRealm and finds some interesting articles. Buys an article for, say 20 MATIC. 

  16 MATIC goes to the author, Kamal who published the paper successfully. 3 MATIC gets distributed to, say 4 Peer Reviewers in this case. Remaining 1    MATIC to the TruePeer pool for further develop the TruePeer ecosystem and aid development efforts.
  
  Kamal publishes a paper, ‘climate_change_v1’ which is not yet eligible for sale. Anand is a qualified peer reviewer. He looks for papers which include ‘v‘ in their title (as in version) and finds Kamal’s paper. Anand reviews it and submits feedback. Kamal makes changes and submits ‘climate_change_v2’. Similarly, 1 more qualified reviewer provides feedback, Kamal Makes changes and submits ‘climate_change_v3’. Then 2 more people review it and give their go-ahead, meaning, it’s ready to be published. 

  Now, Kamal finalizes the paper and submits his paper ‘climate_change’ without a ‘v’. It is now available for sale to people like Prakyath.

  Research papers are stored on the IPFS using filecoin. As feedback is presented, multiple versions can be created as IPFS supports versioning of files. To define the originality of a paper using FileCoin, the file would be hashed and stored on the FileCoin network as a unique piece of data. The hash acts as a digital fingerprint of the file and allows it to be easily retrieved and verified. When a user wants to verify the originality of a file, the hash of the file can be compared to the hash stored on the FileCoin network. If the hashes match, it can be determined that the file is original and has not been altered or tampered with. If the hashes do not match, it may indicate that the file has been altered or is a duplicate.
  
  Push protocol is used to send notifications everytime a reviewer provides feedback, when a paper get published, and everytime it is puchased.
  
  We used Arcana Auth to authenticate users by sending a link to their email ID everytime they had to login.
