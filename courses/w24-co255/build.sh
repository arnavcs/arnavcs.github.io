#!/bin/sh
#
# build.sh

# clean existing plots
rm -rf ./plots/

# recompile
pandoc --filter pandoc-plot \
       --standalone \
       --mathml \
       --toc \
       --template template.html \
       --highlight-style pygments \
       main.md -o ./notes.html
       # --number-sections \
