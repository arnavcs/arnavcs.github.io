#!/bin/sh
#
# build.sh

pandoc --standalone\
       --template template.html\
       main.md -o ./index.html
