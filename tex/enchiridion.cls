\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{enchiridion}[2014/08/21 Custom class for the enchiridion]

\DeclareOption{letterpaper}{
	\PassOptionsToClass{letterpaper}{memoir}
	\PassOptionsToPackage{letterpaper,margin=0.75in}{geometry}
	}
\DeclareOption{a4paper}{
	\PassOptionsToClass{a4paper}{memoir}
	\PassOptionsToPackage{a4paper,margin=0.75in}{geometry}
}
\DeclareOption{ebook}{
	\PassOptionsToClass{ebook}{memoir}
	\PassOptionsToPackage{paperwidth=6in,paperheight=9in,margin=0.5in,vmargin=0.75in}{geometry}
}
\ProcessOptions\relax


\LoadClass[11pt,oneside,onecolumn]{memoir}
	\chapterstyle{lyhne}
    \makepagestyle{custom}
    \makeevenfoot{custom}{}{\thepage}{}
    \makeoddfoot{custom}{}{\thepage}{}
    \pagestyle{custom}
	
\RequirePackage{geometry}
\RequirePackage{indentfirst}
\RequirePackage{fontspec}
	\setmainfont[Path=../fonts/,Extension=.otf,UprightFont=*-Roman,BoldFont=*-Bold,ItalicFont=*-Italic]{Crimson}
	\setmonofont[Path=../fonts/,UprightFont=Inconsolata.otf,Scale=MatchLowercase]{Inconsolata}
\RequirePackage[english=american]{csquotes}
	\MakeOuterQuote{"}

\RequirePackage{calc}
\RequirePackage{tabularx}
\RequirePackage{longtable}

% Special counters are needed for the outlines, since the references require a longtable environment.
% Basically, we want an outline with citations running along the side, right? But margin notes tend to float,
% and, you know, are in the margins. It turns out that the easiest way to get what we want is to forget
% about enumerate or lists or easylist or tablikelist and just do the blasted thing by hand.
\newcounter{firstcount}
\newcounter{secondcount}
\newcounter{thirdcount}
\newcounter{fourthcount}
\newcommand{\one}{%
	\stepcounter{firstcount}%
	\setcounter{secondcount}{0}%
	\setcounter{thirdcount}{0}%
	\setcounter{fourthcount}{0}%
	\bfseries\scshape %
	\hangindent=25pt\hspace*{0pt}\makebox[25pt][l]{\thefirstcount.}%
}
\newcommand{\two}{%
	\stepcounter{secondcount}%
	\setcounter{thirdcount}{0}%
	\setcounter{fourthcount}{0}%
	\hangindent=50pt\hspace*{25pt}\makebox[25pt][l]{\thefirstcount.\thesecondcount}%
}
\newcommand{\thr}{%
	\stepcounter{thirdcount}%
	\setcounter{fourthcount}{0}%
	\hangindent=75pt\hspace*{50pt}\makebox[25pt][l]{\thethirdcount.}%
}
\newcommand{\for}{%
	\stepcounter{fourthcount}%
	\hangindent=100pt\hspace*{75pt}\makebox[25pt][l]{\alph{fourthcount}.}%
}
% Counters need to be reset if there are separate outlines in one document.
\newcommand{\reset}{%
	\setcounter{firstcount}{0}%
	\setcounter{secondcount}{0}%
	\setcounter{thirdcount}{0}%	
	\setcounter{fourthcount}{0}%	
}

\RequirePackage[colorlinks=true,urlcolor=blue]{hyperref}

\newenvironment{outline}{
	\noindent%
	\setlength{\tabcolsep}{7pt}%
	\begin{longtable}{ @{} p{\textwidth-0.75in} >{\raggedright\arraybackslash\ttfamily\footnotesize}p{0.75in} @{} }
	}{
	\end{longtable}
}