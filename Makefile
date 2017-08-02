TARGETS := main 
EXTRADEPS := xxx.sty $(wildcard images/*.png) $(wildcard images/*.pdf) \
	eso-pic.sty ieee.bst
include Makefile.include

