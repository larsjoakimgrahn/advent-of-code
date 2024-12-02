"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var fs = require("fs");
var puzzleInput = fs.readFileSync('input.txt', 'utf8');
var parseInput = function (input) {
    var pairs = input.split('\n')
        .map(function (v) {
        var split = v.split('   ');
        return {
            first: Number(split[0]),
            second: Number(split[1])
        };
    });
    return {
        first: pairs.map(function (it) { return it.first; }),
        second: pairs.map(function (it) { return it.second; })
    };
};
var parsed = parseInput(puzzleInput);
var occurences = parsed.second.reduce(function (acc, curr) {
    return acc[curr] ? ++acc[curr] : acc[curr] = 1, acc;
}, {});
var values = parsed.first.map(function (v) { return v * (occurences[v] || 0); });
var sum = values
    .reduce(function (acc, curr) { return acc + curr; }, 0);
console.log(sum);
