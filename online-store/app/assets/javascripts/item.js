$(document).ready(()=>{
    bindClick()
});
function Item(item){
    this.id = item.id;
    this.title = item.title;
    this.description = item.description;
    this.cost = item.cost;
    this.rating = item.rating;
    this.stock = item.stock;
    this.imageURL = item.image_url;
}

Item.prototype.formatIndex = function(){
    let itemHTML = `
    <div class = "col-33">
        <div class="item-index">
            <a href="/items/${this.id}"> <img src="${this.imageURL}" class="image" data-id="${this.id}">${this.title}</a>
        </div>
    </div>
  `;
  return itemHTML;
}



const bindClick = ()=>{
    $(document).on('click', ".shop-link", function(event){
        event.preventDefault();
        getItems();
    })
    $(document).on('click', ".item-index", function(event){
        event.preventDefault();
        const id = event.target.getAttribute("data-id");
        getItemShow(id);
    })
    $(document).on('submit', "#new_item", function(event){
        event.preventDefault();
        const values = $(this).serialize();
        $.post('/items', values)
        .done(function(data){
            $(".wrapper").html("");
            const newHTML = getItemShow(data.id);
            $(".wrapper").append(newHTML);
        })
    })
};


const getItems = ()=> {
    fetch(`/items.json`)
    .then(res => res.json())
    .then(items => {
        $(".wrapper").html("");
        let newHtml = `<div class="top-div"><a class="link back" href="/">Back</a>`
        if($(".profile a").text() == "admin"){
            newHtml += `<a class="button" href="/items/new">Create Item Listing</a><br>`
        }else{
            newHtml += `<br>`
        }
        items.forEach(item => {
            const newItem = new Item(item);
            newHtml += newItem.formatIndex();
        })
        newHtml += `</div>`
        $(".wrapper").append(newHtml);
    })
};

const getItemShow = (id)=>{
    fetch(`/items/${id}.json`)
    .then(res => res.json())
    .then(item => {
        $(".wrapper").html("");
        const target = new Item(item);
        const targetHTML = target.formatShow();
        $(".wrapper").append(targetHTML);
    })
};
Item.prototype.formatShow = function(){
    let showHTML = `<div class="top-div"><img class="show-image" src="${this.imageURL}" alt="No available image"></img><h1>${this.title}</h1>
                    <h3>${this.description}</h3>
                    <p>Price: $${this.cost}</p>
                    <p>Left in stock: ${this.stock}</p>`
    if($(".profile a").text() != "admin"){
        showHTML += `<form class="new_transaction" id="new_transaction" action="/items/${this.id}/purchase" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="pFPpL4rvXm2xiJDVcZ9ibJb0gkA4pTStPm9FitW83UGLWZTiGQli2BAcfsxpvRA1e7xlrqLlBHnHUjwzreZy/g==">
        <label for="transaction_quantity">Quantity</label>
        <input value="1" type="number" name="transaction[quantity]" id="transaction_quantity">
        <a class="link back" href="/items">Back</a>  
        <input type="submit" name="commit" value="Purchase" class="button" data-disable-with="Purchase">
        </form><br><br>
        <a href="/items/${this.id}/comments/new">Create a comment</a> |
        <a href="/items/${this.id}/comments">View comments</a></div>`
    }else {
        showHTML += `<a class="link back" href="/items">Back</a>
        <a class="edit" href="/items/${this.id}/edit">Edit this item</a>
        <a class="link delete" rel="nofollow" data-method="delete" href="/items/${this.id}">Delete this item</a></div>`
    }
    return showHTML;
};

