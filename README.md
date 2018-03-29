# i4neo Demo

![Titlepage](.screenshots/demo-01.png)
![Table of contents](.screenshots/demo-02.png)
![Section](.screenshots/demo-03.png)
![Plain slide](.screenshots/demo-04.png)
![Slide with title](.screenshots/demo-05.png)

Make sure to checkout the submodule as well, for example by using

	git clone --recursive https://gitlab.cs.fau.de/i4/tex/i4neo-demo.git

To build the demo, make sure you have a TeX distribution (like *TeX Live*)
installed and simply run

	make demo.pdf

to create the PDF using *XeLaTeX* (predefined by the theme).

You can use different generators like *pdfLaTeX* (which requires FiraSans.sty)

	make demo-pdflatex

or *LuaLaTeX*

	make demo-lualatex

or explicitly the default *XeLaTeX* with

	make demo-xelatex

Although there are a few minor differences between the three generators above
regarding the typesetting, these should not be visible to the naked eye.
