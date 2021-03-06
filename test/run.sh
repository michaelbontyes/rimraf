#!/bin/bash
set -e
code=0
for i in test-*.js; do
  echo -n $i ...
  bash setup.sh
  node $i
  if [ $? -ne 0 ]; then
    echo "fail"
    code=1
  fi
  if [ -d target ]; then
    echo "fail"
    code=1
  else
    echo "pass"
  fi
done
rm -rf target
exit $code
