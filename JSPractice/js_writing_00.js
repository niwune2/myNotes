// 課題 1 — 偶数だけ取り出す

// 指示：配列の中から偶数だけを取り出して、新しい配列を返す関数 filterEven を作りなさい。
// 実装条件：for ループで配列を走査し、if で偶数判定（% を使う）を行う。Array.prototype.filter は使わない。
// 入力 / 出力例：filterEven([1,2,3,4,5,6]) → [2,4,6]
// 発展：元の配列を変えずに、偶数の個数も同時に返す（オブジェクト { evens: [...], count: N }）。

function filterEven(array) {
    for (let i = 0; i < array.length; i++) {
        let even = [];
        let evenSum = 0;

        if (array[i]%2 === 0) {
            even += array[i];
            evenSum++;
        }
    }
}

const numbers = [0, 1, 2, 3, 4, 5];
console.log(filterEven(numbers));