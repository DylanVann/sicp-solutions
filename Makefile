# Modifified version of code by Toby Thain <toby@telegraphics.com.au>
clean : ; rm sicp-ex-1.14.dot
sicp-ex-1.14.svg : sicp-ex-1.14.dot
	dot -o$@ -Tsvg -Grankdir=BT -Gordering=in -Ncolorscheme=pastel24 -Nstyle=filled -Nfillcolor=white $<
sicp-ex-1.14.dot : sicp-ex-1.14.scm
	csi -s $< > $@
sicp-ex-1.14 : sicp-ex-1.14.svg clean