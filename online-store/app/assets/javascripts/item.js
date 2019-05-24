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
        const id = event.target.getAttribute("data-id");
        getItemShow(id);
    })
    $("#new_item").on('submit', function(event){
        event.preventDefault();
        const values = $(this).serialize();
        $.post('/items', values)
        .done(function(data){
            $(".wrapper").html("");
            const newHTML = getItemShow(data.id);
            $(".wrapper").append(newHTML);
        })
    })
}

const getItems = ()=> {
    fetch(`/items.json`)
    .then(res => res.json())
    .then(items => {
        $(".wrapper").html("");
        items.forEach(item => {
            const newItem = new Item(item);
            const newHtml = newItem.formatIndex();
            $(".wrapper").append(newHtml);
         
        })
    })
}

const getItemShow = (id)=>{
    fetch(`/items/${id}.json`)
    .then(res => res.json())
    .then(item => {
        $("#.wrapper").html("");
        const target = new Item(item);
        const targetHTML = target.formatShow();
        $(".wrapper").append(targetHTML);
    })
};
Item.prototype.formatShow = function(){
    const showHTML = `<img class="show-image" src="${this.imageURL}" alt="No available image"></img><h1>${this.title}</h1>
    <h3>${this.description}</h3>
    <p>Price: $${this.cost}</p>
    <p>Left in stock: ${this.stock}</p>`;
    return showHTML;
}