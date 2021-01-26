./scripts/github-three.sh

mkdir -p bench/three/src
echo > bench/three/src/entry.js
for i in 1 2 3 4 5 6 7 8 9 10; do test -d "bench/three/src/copy$$i" || cp -r github/three/src "bench/three/src/copy$$i"; done
for i in 1 2 3 4 5 6 7 8 9 10; do echo "import * as copy$$i from './copy$$i/Three.js'; export {copy$$i}" >> bench/three/src/entry.js; done
echo 'Line count:' && find bench/three/src -name '*.js' | xargs wc -l | tail -n 1
