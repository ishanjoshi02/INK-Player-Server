
pragma experimental ABIEncoderV2;
contract Playlist {
    struct List {
        string name;
        uint[] ids;
        string ownerEmail;
    }
        
    uint listCount = 0;
    mapping(uint=>List) lists;
    
    function createPlaylist
    (string memory _name, string memory _ownerEmail)
    public
    returns (uint _id)
    {
        lists[listCount].name = _name;
        lists[listCount].ownerEmail = _ownerEmail;
        listCount++;
        _id = listCount;
    }
    
    function addVideoToPlaylist
    (uint listId, uint videoId)
    public 
    {
        if (!alreadyAdded(listId, videoId)) {
            lists[listId].ids.push(videoId);
        }
    }
    
    function getPlaylist
    (uint listId)
    public 
    view 
    returns(List memory playlist)
    {
        playlist = lists[listId];
    }
    
    function getPlaylistListCount 
    ()
    public
    view
    returns (uint) {
        return listCount;
    }
    
    function alreadyAdded 
    (uint listId, uint videoId) 
    public
    view
    returns(bool)
    {
        uint i;
        for (i = 0;i < lists[listId].ids.length;i++) {
            if (lists[listId].ids[i] == videoId) {
                return true;
            }
        }
        return false;
    }
    
    function removeVideoFromPlaylist
    (uint listId, uint videoId) 
    public
    {   
        uint i;
        if (alreadyAdded(listId, videoId)) {
            for (i = 0;i < lists[listId].ids.length;i++) {
                if (lists[listId].ids[i] == videoId) {
                  delete lists[listId].ids[i];
                }
            } 
        }
    }
    
    function deletePlaylist
    (uint listId)
    public
    returns (uint id)
    {
        id = listId;
        delete lists[listId];
    }
    
}