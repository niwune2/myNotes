const nums = [3, -1, 4, 1, 5, 9];
function calc(a) {
	  let t = 0;
	  for (let i = 0; i < a.length; i++) {
		      if (a[i] % 2 === 0) t += a[i];
		      else t -= a[i];
		    }
	  return a.filter(n => n > 0).map(n => n * 2).reduce((p, c) => p + c, 0) === 0 ? t : t + 1;
}
const result = calc(nums);
