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
    const splitArray = lines[0].split(' ');
    let sum = 0;
    for (let i = 0; i < splitArray.length; i++) {
        sum += Number(splitArray[i]);
    }
    console.log(sum);
});
