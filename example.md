---
# Document settings
title: 'i4**neo** with Markdown'
subtitle: Proposal for a modern Beamer theme generated out of a simple Markup language
date: \today
author: Wolfgang Händler
institute: 'Friedrich-Alexander-Universität Erlangen-Nürnberg'
# Some logos on the title page?
titlegraphic:
 - theme/images/logo-i4.pdf
# Internal or external title background image?
titletype: intern
# Show TOC?
toc: true
# Overall font size
fontsize: 10pt
# Additional (LaTeX) commands
header-includes:
 - \usepackage{pgfplots}
 - \neoset{notes=show}
# Bibliography
bibliography: demo
biblio-title: References
biblio-style: abbrv
---

# Introduction

##

The **neo** theme is a LaTeX Beamer theme with minimal visual noise based on
the [[Metropolis]{.smallcaps} Beamer Theme](https://github.com/matze/mtheme)
by Matthias Vogelgesang and inspired by the
[[hsrm]{.smallcaps} Beamer Theme](https://github.com/hsrmbeamertheme/hsrmbeamertheme)
by Benjamin Weiss.

But it is not necessary to write **TeX** -- you can use **Markdown** instead!


## Sections

Sections group slides of the same topic with

        Elements
        ========

or

        # Elements

for which **neo** provides a nice progress indicator ...


## Frames

Start a new frame with

        Frametitle
        ----------

or

        # Frametitle

For title-less frames just remove the name

        #

Setting attributes like *standout* is still possible by appending them

        # {.standout}


## Document settings

Metadata and configuration is stored in the beginning of the document in [YAML](https://yaml.org/) Format

        ---
        title: Good Omens
        date: 1 May 1990
        author:
         - Terry Pratchett
         - Neil Gaiman
        toc: true
        fontsize: 10pt
        ---

(although it is not required to have an header)


## Presentation notes

The built-in support for notes is available as well

        \pnote{Important presentation note}

**neo** can not only create embedded [pdfpc](https://github.com/pdfpc/pdfpc) notes with

        \neoset{notes=pdfpc}

but also full note pages (e.g., for printing)

        \neoset{notes=show}

\pnote{Hi there!}
\pnote{We have some text in \textbf{here}!}
\pnote{Try to use \texttt{notes=preview-right} with \texttt{pdfpc --notes=right ./out/presentation.pdf}}
\pnote<1>{By the way, the command is overlay-aware!}


# Elements

## Typography

    The theme provides sensible defaults to
    *emphasize* text, \alert{accent} parts
    or show **bold** results.

becomes

The theme provides sensible defaults to *emphasize* text,
\alert{accent} parts or show **bold** results.


## Font feature test

 - Regular
 - *Italic*
 - [SmallCaps]{.smallcaps}
 - **Bold**
 - ***Bold Italic***
 - **[Bold SmallCaps]{.smallcaps}**
 - `Monospace`
 - *`Monospace Italic`*
 - **`Monospace Bold`**
 - ***`Monospace Bold Italic`***


## Predefined Colors

  Dark                       Normal                                        Light
 -------------------------- ---------------------------------- ---------------------------
 \nDarkRed{nDarkRed}        \nRed{nRed}                        \nLightRed{nLightRed}
 \nDarkGreen{nDarkGreen}    \nGreen{nGreen}                    \nLightGreen{nLightGreen}
 \nDarkBlue{nDarkBlue}      \nBlue{nBlue}                      \nLightBlue{nLightBlue}
 \nDarkCyan{nDarkCyan}      \nCyan{nCyan}                      \nLightCyan{nLightCyan}
 \nDarkYellow{nDarkYellow}  \nYellow{nYellow}                  \nLightYellow{nLightYellow}
 \nDarkGrey{nDarkGrey}      \nGrey{nGrey}                      \nLightGrey{nLightGrey}
                            \nBlack{nBlack}
                            \colorbox{nBlack}{\nWhite{nWhite}}
 -------------------------- ---------------------------------- ---------------------------


## Lists (and Columns)

::: {.columns}

:::: {.column width=0.33}
Items

 - Milk
 - Eggs
 - Potatos
::::

:::: {.column width=0.33}
Enumerations

 1. First,
 2. Second and
 3. Last.
::::

:::: {.column width=0.33}
Descriptions

PowerPoint
:   Meeh.

Beamer
:   Yeeeha.
::::

:::

## Animation

 - \alert<4>{This is\only<4>{ really} important} \pause
 - Now this \pause
 - And now this \pause


## Tables

  City            Population
  ------------- ------------
  Mexico City     20,116,842
  Shanghai        19,210,000
  Peking          15,796,450
  Istanbul        14,160,467

  : Largest cities in the world (source: Wikipedia)


## Code

``` {.c language="C"}
#include <stdio.h>

int main(void) {
   printf("Hello World!");
}
```


## Math

$$e = \lim_{n\to \infty} \left(1 + \frac{1}{n}\right)^n$$


## Line Plots

\begin{figure}
 \begin{tikzpicture}
  \begin{axis}[
    mlineplot,
    width=0.9\textwidth,
    height=6cm,
  ]

   \addplot {sin(deg(x))};
   \addplot+[samples=100] {sin(deg(2*x))};

  \end{axis}
 \end{tikzpicture}
 \caption{Embedded TikZ Image}
\end{figure}


## Quotes

> Veni, Vidi, Vici


## Images

![Screenshot from titlepage](.screenshots/demo-01.png){width=50%}


## References

Some references to showcase [@knuth92; @ConcreteMath; @Simpson; @Er01; @greenwade93]
References can also be added in place as footnote[^1]


[^1]: Just use a normal footnote which contains lots and lots of text



# Conclusion

## Summary

Get the source of this theme from

<https://gitlab.cs.fau.de/i4/tex/i4neo.git>

The theme *itself* is licensed under a [Creative Commons
Attribution-ShareAlike 4.0 International
License](http://creativecommons.org/licenses/by-sa/4.0/).


## {.standout}

\only<handout:0>{Questions?}
\only<beamer:0>{Have Fun!}

