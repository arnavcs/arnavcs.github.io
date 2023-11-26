#!/bin/sh
#
# ./build.sh

pdflatex -jobname=resume "\newcommand{\version}{resume}\input{./arnav-kumar.tex}"
pdflatex -jobname=cv "\newcommand{\version}{cv}\input{./arnav-kumar.tex}"

rm ./*.aux ./*.log ./*.out
