const numberArray = [];

function generateNumber(min, max) {
    for (let i = min; i < max; i++) {
        numberArray.push(i);
    }
}

generateNumber(2, 30);

function filterOddOverNumber(array, referenceValue) {
    const biggerAndOddNumber = [];
    for (let i = 0; i < array.length; i++) {
        if (array[i] % 2 === 1 && array[i] > referenceValue) {
            biggerAndOddNumber.push(array[i]);
        }
    }
    return biggerAndOddNumber;
}

console.log(filterOddOverNumber(numberArray, 6));

const referenceValue = 3

const filterOddOverNumber2 = numberArray.filter(number =>
    number % 2 === 1 && number >referenceValue
);

console.log(filterOddOverNumber2);
