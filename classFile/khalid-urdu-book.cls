%% شروعات فائل khalidurdubook.cls 
% Khalid Urdu Books کلاس فائل


\ProvidesClass{khalid-urdu-book}[2021/03/27 v0.1 Urdu Book Class by Khalid Khan]
\NeedsTeXFormat{LaTeX2e}

%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{book}
}
\ProcessOptions\relax
\LoadClass[leqno]{book}

%-------------------------------------------------
%                    3rd party packages
%-------------------------------------------------
\RequirePackage[quiet]{fontspec}
\RequirePackage{makeidx} %generates index
\RequirePackage{amsmath} %\tfrac for fractions in text
\RequirePackage{amssymb} %ams symbols
\RequirePackage{amsthm} %theorem environment. started using in the maths book
\RequirePackage{mathtools}
\RequirePackage{commath} %differentiation symbols
\RequirePackage{upgreek}
\RequirePackage{bm} %bold greek letters too
\RequirePackage{lineno}	%line numbers in pdf
\RequirePackage{graphics}
\RequirePackage{graphicx} 
\RequirePackage{cancel}	%not used
\RequirePackage{mathpazo} %kkk   causes trouble with siunitx units such as ohm which needs correction using sisetup
\RequirePackage{booktabs} %for tables toprule, midrule and bottomrule
\RequirePackage{parskip} 
\RequirePackage[stable,bottom]{footmisc} %for footnotes in the headings

\RequirePackage{siunitx} %SI units that meets iso-31 regulations such as \micro, \degree \SI{3}{\celsius}
%\sisetup{per=frac,fraction=nice}    %setup for siunitx
\sisetup{per=reciprocal,fraction=nice}    %setup for siunitx

\protected\def\numpi{\text{\ensuremath{\pi}}}  %25 june 2015, these two lines were added to be able to use numpi as pi in SI commands.
\sisetup{input-symbols = \numpi} %without it, in the presence of mathpazo package, SI would show beta instead of pi
\DeclareSIUnit\litre{\liter}
\DeclareSIUnit{\pH}{pH}

\RequirePackage{steinmetz} %\phase to show angle of phasors
\RequirePackage[version=3]{mhchem} %chemical symbols such as \ce{H2O}

\RequirePackage{geometry} %use this command and put b5paper in documentclass statement to set b5papersize
%\RequirePackage[paperwidth=8in,paperheight=10.25in,]{geometry}  %to use b5paper size, use the command above for using geometry package
%\RequirePackage[margin=1cm]{geometry}                        %the geometry package gives correct page size in pdf meta data i.e. pdf file properties
%\pdfpagewidth=\paperwidth              %instead of the geometry package, could have used these two lines      
%\pdfpageheight=\paperheight

% \RequirePackage{microtype}               %underfull messages try using it if needed. check first if it works with xelatex

%\RequirePackage{makeidx}                %  \makeindex 
\RequirePackage{placeins}                   % \FloatBarrier
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{caption} %must be placed before bidi
\RequirePackage{subcaption}

\RequirePackage[hidelinks]{hyperref}                   %loaded second last just before polyglossia. still giving problems
\RequirePackage{polyglossia}                %is loaded the last. this is the package that handles urdu
\RequirePackage{tikz}
\RequirePackage{ifthen}
\RequirePackage{tikz-3dplot}
\RequirePackage{pgfplots}
\RequirePackage[siunitx, RPvoltages]{circuitikz}
\usetikzlibrary{intersections,calc,decorations.markings,decorations.pathreplacing}
%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir


%\renewcommand\thelinenumber{\textenglish{\arabic{linenumber}}}
%\linenumbers												%for line numbers in pdf

\setmainlanguage{urdu}

\setotherlanguage{english}
%\newfontfamily\urdufont[Scale=1.0]{Jameel Noori Nastaleeq}             %defining urdufont attaches it to mainlanguage{urdu} defined above
%https://tex.stackexchange.com/a/63975/56715
%Dont use space or underscore in font names
\setmainfont[
Path=\@fontdir,
Script=Arabic,
Extension=.ttf,
ItalicFont= JameelNooriNastaleeqItalic,
Scale=1.0]{JameelNooriNastaleeq}             %defining urdufont attaches it to mainlanguage{urdu} defined above

\setmonofont[
Path=\@fontdir,
Extension=.ttf,	
ItalicFont=*-Oblique,
BoldFont=*-Bold,
BoldItalicFont=*-BoldOblique,
Scale=1.0]{DejaVuSansMono} %had to add this and the next line to get going after ubuntu upgrade
\let\urdufontt\ttfamily                                                                                  %had to add this and the above line to get going after ubuntu upgrade
\newfontfamily\urduTechTermsfont[
Path=\@fontdir,
Scale=1.0,
Extension=.ttf,
Script=Arabic]{AASameerSagarNastaleeqBold}

\def\urdunumber#1{\protect\farsidigits{\number#1}}
\setlatin
%fix equation numbering for formulas
\makeatletter
\def\tagform@#1{\maketag@@@{(\ignorespaces#1\unskip)}}
\makeatother

%%\newfontfamily\AcaciasHand{AcaciasHand}

\setcounter{secnumdepth}{3} 

%-------------------------------------------------------------------------
%following are urdu wrappers for the commonly used english latex commands
%-------------------------------------------------------------------------

%chapter, section etc
%  \newcommand*{newcommand}[arguments]{actual command}
\newcommand*{\باب}[1]{\chapter{#1}}                                      %defining commonly used commands
\newcommand*{\حصہ}[1]{\section{#1}}
\newcommand*{\جزوحصہ}[1]{\subsection{#1}}
\newcommand*{\جزوجزوحصہ}[1]{\subsubsection{#1}}

\newcommand*{\بابء}[1]{\chapter*{#1}}                                      %defining commonly used commands
\newcommand*{\حصہء}[1]{\section*{#1}}
\newcommand*{\جزوحصہء}[1]{\subsection*{#1}}
\newcommand*{\جزوجزوحصہء}[1]{\subsubsection*{#1}}


%english text in urdu mode
\newcommand*{\تحریر}[1]{\textenglish{#1}}	% english text in urduMode
%\newcommand*{\موٹا}[1]{\textbf{#1}}
%\newcommand*{\ترچھا}[1]{{\textit{#1}}}
\newcommand*{\موٹا}[1]{{\urduTechTermsfont{#1}}}
\newcommand*{\ترچھا}[1]{{\small{#1}}}

%%\newcommand*{\اصطلاح}[1]{{\color{red}{#1}}}   %colours spills to next word when there is index or footnote entry with the word
%%\newcommand{\اصطلاح}[1]{{\urdufontBig{#1}}}

\newcommand{\اصطلاح}[1]{{\urduTechTermsfont{#1}}}  %%%moved to main file


%end commands cannot be redefined and as such these two are not usable
\providecommand*{\ابتدا}[1]{\begin{#1}}
	\providecommand*{\انتہا}[1]{\end{#1}}

%include and input directives for adding external files into the main document 
\newcommand*{\بشمول}[1]{\includeonly{#1}}
\newcommand*{\شامل}[1]{\include{#1}}
\newcommand*{\داخل}[1]{\input{#1}}

%to use extra latex packages
\newcommand*{\استعمال}[1]{\usepackage{#1}}

%footnotes and indexes
\newcommand*{\حاشیہب}[1]{{\raggedright{\footnote{\textenglish{#1}}}} }          %  moved to main file. footnote to the left hand side
\newcommand*{\حاشیہد}[1]{{\raggedleft{\footnote{#1}}}}
\newcommand*{\حاشیہط}[1]{\marginpar{#1}}

\newcommand*{\فرہنگ}[1]{\index{#1}}

%references and labels
\newcommand*{\شناخت}[1]{\label{#1}}
\newcommand*{\حوالہ}[1]{\ref{#1}}
\newcommand*{\حوالہء}[1]{#1}			%dummy to enter the figure number directly while the figure is not ready
\newcommand*{\حوالہصفحہ}[1]{\pageref{#1}}

%counters
\newcommand*{\فاصلہ}{\vspace*{10mm}}
\newcommand*{\فاصلہء}{\quad}

%itemize, bullets and numbered items   
\newcommand*{\اشیاء}{itemize}                               %used in   \begin{itemize}
\newcommand*{\شے}[1]{\item {#1}}			%used in    \item, \description
%description
\newcommand*{\جزو}[1]{\item[#1]}                      %used in \begin{description}
%maths commands
\newcommand*{\عددی}[1]{\: \ensuremath{#1} \:} % in-line math & inside math mode
\newcommand*{\عددیء}[1]{\ensuremath{#1}}
\newcommand*{\سمتیہ}[1]{\ensuremath{{\bf{#1}}}}
\newcommand*{\سمتیہز}[2]{{\ensuremath{{\boldsymbol{#1}_{#2}}}}}     %with non-vector subscript
\newcommand*{\سمتیازیرنوشت}[2]{\ensuremath{{\boldsymbol{#1}}_{\textup{#2}}}}
\newcommand*{\ضرب}{\time}					%multiplication symbol
\newcommand*{\نکطہد}{\cdot}
\newcommand*{\نقطے}{\ensuremath{\cdots}}

\newcommand*{\زیرنوشت}[3]{\: \ensuremath{{#1_{#2 \textrm {#3}}}} \:}   %english+urdu subscript \زیرنوشت{V}{CE}{غیرافزائندہ}
\newcommand*{\سیدھازیرنوشت}[2]{\: \ensuremath{{#1_{\textup{#2}}}} \:} %RC

\newcommand*{\قریب}[1]{\mbox{#1}}  %dissallows splitting along two lines 
\newcommand{\سن}[1]{؁\,\ensuremath{#1}}
\newcommand{\زور}[1]{\aemph{#1}} %overline urdu text to emphasize


\renewcommand{\indexname}{فرہنگ}        %does nothing here. must be placed within begin{urdufont} environment to be the last to take effect 
%===============================


%numbering scheme
\renewcommand*{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand*{\thetable}{\thechapter.\arabic{table}}
\renewcommand*{\theequation}{\thechapter.\arabic{equation}}
\renewcommand*{\thesection}{\thechapter.\arabic{section}}
\renewcommand*{\thesubsection}{\thechapter.\arabic{section}.\arabic{subsection}}
\renewcommand*{\thesubsubsection}{\thechapter.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}
%=======================================
%the following pertains to theorem environment. added to maths sty
%\renewcommand*{\thetheorem}{\thechapter.\arabic{theorem}}
%\renewcommand*{\thecorollary}{\thechapter.\arabic{theorem}.\arabic{corollary}}
%\renewcommand*{\thelemma}{\thechapter.\arabic{lemma}}
%\renewcommand*{\thedefinition}{\thechapter.\arabic{definition}.}

%================
%my environments
%================

%environment for examples مثال
%\newcounter{examplecounter}[section]
%\renewcommand{\theexamplecounter}{\arabic{examplecounter}}
\newcounter{examplecounter}[chapter]
\renewcommand{\theexamplecounter}{\thechapter.\arabic{examplecounter}}

\newenvironment*{مثال}
{\par\noindent\ignorespaces    مثال \refstepcounter{examplecounter} \theexamplecounter :\quad}%
{\hfill\qedsymbol  \vspace{\baselineskip}\par}
%{\noindent\ignorespaces \vspace{\baselineskip} \hrule \vspace{\baselineskip}  مثال \refstepcounter{examplecounter} \theexamplecounter :}%
%{\par\noindent \hrule  \vspace{\baselineskip}}

%------
%practice problems environment مشق

%\newcounter{practicecounter}[section]                              %practice here means مشق
%\renewcommand{\thepracticecounter}{\arabic{practicecounter}}
\newcounter{practicecounter}[chapter]                              %practice here means مشق
\renewcommand{\thepracticecounter}{\thechapter.\arabic{practicecounter}}

\newenvironment*{مشق}
{\par\noindent\ignorespaces \vspace{\baselineskip} \hrule \vspace{\baselineskip} مشق \refstepcounter{practicecounter} \thepracticecounter :\quad}%
{\par\noindent \hrule  \vspace{\baselineskip}}
%---------

%end of chapter questions environment سوال

\newcounter{questioncounter}[chapter]                           %for reseting at every section. to be used only during writing stage
%\renewcommand{\thequestioncounter}{\arabic{questioncounter}}
%\newcounter{questioncounter}[chapter]						%when book is finished, use this instead of the above
\renewcommand{\thequestioncounter}{\thechapter.\arabic{questioncounter}}

\newenvironment*{سوال}				
{\noindent\ignorespaces  سوال \refstepcounter{questioncounter} \thequestioncounter :\quad}%
{\par\noindent\ignorespaces }
%--------------------

%defining a LAW   قانون

%\newcounter{lawcounter}[section]
%\renewcommand{\thelawcounter}{\arabic{lawcounter}}
\newcounter{lawcounter}[chapter]
\renewcommand{\thelawcounter}{\thechapter.\arabic{lawcounter}}

\newenvironment*{قانون}				
{\par\medskip \refstepcounter{lawcounter} \quad\nopagebreak}%
{\par\hfill\qedsymbol  \vspace{\baselineskip}\par }
%{\par\medskip }
%--------------------
%--------------------

%defining a THEOREM   مسئلہ

%\newcounter{kthcounter}[section]
%\renewcommand{\thekthcounter}{\arabic{kthcounter}}
\newcounter{kthcounter}[chapter]
\renewcommand{\thekthcounter}{\thechapter.\arabic{kthcounter}}

\newenvironment*{مسئلہ}				
{\par\noindent\ignorespaces  مسئلہ \refstepcounter{kthcounter} \thekthcounter :\quad}%
{\par\noindent }
%--------------------
%--------------------

%defining a Proof   ثبوت

%\newcounter{kprcounter}[chapter]
%\renewcommand{\thekprcounter}{\thechapter.\arabic{kprcounter}}

\newenvironment*{ثبوت}				
{\noindent\ignorespaces  ثبوت :\quad}%
{\par\hfill\qedsymbol  \vspace{\baselineskip}\par }
%{\par\noindent\qedsymbol  \vspace{\baselineskip} }
%--------------------
%--------------------
%++++++++++++++++++++++++++++++

%--------------------

%defining a COROLLARY   ضمنی نتیجہ


\newcounter{kcocounter}[chapter]
\renewcommand{\thekcocounter}{\thechapter.\arabic{kcocounter}}

\newenvironment*{ضمنی نتیجہ}				
{\par\noindent\ignorespaces  ضمنی نتیجہ \refstepcounter{kcocounter} \thekcocounter :\quad}%
{\par\noindent }
%--------------------
%--------------------

%defining a Proof   ثبوت ضمنی نتیجہ

%\newcounter{kprcocounter}[chapter]
%\renewcommand{\thekprcocounter}{\thechapter.\arabic{kprcocounter}}

\newenvironment*{ثبوت ضمنی نتیجہ}				
{\noindent\ignorespaces  ثبوت ضمنی نتیجہ :\quad}%
{\par\hfill\qedsymbol  \vspace{\baselineskip}\par }
%{\par\noindent\qedsymbol  \vspace{\baselineskip} }
%--------------------
%--------------------
%++++++++++++++++++++++++++++++++++++++++++++

%defining a Definition تعریف

%\newcounter{kdfcounter}[chapter]
%\renewcommand{\thedfrcounter}{\thechapter.\arabic{kdfcounter}}

\newenvironment*{تعریف}				
{\par\noindent\ignorespaces  تعریف :\quad}%
{\par\hfill\qedsymbol  \vspace{\baselineskip}\par }
%{\par\noindent }
%--------------------
%----------------------------
%defining a Definition تعریفات

%\newcounter{kdfcounter}[chapter]
%\renewcommand{\thedfrcounter}{\thechapter.\arabic{kdfcounter}}

\newenvironment*{تعریفات}				
{\par\noindent\ignorespaces  تعریفات :\quad}%
{\par\hfill\qedsymbol  \vspace{\baselineskip}\par }
%{\par\noindent }
%--------------------
%--------------------

%defining a Definition مفروضہ

%\newcounter{kAscounter}[chapter]
%\renewcommand{\theAsrcounter}{\thechapter.\arabic{kAscounter}}

\newenvironment*{مفروضہ}				
{\par\noindent\ignorespaces  مفروضہ \quad}%
{\par\hfill\qedsymbol  \vspace{\baselineskip}\par }
%{\par\noindent }
%--------------------
%--------------------

%defining a RULE   قاعدہ

%\newcounter{krucounter}[section]
%\renewcommand{\thekrucounter}{\arabic{krucounter}}
\newcounter{krucounter}[chapter]
\renewcommand{\thekrucounter}{\thechapter.\arabic{krucounter}}

\newenvironment*{قاعدہ}				
{\par\noindent\ignorespaces  قاعدہ \refstepcounter{krucounter} \thekrucounter :\quad}%
{\par\noindent }
%--------------------
%--------------------

%defining a Proof   ثبوت قاعدہ

%\newcounter{kprRcounter}[chapter]
%\renewcommand{\thekprRcounter}{\thechapter.\arabic{kprRcounter}}

\newenvironment*{ثبوت قاعدہ}				
{\noindent\ignorespaces  ثبوت قاعدہ :\quad}%
{\par\hfill\qedsymbol  \vspace{\baselineskip}\par }
%{\par\noindent\qedsymbol  \vspace{\baselineskip} }
%--------------------
%--------------------

%defining a TEST   پرکھ

%\newcounter{kttcounter}[section]
%\renewcommand{\thekttcounter}{\arabic{kttcounter}}
\newcounter{kttcounter}[chapter]
\renewcommand{\thekttcounter}{\thechapter.\arabic{kttcounter}}

\newenvironment*{پرکھ}				
{\par\noindent\ignorespaces  \refstepcounter{kttcounter} \quad \nopagebreak}%
{\par\hfill\qedsymbol  \vspace{\baselineskip}\par }
%--------------------

\newenvironment*{ثبوت پرکھ}				
{\noindent\ignorespaces  ثبوت پرکھ :\quad}%
{\par\hfill\qedsymbol  \vspace{\baselineskip}\par }
%{\par\noindent\qedsymbol  \vspace{\baselineskip} }

%---------

%questions environment جواب

%\newcounter{answercounter}[section]                                           %for reseting at every section. NOT NEEDED
%\renewcommand{\theanswercounter}{\arabic{answercounter}}
%\newcounter{answercounter}[chapter]						%when book is finished, use this instead of the above
%\renewcommand{\theanswercounter}{\thechapter.\arabic{answercounter}}

%\newenvironment*{جواب}				
%{\noindent\ignorespaces\wf{\thequestioncounter)\noexpand\quad}}%
%{\par\noindent\ignorespacesafterend}
%==================

\newenvironment*{سوالات}				
{\noindent\ignorespaces\wf{
		\موٹا{حصہ} 
		\thesection
		\quad
		\موٹا{صفحہ}
		\thepage}
	\wf{\unexpanded{\begin{description}\setlength{\parskip}{0pt} \setlength{\itemsep}{0pt plus 1pt}}}
	}%
	{\wf{\unexpanded{\end{description}}}\par\noindent\ignorespacesafterend}
%==================
\newenvironment*{جواب}  %the next is a better environment. it take less input		
{\noindent\ignorespaces\wf{\unexpanded{\item[}}\wf{\thequestioncounter)}\wf{\unexpanded{]}}}%
{\noindent\ignorespacesafterend}
%%==================
%%==================
%%this takes one input hence there is no need to write \wf{\unexpanded{...}} in every answer
%\newenvironment*{جواب}[1]			%put actual answer in {} examples {\(\sqrt{2}\)} 	
%{\noindent\ignorespaces\wf{\unexpanded{\item[}}\wf{\thequestioncounter)}\wf{\unexpanded{]}}\wf{\unexpanded{#1}}}%
%{\noindent\ignorespacesafterend}
%==================
%\newenvironment*{جوابء}				%i think is wrong and not used	
%{\noindent\ignorespaces\wf{\unexpanded{[}}\wf{\thequestioncounter)}\wf{\unexpanded{]}}}%
%{\par\noindent\ignorespacesafterend}
%==================


% -------------------------------------------------------------------------------
% Greek Letters for Urdu Latex usage
% -------------------------------------------------------------------------------

\newcommand*{\ایلفا}{\alpha}
\newcommand*{\بیٹا}{\beta}
\newcommand*{\گیما}{\gamma}
\newcommand*{\ڈیلٹا}{\delta}
\newcommand*{\ایپسلان}{\epsilon}
\newcommand*{\متغیرایپسلان}{\varepsilon}
\newcommand*{\زیٹا}{\zeta}
\newcommand*{\ایٹا}{\eta}
\newcommand*{\تھیٹا}{\theta}
\newcommand*{\متغیرتھیٹا}{\vartheta}
\newcommand*{\ایوٹا}{\iota}
\newcommand*{\کاپا}{\kappa}
\newcommand*{\لیمڈا}{\lambda}
\newcommand*{\میو}{\mu}
\newcommand*{\نیو}{\nu}
\newcommand*{\ژاے}{\xi}
\newcommand*{\پاے}{\pi}
\newcommand*{\متغیرپاے}{\varpi}
\newcommand*{\رھو}{\rho}
\newcommand*{\متغیررھو}{\varrho}
\newcommand*{\سگما}{\sigma}
\newcommand*{\متغیرسگما}{\varsigma}
\newcommand*{\ٹو}{\tau}
\newcommand*{\اپسیلان}{\upsilon}
\newcommand*{\فاے}{\phi}
\newcommand*{\متغیفاے}{\varphi}
\newcommand*{\چاے}{\chi}
\newcommand*{\ساے}{\psi}
\newcommand*{\اومیگا}{\omega}

\newcommand*{\بڑاگیما}{\Gamma}
\newcommand*{\بڑاڈیلٹا}{\Delta}
\newcommand*{\بڑاتھیٹا}{\Theta}
\newcommand*{\بڑالیمڈا}{\Lambda}
\newcommand*{\بڑاژاے}{\Xi}
\newcommand*{\بڑاپاے}{\Pi}
\newcommand*{\بڑاسگما}{\Sigma}
\newcommand*{\بڑاساے}{\Psi}
\newcommand*{\بڑااومیگا}{\Omega}

%================================================================
% circuit analysis and mathematical symbols
%================================================================

\pgfmathsetmacro{\x}{2}     %smallest resistor sizes
\pgfmathsetmacro{\y}{2}
\pgfmathsetmacro{\xx}{2.5}   %somewhat larger resistor leads. gives more space
\pgfmathsetmacro{\yy}{2.5}
\pgfmathsetmacro{\xxx}{3}   %still larger resistor leads. gives even more space
\pgfmathsetmacro{\yyy}{3}
\pgfmathsetmacro{\dx}{0.2}     %moving labels beyond resistor outline
\pgfmathsetmacro{\dy}{0.2}
\pgfmathsetmacro{\pin}{0.3}

\pgfmathsetmacro{\boxW}{0.5}   %width of box circuit
\pgfmathsetmacro{\boxH}{2.5}   %height of box circuit

%=============================
%complex numbers, squared voltages
\newcommand*{\bZ}{{\ensuremath{{\boldsymbol{Z}}}}}           %complex impedance
\newcommand*{\bY}{{\ensuremath{{\boldsymbol{Y}}}}}           %complex admittance
\newcommand*{\bZCC}{{\ensuremath{{\boldsymbol{Z}}^{*}}}}                                            %complex conjugate impedance
\newcommand*{\bYCC}{{\ensuremath{{\boldsymbol{Y}}^{*}}}}                                            %complex conjugate

\newcommand*{\bVrms}{{\ensuremath{\hat{V}_{\textup{rms}}}}}           %phasor voltage
\newcommand*{\bIrms}{{\ensuremath{\hat{I}_{\textup{rms}}}}}           %phasor current
\newcommand*{\Vrms}{{\ensuremath{V_{\textup{rms}}}}}       %rms voltage
\newcommand*{\Irms}{{\ensuremath{I_{\textup{rms}}}}}           %rms current
\newcommand*{\Arms}{{\ensuremath{A_{\textup{rms}}}}}           %rms amps
\newcommand*{\VrmsS}{{\ensuremath{V^2_{\textup{rms}}}}}       %rms squared
\newcommand*{\IrmsS}{{\ensuremath{I^2_{\textup{rms}}}}}           %rms squared
\newcommand*{\bVrmsCC}{{\ensuremath{\hat{V}^{*}_{\textup{rms}}}}}                  %conjugate phasor voltage
\newcommand*{\bIrmsCC}{{\ensuremath{\hat{I}^{*}_{\textup{rms}}}}}           %conjugate phasor current


\newcommand*{\kx}[1]{{\ensuremath{{\boldsymbol{#1}}}}}                  %complex quantity
\newcommand*{\bS}{{\ensuremath{{\boldsymbol{S}}}}}                         %complex power
\newcommand*{\bH}{{\ensuremath{{\boldsymbol{H}}}}}                       %network functions
\newcommand*{\bA}{{\ensuremath{{\boldsymbol{A}}}}}                        %voltage gain

\newcommand*{\pf}{{\ensuremath{{\textup{pf}}}}}
\newcommand*{\rms}{{\ensuremath{\textup{rms}}}}           %rms
\newcommand*{\BW}{{\ensuremath{{\textup{BW}}}}}   %bandwidth

\newcommand*{\Laplace}{\mathcal{L}}   %Laplace transform
\newcommand*{\Fourier}{\mathcal{F}}   %Fourier transform

\newcommand*{\kB}[1]{{\ensuremath{{\textup{#1}}}}}  %Laplace symbol general use. 
%following were used too often so gave them specific symbols
\newcommand*{\bF}{{\ensuremath{{\textup{F}}}}}    %Fourier transform of 
\newcommand*{\bP}{{\ensuremath{{\textup{P}}}}}   %Laplace fraction
\newcommand*{\bQ}{{\ensuremath{{\textup{Q}}}}}  %Laplace fraction
\newcommand*{\bV}{{\ensuremath{{\textup{V}}}}}  %Laplace Voltage
\newcommand*{\bI}{{\ensuremath{{\textup{I}}}}}  %Laplace Current
%Matrices and Vectors
\newcommand*{\bM}[1]{{\ensuremath{{\boldsymbol{#1}}}}} 

%======================================================================
% Declare functions contains functions like cos sin etc
%=======================================================================

\DeclareMathOperator{\sech}{sech}
\DeclareMathOperator{\csch}{csch}
\DeclareMathOperator{\cosec}{cosec}
\DeclareMathOperator{\arcsec}{arcsec}
\DeclareMathOperator{\arccot}{arcCot}
\DeclareMathOperator{\arccsc}{arcCsc}
\DeclareMathOperator{\arccosine}{arcCos}
\DeclareMathOperator{\arccosh}{arcCosh}
\DeclareMathOperator{\arcsinh}{arcsinh}
\DeclareMathOperator{\arctanh}{arctanh}
\DeclareMathOperator{\arcsech}{arcsech}
\DeclareMathOperator{\arccsch}{arcCsch}
\DeclareMathOperator{\arccoth}{arcCoth} 
\DeclareMathOperator{\erf}{erf} 
\DeclareMathOperator{\erfc}{erfc} 
%the following two Sine Integral symbols doesnot clash with SI units package
\DeclareMathOperator{\kSi}{Si} 
\DeclareMathOperator{\ksi}{si} 
\DeclareMathOperator{\kS}{S} 
%cosine integral, exponential integral, logrithmic integral
\DeclareMathOperator{\ci}{ci} 
\DeclareMathOperator{\kC}{C} 
\DeclareMathOperator{\Ei}{Ei} 
\DeclareMathOperator{\li}{li} 
%Fresnel Cosine and SineIntegrals and their Auxiliary integrals
\DeclareMathOperator{\FC}{C} 
\DeclareMathOperator{\FS}{S} 
\DeclareMathOperator{\FAC}{c}                  %complementary Fresnel integral
\DeclareMathOperator{\FAS}{s}                     %complementary Fresnel integral
\DeclareMathOperator{\gammaQ}{Q}                     %Incomplete gamma function
\DeclareMathOperator{\gammaP}{P}                     %Incomplete gamma function
%Hermite polynomials
\DeclareMathOperator{\He}{He} 
%Complex Natural Logarithm, Principal Value
\DeclareMathOperator{\Ln}{Ln} 
%Residue 
\DeclareMathOperator{\Res}{Res}
%Lagrange interpolation formula
\DeclareMathOperator{\Lagrange}{L}
%statistics UpperControlLimit and Lower Control Limit, Average Outgoing Quality
\DeclareMathOperator{\UCL}{UCL} 
\DeclareMathOperator{\LCL}{LCL} 
\DeclareMathOperator{\CL}{CL} 
\DeclareMathOperator{\OC}{OC} 
\DeclareMathOperator{\AOQ}{AOQ} 
%projection of a vector
\DeclareMathOperator{\proj}{proj}

%======================================================================
% Electronics variables
%======================================================================
%still decided to format everything at the very end
%try to make a jump table so that a single command can be built

\newcommand*{\ksubRB}{\ensuremath{R_{\textup{B}}}}   %transistor
\newcommand*{\ksubRC}{\ensuremath{R_{\textup{C}}}}
\newcommand*{\ksubRE}{\ensuremath{R_{\textup{E}}}}

\newcommand*{\ksubRG}{\ensuremath{R_{\textup{G}}}}	%mosfet
\newcommand*{\ksubRD}{\ensuremath{R_{\textup{D}}}}
\newcommand*{\ksubRS}{\ensuremath{R_{\textup{S}}}}

\newcommand*{\ksubCB}{\ensuremath{C_{\textup{B}}}}	%transistor
\newcommand*{\ksubCC}{\ensuremath{C_{\textup{C}}}}
\newcommand*{\ksubCE}{\ensuremath{C_{\textup{E}}}}

\newcommand*{\ksubCG}{\ensuremath{C_{\textup{G}}}}	%mosfet
\newcommand*{\ksubCD}{\ensuremath{C_{\textup{D}}}}
\newcommand*{\ksubCS}{\ensuremath{C_{\textup{S}}}}

\newcommand*{\ksubRCB}{\ensuremath{R_{\textup{CB}}}}    %resistor used with base capacitor    (GET RID OF SUCH USAGE)
\newcommand*{\ksubRCC}{\ensuremath{R_{\textup{CC}}}}   %resistor used with collector capacitor
\newcommand*{\ksubRCE}{\ensuremath{R_{\textup{CE}}}}   %resistor used with emitter capacitor

\newcommand*{\ksubVBE}{\ensuremath{V_{\textup{BE}}}}  %npnTransistor
\newcommand*{\ksubVBC}{\ensuremath{V_{\textup{BC}}}}
\newcommand*{\ksubVCE}{\ensuremath{V_{\textup{CE}}}}

\newcommand*{\ksubVEB}{\ensuremath{V_{\textup{EB}}}}  %pnpTransistor
\newcommand*{\ksubVCB}{\ensuremath{V_{\textup{CB}}}}
\newcommand*{\ksubVEC}{\ensuremath{V_{\textup{EC}}}}

\newcommand*{\ksubVGS}{\ensuremath{V_{\textup{GS}}}}  %nMosfet
\newcommand*{\ksubVGD}{\ensuremath{V_{\textup{GD}}}}
\newcommand*{\ksubVDS}{\ensuremath{V_{\textup{DS}}}}

\newcommand*{\ksubVSG}{\ensuremath{V_{\textup{SG}}}} 	%pMosfet
\newcommand*{\ksubVDG}{\ensuremath{V_{\textup{DG}}}}
\newcommand*{\ksubVSD}{\ensuremath{V_{\textup{SD}}}}

\newcommand*{\ksubsubVRE}{\ensuremath{V_{R_{\textup{E}}}}}
\newcommand*{\ksubsubVRC}{\ensuremath{V_{R_{\textup{C}}}}}
\newcommand*{\ksubsubVRB}{\ensuremath{V_{R_{\textup{B}}}}}

\newcommand*{\ksub}[2]{\ensuremath{#1_{\textup{#2}}}}     %R_1    or V_1   or C_1     where numbers are used

%voltage sources
\newcommand*{\ksubVCC}{\ensuremath{V_{\textup{CC}}}} %transistor
\newcommand*{\ksubVBB}{\ensuremath{V_{\textup{BB}}}}
\newcommand*{\ksubVEE}{\ensuremath{V_{\textup{EE}}}}

\newcommand*{\ksubVDD}{\ensuremath{V_{\textup{DD}}}}	%mosfet
\newcommand*{\ksubVGG}{\ensuremath{V_{\textup{GG}}}}
\newcommand*{\ksubVSS}{\ensuremath{V_{\textup{SS}}}}

\newcommand*{\ksubVS}{\ensuremath{V_{\textup{S}}}}
\newcommand*{\ksubVs}{\ensuremath{V_{\textup{s}}}}

%gain
\newcommand*{\ksubAv}{\ensuremath{A_{\textup{v}}}}		%gains
\newcommand*{\ksubAi}{\ensuremath{A_{\textup{i}}}}
\newcommand*{\ksubGm}{\ensuremath{G_{\textup{m}}}}
\newcommand*{\ksubRm}{\ensuremath{R_{\textup{m}}}}

%====================================================================
% EMT vectors
%====================================================================
\newcommand*{\kvec}[1]{{\ensuremath{{\boldsymbol{#1}}}}}
\newcommand*{\kvecsub}[2]{{\ensuremath{{\boldsymbol{#1}}}_{\textup{#2}}}}

\newcommand*{\ax}{\ensuremath{{\boldsymbol{a}}_{\textup{x}}}}
\newcommand*{\ay}{\ensuremath{{\boldsymbol{a}}_{\textup{y}}}}
\newcommand*{\az}{\ensuremath{{\boldsymbol{a}}_{\textup{z}}}}
%
\newcommand*{\arho}{\ensuremath{{\boldsymbol{a}}_{\rho}}}
\newcommand*{\aphi}{\ensuremath{{\boldsymbol{a}}_{\phi}}}
%
\newcommand*{\ar}{\ensuremath{{\boldsymbol{a}}_{\textup{r}}}}
\newcommand*{\atheta}{\ensuremath{{\boldsymbol{a}}_{\theta}}}

\newcommand*{\aN}{\ensuremath{{\boldsymbol{a}}_N}}
\newcommand*{\aR}{\ensuremath{{\boldsymbol{a}}_{\textup{R}}}}
\newcommand*{\aL}{\ensuremath{{\boldsymbol{a}}_{\textup{L}}}}

\newcommand*{\au}{\ensuremath{{\boldsymbol{a}}_u}}
\newcommand*{\av}{\ensuremath{{\boldsymbol{a}}_v}}
\newcommand*{\aw}{\ensuremath{{\boldsymbol{a}}_w}}

\newcommand*{\ai}{\ensuremath{{\boldsymbol{i}}}}
\newcommand*{\aj}{\ensuremath{{\boldsymbol{j}}}}
\newcommand*{\ak}{\ensuremath{{\boldsymbol{k}}}}

\newcommand*{\uu}{\ensuremath{{\boldsymbol{u}}}}


\newcommand*{\Ex}{\ensuremath{{\boldsymbol{E}}_x}}
\newcommand*{\Ey}{\ensuremath{{\boldsymbol{E}}_y}}
\newcommand*{\Ez}{\ensuremath{{\boldsymbol{E}}_z}}
%
\newcommand*{\Erho}{\ensuremath{{\boldsymbol{E}}_{\rho}}}
\newcommand*{\Ephi}{\ensuremath{{\boldsymbol{E}}_{\phi}}}
%
\newcommand*{\Er}{\ensuremath{{\boldsymbol{E}}_r}}
\newcommand*{\Etheta}{\ensuremath{{\boldsymbol{E}}_{\theta}}}

\newcommand*{\TE}[1]{\ensuremath{\textup{TE}_{#1}}}
\newcommand*{\TM}[1]{\ensuremath{\textup{TM}_{#1}}}
\newcommand*{\TEM}{\ensuremath{\textup{TEM}}}
%===========================
\newcommand{\RightAngle}[4][5pt]{\draw[gray] ($#3!#1!#2$)--($ #3!2!($($#3!#1!#2$)!.5!($#3!#1!#4$)$) $) --($#3!#1!#4$) ;        }

%---------------------------------------------------------------
% Harpoon
%---------------------------------------------------------------
\newcommand{\krightharpoonup}[1]{\overset{\rightharpoonup}{\rule{0pt}{.9ex}\smash{#1}}}
\newcommand{\kleftharpoonup}[1]{\overset{\leftharpoonup}{\rule{0pt}{.9ex}\smash{#1}}}


\newcommand{\koverleftharp}[1]{\overharp{\leftharpoonup}{#1}{.7}}
\newcommand{\koverrightharp}[1]{\overharp{\rightharpoonup}{#1}{.7}}
\newcommand{\koverleftharpdown}[1]{\overharp{\leftharpoondown}{#1}{.9}}
\newcommand{\koverrightharpdown}[1]{\overharp{\rightharpoondown}{#1}{.9}}
\newcommand{\kunderleftharp}[1]{\overharp{\leftharpoonup}{#1}{-1}}
\newcommand{\kunderrightharp}[1]{\overharp{\rightharpoonup}{#1}{-1}}
\newcommand{\kunderleftharpdown}[1]{\overharp{\leftharpoondown}{#1}{-.8}}
\newcommand{\kunderrightharpdown}[1]{\overharp{\rightharpoondown}{#1}{-.8}}

\newlength{\argwd}  \newlength{\arght}%-Two variables
\newcommand{\overharp}[3]{%        -The command name
	\settowidth{\argwd}{#2}\settoheight{\arght}{#2}%
	%                                    -Set the variables
	\raisebox{#3\arght}{%                -Put the harp 6/10 of a line higher
		\makebox[0pt][r]{%                 -Put everything in a box ;           corrected by me for Flush Right
			\resizebox{\argwd}{.8\arght}{\!$#1$}% 
			%                                -Set harp to right length
		}%
	}%
	#2}%                                   -Print the argument

%---------------------------------------------------------------------
%Tikz commands
%---------------------------------------------------------------------
%draws left and right arrows where needed e.g.  
% \draw[->-=0.5] (0,0)--(3,0); draws arrow at the middle
\tikzset{->-/.style={decoration={markings, mark=at position #1 with {\arrow{latex}}},postaction={decorate}}}
\tikzset{-<-/.style={decoration={markings, mark=at position #1 with {\arrow{latex reversed}}},postaction={decorate}}}
\tikzset{osquare/.style={draw,solid,fill=white, rectangle, minimum size=4pt, inner sep=0pt, outer sep=0pt}}   %node[osquare,fill=black]{}

%this puts small orthogonal tick marks along a curve at selected points. a point at each side of the location has to be provided to %the \path[] section of the command as shown.
% 		\draw[smooth, domain=0:2]plot ({\x},{\x^2});
%		\foreach \t in {0.5,1,1.5}{\path[| mark=0.5] ({\t-0.1},{(\t-0.1)^2}) -- ({\t+0.1},{(\t+0.1)^2});}
\tikzset{| mark/.style={postaction=decorate,decoration={markings,
			mark=at position #1 with {\draw[line cap=round,mark segment] (0,-2pt) -- (0,2pt);
	}}},mark segment/.style={thick}}


%draws right angles \RightAngle{A}{B}{C}
\providecommand{\RightAngle}[4][5pt]{\draw[] ($#3!#1!#2$)--($ #3!2!($($#3!#1!#2$)!.5!($#3!#1!#4$)$) $) --($#3!#1!#4$) ;     }
%colours
\definecolor{lgray}{cmyk}{0,0,0,0.2}
\definecolor{dgray}{cmyk}{0,0,0,0.7}
%draws a cross just like ocirc, circ; usage \fill(0,2)circle(1.5py);\draw(0,2)node[kcross]{};
\tikzset{kcross/.style={cross out, draw, 
		minimum size=2*(2pt-\pgflinewidth), 
		inner sep=0pt, outer sep=0pt}}


%tikz, pgfplot TABLE
\pgfplotsset{select coords between index/.style 2 args={
		x filter/.code={
			\ifnum\coordindex<#1\def\pgfmathresult{}\fi
			\ifnum\coordindex>#2\def\pgfmathresult{}\fi
		}
}}
%
%boxed circuits
%=========================================
%\leftBox[K]{3,2}   draws a box with lower end at (3,2) and the terminals called Ka and Kb
\newcommand{\boxLeft}[2][p]{
	\coordinate (a) at (#2);
	\draw (a)++(-0.025,0.5) coordinate (b);
	\draw (a)++(-0.04,1) coordinate (c);
	\draw (a)++(-0.12,1.5) coordinate (d);
	\draw (a)++(-0.2,2) coordinate (e);
	\draw (a)++(-0.15,2.5) coordinate (f);
	\draw (a)++(0.5,3) coordinate (g);
	
	\draw (a)++(0.7,2.5)coordinate(h);
	\draw (a)++(0.6,2)coordinate(i);
	\draw (a)++(0.75,1.5)coordinate(j);
	\draw (a)++(0.7,1)coordinate(k);
	\draw (a)++(0.7,0.5)coordinate(l);
	\draw (a)++(0.6,0)coordinate(m);
	\draw plot [smooth cycle] coordinates {(a) (b) (c) (d) (e) (f) (g) (h) (i) (j) (k) (l) (m)};
	\draw (h)coordinate(#1a);
	\draw(l)coordinate(#1b);
}
%===================
%\rightBox[J]{3,2}   draws a box with lower end at (3,2) and the terminals called Ja and Jb
\newcommand{\boxRight}[2][p]{
	\coordinate (aa) at (#2);
	\draw (aa)++(0.025,0.5) coordinate(ba);
	\draw (aa)++(0.04,1)coordinate(ca);
	\draw (aa)++ (0.12,1.5)coordinate(da);
	\draw (aa)++(0.13,2)coordinate(ea);
	\draw (aa)++(0.1,2.5)coordinate(fa);
	\draw (aa)++(-0.5,3)coordinate(ga);
	
	\draw (aa)++(-0.8,2.5) coordinate(ha);
	\draw (aa)++(-0.8,2) coordinate(ia);
	\draw (aa)++ (-0.75,1.5) coordinate(ja);
	\draw (aa)++(-0.7,1) coordinate(ka);
	\draw (aa)++(-0.7,0.5) coordinate(la);
	\draw (aa)++(-0.5,0) coordinate(ma);
	\draw plot [smooth cycle] coordinates {(aa) (ba) (ca) (da) (ea) (fa) (ga) (ha) (ia) (ja) (ka) (la) (ma)};
	\draw (ha)coordinate(#1a);
	\draw(la)coordinate(#1b);
}
%===================
%writes text above matrix entries (outside the matrix bars)
\newcommand\bovermat[2]{%
	\makebox[0pt][r]{$\raisebox{16pt}[0pt][0pt]{\text{\RL{#1}}}$}#2}
\newcommand\covermat[2]{%
	\makebox[0pt][c]{$\raisebox{16pt}[0pt][0pt]{\text{\RL{#1}}}$}#2}
\newcommand\partialphantom{\vphantom{\frac{\partial e_{P,M}}{\partial w_{1,1}}}}

%=============================
%when a table is all math, instead of using $$ in each cell use the following.Text can be entered in a cell with \text{} 
%usage \begin{matrix}{C|L} ;not needed in array as array is $$ by default
\newcolumntype{L}{>{$}l<{$}}
\newcolumntype{C}{>{$}c<{$}}
\newcolumntype{R}{>{$}r<{$}}
% Sloppy ensures no words cross left or right margins
\sloppy
