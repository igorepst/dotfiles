#!/bin/bash

IFS=$'\n'
set -f
for i in $(cat < "$(dirname 0)/ext-list.txt"); do
  echo "Installing $i"
  code --install-extension "$i"
done

