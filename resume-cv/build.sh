#!/bin/sh
#
# ./build.sh

pdflatex -jobname=cv "\newcommand{\version}{cv}\newcommand{\focus}{general}\input{./arnav-kumar.tex}"
pdflatex -jobname=resume "\input{./arnav-kumar.tex}"
pdflatex -jobname=wwresume "\newcommand{\board}{waterlooworks}\input{./arnav-kumar.tex}"
pdflatex -jobname=graphics "\newcommand{\version}{graphics}\input{./arnav-kumar.tex}"
pdflatex -jobname=wwgraphics "\newcommand{\version}{graphics}\newcommand{\board}{waterlooworks}\input{./arnav-kumar.tex}"
pdflatex -jobname=math "\newcommand{\version}{math}\input{./arnav-kumar.tex}"
pdflatex -jobname=wwmath "\newcommand{\version}{math}\newcommand{\board}{waterlooworks}\input{./arnav-kumar.tex}"

rm ./*.aux ./*.log ./*.out
