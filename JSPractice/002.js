// 偶数の個数を数える関数
function countEvenNumbers(numbers) {
  // `number`に数値の入った配列を入れる

  let count = 0;
  // 変数countを初期化

  for (let i = 0; i < numbers.length; i++) {
    // 配列の要素数だけループする

    if (numbers[i] % 2 === 0) {
      // 配列dataのi番目の要素が2で割った余りが0のとき（＝偶数）、変数countに1加算する
      count++;
    }
  }
  // 変数countの値を返す
  return count;
}

//  数値を収めた配列
const data = [3, 8, 5, 12, 7, 10];

// 定数resultに、配列を関数で処理した内容を代入する
const result = countEvenNumbers(data);

// コンソールに結果を表示する
console.log(result);
