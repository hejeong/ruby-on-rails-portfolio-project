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
        if(event.target.innerHTML == "View comments"){
            event.target.innerHTML = "Hide comments"
            const url = event.target.getAttribute("href");
            getComment(url + ".json");
        }else{
            $(".comments-container").remove();
            event.target.innerHTML = "View comments"
        }
    })
}

const getComment = (url) =>{
    fetch(url)
    .then(res => res.json())
    .then(comment => {
        let targetHTML = `<div class="comments-container"><h3>User Reviews:</h3>`;
        comment.forEach(newComment => {
            const target = new Comment(newComment);
            targetHTML += target.formatComment();
        })
        targetHTML += `</div>`
        $(".top-div").append(targetHTML);
    })
}
Comment.prototype.formatComment = function(){
    let commentHTML = `
    <div class="comment-container data-id="${this.id}">
    →  ${this.content}
    </div><br>
  `;
  return commentHTML;
}