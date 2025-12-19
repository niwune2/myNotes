// Question1-2 偶数の個数も同時に返す

const numbers = [1, 2, 3, 4, 5, 6];
const evens = [];

function filterEvenWithSum(array) {
    if (!Array.isArray(array)) {
        return [];
    }

    for ( let num of array) {
        if ( num % 2 === 0) {
            evens.push(num);
        }
    }
    return evens;
}

console.log(filterEvenWithSum(numbers));
console.log(evens.length);
