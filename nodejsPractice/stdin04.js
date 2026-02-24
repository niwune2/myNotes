const readline = require('readline');
const lines = [];
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.on('line', (line) => {
    lines.push(line);
});

rl.on('close',() => {
    let splitArray = lines[0].split(' ');
    for(let i = 0; i < splitArray.length; i++) {
        console.log(splitArray[i]);
    }
});

