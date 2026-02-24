const readline = require('readline');
const lines = [];
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.on('line', (line) => {
    lines.push(line);
});

rl.on('close', () => {
    let sum = 0;
    let additionStart = 1;
    // let additionCount = 0;
    for (let i = additionStart; i <= Number(lines[0]); i++){
        sum += Number(lines[i]);
    }
    console.log(sum);
});

