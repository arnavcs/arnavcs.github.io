#!/bin/sh
#
# build.sh

pandoc --standalone\
       --template template.html\
       index.md -o ./index.html
