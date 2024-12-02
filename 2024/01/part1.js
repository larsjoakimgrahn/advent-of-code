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
        first: pairs.map(function (it) { return it.first; }).sort(),
        second: pairs.map(function (it) { return it.second; }).sort()
    };
};
var parsed = parseInput(puzzleInput);
var totalDiff = 0;
console.log(parsed);
for (var i = 0; i < parsed.first.length; i++) {
    totalDiff += Math.abs(parsed.first[i] - parsed.second[i]);
    console.log(Math.abs(parsed.first[i] - parsed.second[i]));
}
console.log(totalDiff);
