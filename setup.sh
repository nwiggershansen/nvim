#!/bin/bash

os="Unknown"
case "$OSTYPE" in
  msys*) os="Windows" ;;
  *) os="Unknown: $OSTYPE" ;;
esac

echo $os

if ! type nvim &> /dev/null; then
  echo "nvim not installed"
fi

echo "Complete"
while [ true ]; do
  read -t 3 -n 1
if [ $? = 0 ]; then
  exit;
fi
done
