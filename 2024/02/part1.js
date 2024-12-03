"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var fs = require("fs");
var puzzleInput = fs.readFileSync('input.txt', 'utf8');
var parseInput = function (input) {
    var reports = input.split('\n')
        .map(function (report) {
        return report.split(' ').map(function (v) { return Number(v); });
    });
    return reports;
};
var reports = parseInput(puzzleInput);
var sameOrGreater = function (element, index, array) {
    var prev = array[index - 1];
    var difference = Math.abs(element - prev);
    return !index || (element > prev && difference <= 3 && difference >= 1);
};
var sameOrLesser = function (element, index, array) {
    var prev = array[index - 1];
    var difference = Math.abs(element - prev);
    return !index || (element < prev && difference <= 3 && difference >= 1);
};
var result = reports.reduce(function (acc, report) {
    if (report.every(sameOrLesser) || report.every(sameOrGreater)) {
        return acc + 1;
    }
    else {
        return acc;
    }
}, 0);
console.log(result);
