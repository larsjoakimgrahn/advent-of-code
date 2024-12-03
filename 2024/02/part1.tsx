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

const result = reports.reduce((acc: number, report: number[]) => {
    if (report.every(sameOrLesser) || report.every(sameOrGreater)) {
        return acc + 1
    } else {
        return acc
    }
}, 0)


console.log(result)