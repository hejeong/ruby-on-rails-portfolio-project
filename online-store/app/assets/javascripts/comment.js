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
const bindCommentsClick = () => {
    $(document).on('click', ".comment-link", function(event){
        event.preventDefault();
        const id = event.target.getAttribute("data-id");
        getComment(id);
    })
}
Comment.prototype.formatComment = function(){
    let commentHTML = `
    <div class="comment-container data-id="${this.id}">
        ${this.content}
    </div>
  `;
  return commentHTML;
}