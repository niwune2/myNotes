function countEvenNumbers(numbers) {
  let count = 0;
  for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 === 0) {
      count++;
    }
  }
  return count;
}

const data = [3, 8, 5, 12, 7, 10];
const result = countEvenNumbers(data);
console.log(result);
