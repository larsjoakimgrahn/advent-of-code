import * as fs from 'fs';
const puzzleInput = fs.readFileSync('input.txt', 'utf8');
const mulRegex = /mul\((\d{1,3}),(\d{1,3})\)/;
const parseMul = (input) => {
    const res = input.match(mulRegex);
    if (res.index == 0) {
        return Number(res[1]) * Number(res[2]);
    }
    return 0;
};
const parseDoDont = (input, oldValue) => {
    if (input.startsWith("do()")) {
        return true;
    }
    if (input.startsWith(("don't"))) {
        return false;
    }
    return oldValue;
};
let keepDoing = true;
let sum = 0;
for (let i = 0; i < puzzleInput.length; i++) {
    const char = puzzleInput[i];
    if (char == 'm' && keepDoing) {
        sum += parseMul(puzzleInput.slice(i));
    }
    if (char == 'd') {
        keepDoing = parseDoDont(puzzleInput.slice(i), keepDoing);
    }
}
console.log(sum);
