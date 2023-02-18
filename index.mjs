import { NFTStorage, File } from "nft.storage";

// The 'mime' npm package helps us set the correct file type on our File objects
import mime from "mime";

// The 'fs' builtin module on Node.js provides access to the file system
import fs from "fs";

// Import the NFTStorage class and File constructor from the 'nft.storage' package
import { NFTStorage, File } from "nft.storage";

// The 'mime' npm package helps us set the correct file type on our File objects
import mime from "mime";

// The 'fs' builtin module on Node.js provides access to the file system
import fs from "fs";

// The 'path' module provides helpers for manipulating filesystem paths
import path from "path";

const client = new NFTStorage({
  token:
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDUyQkZkM2MzYTVFZjcyMjExNmQ5ZjBCNUU3NDg0OEY1MEE5OGU4ZEMiLCJpc3MiOiJuZnQtc3RvcmFnZSIsImlhdCI6MTY3NjczNjAxNTA3OCwibmFtZSI6IkV0aDRBbGwgUHJvamVjdCJ9.08cvttXy7_YtokATwqVBAVgkO3oWBwgbyWIGcLZibmo",
});

async function main() {
  const metadata = await client.store({
    name: "Pinpie",
    description: "Pin is not delicious beef!",
    image: new File(
      [
        /* data */
      ],
      "pinpie.jpg",
      { type: "image/jpg" }
    ),
  });
  console.log(metadata.url);
  // ipfs://bafyreib4pff766vhpbxbhjbqqnsh5emeznvujayjj4z2iu533cprgbz23m/metadata.json
}

main();
