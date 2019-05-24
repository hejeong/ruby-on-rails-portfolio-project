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
            <a href="/items/${this.id}"> <img src="${this.imageURL}" class="image">${this.title}</a>
        </div>
    </div>
  `;
  return itemHTML;
}



const bindClick = ()=>{
    $("#items-list-btn").on('click', function(event){
        event.preventDefault();
        getItems();
    })
    $("#item-show").on('click', function(event){
        event.preventDefault();
        getItemShow();
    })
}

const getItems = ()=> {
    fetch(`/items.json`)
    .then(res => res.json())
    .then(items => {
        $("#items-list").html("");
        items.forEach(item => {
            const newItem = new Item(item);
            const newHtml = newItem.formatIndex();
            $("#items-list").append(newHtml);
         
        })
    })
}

const getItemShow = (id)=>{
    fetch(`/items/1.json`)
    .then(res => res.json())
    .then(item => {
        $("#item-show").html("");
        const target = new Item(item);
        const targetHTML = target.formatShow();
        $("#item-show").append(targetHTML);
    })
};
Item.prototype.formatShow = function(){
    const showHTML = `<h1>${this.title}</h1>
    <h3>${this.description}</h3>
    <p>$${this.cost}</p>
    <p>Left in stock: ${this.stock}</p>`;
    return showHTML;
}