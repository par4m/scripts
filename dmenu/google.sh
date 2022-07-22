#!/bin/bash

QUERY=$(printf "" | dmenu -p "Google: " -b -fn 'curie')
CON=$(echo $QUERY | tr " " "+")


if [[ $(echo $CON | wc -c) -gt 1 ]]
then
  firefox https://www.google.com/search\?q\=$CON
fi
