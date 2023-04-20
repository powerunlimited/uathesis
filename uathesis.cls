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

% Todo Confirm that it follows new sample
%%---------------------------- Title Page -----------------------------
%%
%% \maketitlepage{Title}{Author}{degree title}{Department}{y e a r}
%%
%% options are	#1 = Title
%%				#2 = Author
%%				#3 = degree title
%%				#4 = Department
%%				#5 = year
\newcommand{\maketitlepage}[5]{%
  % This bracket begins an unnamed environment in which we will temporarily
  % override the document's page style.
  {
    \thispagestyle{empty}				% no page number on title page
    \SingleSpacing % single spaced herecentering
    \centering % Center the title and author
    \vspace*{0.5in}	% This accounts for the larger top margin.

    \bigskip
    \bigskip

    {\large\MakeTextUppercase{#1}}	% Title text

    \bigskip
    \bigskip

    by

    \bigskip
    \bigskip

    #2							% Author

    \bigskip
    \bigskip

    \rule{2.25in}{1pt}\\
    % This puts in the Copyright statement
    \ifthenelse{\boolean{Copyright}}{\footnotesize~~~Copyright \ccCopy\ #2\ #5}{}	
    % Creative Commons licenses	
    \ifthenelse{\boolean{CCBY}}{\footnotesize\ccby Creative Commons Attribution 3.0 License}{}		
    \ifthenelse{\boolean{CCBYSA}}{\footnotesize\ccbysa Creative Commons Attribution-Share Alike 3.0 License}{}		
    \ifthenelse{\boolean{CCBYND}}{\footnotesize\ccbynd Creative Commons Attribution-No Derivative Works 3.0 License}{}

    \bigskip
    \bigskip

    A \ThesisType\ Submitted to the Faculty of the

    \bigskip
    \bigskip

    \MakeTextUppercase{#4}					% Department

    \bigskip
    \bigskip

    In Partial Fulfillment of the Requirements\\
    \bigskip
    For the Degree of

    \bigskip
    \bigskip

    \MakeTextUppercase{#3}					% Degree Title

    \bigskip
    \bigskip

    In the Graduate College

    \bigskip
    \bigskip

    THE UNIVERSITY OF ARIZONA

    \bigskip
    \bigskip
    \bigskip
    \bigskip

    \ifthenelse{ \boolean{GeneratedOn} }
    {This draft was generated on \today.}

    {#2}								% Year
  }
}

%%---------------------------- Approval Form --------------------------
%% 
%% Please use the Adobe workflow and include the signed documents in the thesis, which is also recommended by the Graduate College.

%%---------------------------- Rest of Front matter ----------------------
%% 
%% The university has loosened the requirements considerably for the rest of the Documents.
%% The only thing that is required is the Tile page, and the Approval form. all the rest is optional.
%% Thus we use the default memoir class definitions for the rest of the front matter.