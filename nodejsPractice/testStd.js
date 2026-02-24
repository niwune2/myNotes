const readline = require('readline');
const lines = [];
const rl = readline.createInterface({
    input:process.stdin,
    output:process.stdout
});

rl.on('line', (line) => {
    line.push(line);
});

rl.on('close', () => {
    // 処理
});

