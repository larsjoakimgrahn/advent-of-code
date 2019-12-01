const Math = require('mathjs');

const fs = require('fs');
const path = require('path');

const lineReader = require('readline').createInterface({
  input: fs.createReadStream(path.resolve(__dirname, './input.txt')),
});

const moduleWeight = mass => Math.floor(mass / 3) - 2;

const calcWeight = mass => {
  const modWeight = moduleWeight(mass);
  if (modWeight <= 0) {
    return 0;
  }
  return modWeight + calcWeight(modWeight);
};

let weight = 0;

lineReader
  .on('line', line => {
    const modWeight = calcWeight(line);
    weight += modWeight;
  })
  .on('close', () => {
    console.log(`WEIGHT = ${weight}`);
  });
