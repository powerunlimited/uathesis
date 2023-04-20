# The ~~Unofficial~~ University of Arizona Thesis Template

This is a LaTeX thesis template for graduate students at The University of Arizona.

Right off the bat, as of the time of writing, there is no "official" UofA template for Thesis from the grad college, only the first few pages, one which is also in the process of transitioning to a fully online Adobe Sign workflow, has samples.
All the other portions of the document are only loosely (not even a margin or line spacing requirement!) defined by the Formatting guide, all the current samples and guides can be found in the `\uathesis\ua-templates` folder.

This template started originated from various sources such as Overleaf and GitHub.
Apparently the initial version started from [LPL](https://www.lpl.arizona.edu/), along with some basic documentation/samples. The last documented public modifications was in 2018 when the statement of authors were no longer required.
While searching for a usable Latex template, this was the best I could find, I decided to updated in 2023 to match current Graduate College requirements. Please see the `CHANGELOG`.txt and the commit history for more background.

----
## Modernization

The template is updated to run with modern latex packages, such as using latexmk, lualatex, and biblatex, and leverage the fonts, graphics, and pdf related enhancements.
The changes were made and tested on VScode + Latex Workshop extension running on Miktex (Windows).
No other configurations were tested though TexLive/Overleaf should in theory work as well.
*Perl is required to run `latexmk`!*

Obsolete pages and methods originating from the time when documents were still submitted physically has been removed.
Though the sample still includes the settings needed if you would like to send your thesis off to print, see the comments in the main Tex and class.
Targeted packages and extra classes for cs/astro studies were also removed to lean out the package.

----

## File Structure

- `uathesis.cls` - LaTeX 2e class file for the UA Thesis format
- `dissertation.tex` - Main Tex file, contains the user options for the `uathesis` class, eg. title, authors, degree etc.
All of the actual preface, appendix and writing should be done in the various included `.tex` files.
*Most of the common packages are directly defined in the class file, except for `hyperref`.*
- `/Figs` - Default root folder for figures, supported by the `graphicx` package, see the [docs](https://ctan.org/pkg/latex-graphics) for more info
- `proposal.tex` - Sample of proposal if needed
- `abstract.tex` - Sample abstract
- `acknowledgements.tex` - Sample acknowledgements
- `appendix_A.tex` - Sample appendix
- `bibliography.bib` - Sample bibliography file
- `intorduction.tex` - Sample introduction chapter, add and change as needed, eg. methods, conclusions
- `dedication.tex` - Sample dedication
- `uabibnat.bst` - Bibliography style file

## Building the Document

The template by default uses `latexmk` to automagically run the main tex document `dissertation.tex` the required iterations to have the final output.
This is due to Latex needs make sure that all the page numbers in the Table of Contents and
the Lists of Figures and Tables are correct.
The `latexmkconf` file in the template folder defines the Tex engine and configuations, by default uses lualatex with bibilatex.
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