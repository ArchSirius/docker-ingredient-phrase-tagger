#!/bin/bash

cat - > /tmp/input.txt
python bin/parse-ingredients.py /tmp/input.txt > /tmp/results.txt
python bin/convert-to-json.py /tmp/results.txt
