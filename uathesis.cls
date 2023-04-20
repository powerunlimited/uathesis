%% This LaTeX 2e Class file is the culmination of a large amount of
%% work over more than a couple decades by graduate students in The University of Arizona.
%%
%%
%% Peter Halverson	1989 (non-LPL)
%% William D. Sears	1994 (Department of Planetary Sciences)
%% Rov Vervack		1996 (Department of Planetary Sciences)
%% Andrew Rivkin	1997 (Department of Planetary Sciences)
%% Joe Spitale		2001 (Department of Planetary Sciences)
%% Dave O'Brien		2003 (Department of Planetary Sciences)
%% Ross A. Beyer	2004 (Department of Planetary Sciences)
%% Jim Richardson	2005 (Department of Planetary Sciences)
%% Terry Hurford	2005 (Department of Planetary Sciences)
%% Curtis S. Cooper	2007 (Department of Planetary Sciences)
%% David A. Minton  2009 (Department of Planetary Sciences)
%% Anh X. Tran		2013 (CS)
%% Ted Lee		2023 (OS)
%%
%% ! Currently footskip is zero.  This should be looked into.
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uathesis}[2033 University of Arizona Thesis Class]

%% This class file will be based off of the memoir class, a more modern alternative to the book class.
%% memoir incorporates a magnitude of manual fixes previously done, Those were deleted from this class for clarity.
%% See the commit history for the old methods.
%% We will still need to set up some options that are specific to the various kinds of theses.

\RequirePackage{ifthen}

% Set a default for ThesisType, just in case
\newcommand{\ThesisType}{\emph{(please specify thesis or dissertation as an option in the uathesis documentclass statement at the top of your file)}}

\DeclareOption{thesis}{%
	\renewcommand{\ThesisType}{Thesis}
}

\DeclareOption{dissertation}{%
	\renewcommand{\ThesisType}{Dissertation}
}

\newboolean{Proposal}
\setboolean{Proposal}{false}
\DeclareOption{proposal}{%
	\renewcommand{\ThesisType}{Proposal}
	\setboolean{Proposal}{true}
}

\DeclareOption{dissertation-proposal}{%
	\renewcommand{\ThesisType}{Dissertation Proposal}
	\setboolean{Proposal}{true}
}

\DeclareOption{thesis-proposal}{%
	\renewcommand{\ThesisType}{Thesis Proposal}
	\setboolean{Proposal}{true}
}

\newboolean{Copyright}
\setboolean{Copyright}{false}
\DeclareOption{copyright}{%
	\setboolean{Copyright}{true}
}

% This next bit could probably be made more elegant
% Code for including Creative Commons licenses
\newboolean{CCBY}
\setboolean{CCBY}{false}
\newboolean{CCBYSA}
\setboolean{CCBYSA}{false}
\newboolean{CCBYND}
\setboolean{CCBYND}{false}
% as of Januare 2009, the UA license grants the University the 
% non-exclusive right to display and distribute your dissertation 
% as an open access work and include it in the Networked
% Digital Library of Theses and Dissertations (http://www.ndltd.org/).
% UMI/ProQuest includes it in Dissertations Abstracts and makes copies
% available for sale.  Therefore the NC licences are not compatible and
% are not included here. (from a correspondence with Dan Lee
% Interim Team Leader for Undergraduate Services and Copyright Librarian 
% University of Arizona Libraries leed@u.library.arizona.edu) 
\DeclareOption{CC-BY}{%
	\setboolean{CCBY}{true}
}
\DeclareOption{CC-BY-SA}{%
	\setboolean{CCBYSA}{true}
}
\DeclareOption{CC-BY-ND}{%
	\setboolean{CCBYND}{true}
}

% This option puts the generation date on the titlepage.
\newboolean{GeneratedOn}
\setboolean{GeneratedOn}{false}
\DeclareOption{generatedon}{%
	\setboolean{GeneratedOn}{true}
}
% this provides a default option list
\ExecuteOptions{12pt,oneside}

% Pass other options to the memoir class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

\ProcessOptions\relax
\LoadClass{memoir}

%% Okay, now that the options are set and the memoir class is loaded in,
%% we now need to start detailing how we want this to be different than
%% the book class.

%% --------------------------- Load required packages ------------------------

\RequirePackage{ccicons} % Creative Commons icons 
\RequirePackage{graphicx} % For graphics
\RequirePackage{fontsetup} % For new computer modern + math font setup
% * Merge into memoir class \RequirePackage{geometry} % For page margins
% * Merge into memoir class \RequirePackage{setspace} \onehalfspacing % For 1.5 spacing
\RequirePackage{microtype} % better hyphen control
\RequirePackage{csquotes} % for better quotes

%% --------------------------- Global Settings ------------------------

%% Page Style to put numbers at the top.
% TODO Modify this to use the new pagestyle
\pagestyle{myheadings}


%% Set margins for the bulk of the dissertation (referred to as Body of Paper).
%% The only page that have different margins is the Title Page, 
%% Fortunately, there left and right margins are identical, and the top and bottom margins are greater, so
%% we'll just throw in some extra vspace in those places.
%* Currently Use the memoir class defaults, only switch to one-half spacing for the body of the paper.
\OneHalfSpacing


% Make sure that various key names are in all caps.
\renewcommand{\partname}{PART}
\renewcommand{\chaptername}{CHAPTER}
\renewcommand{\appendixname}{APPENDIX}
\renewcommand{\contentsname}{TABLE OF CONTENTS}
\renewcommand{\listfigurename}{LIST OF FIGURES}
\renewcommand{\listtablename}{LIST OF TABLES}
\renewcommand{\bibname}{REFERENCES} % Will NOT work with biblatex

% Proposals don't use chapters
\ifthenelse{\boolean{Proposal}}{\renewcommand{\chaptername}{}}{}

%%---------------------------- General Renewed Commands----------------
%%  Removed renew commands that are no longer needed or are in the memoir class.

%% These commands give us values for strings that we will use 
%% more than once in the commands below.

\newcommand{\completetitle}[1]{%
\newcommand{\CompleteTitle}{#1}
}

\newcommand{\fullname}[1]{%
\newcommand{\FullName}{#1}
}

\newcommand{\degreename}[1]{%
\newcommand{\DegreeName}{#1}
}

% Todo Comfirm that it follows new sample
%%---------------------------- Title Page -----------------------------
%%
%% \maketitlepage{Title}{Author}{degree title}{Department}{y e a r}
%%
%% options are	#1 = Title
%%				#2 = Author
%%				#3 = degree title
%%				#4 = Department
%%				#5 = year

\newcommand{\maketitlepage}[2]{%

% This bracket begins an unnamed environment in which we will temporarily
% override the document's page style.
{
\thispagestyle{empty}				% no page number on title page
\SingleSpacing % single spaced herecentering
\centering % Center the title and author
\vspace*{0.5in}	% This accounts for the larger top margin.

\bigskip
\bigskip

{\large\MakeTextUppercase{\CompleteTitle}}	% Title text

\bigskip
\bigskip

by

\bigskip
\bigskip

\FullName							% Author

\bigskip
\bigskip

\rule{2.25in}{1pt}\\
% This puts in the Copyright statement
\ifthenelse{\boolean{Copyright}}{\footnotesize~~~Copyright \ccCopy\ \FullName\ #2}{}	
% Creative Commons licenses	
\ifthenelse{\boolean{CCBY}}{\footnotesize\ccby Creative Commons Attribution 3.0 License}{}		
\ifthenelse{\boolean{CCBYSA}}{\footnotesize\ccbysa Creative Commons Attribution-Share Alike 3.0 License}{}		
\ifthenelse{\boolean{CCBYND}}{\footnotesize\ccbynd Creative Commons Attribution-No Derivative Works 3.0 License}{}

\bigskip
\bigskip

A \ThesisType\ Submitted to the Faculty of the

\bigskip
\bigskip

\MakeTextUppercase{#1}					% Department

\bigskip
\bigskip

In Partial Fulfillment of the Requirements\\
\bigskip
For the Degree of

\bigskip
\bigskip

\MakeUppercase{\DegreeName}					% Degree Title

\bigskip
\bigskip

In the Graduate College

\bigskip
\bigskip

THE UNIVERSITY OF ARIZONA

\vfill
\ifthenelse{ \boolean{GeneratedOn} }
{This draft was generated on \today.}

{#2}								% Year
}

}


%%---------------------------- Approval Form --------------------------
%% 
%% This creates the Committee Approval form, the arguments are as
%% follows:	#1	defense date
%%			#2	Dissertation Director's name
%%			#3	1st committee member's name
%%			#4	2nd committee member's name
%%			#5	3rd committee member's name
%%			#6	4th committee member's name
%%			#7	5th committee member's name

\newcommand{\approval}[7]{%

{
\renewcommand{\baselinestretch}{1}	% single spaced here
\small\normalsize	

\ifthenelse{\boolean{Proposal}}{%
  % Proposal's headings aren't centered by default and have smaller spacing
  \chapter*{\center THE UNIVERSITY OF ARIZONA\\GRADUATE COLLEGE}\vskip 30\p@
}{%
  \chapter*{THE UNIVERSITY OF ARIZONA\\GRADUATE COLLEGE}
}


As members of the Dissertation Committee, we certify that we have
read the \MakeLowercase{\ThesisType} prepared by \FullName,
titled \CompleteTitle~and recommend that it be accepted as fulfilling the
\MakeLowercase{\ThesisType} requirement for the Degree of \DegreeName.

% Before the final oral defense you must obtain the Approval Pages
% from the Degree Certification Office. Original signatures are
% required on both final copies.  That means print out the Approval
% Forms (one for each copy of the \ThesisType) on the nice acid-free
% paper and get original signatures on each one.  Do this at your
% defense to keep from having to do another signature round-up later
% on.

\vfill

\bigskip
\begin{flushleft}
\begin{tabular*}{\textwidth}{p{4in}@{\extracolsep{\fill}}l}
	& Date: #1	\\
\cline{1-1}
#3	& 			\\
	&			\\
	&			\\
	& Date: #1	\\
\cline{1-1}
#4	& 			\\
	&			\\
	&			\\
	& Date: #1	\\
\cline{1-1}
#5	& 			\\
	& 			\\
	& 			\\
	& Date: #1	\\
\cline{1-1}
#6	& 			\\
	&			\\
	&			\\
	& Date: #1	\\
\cline{1-1}
#7	& 			\\
\end{tabular*}
\end{flushleft}

\ifthenelse{\boolean{Proposal}}{}{
\vfill

\noindent Final approval and acceptance of this \MakeLowercase{\ThesisType} is
contingent upon the candidate's submission of the final copies of the
\MakeLowercase{\ThesisType} to the Graduate College.

\bigskip
}

\noindent I hereby certify that I have read this \MakeLowercase{\ThesisType} prepared
under my direction and recommend that it be accepted as fulfilling the 
\MakeLowercase{\ThesisType} requirement.

\vfill

\bigskip
\begin{flushleft}
\begin{tabular*}{\textwidth}{p{4in}@{\extracolsep{\fill}}l}
							& Date: #1	\\
\cline{1-1}
Dissertation Director: #2	&			\\
\end{tabular*}
\end{flushleft}
\vspace{0.5in} % This accounts for the 0.5in larger bottom margin on this page.
}

}

%%---------------------------- Acknowledgements -----------------------
%%
%% This command includes the file that contains the acknowledgements.
%% 
%% \incacknowledgements
%% Option is #1 = acknowledgements file name
%%

\newcommand{\incacknowledgements}[1]{

% This bracket begins an unnmaed environment in which we will temporarily
% override the document's page style.
{
\renewcommand{\baselinestretch}{1}	% single spaced here
\small\normalsize					% size switch to make the spacing behave

\chapter*{ACKNOWLEDGEMENTS}

\InputIfFileExists{#1}
	{\typeout{Including your file #1.tex as the acknowledgements.}}
	{Couldn't find #1.tex to include as your acknowledgements.}

}
}


%%---------------------------- Dedication -----------------------------
%%
%% This command includes the file that contains the dedication.
%%
%% \incdedication
%% Option is #1 = dedication file name
%%

\newcommand{\incdedication}[1]{

\chapter*{DEDICATION}

\InputIfFileExists{#1}
	{\typeout{Including your file #1.tex as the dedication.}}
	{Couldn't find #1.tex to include as your dedication.}

}


%%---------------------------- Abstract -------------------------------
%%
%% This command includes the file that contains the abstract.
%%
%% \incabstract
%% Option is #1 = abstract file name
%%

\newcommand{\incabstract}[1]{

\chapter*{ABSTRACT}
\addcontentsline{toc}{chapter}{ABSTRACT}

\InputIfFileExists{#1}
	{\typeout{Including your file #1.tex as the abstract.}}
	{Couldn't find #1.tex to include as your abstract.}

}

%%---------------------------- Table of Contents ----------------------
%% 
%% The table of contents that the UofA wants is subtley different in a
%% number of ways such that we need to redefine the \tableofcontents
%% command provided by the basic LaTeX classes.  Many of the commands
%% here are confusing, but were taken from the LaTeX book.cls class
%% file with the following date and version stamp: 2001/04/21 v1.4e
%%
\renewcommand{\tableofcontents}{

\addtolength{\headsep}{0.5in}		% These adjust things for the running
\addtolength{\textheight}{-0.5in}	% headers for TOC, LOF, LOT.

% This bracket begins an unnmaed environment in which we will temporarily
% override the document's page style and margins
{
\renewcommand{\baselinestretch}{1}	% single spaced here
\small\normalsize					% size switch to make the spacing behave

\if@twocolumn					% \
	\@restonecoltrue\onecolumn	%  \
\else							% 	> Taken from book.cls
	\@restonecolfalse			%  /
\fi								% /

% vspace added to account for the TOC, LOF, & LOT running header business.
\chapter*{\vspace*{-0.5in}\contentsname}

% \markboth{	\protect\raisebox{-0.5in}{\textbf{\emph{\contentsname} -- Continued}\hspace{1.5in}} }{
% 			\protect\raisebox{-0.5in}{\hspace{1.5in}\textbf{\emph{\contentsname} -- Continued}} }
\markboth{	\protect\raisebox{-0.5in}{{\emph{\contentsname} -- Continued}\hspace{1.5in}} }{
			\protect\raisebox{-0.5in}{\hspace{1.5in}{\emph{\contentsname} -- Continued}} }

\@starttoc{toc}%
\if@restonecol\twocolumn\fi		% Taken from book.cls
}
}

%---------------------------- List of Figures ------------------------
%% 
%% The U of A List of Figures requires a running header on subsequent
%% pages that we must define here.  We also add this section to the TOC.
%% This was modified from the definition for listoffigures from 
%% 2001/04/21 v1.4e book.cls.
%%
\renewcommand{\listoffigures}{%
% This bracket begins an unnmaed environment in which we will temporarily
% override the document's page style and margins
{
\renewcommand{\baselinestretch}{1}	% single spaced here
\small\normalsize					% size switch to make the spacing behave

    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
	% vspace added to account for the TOC, LOF, & LOT running header business.
    \chapter*{\vspace*{-0.5in}\listfigurename}%

	% \markboth{\protect\raisebox{-0.5in}{\textbf{\emph{\listfigurename} -- Continued}\hspace{1.5in}} }{
	% 		  \protect\raisebox{-0.5in}{\hspace{1.5in}\textbf{\emph{\listfigurename} -- Continued}} }
	\markboth{\protect\raisebox{-0.5in}{{\emph{\listfigurename} -- Continued}\hspace{1.5in}} }{
			  \protect\raisebox{-0.5in}{\hspace{1.5in}{\emph{\listfigurename} -- Continued}} }

	\addcontentsline{toc}{chapter}{\listfigurename}
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
}
}

%%---------------------------- List of Tables -------------------------
%% 
%% The U of A List of Tables requires a running header on subsequent
%% pages that we must define here.  We also add this section to the TOC.
%% This was modified from the definition for listoffigures from 
%% 2001/04/21 v1.4e book.cls.
%%
\renewcommand{\listoftables}{%
% This bracket begins an unnmaed environment in which we will temporarily
% override the document's page style and margins
{
\renewcommand{\baselinestretch}{1}	% single spaced here
\small\normalsize					% size switch to make the spacing behave

    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
	% vspace added to account for the TOC, LOF, & LOT running header business.
    \chapter*{\vspace*{-0.5in}\listtablename}%

	% \markboth{\protect\raisebox{-0.5in}{\textbf{\emph{\listtablename} -- Continued}\hspace{1.5in}} }{
	% 		  \protect\raisebox{-0.5in}{\hspace{1.5in}\textbf{\emph{\listtablename} -- Continued}} }
	\markboth{\protect\raisebox{-0.5in}{{\emph{\listtablename} -- Continued}\hspace{1.5in}} }{
			  \protect\raisebox{-0.5in}{\hspace{1.5in}{\emph{\listtablename} -- Continued}} }

	\addcontentsline{toc}{chapter}{\listtablename}
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
}

\clearpage
\addtolength{\headsep}{-0.5in}		% Un-adjust things for the running
\addtolength{\textheight}{0.5in}	% headers for TOC, LOF, LOT.
}