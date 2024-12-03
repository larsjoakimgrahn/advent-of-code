import * as fs from 'fs';

const puzzleInput = fs.readFileSync('input.txt', 'utf8');

const parseInput = (input: string) => {
    const reports: Array<Array<number>> = input.split('\n')
        .map(report => {
            return report.split(' ').map(v => Number(v))
        })
    return reports
}
const reports = parseInput(puzzleInput)

const sameOrGreater = (element: number, index: number, array: number[]) => {
    const prev = array[index - 1];
    const difference = Math.abs(element - prev);
    return !index || (element > prev && difference <= 3 && difference >= 1);
};

const sameOrLesser = (element: number, index: number, array: number[]) => {
    const prev = array[index - 1];
    const difference = Math.abs(element - prev);
    return !index || (element < prev && difference <= 3 && difference >= 1);
};

const getVariants = (arr: number[]) => {
    const result = []
    for (let i = 0; i < arr.length; i++) {
        result.push(arr.filter((_, index) => index !== i));
    }
    return result
}

const result = reports.reduce((acc: number, report: number[]) => {
    const allPossibleVariants = getVariants(report)
    const found = allPossibleVariants.find(variant => {
        console.log(variant)
        return variant.every(sameOrLesser) || variant.every(sameOrGreater)
    })
    if (found) {
        return acc+1
    } else {
        return acc
    }

}, 0)

console.log(result)