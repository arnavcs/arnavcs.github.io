#!/bin/sh
#
# build.sh

pandoc --standalone --mathml --toc --template template.html --number-sections main.md -o ./reference.html
