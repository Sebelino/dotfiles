#!/bin/sh
#latex2gif script by Ian Hutchinson 1998; use at your own risk.
#You need latex, dvips and ps2gif.
if [ $# != 1 ] ; then
       echo " Usage: latex2gif <file> (no extension)" 1>&2
       exit 1
else 
	echo "Calling latex, dvips, and ps2gif, please wait ..." >&2
	latex $1 >&2
	dvips -o $1.ps $1 >&2
	ps2gif $1.ps $1.gif
#	rm $1.tex
	rm $1.aux
	rm $1.dvi
	rm $1.log
	rm $1.ps
fi


