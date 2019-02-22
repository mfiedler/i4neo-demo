SCREENSHOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))/.screenshots
TARGET := demo.pdf

all: demo

.PHONY: all demo screenshots

%-xelatex:
	$(MAKE) LATEXMK_GEN=-xelatex $*

%-lualatex:
	$(MAKE) LATEXMK_GEN=-lualatex $*

%-pdflatex:
	$(MAKE) LATEXMK_GEN=-pdf $*

demo: | clean $(TARGET)
	test -d "$(SCREENSHOT_DIR)" || mkdir "$(SCREENSHOT_DIR)"

screenshots: $(TARGET)
	pdftoppm -scale-to 500 -f 1 -l 5 -png $(TARGET) "$(SCREENSHOT_DIR)/$@"

clean::
	rm -f "$(TARGET)"

mrproper::
	rm -f "$(SCREENSHOT_DIR)"/demo-*.png
	rmdir --ignore-fail-on-non-empty "$(SCREENSHOT_DIR)" || true

include theme/Makefile
