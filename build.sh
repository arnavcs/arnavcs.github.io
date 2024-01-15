#!/bin/sh
#
# build.sh

pandoc --standalone\
       --toc\
       --template template.html\
       main.md -o ./index.html
