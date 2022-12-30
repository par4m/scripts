#!/bin/bash

QUERY=$(printf "" | dmenu -p "Google: " -fn 'curie' -nb '#2E3440' -sf '#282828' -sb '#81A1C1' -nf '#bebebe')
CON=$(echo $QUERY | tr " " "+")


if [[ $(echo $CON | wc -c) -gt 1 ]]
then
  firefox https://www.google.com/search\?q\=$CON
fi
