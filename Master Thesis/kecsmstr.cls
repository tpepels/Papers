% Class kecsmstr
% Derived  from JDThesis and book
% (C) 2006 Jeroen Donkers

\LoadClassWithOptions{book}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage[CiteRef]{ikatcite}
\RequirePackage{float}
\RequirePackage{index}
\RequirePackage{calc}
\RequirePackage[english]{babel}
\RequirePackage{lettrine}
\typeout{KECSMSTR class 27/09/2006}


\def\@thesisdate{}%
\def\thesisdate#1{\def\@thesisdate{#1}} 

\def\@thesistype{Master of Science of Knowledge Engineering}%
\def\thesistype#1{\def\@thesistype{#1}} 

\def\@thesisnumber{}%
\def\thesisnumber#1{\def\@thesisnumber{#1}} 

\def\@committee{Member 1 // Member 2 // Member 3}%
\def\committee#1{\def\@committee{#1}} 

\def\emptypage{\clearpage{\pagestyle{empty}\cleardoublepage}}%

\def\maketitle{%
\begin{titlepage}
 \enlargethispage{2cm}
 \thispagestyle{empty}
 \begin{minipage}[t]{14cm} 
 \begin{center}
 \vspace*{4.5cm}
 \parbox[t]{9cm}{\center \bf \MakeUppercase{\@title}} \\
 \vspace{0.4cm}
{\large \@author} \\ 
 \vspace{0.3cm}
 Master Thesis \@thesisnumber \\
 \vspace{4cm}
\textsc{Thesis submitted in partial fulfilment\\
of the requirements for the degree of\\
\@thesistype \\
at the Faculty of Humanities and Sciences\\
of Maastricht University}\\
\vspace{4cm}
 Thesis committee: \\ \vspace{0.5cm}
                  \@committee \\
 \vspace{2cm}
 Maastricht University \\
 Department of Knowledge Engineering\\
 Maastricht, The Netherlands\\
 \@thesisdate                    
 \end{center}
 \end{minipage}
 \end{titlepage} 
}

\newlength{\bibhang}
\setlength{\bibhang}{2em}

\renewcommand{\thebibliography}[1]{
  \renewcommand{\bibname}{References}
  \chapter*{\bibname\@mkboth%
  {\emph{\bibname}}{\emph{\bibname}}}\list
  {\relax}{\setlength{\labelsep}{0em}
        \setlength{\itemindent}{-\bibhang}
        \setlength{\leftmargin}{\bibhang}}
    \def\newblock{\hskip .11em plus .33em minus .07em}
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax
    \addcontentsline{toc}{chapter}{\bibname}%
    }

\renewcommand{\endthebibliography}{%
  \def\@noitemerr{\@warning{Empty `thebibliography' environment}}%
  \endlist}

\newcounter{pubcounter}
\newenvironment{thepubs}{
  \setcounter{pubcounter}{0}
  \newcommand{\pubname}{Publications}
  \chapter*{\pubname\@mkboth%
  {\emph{\pubname}}{\emph{\pubname}}}\begin{list}{[\small \arabic{pubcounter}]}
  {\usecounter{pubcounter}
    %\setlength{\labelsep}{0em}
    %\setlength{\itemindent}{-\bibhang}
    \setlength{\itemsep}{-2pt}
    \setlength{\leftmargin}{20pt}
   }
    \def\newblock{\hskip .11em plus .33em minus .07em}
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax
    \addcontentsline{toc}{chapter}{\pubname}%
}{\def\@noitemerr{\@warning{Empty `thepublications' environment}}%
  \end{list}}

\newcommand{\pubitem}[1]{
   \item \small #1
}


\newif\if@firstappendix
\@firstappendixfalse

\renewcommand\appendix{
  \@firstappendixtrue
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \renewcommand{\chaptername}{Appendix}
  \renewcommand{\thechapter}{\Alph{chapter}}
  \renewcommand{\chaptermark}[1]{\markboth{\emph{Appendix \thechapter: ##1}}{\emph{Appendix \thechapter: ##1}}}
}

\newcommand{\appchapter}[1]{
 \if@firstappendix%
 \addtocontents{toc}{\protect\contentsline {chapter}{Appendices}{}}
 \@firstappendixfalse
 \fi
 \chapter{#1}
}

\newif\if@restonecol
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \emph{\contentsname}}{\emph{\contentsname}}}%
    \addcontentsline{toc}{chapter}{\contentsname}
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }

\newcommand{\chapterx}[1]{
 \chapter*{#1}
  \@mkboth{\emph{#1}}{\emph{#1}}%
 \addcontentsline{toc}{chapter}{#1}
}

\newcommand{\drop}[1]{\dropping[-6pt]{2}{\itshape{} #1}}

\newenvironment{chapterintro}%
{\begin{quote}%
\slshape\large%
\def\Bigletter{\drop}%
\expandafter\Bigletter}
{\medskip \newline \hrule \end{quote} }

\newenvironment{chaptercontents}%
{\addtocontents{alg}{\protect\addvspace{10\p@}}%
\noindent \small {\bf Chapter contents:}  }
{}

\newsavebox{\fminibox}
\newlength{\fminilength}
\newenvironment{fminipage}[1][\linewidth]
{\setlength{\fminilength}{#1-\fboxsep-2\fboxrule}%
\begin{lrbox}{\fminibox}\begin{minipage}{\fminilength}}
{\end{minipage}\end{lrbox}\noindent{\fbox{\usebox{\fminibox}}}}

\newenvironment{itlist}%
{\renewcommand{\labelitemi}{-}%
\addtolength{\topsep}{-7pt}\begin{itemize}\addtolength{\itemsep}{-7pt}}
{\end{itemize}}


% ============= FLOAT CONTROL ========================
\renewcommand{\topfraction}{1.0}
\renewcommand{\bottomfraction}{1.0}
\renewcommand{\textfraction}{0.0}

\renewcommand\listof[2]{%
  \@ifundefined{ext@#1}{\float@error{#1}}{%
   \section*{#2}%
   \addcontentsline{toc}{chapter}{#2}
   \@namedef{l@#1}{\@dottedtocline{1}{1.5em}{2.3em}}%
   \@starttoc{\@nameuse{ext@#1}}}}


% ============= PAGE LAYOUT ========================

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\emph{#1}}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ --- \emph{#1}}}
\renewcommand{\headrulewidth}{0pt} % no line

\def\version{
version \today}

\def\makeheaders{
  \setlength{\headwidth}{\textwidth}
  \fancyhf{}
  \fancyhead[LE,RO]{\thepage}
  \fancyhead[LO]{\rightmark}
  \fancyhead[RE]{\leftmark}
  \fancypagestyle{plain}{%
    \fancyhead{} % get rid of headers
  }
}



\geometry{a4paper}
\geometry{top=3cm,bottom=3cm,left=2.5cm,right=2.5cm}
\geometry{twoside}
