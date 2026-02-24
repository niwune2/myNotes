

const items = [
     { name:"coke",     price:150, qty:5 },
     { name:"bandaid",  price:700, qty:2 },
     { name:"onigiri",  price:200, qty:2 },
     { name:"ramen",    price:250, qty:1 },
     { name:"chocolate",price:200, qty:3 },
];

function createReceipt(items) {

    const receipt = {};

    let total = 0;
    let totalQty = 0;
    let discountRate = 0;
    let discount = 0;
    let finalTotal = 0;
    let summary = "";

    if (Array.isArray(items) === false) {
        receipt.total = 0;
        receipt.totalQty = 0;
        receipt.discountRate = 0;
        receipt.discount = 0;
        receipt.finalTotal = 0;
        receipt.summary = "入力エラー";
    } else {


        for (let i = 0; i < items.length; i++) {
            total += items[i].price * items[i].qty;
            totalQty += items[i].qty;
        }

        if ( total >= 3000 ) {
            discountRate = 0.1;
        }
        discount = Math.floor(total * discountRate);
        finalTotal = (total - discount);
        summary = `合計 ${totalQty} 点 / 割引${discount} 円 / 支払い${finalTotal} 円`;

        receipt.total = total;
        receipt.totalQty = totalQty;
        receipt.discount = discount;
        receipt.finalTotal = finalTotal;
        receipt.summary = summary;
    }
    return receipt;
}


console.log(createReceipt(items));
