#!/usr/bin/env bash

./scripts/bench-three.sh

# Clears esbuild output before running tests
rm -rf bench/three/esbuild

TIMEFORMAT=%R

RUN_TIME=$(time (esbuild \
  --bundle \
  --summary \
  --global-name=THREE \
  --sourcemap \
  --minify bench/three/src/entry.js \
  --outfile=bench/three/esbuild/entry.esbuild.js >/dev/null 2>&1) 2>&1)

BUNDLE_SIZE=$(ls -sh bench/three/esbuild/entry.esbuild.js | cut -d ' ' -f 1)

# Bundler name | Time | Relative slowdown | Output size
echo -e "esbuild,${RUN_TIME}s,1x,${BUNDLE_SIZE}" >> benchmark.csv

node scripts/generate-output.js
