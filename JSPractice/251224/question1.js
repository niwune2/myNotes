// Question 1

// 
const numbers = [1,2,3,4,5,6];

function filterEven(array) {
    const even = [];
    for (let i = 0; i < array.length; i++) {
        if (array[i] % 2 === 0) {
            even.push(array[i]);
        }
    }
    return even;
}

console.log(filterEven(numbers));
console.log(`${filterEven(numbers).length}`);
