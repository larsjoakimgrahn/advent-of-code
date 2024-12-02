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
        first: pairs.map(it => it.first),
        second: pairs.map(it => it.second)
    }
}

const parsed = parseInput(puzzleInput)

const occurences = parsed.second.reduce((acc, curr) => {
    return acc[curr] ? ++acc[curr] : acc[curr] = 1, acc
}, {});

const values = parsed.first.map(
    v => v * (occurences[v] || 0)
)

const sum = values
    .reduce((acc, curr) => acc + curr, 0);
console.log(sum)
