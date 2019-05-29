$(document).ready(()=>{
    bindCommentsClick()
});
class Comment {
    constructor(commentJson){
        this.id = commentJson.id;
        this.userID = commentJson.user_id;
        this.itemID = commentJson.item_id;
        this.content = commentJson.content;
    }
}