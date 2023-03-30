# The ~~Unofficial~~ University of Arizona Thesis Template

This is a LaTeX thesis template for graduate students at The University of Arizona.

Right off the bat, as of the time of writing, there is no "official" UofA template for Thesis from the grad college, only the first few pages, one which is also in the process of transitioning to a fully online Adobe Sign workflow, has samples.
All the other portions of the document are only loosely (not even a margin or line spacing requirement!) defined by the Formatting guide, all the current samples and guides can be found in the `\uathesis\ua-templates` folder.

This template started originated from various sources such as Overleaf and GitHub.
Apparently the initial version started from [LPL](https://www.lpl.arizona.edu/), along with some basic documentation/samples. The last documented public modifications was in 2018 when the statement of authors were no longer required.
While searching for a usable Latex template, this was the best I could find, I decided to updated in 2023 to match current Graduate College requirements. Please see the `CHANGELOG`.txt and the commit history for more background.

----
## Modernization
The template is updated to run with the newer versions and packages of latex, such as using latexmk, lualatex, and biblatex, and leverage the fonts, graphics, and pdf related enhancements.
The changes were made and tested on VScode + Latex Workshop extension running on Miktex (Windows).
No other configurations were tested though TexLive/Overleaf should in theory work as well.

Obsolete pages and methods originating from the time when documents were still submitted physically has been removed.
Though the sample still includes the settings needed if you would like to send your thesis off to print, see the comments in the main Tex and class.
Targeted packages and extra classes for cs/astro studies were also removed to lean out the package.

----
## File Structure

dissertation.tex
: Main Tex file, contains the required packages and options for the `uathesis.sty` class.
All of the actual preface, apendix and writing should be done in the various included `.tex` files.
From what I understand, if you're doing a Ph.D. it's a Dissertation and if you're doing a Masters it's a Thesis.
There is actually very little differences between the two.

mainmatter
: Folder of where most of the written documnet lives

Figs
: Default root folder for figures, supported by the `graphicx` package, see the docs for more info


## Building the Document
The template by default uses `latexmk` to automagically run the main tex document `dissertation.tex` the required iterations to have the final output.
This is due to Latex needs make sure that all the page numbers in the Table of Contents and
the Lists of Figures and Tables are correct.
The `latexmkconf` file in the template folder defines the Tex engine and configuations, by default uses lualatex with bibilatex.
If you want to use pdflatex, you can change the settings in the latexmk file.
Depending on your Tex Distribution, latexmk is my not be installed by default, and it also requires Perl to run.

I

# From Old README.txt

This is a LaTeX 2e version of the thesis/dissertation style files that have been floating around LPL, along with some basic documentation/samples.
It uses BibTeX and the 'natbib' referencing format and the `graphicx' package for handling figures.
Most LaTeX distributions should have these packages already.

From what we understand, if you're doing a Ph.D. it's a Dissertation,
and if you're doing a Masters it's a Thesis, and if you are getting
a musical arts degree it is a Document.  There are some slight
differences in the formatting of the `Statement by Author', which
this template should handle correctly.  Otherwise, they are basically
the same.  You can specify what kind of document you want produced
by giving the \documentclass command the right option at the top
of the file.  The sample dissertation.tex file has all three examples.

In addition to the Dissertation (or Thesis or Document) itself, you
must also produce a `Special Abstract' for UMI.  An example
special_abstract.tex file is also provided for this short document.
N.B. As of 2006, the special_abstract file may be obsolete, if you 
are submitting your dissertation electronically.  We include it here 
in case you still have need for it.

To compile the sample dissertation into a .dvi file, run the following
sequence of commands, or use the accompanying GNU Make file.

latex dissertation
bibtex dissertation
latex dissertation
latex dissertation
latex dissertation

That's right, you need to run LaTeX three times after you run BibTeX
to make sure that all the page numbers in the Table of Contents and
the Lists of Figures and Tables are correct.

The Special Abstract isn't as complicated and can be made into a .dvi
file with a single run of LaTeX.

Once you have those .dvi files, make sure you use the "-t letter"
option to dvips so that letter-sized output gets created in your
PostScript file.

The GNU Makefile will do all of this transparently (and make correct
PostScript files) with a single call to the GNU make program, often
aliased as `gmake'; but check your system, your default make program
may already be GNU make.


Files:

Makefile                GNU make file for building your dissertation
Makefile_alternate	Uses "rubber" to implement the build process.
abstract.tex            Sample abstract
acknowledgements.tex    Sample acknowledgements
appendix_A.tex          Sample appendix
bibliography.bib        Sample bibliography file
chapter_1.tex           Sample chapter
chapter_2.tex           Sample chapter
dedication.tex          Sample dedication
dissertation.tex        The main file.
figure.eps              Sample figure
refs.sty                Abbreviations for common journals
special_abstract.tex	Sample special abstract file
uabibnat.bst            Bibliography style file
uathesis.cls            LaTeX 2e class file for the UA Thesis format
aastex_hack.sty		Style file to be able to use AASTEX macros
deluxetable.sty		Style file allowing AASTEX deluxetable environment

----
## > WARNING! WARNING! WARNING!

> DISCLAIMER:  These files are not perfect, but they are based on
older LaTeX style files that have produced acceptable dissertations
for numerous former grad students.  If you use this class file and
associated files and Grad College won't accept it, it's not our
fault.  Double-check the format that this template produces against
the Grad College requirements for yourself to make sure:

http://grad.admin.arizona.edu/degreecert/thesismanual/front.htm

These files will certainly change as we hear about problems with
the formatting, so be sure to check for newer versions.

Happy dissertating!

Curtis S. Cooper            &        David A. Minton
curtis@lpl.arizona.edu	    daminton@lpl.arizona.edu

Last modified March 20, 2006



