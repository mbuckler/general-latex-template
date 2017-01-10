%=========================================================================
% CBX Problem Set Class
%=========================================================================
%
% Author : Christopher Batten
% Date   : September 6, 2010
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cbxpset}[2010/09/06 ver 0.1]
\LoadClass[9pt]{article}

%-------------------------------------------------------------------------
% Packages
%-------------------------------------------------------------------------

\RequirePackage[T1]{fontenc}  % Make sure we use T1 font encoding
\RequirePackage{mathpazo}     % Use palatino for serif font
\linespread{1.05}             % http://www.tug.dk/FontCatalogue/palatino

\RequirePackage{geometry}     % Page layout
\RequirePackage{caption}      % Flexibly configure captions
\RequirePackage{subfig}       % -> we should move to subcaption soon
\RequirePackage{graphicx}     % To include graphics
\RequirePackage{textcomp}     % For non-math characters (eg. mu)
\RequirePackage{cite}         % Sort cite lists [1,2,3]
\RequirePackage{fancyhdr}     % For headers and footers
\RequirePackage{booktabs}     % Very nice table formatting
\RequirePackage{xcolor}       % Colored text
\RequirePackage{datetime}     % Date/time formatting
\RequirePackage{url}          % Format URLs
\RequirePackage{comment}      % Exclude large portion of text
\RequirePackage{fancyvrb}     % Pretty code formatting
\RequirePackage{array}        % More table options
\RequirePackage{rotating}     % Rotate tables and figures
\RequirePackage{tikz}         % Drawing
\RequirePackage{fixltx2e}
\RequirePackage{titlesec}
\RequirePackage{afterpage}
\RequirePackage{pgffor}

\RequirePackage{calc}         % Basic math operations
\RequirePackage{xifthen}      % Conditional code

%-------------------------------------------------------------------------
% Document Parameters
%-------------------------------------------------------------------------

\renewcommand{\title}[1]      {\gdef\cbx@title{#1}}
\newcommand{\subtitle}[1]     {\gdef\cbx@subtitle{#1}}
\renewcommand{\author}[1]     {\gdef\cbx@author{#1}}
\newcommand{\institution}[1]  {\gdef\cbx@institution{#1}}

%-------------------------------------------------------------------------
% Misc Setup
%-------------------------------------------------------------------------

% Setup date/time formats suitable for revision numbers

\newdateformat{revdate}{\THEYEAR-\twodigit{\THEMONTH}-\twodigit{\THEDAY}}
\newtimeformat{revtime}{\twodigit{\THEHOUR}-\twodigit{\THEMINUTE}}

% Paragraph setup

\setlength{\parskip}{0.5em}
\setlength{\parindent}{0pt}

% Table rule setup

\setlength{\doublerulesep}{0pt}
\newcommand{\thline}{\hline\hline\hline\hline}

% Float spacing

\setlength{\floatsep}{0.3in}
\renewcommand{\floatpagefraction}{0.9}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.9}
\renewcommand{\textfraction}{0.1}
\setcounter{totalnumber}{50}
\setcounter{topnumber}{50}
\setcounter{bottomnumber}{50}

% Orphans and widows

\clubpenalty=10000
\widowpenalty=10000

%-------------------------------------------------------------------------
% Page Layout
%-------------------------------------------------------------------------
% A margin of 1.2in seems to be a good compromise between number of
% characters per line vs. compactness.

\geometry
{%
  margin=0.6in,
  headheight=15pt,
  footskip=45pt,
}

%-------------------------------------------------------------------------
% Header/Footers
%-------------------------------------------------------------------------
% We put the title and subtitle in the header and the page numbers are
% centered in the footer.

\fancypagestyle{mainpagestyle}%
{%
  \fancyhead{}%
  \fancyfoot{}%
  %
  % Header Left
  %
  \fancyhead[L]
  {%
    \ifthenelse{ \NOT\isundefined{\cbx@subtitle} }%
    {%
      %\textit{ECE 5745, \cbx@subtitle}%
    }{}%
  }%
  %
  % Header Center
  %
  \fancyhead[C]
  {%
    \ifthenelse{ \isundefined{\cbx@subtitle} }%
    {%
      \textit{\cbx@title}%
    }{}%
  }%
  %
  % Header Right
  %
  \fancyhead[R]
  {%
    \ifthenelse{ \NOT\isundefined{\cbx@subtitle} }%
    {%
      \textit{} %{\cbx@author}%\cbx@subtitle}%
    }{}%
  }%
  %
  % Footer
  %
  %\fancyfoot[C]{\thepage}%
}%

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\pagestyle{mainpagestyle}

%-------------------------------------------------------------------------
% Title Block
%-------------------------------------------------------------------------

\renewcommand{\@maketitle}
{%
  \centering%
  %
  % Title
  %
  {\Large\textbf{\cbx@title}\par}%
  %
  % Subtitle
  %
  \ifthenelse{ \NOT\isundefined{\cbx@subtitle} }%
  {%
    {\Large\textbf{\cbx@subtitle}\par}%
  }{}%
  %
  % Author
  %
  \ifthenelse{ \NOT\isundefined{\cbx@author} }%
  {%
    \vspace{0.15in}%
    {\large\cbx@author\par}%
  }{}%
  %
  % Institution
  %
  \ifthenelse{ \NOT\isundefined{\cbx@institution} }%
  {%
    \vspace{0.1in}%
    {\cbx@institution\par}%
  }{}%
  %
  % Revision
  %
  %\vspace{0.1in}%
  %revision: \revdate\today{}-\revtime\par%
  %
  \thispagestyle{empty}%
}

%-------------------------------------------------------------------------
% Caption Setup
%-------------------------------------------------------------------------

\captionsetup{font={bf},labelfont={bf}}
\newcommand{\captionreset}
{%
  \captionsetup{font={bf},labelfont={bf}}
}

%-------------------------------------------------------------------------
% Section Headers
%-------------------------------------------------------------------------

%\titleformat{\section}
%  {\normalfont\bfseries\large}
%  {Problem \thesection.}
%  {1.5ex}{}{}

\titlespacing{\section}{-1pt}{*1}{*1}

%\titleformat{\subsection}
%  {\normalfont\bfseries}
%  {Part \thesection.\Alph{subsection}}
%  {1.5ex}{}{}
%
\titlespacing{\subsection}{-1pt}{*2}{*1}
%\renewcommand{\thesubsection}{\thesection.\Alph{subsection}}
%
%\renewcommand{\contentsname}{List of Problems}
%\newcommand{\contentsfinish}{}

%-------------------------------------------------------------------------
% Table row formatting
%-------------------------------------------------------------------------

\newcolumntype{+}
{%
  >{\global\let\currentrowstyle\relax}%
}

\newcolumntype{^}
{%
  >{\currentrowstyle}%
}

\newcommand{\rs}
{%
  \gdef\currentrowstyle{\lastrowstyle}%
  \lastrowstyle\ignorespaces%
}

\newcommand{\rowstyle}[1]
{%
  \gdef\lastrowstyle{#1}%
  \gdef\currentrowstyle{#1}%
  #1\ignorespaces%
}

%-------------------------------------------------------------------------
% Code block formatting
%-------------------------------------------------------------------------

\renewcommand{\FancyVerbFormatLine}[1]
{%
  \parbox{2.5ex}{\raggedleft\theFancyVerbLine} #1%
}

%-------------------------------------------------------------------------
% Lists
%-------------------------------------------------------------------------

\newenvironment{cbxlist}[4][\textbullet]
{%
  \begin{list}{#1}
  {%
    \setlength{\leftmargin}{#2}
    \setlength{\rightmargin}{#3}
    \setlength{\topsep}{0pt}
    \setlength{\parsep}{0pt}
    \setlength{\listparindent}{0pt}
    \setlength{\itemsep}{#4}
  }
}{%
  \end{list}
}

%-------------------------------------------------------------------------
% Pipe diagram
%-------------------------------------------------------------------------

\@namedef{cbx@cycles1}{0}
\@namedef{cbx@cycles2}{0&1}
\@namedef{cbx@cycles3}{0&1&2}
\@namedef{cbx@cycles4}{0&1&2&3}
\@namedef{cbx@cycles5}{0&1&2&3&4}
\@namedef{cbx@cycles6}{0&1&2&3&4&5}
\@namedef{cbx@cycles7}{0&1&2&3&4&5&6}
\@namedef{cbx@cycles8}{0&1&2&3&4&5&6&7}
\@namedef{cbx@cycles9}{0&1&2&3&4&5&6&7&8}
\@namedef{cbx@cycles10}{0&1&2&3&4&5&6&7&8&9}
\@namedef{cbx@cycles11}{0&1&2&3&4&5&6&7&8&9&10}
\@namedef{cbx@cycles12}{0&1&2&3&4&5&6&7&8&9&10&11}
\@namedef{cbx@cycles13}{0&1&2&3&4&5&6&7&8&9&10&11&12}
\@namedef{cbx@cycles14}{0&1&2&3&4&5&6&7&8&9&10&11&12&13}
\@namedef{cbx@cycles15}{0&1&2&3&4&5&6&7&8&9&10&11&12&13&14}
\@namedef{cbx@cycles16}{0&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15}
\@namedef{cbx@cycles17}{0&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16}
\@namedef{cbx@cycles18}{0&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16&17}
\@namedef{cbx@cycles19}{0&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16&17&18}
\@namedef{cbx@cycles20}{0&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16&17&18&19}
\@namedef{cbx@cycles21}{0&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16&17&18&19&20}
\@namedef{cbx@cycles22}{0&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16&17&18&19&20&21}
\@namedef{cbx@cycles23}{0&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16&17&18&19&20&21&22}
\@namedef{cbx@cycles24}{0&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16&17&18&19&20&21&22&23}
\@namedef{cbx@cycles25}{0&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16&17&18&19&20&21&22&23&24}
\@namedef{cbx@cycles26}{0&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16&17&18&19&20&21&22&23&24&25}
\@namedef{cbx@cycles27}{0&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16&17&18&19&20&21&22&23&24&25&26}
\@namedef{cbx@cycles28}{0&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16&17&18&19&20&21&22&23&24&25&26&27}
\@namedef{cbx@cycles29}{0&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16&17&18&19&20&21&22&23&24&25&26&27&28}

\newcounter{pdcounter}
\newenvironment{pipediagram}[1]
{%
  \setcounter{pdcounter}{1}\setcounter{nodecounter}{0}
  \centering\setlength{\tabcolsep}{0.4em}
  \begin{tabular}{+c@{\hspace{1ex}}^>{\ttfamily\normalsize}l*{#1}{^>{\centering\arraybackslash}m{1em}}}
  \toprule
%
\rowstyle{\bfseries\rmfamily}
\rs & Dynamic          & \multicolumn{#1}{c}{\BF{Cycle}} \\
\rs & Transaction      & \@nameuse{cbx@cycles#1} \\\tmidrule
}{%
  \bottomrule
  \end{tabular}\par
}

\newcommand{\pd}
{%
  \thepdcounter\addtocounter{pdcounter}{1} & %
}

%-------------------------------------------------------------------------
% Helpers for drawing raw deps
%-------------------------------------------------------------------------

\tikzset{pipestage/.style={red,thick,draw,circle,minimum size=1.4em,}}
\tikzset{rawdep/.style={red,thick,->}}
\tikzset{ctrldep/.style={dashed,red,very thick,->}}

\newcounter{nodecounter}
\setcounter{nodecounter}{0}
\newcommand{\nF}{ \tikz[remember picture] \node[inner sep=0pt]
(n\thenodecounter) {F}; \addtocounter{nodecounter}{1}}
\newcommand{\nD}{ \tikz[remember picture] \node[inner sep=0pt]
(n\thenodecounter) {D}; \addtocounter{nodecounter}{1}}
\newcommand{\nXa}{\tikz[remember picture] \node[inner sep=0pt]
(n\thenodecounter) {X0};\addtocounter{nodecounter}{1}}
\newcommand{\nXb}{\tikz[remember picture] \node[inner sep=0pt]
(n\thenodecounter) {X1};\addtocounter{nodecounter}{1}}
\newcommand{\nM}{ \tikz[remember picture] \node[inner sep=0pt]
(n\thenodecounter) {M}; \addtocounter{nodecounter}{1}}
\newcommand{\nW}{ \tikz[remember picture] \node[inner sep=0pt]
(n\thenodecounter) {W}; \addtocounter{nodecounter}{1}}

%-------------------------------------------------------------------------
% Simple Macros
%-------------------------------------------------------------------------

\newcommand{\fixme}[1]{{\color{red}\bfseries [ FIXME: #1 ]}}
\newcommand{\wu}[2]{\mbox{#1\,#2}}
\newcommand{\um}{\mbox{\textmu m}}
\newcommand{\X}{$\times$}
\newcommand{\by}{$\times$}
\newcommand{\tw}{\textwidth}
\newcommand{\cw}{\columnwidth}
\newcommand{\larrow}{$\leftarrow$}
\newcommand{\la}{$\leftarrow$~}
\newcommand{\rarrow}{$\rightarrow$}

\newcommand{\TT}[1]{\texttt{#1}}
\newcommand{\BF}[1]{\textbf{#1}}
\newcommand{\IT}[1]{\textit{#1}}
\newcommand{\RM}[1]{\textrm{#1}}

\newcommand{\mc}[2]{\multicolumn{#1}{c}{\textbf{#2}}}
\newcommand{\tmidrule}{\midrule[\heavyrulewidth]}

\newcommand{\T}{$\tau$}


