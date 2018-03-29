SCREENSHOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))/.screenshots
TARGET := demo.pdf

all: demo

.PHONY: alldemo demo-xelatex demo-lualatex demo-pdflatex

demo-xelatex: LATEXMK_GEN := -xelatex
demo-lualatex: LATEXMK_GEN := -lualatex
demo-pdflatex: LATEXMK_GEN := -pdf

demo-xelatex demo-lualatex demo-pdflatex: clean

demo demo-xelatex demo-lualatex demo-pdflatex: $(TARGET)
	test -d "$(SCREENSHOT_DIR)" || mkdir "$(SCREENSHOT_DIR)"
	pdftoppm -scale-to 500 -f 1 -l 5 -png $< "$(SCREENSHOT_DIR)/$@"

mrproper::
	rm -f "$(TARGET)" "$(SCREENSHOT_DIR)"/demo-*.png
	test -d "$(SCREENSHOT_DIR)" && rmdir --ignore-fail-on-non-empty "$(SCREENSHOT_DIR)"

include theme/Makefile

