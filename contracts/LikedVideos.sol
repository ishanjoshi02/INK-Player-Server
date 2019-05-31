contract LikedVideos {

    mapping(string=>uint[]) liked;

    function addVideo(string memory _email, uint _id)
    public {
        if (!isLiked(_email, _id))
            liked[_email].push(_id);
    }

    function isLiked(string memory _email, uint _id)
    public
    view
    returns(bool) {
        uint i;
        for (i = 0;i < liked[_email].length;i++) {
            if (liked[_email][i] == _id) {
                return true;
            }
        }
        return false;
    }

    function removeVideo(string memory _email, uint _id)
    public
    {
        if (isLiked(_email, _id)) {
             uint i;
        for (i = 0;i < liked[_email].length;i++) {
            if (liked[_email][i] == _id) {
                delete liked[_email][i];
            }
        }
        }
    }

}