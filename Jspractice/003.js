function findLargestNumber(numbers) {
  let largest = numbers[0];
  for (let i = 1; i < numbers.length; i++) {
    if (numbers[i] > largest) {
      largest = numbers[i];
    }
  }
  return largest;
}

const values = [4, 15, 9, 22, 7, 18];
const result = findLargestNumber(values);
console.log(result);

