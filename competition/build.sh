#!/bin/sh
#
# build.sh

pandoc --standalone\
       --mathml\
       --template template.html\
       --number-sections\
       main.md -o ./reference.html
