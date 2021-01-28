import minimist from 'minimist'
import Table from 'cli-table3'

const argv = minimist(process.argv.slice(2))

const [esbuildResults, rollupResults, webpackResults] = [
  {
    name: 'esbuild',
    time: argv.esbuildTime + 's',
    relativeSlowdown: '1x',
    outputSize: argv.esbuildSize
  }
  /*{
    name: 'Rollup',
    time: argv.rollupTime + 's',
    relativeSlowdown: `${argv.rollupTime / argv.esbuildTime} (${
      (argv.rollupTime * 100) / argv.esbuildTime
    }%)`,
    outputSize: argv.esbuildSize
  },
  {
    name: 'Webpack',
    time: argv.webpackTime + 's',
    relativeSlowdown: `${argv.esbuildTime / argv.webpackTime} (${
      (argv.webpackTime * 100) / argv.esbuildTime
    }%)`,
    outputSize: argv.webpackSize
  }*/
]

const table = new Table({
  head: ['Bundler', 'Time', 'Relative slowdown', 'Output size']
})

table.push(
  Object.values(esbuildResults)
  /*Object.values(rollupResults),
  Object.values(webpackResults)*/
)

console.log(table.toString())
