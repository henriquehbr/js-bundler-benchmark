#!/usr/bin/env bash

test -d "github/three" || yarn degit mrdoob/three.js#r108 github/three
