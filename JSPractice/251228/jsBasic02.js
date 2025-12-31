
function filterOverThree(numbers) {
    const biggerThan3 = [];
    for (const number of numbers) {
        if (number > 3) {
            biggerThan3.push(number);
        }
    }
    return biggerThan3;
}

const numberArray = [1,3,4,2,6];

console.log(filterOverThree(numberArray));
