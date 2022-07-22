#!/bin/bash

QUERY=$(printf "" | dmenu -p "YouTube: " -b -fn 'curie')
CON=$(echo $QUERY | tr " " "+")


if [[ $(echo $CON | wc -c) -gt 1 ]]
then
  firefox https://www.youtube.com/results?search_query=$CON
fi
