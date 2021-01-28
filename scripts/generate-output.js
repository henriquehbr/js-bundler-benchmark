import { createReadStream } from 'fs'
import Table from 'cli-table3'
import csv from 'csv-parser'

const csvToJson = csvFile =>
  new Promise((resolve, reject) => {
    let jsonData = []
    createReadStream(csvFile, { encoding: 'utf-8' })
      .pipe(csv())
      .on('data', data => jsonData.push(data))
      .on('end', () => resolve(jsonData))
      .on('error', reject)
  })

const [esbuildResults] = await csvToJson('benchmark.csv')

/*{
  bundler: 'Rollup',
  time: argv.rollupTime + 's',
  relativeSlowdown: `${argv.rollupTime / argv.esbuildTime} (${
    (argv.rollupTime * 100) / argv.esbuildTime
  }%)`,
  outputSize: argv.esbuildSize
},
{
  bundler: 'Webpack',
  time: argv.webpackTime + 's',
  relativeSlowdown: `${argv.esbuildTime / argv.webpackTime} (${
    (argv.webpackTime * 100) / argv.esbuildTime
  }%)`,
  outputSize: argv.webpackSize
}*/

const table = new Table({
  head: ['Bundler', 'Time', 'Relative slowdown', 'Output size']
})

table.push(
  Object.values(esbuildResults)
  /*Object.values(rollupResults),
  Object.values(webpackResults)*/
)

console.log(table.toString())
