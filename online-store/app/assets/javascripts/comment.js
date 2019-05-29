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
        const url = event.target.getAttribute("href");
        getComment(url + ".json");
    })
}

const getComment = (url) =>{
    fetch(url)
    .then(res => res.json())
    .then(comment => {
        let targetHTML = "<h3>User Reviews:</h3>";
        comment.forEach(newComment => {
            const target = new Comment(newComment);
            targetHTML += target.formatComment();
        })
        $(".top-div").append(targetHTML);
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