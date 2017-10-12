SCREENSHOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))/.screenshots

include theme/Makefile

.PHONY: demo

demo: demo.pdf
	mkdir .screenshots
	pdftoppm -scale-to 500 -f 1 -l 5 -jpeg $< $(SCREENSHOT_DIR)/$@

mrproper::
	@rm -f demo.pdf $(SCREENSHOT_DIR)/demo-*.jpg
	@rmdir $(SCREENSHOT_DIR)
