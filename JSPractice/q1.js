'use strict';

const items = [
    { name:"coke",     price:150, qty:5 },
    { name:"bandaid",  price:700, qty:2 },
    { name:"onigiri",  price:200, qty:2 },
    { name:"ramen",    price:250, qty:1 },
    { name:"chocolate",price:200, qty:3 },
];

function createReceipt(items) {
    let total = 0;
    let totalQty = 0;
    let discountRate = 0;
    let discount = 0;
    let finalTotal = 0;

//    items.forEach(item => {
//        let priceByqty = 0;
//        let qtySum = 0;
//
//        priceByqty = (item.price * item.qty);
//        total += priceByqty;
//        totalQty += item.qty;
//        });

    

    if ( total >= 3000 ) {
        discountRate = 0.1;
    }

    discount = Math.floor(total * discountRate);

    finalTotal = (total - discount);

    return total;
}
console.log(createReceipt(items));
