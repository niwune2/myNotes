const array = [];

function generateRandomNumber(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function generateNumberArray(numberOfElement){
    for (let i = 0; i < numberOfElement; i++) {
        array.push(generateRandomNumber(1,199));
    }
}

function sortNumberArray(array) {
    return array.toSorted((a, b) => a - b);
}


generateNumberArray(50);
const ascendingArray = sortNumberArray(array);
const mapped = ascendingArray.map((x) => x * 3);
console.log(`ascendingArray`, ascendingArray);
console.log(`mapped`, mapped);
