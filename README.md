# The ~~Unofficial~~ University of Arizona Thesis Template

This is a LaTeX thesis template for graduate students at The University of Arizona.

As of the time of writing(Summer 2023), there is no "official" UofA template for Thesis from the grad college, only the front matter order, title page, and approval forms have samples.
All the other portions of the document are only loosely (not even a margin or line spacing requirements!) defined by the Formatting guide, all the current samples and guides can be found in the `\uathesis\ua-templates` folder.

This template originated from various sources such as Overleaf and GitHub.
Apparently the initial version started from [LPL](https://www.lpl.arizona.edu/) back in the 1990s, along with some basic documentation/samples. The last documented public modifications was in 2018 when the statement of authors were no longer required.
While searching for a usable Latex template, this was the best I could find, I decided to updated it to match current Graduate College requirements. Please see the `CHANGELOG`.txt and the commit history for more background.

----
## Modernization

The template is updated to run with modern latex packages, such as using latexmk, lualatex, and biblatex, and leverage the fonts, graphics, and pdf related enhancements.
A big braking change is that the style file now uses the memoir class, which has good defaults and many helpful packages preloaded.
The changes were made and tested on VScode + Latex Workshop extension running on Miktex (Windows).
No other configurations were tested though TexLive/Overleaf should in theory work as well.
*Perl is required to run `latexmk`!*

Obsolete pages/packages/samples and methods originating from the time when documents were still submitted physically has been removed.

The sample has some modifications to the memoir class to better fit a scientific thesis layout, such as the headers and such.
Pagination and the title page is also modified to adhere with University standards.
Currently the sample is setup to be submitted electronically and follows one side margins.

If you would like to send your thesis off to print, which should be done on double side printing to save paper. look at the `Oneside`, `Twoside` options.
There is also a convenient `Draft`, `Final` options if needed.

----

## File Structure

- `uathesis.cls` - LaTeX 2e class file for the UA Thesis format, based on the `memoir` class. [docs](http://mirrors.ctan.org/macros/latex/contrib/memoir/memman.pdf)
- `dissertation.tex` - Main Tex file, contains the user options for the `uathesis` class, eg. title, authors, degree etc.
All of the actual preface, packages, appendix and writing should be done in the various included `.tex` files.
*Most of the common packages are predefined in the class file, except for `biblatex`, `hyperref`.*
- `/figs` - Default root folder for figures, supported by the `graphicx` package, see the [docs](https://ctan.org/pkg/latex-graphics) for more info
- `proposal.tex` - Sample of proposal if needed
- `abstract.tex` - Sample abstract, note the different environments needed.
- `acknowledgements.tex` - Sample acknowledgements
- `land-acknowledgement.tex` - Optional land acknowledgement page
- `appendix-A.tex` - Sample appendix
- `dedication.tex` - Sample dedication
- `bibliography.bib` - Sample bibliography file
- `intorduction.tex` - Sample introduction chapter, add and change as needed, eg. methods, conclusions
- `dedication.tex` - Sample dedication

## Building the Document

The template by default uses `latexmk` to automagically run the main tex document `dissertation.tex` the required iterations to have the final output.
This is due to Latex needs make sure that all the page numbers in the Table of Contents and
the Lists of Figures and Tables are correct.
The `latexmkconf` file in the template folder defines the Tex engine and configuations, by default uses xelatex with bibilatex.
If you want to use pdflatex, you can change the settings in the latexmk file.
Depending on your Tex Distribution, latexmk is my not be installed by default, and it also requires Perl to run.

----
## Disclaimer

These files are not perfect, and they are based on older LaTeX style files dating back 20+ years.
That being said that have produced acceptable dissertations for numerous former grad students, I also tried and personally used it on my dissertation.

> **If you use this class file and associated files and Grad College won't accept it, it's not my fault.**

>Double-check the format that this template produces against the [current Grad College requirements](https://grad.arizona.edu/gsas/dissertations-theses/dissertation-and-thesis-formatting-guides) for yourself to make sure!

These files will certainly change as time passes, PR and forks are more that welcome.

## Happy dissertating!