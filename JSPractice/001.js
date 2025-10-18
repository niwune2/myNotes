const nums = [3, -1, 4, 1, 5, 9];
// 処理する数値を格納した配列

// ↓計算するための関数
function calc(a) {
		// パラメータaに入れたものを計算する関数
	  let t = 0;
	  	// 計算結果を入れるための変数t
	  for (let i = 0; i < a.length; i++) {
			// 配列aの要素を順番に処理する
			// `.length`で配列の長さを取得する
		      if (a[i] % 2 === 0) t += a[i];
			  // 
		      else t -= a[i];
		    }
	  return a.filter(n => n > 0).map(n => n * 2).reduce((p, c) => p + c, 0) === 0 ? t : t + 1;
}
const result = calc(nums);
