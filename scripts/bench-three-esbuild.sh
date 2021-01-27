#!/bin/bash

./scripts/bench-three.sh

# Clears esbuild output before running tests
rm -rf bench/three/esbuild

time -p esbuild \
  --bundle \
  --summary \
  --global-name=THREE \
  --sourcemap \
  --minify bench/three/src/entry.js \
  --outfile=bench/three/esbuild/entry.esbuild.js

du -h bench/three/esbuild/entry.esbuild.js*
