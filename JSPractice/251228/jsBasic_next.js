
function sumTo(n) { 
    let sum = 0;
    let count = 1;
    while ( count <= n ) {
        // countより小さい間ループを繰り返す
        // 条件がtrueである間繰り返す
        sum += count;
        count++;
    }
    return sum;
}

console.log(sumTo(5));
