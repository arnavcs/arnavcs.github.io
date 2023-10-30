#!/bin/sh
#
# build.sh

pandoc --standalone --toc --template template.html --number-sections main.md -o ./reference.html
