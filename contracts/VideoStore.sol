// solium-disable linebreak-style
pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;
contract VideoStore {

    struct Comment {
        string content;
        string userEmail;
        uint commentTimestamp;
        uint likes;
        Comment[] replies;
    }

    struct Video {
        string title;
        string description;
        uint videoTimestamp;
        string hashes;
        string hash;
        string[] tags;
        string category;
        string userEmail;
        uint commentThreadId;
    }

    mapping(string=>uint[]) tagMapping;
    mapping(uint => Video) videoList;

    uint videoListCount = 0;

    Comment[] commentThreads; // Tags are used to search the database.

    function getVideoCount() 
    public 
    view 
    returns (uint) {
        return videoListCount;
    }

    function addVideo(
        string memory _title,
        string memory _description,
        string memory _hash,
        string memory _tags,
        string memory _category,
        string memory _userEmail
        )
    public
    {
        // Add insertion functionality.
        // string hashes is going to be a list of string saved as one.
        // This is because solidity doesnot have a way to serialize and deserialize a string array.
        // using ; as a delimiter.
        // similar logic is going to be used for the tags array or for any arrays for that matter.

        videoListCount++;

        Video memory foo;
        foo.title = _title;
        foo.description = _description;
        foo.category = _category;
        foo.userEmail = _userEmail;
        foo.hash = _hash;
        foo.videoTimestamp = now;

        videoList[videoListCount] = foo;

        // extract all tags in the _tags string.
        // create tag entry, and push the video id to tagMapping

        // string[] tags = generateTags(_tags);

    }

    function getVideoListCount()
    public
    returns (uint) {
      return videoListCount;
    }

    function getVideo(uint _id)
    public
    returns (Video memory) {
      require(_id <= videoListCount, "Video does not exist");
      return videoList[_id];
    }

    function addVideoIdToTag(string memory _tag, uint videoId)
    internal
    {
        tagMapping[_tag].push(videoId);
    }

    function searchVideo(string memory _tags)
    public
    view
    returns (uint[] memory videoIds)
    {

        // Implement search algorithm here.
        // Split _tags into string array
        // Figure out Ranking Algorithm

    }



    function updateVideo(
        uint _id,
        string memory _title,
        string memory _description,
        string memory _hashes,
        string memory _tags,
        string memory _category,
        string memory _userEmail
        )
    public
    {

    }

    function deleteVideo(uint _id)
    public
    {

    }

    //________________________________Comment Functions______________________________________//

    // struct Comment {
    //     string content;
    //     string userEmail;
    //     uint commentTimestamp;
    //     uint likes;
    //     Comment[] replies;
    // }


  //________________________________Helper Functions______________________________________//

//   function generateTags(string memory _tags)
//   internal
//   returns (string[] memory tags)
//   {

//     // separate tags into string array.
//     // separate using delimiter ;

//   }

}
