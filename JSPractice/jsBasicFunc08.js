const refValue = 5;
const numberArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const result = numberArray.filter(number =>
    number % 2 === 0 && number > refValue
);

console.log(result);
