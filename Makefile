SCREENSHOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))/.screenshots
TARGET_LATEX := demo.pdf
TARGET_MARKDOWN := example.pdf

all: demo

.PHONY: all demo screenshots

%-xelatex:
	$(MAKE) LATEXMK_GEN=-xelatex $*

%-lualatex:
	$(MAKE) LATEXMK_GEN=-lualatex $*

%-pdflatex:
	$(MAKE) LATEXMK_GEN=-pdf $*

demo: | clean $(TARGET_LATEX) $(TARGET_MARKDOWN)
	test -d "$(SCREENSHOT_DIR)" || mkdir "$(SCREENSHOT_DIR)"

screenshots: $(TARGET_LATEX)
	pdftoppm -scale-to 500 -f 1 -l 5 -png $(TARGET_LATEX) "$(SCREENSHOT_DIR)/$@"

clean::
	rm -f "$(TARGET_LATEX)" "$(TARGET_MARKDOWN)"

mrproper:: clean
	rm -f "$(SCREENSHOT_DIR)"/demo-*.png
	rmdir --ignore-fail-on-non-empty "$(SCREENSHOT_DIR)" || true

include theme/Makefile
