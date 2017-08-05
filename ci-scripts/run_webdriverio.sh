#!/bin/bash
set -e

echo "Test WebDriverIO."

cd wdio || exit

WDIO_ALL_RET=0
set +o errexit

for SPEC in specs/*js; do
  echo "Executing $SPEC"
  WDIO_RET=0
  ./node_modules/.bin/wdio wdio.conf.travis.js --spec "$SPEC"
  WDIO_RET=$?
  if [[ "$WDIO_RET" -ne 0 ]]; then
    echo "$SPEC failed"
    WDIO_ALL_RET="$WDIO_RET"
    break
  fi  
done

exit $WDIO_ALL_RET
