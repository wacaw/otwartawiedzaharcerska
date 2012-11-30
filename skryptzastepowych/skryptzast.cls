\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{skryptzast}[2012/11/30 v0.01 ZHR 3PHH]

\ExecuteOptions{11pt,polish,a5paper,final,twoside,fleqn,onecolumn}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass{memoir}
\usepackage[polish]{babel}
%
% Require additional packages
%
\RequirePackage{babel}
\newif\if@pppolish
\iflanguage{polish}{\@pppolishtrue}{\@pppolishfalse}

\if@pppolish
\selectlanguage{polish}
\RequirePackage{indentfirst}
%\addto\captionspolish{\renewcommand{\bibname}{Literatura}}   % Force "Literatura" instead of "Bibliografia"
\else
\selectlanguage{english}
\fi

\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{booktabs}

\ifpdf
	\DeclareGraphicsExtensions{.pdf,.png,.jpg}
\else
	\DeclareGraphicsExtensions{.eps}
\fi
\RequirePackage{fancyvrb}

%
% Configure Hyperref
%

\RequirePackage{url}
\RequirePackage{nameref}
\RequirePackage{varioref}

 
\ifpdf
        \usepackage[unicode,linktocpage,bookmarks]{hyperref}
\else
        \usepackage[dvips,unicode,linktocpage,bookmarks]{hyperref}
\fi
\hypersetup{
    pdffitwindow=true,
    bookmarksnumbered=true,
    bookmarksopen=true,
    colorlinks=true,
    pdfpagelayout=SinglePage,
    pdfpagemode=UseOutlines,
    pdfstartview=Fit,
    linkcolor=black,
    citecolor=black,
    anchorcolor=black,
    filecolor=black,
    menucolor=black,
    urlcolor=black,
    pdftitle={Skrypt zastępowych},
    pdfauthor={praca grupowa},
    pdfkeywords={zastępowy, system zastępowy}
}
\RequirePackage{memhfixc}



%
% Customize running titles and page style.
%

\makepagestyle{skryptzast}
\makeevenfoot{skryptzast}{}{}{}
\makeatletter
\newcommand{\@skryptzastmarks}{%
  \let\@mkboth\markboth
  \def\chaptermark##1{\markboth{##1}{##1}}    % left mark & right marks
  \def\sectionmark##1{\markright{%
    \ifnum \c@secnumdepth>\z@
      \thesection. \ %
    \fi
    ##1}}
  \def\tocmark{\markboth{\contentsname}{}}
  \def\lofmark{\markboth{\listfigurename}{}}
  \def\lotmark{\markboth{\listtablename}{}}
  \def\bibmark{\markboth{\bibname}{}}
  \def\indexmark{\markboth{\indexname}{}}
}
\makepsmarks{skryptzast}{\@skryptzastmarks}
\makeatother
\makeevenhead{skryptzast}{\thepage}{}{\normalfont\small\itshape\leftmark}
\makeoddhead{skryptzast}{\normalfont\small\itshape\rightmark}{}{\thepage}

%
% Customize Table of Contents
%
\setcounter{tocdepth}{3}
\maxtocdepth{subsubsection}
\maxsecnumdepth{subsection}

%
% Customize book style
%
% \tightlists
\pagestyle{skryptzast}
\setstocksize{297mm}{210mm}
\settrimmedsize{297mm}{210mm}{*}
\settrims{0pt}{0cm}
\setlrmarginsandblock{3.5cm}{2.5cm}{*}
\setulmarginsandblock{2.5cm}{2.5cm}{*}
\setmarginnotes{6pt}{50pt}{\onelineskip}
\setheadfoot{\onelineskip}{2\onelineskip}
\setheaderspaces{*}{2\onelineskip}{*}
\OnehalfSpacing

\changecaptionwidth
\captionwidth{.9\linewidth}
\captionnamefont{\footnotesize\scshape}
\captiontitlefont{\footnotesize}

\newcommand{\fcmfcaption}[2][\@empty]{
\captionnamefont{\footnotesize\bfseries}%
\captiondelim{.~}
\captionstyle{}
\captiontitlefont{\footnotesize}
\ifx #1\@empty \caption{#2}\else \caption[#1]{#2}}

\newcommand{\fcmtcaption}[2][\@empty]{
\captionnamefont{\footnotesize\bfseries\hfill}%
\captiondelim{}
\captionstyle{\raggedleft\\}
\captiontitlefont{\footnotesize\normalfont}
\ifx #1\@empty \caption{#2}\else \caption[#1]{#2}}

\def\thesubsubsection {\thesubsection .\arabic{subsubsection}}

\checkandfixthelayout

%
% Macros 
%

% English
\newcommand{\termdef}[1]{\emph{#1}}
\newcommand{\acronym}[1]{\emph{\MakeUppercase{#1}}}

% Polish
\newcommand{\definicja}[1]{\termdef{#1}}
\newcommand{\akronim}[1]{\acronym{#1}}
\newcommand{\english}[1]{ang.~\emph{#1}}

% Table head
\newcolumntype{L}{c}\newcommand{\tabhead}[1]{\multicolumn{1}{L}{#1}}