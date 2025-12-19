// question1.js

const numbers = [1, 2, 3, 4, 5, 6];

function filterEven(array) {
    let even = [];
    for ( let i of array ) {
        if ( i % 2 === 0 ) {
            even.push(i);
        }
    }
    return even;
}

console.log(filterEven(numbers));

//let filterEven = (array) => {
//    for ( let i of array) {
//        if ( i % 2 === 0 ) {
//            console.log(i);
//        }
//    }
//}

//console.log(filterEven(numbers));
//console.log(filterEven.map(
