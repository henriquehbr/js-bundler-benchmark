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

node scripts/generate-output.js --esbuildTime=$RUN_TIME --esbuildSize=$BUNDLE_SIZE
