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
    console.log(lines[0].split(' '));
});
