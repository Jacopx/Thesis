% rapporto.cls	1 luglio 1994
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rapporto}[1994/06/01 LaTeX class *italiano*]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions

\LoadClass{report}
%
% Definizione del comando italiano
%
\providecommand\italiano{\language=1 \lccode`\'=`\' \righthyphenmin=2}
\providecommand\inglese{\language=0 \lccode`\'=0 \righthyphenmin=3}
%
% Ridefinito per l'italiano
\renewcommand\contentsname	 {Indice}
\renewcommand\listfigurename	 {Elenco delle figure}
\renewcommand\listtablename	 {Elenco delle tabelle}
\renewcommand\bibname		 {Bibliografia}
\renewcommand\indexname 	 {Indice analitico}
\renewcommand\figurename	 {Figura}
\renewcommand\tablename 	 {Tabella}
\renewcommand\chaptername	 {Capitolo}
\renewcommand\appendixname	 {Appendice}
\renewcommand\partname		 {Parte}
\renewcommand\abstractname	 {Sommario}
\renewcommand\@chapapp		 {}
\renewcommand\today		 {\number\day\space\ifcase\month\or
 gennaio\or febbraio\or marzo\or aprile\or maggio\or giugno\or
 luglio\or agosto\or settembre\or ottobre\or novembre\or dicembre\fi
\space\number\year}
%
% Lettere accentate
%
% \catcode`\Ö=\active \providecommand{Ö}{\`a}
% \catcode`\ä=\active \providecommand{ä}{\`e}
% \catcode`\Ç=\active \providecommand{Ç}{\'e}
% \catcode`\ç=\active \providecommand{ç}{{\`\i}}
% \catcode`\ï=\active \providecommand{ï}{\`o}
% \catcode`\ó=\active \providecommand{ó}{\`u}
% \RequirePackage{ibmkbd}
%
% Ridefiniti per avere delle spaziature diverse
\renewcommand\l@section      {\@dottedtocline{1}{1.5em}{2.5em}}
\renewcommand\l@subsection   {\@dottedtocline{2}{4em}{3.4em}}
\renewcommand\l@subsubsection{\@dottedtocline{3}{7.4em}{4.3em}}
\renewcommand\l@paragraph    {\@dottedtocline{4}{10em}{5.2em}}
\renewcommand\l@subparagraph {\@dottedtocline{5}{12em}{6.2em}}
%
% Questi numeri sono critici; li ho ridefiniti, dopo il carattere di commento
% c'e` il valore originale
%
\setcounter{topnumber}{2}
\renewcommand\topfraction{1}			 % {.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.5}		 % {.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{0}			 % {.2}
\renewcommand\floatpagefraction{0.9}		 % {.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{1} 		 % {.7}
\renewcommand\dblfloatpagefraction{0}		 % {.5}
\renewcommand\fps@figure{htb}
\renewcommand\fps@table{htb}

%
% Ridefinito per usare un carattere piu` piccolo
\newdimen\captionwidth
\newskip\l@c@s \l@c@s 12\p@ \@plus 2\p@ \@minus 2\p@
\renewcommand\@makecaption[2]{%
  \captionwidth=.9\hsize
  {\def\baselinestretch{0.9}%
  \small\sbox\@tempboxa{#1.\hskip\l@c@s#2}\dimen@\wd\@tempboxa
  \ifdim\dimen@<\captionwidth
  \else
    \setbox\@tempboxa\vbox{\hsize\captionwidth\parskip\z@
    \finalhyphendemerits10000000
    #1.\hskip\l@c@s
    #2\par\global\setbox0\lastbox}
    \setbox0\hbox{\unhbox0\unskip}
    \ifdim\wd0<.8\captionwidth
       \count@\dimen@\divide\count@\captionwidth
       \advance\count@ 2
       \dimen@\captionwidth
       \advance\dimen@-\wd0%\dimen@ .9\dimen@
       \divide\dimen@\count@
       \advance\captionwidth-\dimen@
       \setbox\@tempboxa\vbox{\hsize\captionwidth\parskip\z@
       \finalhyphendemerits10000000
       #1.\hskip\l@c@s
       #2\par\global\setbox0\lastbox}
    \fi
    \setbox\@tempboxa\vbox{\hsize\captionwidth
			   \unvbox\@tempboxa
			   \centerline{\hfill\unhbox0\hfill}%
			  }
  \fi
  \vskip\abovecaptionskip
  \centerline{\box\@tempboxa}
  \vskip\belowcaptionskip
  }
}
%
% Ridefinito per avere gli headings come nel mauale LaTeX
%
\if@twoside
   \renewcommand\ps@headings{\let\@mkboth\markboth
      \renewcommand\@oddfoot{}\renewcommand\@evenfoot{}%
      \renewcommand\@evenhead{\relax
	 \underline{\makebox[\textwidth]{{\small\bfseries \thepage\hfill
	 \leftmark}\rule[-0.5ex]{0pt}{1ex}}}%
      }
      \renewcommand\@oddhead{\relax
	 \underline{\makebox[\textwidth]{{\small\bfseries \rightmark \hfill
	 \thepage}\rule[-0.5ex]{0pt}{1ex}}}%
      }
      \renewcommand\chaptermark[1]{\markboth
	 {{\ifnum \c@secnumdepth>\m@ne \@chapapp\ \thechapter. \ \fi ##1}}{}%
      }
      \renewcommand\sectionmark[1]{\markright
	 {{\ifnum \c@secnumdepth >\z@ \thesection. \ \fi ##1}}%
      }%
   }
\else
   \renewcommand\ps@headings{%
      \let\@mkboth\markboth
      \renewcommand\@oddfoot{}\renewcommand\@evenfoot{}%
      \renewcommand\@oddhead{\relax
	 \underline{\makebox[\textwidth]{{\small\bfseries \rightmark \hfill
	 \thepage}\rule[-0.5ex]{0pt}{1ex}}}%
      }
      \renewcommand\chaptermark[1]{\markright
	 {{\ifnum \c@secnumdepth>\m@ne \@chapapp\ \thechapter. \ \fi ##1}}%
      }%
   }
\fi
\renewcommand\cleardoublepage{\clearpage\ifodd\c@page\else \null
   \thispagestyle{plain}\clearpage\fi
}
\mathcode`\,="013B      % Perche` la virgola sia il separatore decimale
\italiano
\endinput
