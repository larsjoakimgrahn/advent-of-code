import * as fs from 'fs';

const puzzleInput = fs.readFileSync('input.txt', 'utf8');

const regex = /mul\((\d{1,3}),(\d{1,3})\)/g

const result = [...(puzzleInput.matchAll(regex))]

const value = result.reduce((acc, curr) => acc + Number(curr[1]) * Number(curr[2]), 0)
console.log(value)
