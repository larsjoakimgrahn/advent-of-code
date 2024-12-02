import * as fs from 'fs';

const puzzleInput = fs.readFileSync('input.txt', 'utf8');

type Pair<T1, T2> = {
    first: T1;
    second: T2;
};

const parseInput = (input: string) => {
    const pairs: Array<Pair<number, number>> = input.split('\n')
        .map(v => {
            const split = v.split('   ')

            return {
                first: Number(split[0]),
                second: Number(split[1])
            }
        })
    return {
        first: pairs.map(it => it.first).sort(),
        second: pairs.map(it => it.second).sort()
    }
}

const parsed = parseInput(puzzleInput)

let totalDiff = 0
for (let i = 0; i < parsed.first.length; i++) {
    totalDiff += Math.abs(parsed.first[i] - parsed.second[i])
}
console.log(totalDiff)