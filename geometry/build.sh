#!/bin/sh
#
# build.sh

pandoc --standalone \
       --css ../assets/episodic.css \
       --template ../assets/episodic.html \
       ./reference.md -o ./reference.html
