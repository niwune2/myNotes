// 渡されたパラメータの中で、最も大きい数値を探す関数
function findLargestNumber(numbers) {
  //numbersには数値を格納した配列を指定する

  let largest = numbers[0];
  // 変数largestにパラメータnumbersの0番目の要素を代入して初期化

  for (let i = 1; i < numbers.length; i++) {
    //パラメータの要素数の分だけループする。iがnumbersの要素の数より少ない間までループ。
    if (numbers[i] > largest) {
      // 条件で、numbersのi番目の要素がlargestにある要素より大きい場合、largestにi番目の要素を代入する
      //すべてのnumbersの素に対して比較し、大きいものが見つかり次第入れ替えていく
      largest = numbers[i];
    }
  }
  return largest;
  // 関数が変数largestの値を返す
}

const values = [4, 15, 9, 22, 7, 18];
//検索対象の配列

const result = findLargestNumber(values);
// 定数resultに配列valuesを関数で処理した値を代入する

console.log(result);
//コンソールにresultに代入された値（最も大きい数値）を表示する。
