#!/bin/sh
#
# ./build.sh

pdflatex -jobname=cv "\newcommand{\version}{cv}\newcommand{\focus}{general}\input{./arnav-kumar.tex}"
pdflatex -jobname=resume "\newcommand{\version}{resume}\newcommand{\focus}{general}\input{./arnav-kumar.tex}"
pdflatex -jobname=wwresume "\newcommand{\version}{resume}\newcommand{\focus}{general}\newcommand{\board}{waterlooworks}\input{./arnav-kumar.tex}"
pdflatex -jobname=graphics "\newcommand{\version}{graphics}\newcommand{\focus}{graphics}\input{./arnav-kumar.tex}"
pdflatex -jobname=wwgraphics "\newcommand{\version}{graphics}\newcommand{\focus}{graphics}\newcommand{\board}{waterlooworks}\input{./arnav-kumar.tex}"

rm ./*.aux ./*.log ./*.out
