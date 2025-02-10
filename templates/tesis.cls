\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tesis}[2025/01/20 Custom UNAM Thesis Class]

% Use a boolean instead of redefining a command multiple times
\newif\iffancystyle
\newif\ifsimplestyle


\DeclareOption{simple}{\simplestyletrue}
% Define options
\DeclareOption{fancy}{\fancystyletrue}
% Define options without conflicts
%\DeclareOption{fancy}{\renewcommand{\templateStyle}{fancy}}
%\DeclareOption{simple}{\renewcommand{\templateStyle}{simple}}


\ExecuteOptions{simple}

% Procesar opciones
\ProcessOptions

% Base Class
\LoadClass[12pt]{book}
\RequirePackage[spanish]{babel}
% Redefinir cómo se nombran tablas y su lista
\addto\captionsspanish{
    \renewcommand{\tablename}{Tabla}         % Cambiar "Cuadro" por "Tabla" en los captions
    \renewcommand{\listtablename}{Índice de Tablas} % Cambiar "Lista de cuadros" por "Índice de Tablas"
}
% Essential Packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\usepackage[utopia]{quotchap}
\RequirePackage{ifthen}
\RequirePackage{csquotes}
\RequirePackage{titlesec}
\RequirePackage{XCharter}
% Cargar paquetes necesarios para personalizar el índice
\RequirePackage{tocloft}
\RequirePackage{Alegreya}

\RequirePackage{tgpagella}
%\RequirePackage{libertinus}
\RequirePackage{lmodern}
%\RequirePackage{antiqua}
% Paquete natbib para gestión de citas
\RequirePackage[round]{natbib}
\RequirePackage{xcolor}
\RequirePackage{changepage}

% Page Layout
\geometry{
    letterpaper,      % Tamaño carta
    top=2.5cm,        % Margen superior
    bottom=2.5cm,     % Margen inferior
    left=2.7cm,         % Margen izquierdo (mayor para encuadernación)
    right=2.5cm,      % Margen derecho
    headheight=15pt,  % Altura del encabezado
    headsep=0.5cm,    % Separación entre encabezado y texto
    footskip=1cm      % Separación entre pie de página y texto
}

\renewcommand{\listtablename}{Índice de Tablas}
\renewcommand{\tablename}{Tabla}
% User Options
\newif\ifposgrado % Posgrado (true) o licenciatura (false)
\newif\ifportada % Define si se muestra una portada adicional
\newif\ifcomite % Define si hay comité tutor
%\renewcommand{\tablename}{Tabla}
\usepackage{booktabs}
% Metadata Macros
\newcommand{\thesisTitle}{}
\newcommand{\setTitle}[1]{\renewcommand{\thesisTitle}{#1}}

\newcommand{\thesisAuthor}{}
\newcommand{\setAuthor}[1]{\renewcommand{\thesisAuthor}{#1}}

\newcommand{\thesisAdvisor}{}
\newcommand{\setAdvisor}[1]{\renewcommand{\thesisAdvisor}{#1}}

\newcommand{\thesisDegree}{}
\newcommand{\setDegree}[1]{\renewcommand{\thesisDegree}{#1}}

\newcommand{\thesisProgram}{}
\newcommand{\setProgram}[1]{\renewcommand{\thesisProgram}{#1}}

\newcommand{\thesisEscuela}{}
\newcommand{\setEscuela}[1]{\renewcommand{\thesisEscuela}{#1}}

\newcommand{\thesisField}{}
\newcommand{\setField}[1]{\renewcommand{\thesisField}{#1}}

\newcommand{\Location}{}
\newcommand{\setLocation}[1]{\renewcommand{\Location}{#1}}

\newcommand{\thesisDate}{}
\newcommand{\setDate}[1]{\renewcommand{\thesisDate}{#1}}

\newcommand{\committeeOne}{}
\newcommand{\setCommitteeOne}[1]{\renewcommand{\committeeOne}{#1}}

\newcommand{\committeeTwo}{}
\newcommand{\setCommitteeTwo}[1]{\renewcommand{\committeeTwo}{#1}}

% Inside tesis.cls
\newcommand{\unam}{Universidad Nacional Aut\'onoma de M\'exico}
% Redefinir nombres en español
\renewcommand{\contentsname}{Índice General}      % Para el índice
\renewcommand{\listfigurename}{Índice de Figuras} % Para la lista de figuras
  % Para la lista de tablas

% Command for title page inclusion
\newcommand{\portada}{\input{capitulos/portada}}

%            REDEFINIENDO EL FORMATO DE LOS CAPITULOS             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definición de línea gruesa para los capítulos
\newcommand{\bigrule}{\titlerule[0.5mm]}

\newcommand{\bigrulecolor}[2]{\textcolor{#1}{\rule{\textwidth}{#2}}}

% Cambiar a numeración romana para las páginas preliminares
\newcommand{\numeracionromana}{%
    \clearpage
    \pagenumbering{roman} % Números romanos
}

% Cambiar a numeración arábiga para el contenido principal
\newcommand{\numeracionarabiga}{%
    \clearpage
    \pagenumbering{arabic} % Números arábigos
}
\newenvironment{romanpages}
{\cleardoublepage\setlength{\baselineskip}{\frontmatterbaselineskip}\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\arabic{page}}}


% Cambiar "Chapter" por "Capítulo" y "Appendix" por "Apéndice"
\renewcommand{\chaptername}{Capítulo}
\renewcommand{\appendixname}{Apéndice}

\RequirePackage{lipsum}

%\renewcommand\huge{\@setfontsize\huge{19pt}{24pt}} 
\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi\fi
       \thispagestyle{empty}
}%
{%
       \if@restonecol\twocolumn
       \else\newpage\fi
}

% Comandos para incluir los índices en el documento
\newcommand{\indices}{%


    \tableofcontents \clearpage
    % Índice de figuras
        \addcontentsline{toc}{chapter}{Índice de Figuras} 
        \listoffigures
        \clearpage

        % Índice de tablas
        \addcontentsline{toc}{chapter}{Índice de Tablas}
        \listoftables


}

\RequirePackage{setspace} % Control del interlineado % Control de márgenes
\RequirePackage{titling}  % Control del título del capítulo

% Definir el entorno "resumen"
\newenvironment{resumen}
{
    % Ajustar márgenes más amplios
    \newgeometry{top=3cm, bottom=3cm, left=4cm, right=4cm}
    % Configurar el interlineado
    \setstretch{1.4}
    % Personalizar el título del capítulo
    \begin{center}
        \Huge\bfseries Resumen % Título centrado y estilizado
    \end{center}
    \vspace{1cm} % Espacio entre el título y el texto
    \addcontentsline{toc}{chapter}{Resumen}
    \thispagestyle{empty} % Página sin numeración
}
{
    \restoregeometry % Restaurar los márgenes originales al salir del entorno
}

 % Fuente Palatino
\newcommand{\resumenfont}{\usefont{T1}{libertinus}{m}{n}} % Usa Palatino
% Configuración de encabezados y pies de página con fancyhdr
\RequirePackage{fancyhdr}

% Configurar el estilo de página
\pagestyle{fancy}
% Redefinir \chaptermark para evitar mayúsculas automáticas
\renewcommand{\chaptermark}[1]{%
    \markboth{Capítulo \thechapter. #1}{}%
}
%% Encabezados
\fancyhead[LE]{} % Página par (izquierda)
%\fancyhead[RO]{\sf \rightmark}                    % Página non (derecha, título de sección)
%
%% Pies de página
%\fancyfoot[CE,RO]{\sf Página \thepage}            % Número de página en las esquinas externas
\fancyfoot[LO,RE]{}                               % Vacío en esquinas internas

% Usar lmodern únicamente en encabezados y pies
\fancyhead[LO]{\usefont{T1}{artemisia}{m}{n}
 \leftmark}
 % Usar lmodern únicamente en encabezados y pies
\fancyhead[RO]{}
\fancyhead[RE]{\usefont{T1}{lmr}{m}{sl} \thesisEscuela}
\fancyfoot[L]{}
% Footers (ensuring no extra page numbers)
\fancyfoot[CE]{\usefont{T1}{XCharter}{m}{n} Página \thepage}      % Center footer (even pages)
\fancyfoot[CO]{\usefont{T1}{XCharter}{m}{n}  \thepage}   % Center footer for odd pages (empty)
\fancyfoot[LE,RO]{} % Remove page numbers on outer corners for left and right pages
\fancypagestyle{plain}{
    \fancyhf{} % Clear all headers and footers
    \fancyfoot[CE]{\usefont{T1}{XCharter}{m}{n} Página \thepage} % Footer for plain pages
    \fancyfoot[CO]{\usefont{T1}{XCharter}{m}{n}  \thepage} % Footer for plain pages
    \renewcommand{\headrulewidth}{0pt} % No header rule
    \renewcommand{\footrulewidth}{0pt} % No footer rule
}

\usepackage{setspace}

% Cambiar el interlineado a 1.15 para capítulos
\usepackage{etoolbox}
\setstretch{1.4}

\RequirePackage{colortbl}
% Estilo para páginas sin headers ni footers
\fancypagestyle{noheaderfooter}{
    \fancyhf{} % Eliminar headers y footers
    \renewcommand{\headrulewidth}{0pt} % Sin línea en el header
    \renewcommand{\footrulewidth}{0pt} % Sin línea en el footer
}
\titleformat{\section}
  {\Large\bfseries }
  {\thesection}
  {1em}
  {}

\makeatletter
% Customize the size here
\makeatother

% Cambiar la fuente de las subsecciones
\titleformat{\subsection}
  {\large\itshape\usefont{T1}{lmr}{m}{it}} % Fuente y estilo para subsecciones
  {\thesubsection} % Numeración de la subsección
  {1em} % Espacio entre número y título
  {}

% Opcional: Cambiar la fuente de las subsubsecciones
\titleformat{\subsubsection}
  {\normalsize\usefont{T1}{lmr}{m}{n}} % Fuente y estilo para subsubsecciones
  {\thesubsubsection} % Numeración de la subsubsección
  {1em} % Espacio entre número y título
  {}
% Líneas horizontales
\renewcommand{\headrulewidth}{0.4pt} % Línea bajo el encabezado
\renewcommand{\footrulewidth}{0pt}   % Sin línea en el pie de página



% Personalización de la fuente en el índice general
% Cambiar la fuente de los capítulos
\renewcommand{\cftchapfont}{\itshape \Large} % Artemisia para capítulos
\renewcommand{\cftchappagefont}{\large} % Números de página con Artemisia

% Cambiar la fuente de las secciones
\renewcommand{\cftsecfont}{\itshape \normalsize} % Latin Modern Roman en cursiva
\renewcommand{\cftsecpagefont}{\usefont{T1}{lmr}{m}{n}} % Números normales para secciones

% Cambiar la fuente de las subsecciones
\renewcommand{\cftsubsecfont}{\small} % Latin Modern Roman para subsecciones
\renewcommand{\cftsubsecpagefont}{\small} % Números normales para subsecciones

% Personalización global del título "Índice General"
\renewcommand{\contentsname}{Índice General} % Cambiar el título del ToC
\renewcommand{\cfttoctitlefont}{\usefont{T1}{lmr}{b}{n}\huge} 
\renewcommand{\cftloftitlefont}{\usefont{T1}{lmr}{b}{n}\huge}%
\renewcommand{\cftlottitlefont}{\usefont{T1}{lmr}{b}{n}\huge} 
% Configurar la fuente principal del documento (Latin Modern)
\renewcommand{\rmdefault}{lmr}
\renewcommand{\scdefault}{lmr}




% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.
% JEM: Lengths for single spacing (ie separate abstract, captions), front matter (abstract,
%   acknowledgements, table of contents, etc), and main body text.
\newlength{\singlebaselineskip}
\newlength{\frontmatterbaselineskip}
\newlength{\textbaselineskip}

\setlength{\singlebaselineskip}{\baselineskip}
\setlength{\frontmatterbaselineskip}{17pt plus1pt minus1pt}
\setlength{\textbaselineskip}{22pt plus2pt}

\newenvironment{dedication}
{\begin{alwayssingle}
  \thispagestyle{empty}
  \vspace*{\fill} \begin{center}}
{\end{center}\vspace*{\fill}\vspace*{\fill} \end{alwayssingle}}

%newfontfamily\dedicatoryfont{artemisia}
% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

%% Crear un entorno para los agradecimientos
%\newenvironment{agradecimientosenv}%
%{   \begin{alwayssingle} % Asegura un formato de una sola página
%    \chapter*{Agradecimientos} % Título del capítulo sin numeración
%    %\thispagestyle{empty} % Sin encabezado ni pie de página
%    \pagestyle{empty} % Desactiva encabezados y pies de página globalmente
%    \setlength{\baselineskip}{\frontmatterbaselineskip} % Espaciado de línea
%}
%{\end{alwayssingle}}

\newenvironment{agradecimientosenv}%
{   
    \clearpage  % Ensure LaTeX starts on a new page
    \pagestyle{empty} % No headers or footers
    \begin{alwayssingle}  % Start the single-page format
        \vspace*{-1cm}     % Adjust vertical spacing if needed
        \begin{center}     % Optional: Center the chapter title
            {\huge \bfseries \fontfamily{qpl}\selectfont Agradecimientos}  % Title format manually
        \end{center}
        \vspace{0.5cm}     % Add vertical space after the title
        \setlength{\baselineskip}{\frontmatterbaselineskip}  % Line spacing setup
}   
{\end{alwayssingle}}


\definecolor{Azul}{RGB}{0,3,84}
% Definir color para encabezado
\definecolor{Gray}{gray}{0.85}
% Para UNAM: Oro PANTONE 871C-->(137,118,75) RGB
% Para UMNSH: PANTONE 110 C
\definecolor{Oro}{RGB}{137,118,75}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            Comandos para líneas            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Se define un comando \colorvrule para hacer líneas verticales de color con 3 argumentos: color, ancho, alto
\newcommand{\colorvrule}[3]{
\begingroup\color{#1}\vrule width#2 height#3
\endgroup}

%Se define un comando \colorhrule para hacer líneas horizontales de color con 2 argumentos: color, ancho
\newcommand{\colorhrule}[2]{
\begingroup\color{#1}\hrule height#2
\endgroup}

% Comando para insertar los agradecimientos desde un archivo externo
\newcommand{\agradecimientos}{%
    \begin{agradecimientosenv}
    \input{capitulos/agradecimientos} % Cargar archivo desde la carpeta capitulos
    \end{agradecimientosenv}
}

% Crear un entorno para la dedicatoria
\newenvironment{dedicacionenv}
{   \begin{alwayssingle} % Página única
    \thispagestyle{empty} % Sin encabezados ni pies de página
    \vspace*{\fill} % Centrar verticalmente el contenido
    \begin{center} % Centrar horizontalmente
    { \usefont{T1}{lmr}{m}{bf} \Large} % Aplicar QTBoulevard en tamaño grande
}
{   \end{center}
    \vspace*{\fill} % Agregar espacio al final
    \end{alwayssingle}
}


% Comando para insertar la dedicatoria desde un archivo externo
\newcommand{\dedicatoria}{%
    \begin{dedicacionenv}
    \input{capitulos/dedicatoria} % Cargar el archivo dedicatoria.tex
    \end{dedicacionenv}
}

\renewcommand\ttdefault{cmvtt}

\RequirePackage{doi}

% Definir el color teal
\definecolor{teal}{RGB}{0,128,128}



% Ambiente personalizado para ejemplos o texto citado
\newenvironment{citedexample}[1][]
{%
    \begin{adjustwidth}{2cm}{2cm} % Márgenes adicionales
    \color{gray} % Color del texto (opcional)
    \itshape % Fuente en cursiva
    \small % Tamaño de fuente más pequeño
    \noindent\textbf{#1} % Título opcional para el ejemplo
    \par % Asegura un salto de línea
}
{%
    \end{adjustwidth} % Termina el ajuste de márgenes
    \normalfont % Restaura la fuente normal
}


% JEM: Fix paragraph spacing within quotes for multi-par quotes
%\renewenvironment{savequote}[1][10cm]{%
%\begin{lrbox}{\@quotebox}
%\begin{minipage}[t]{#1}\footnotesize\slshape%
%\setlength{\parskip}{6px}}{%
%\unskip\end{minipage}\end{lrbox}
%\global\setbox\@quotebox\copy\@quotebox
%\global\let\@printcites\@iprintcites
%\ignorespacesafterend}
%\renewcommand{\qauthor}[1]{\par
%{\raggedleft\upshape #1\qquad\hbox{}\par}\bigskip}
\definecolor{cvblue}{HTML}{304263}
% Cargar configuración según la opción seleccionada
\definecolor{chilerojo}{RGB}{205,28,24}
\RequirePackage{hyperref}

\iffancystyle
%efined\templateStyle


   % \ifx\templateStyle\fancy
        % Estilo 'fancy'
        \typeout{Applying fancy style...}
        	\hypersetup{
        colorlinks=true,
        linkcolor=cvblue,
        citecolor=blue,
        urlcolor=teal,
        breaklinks=true
    }
		% Formato de los capítulos
\titleformat{\chapter}[display]
    {\Huge \usefont{T1}{artemisia}{m}{sb}} % Aplica Artemisia
    {%
     \vspace{0.5mm} \bigrulecolor{teal}{1.5pt} % Línea horizontal superior
    \filleft % Alineación derecha del título
    \Large\chaptertitlename\ % Texto "Capítulo" o "Apéndice" en tamaño \Large
    \Large\thechapter} % Número de capítulo en tamaño \Large
    {0mm} % Espacio entre el número y el título
    {\filleft} % Título del capítulo alineado a la derecha
    [\vspace{0.5mm} \bigrulecolor{teal}{1.5pt}] % Línea horizontal gruesa después del título
		% Definir el color teal

% Cambiar color de puntos y números en ToC, LoF y LoT
\renewcommand{\cftsecleader}{\textcolor{teal}{\cftdotfill{\cftdotsep}}} % Puntos en secciones
\renewcommand{\cftsecpagefont}{\color{teal}} % Números de página en secciones
\renewcommand{\cftsubsecleader}{\textcolor{teal}{\cftdotfill{\cftdotsep}}} % Puntos en subsecciones
\renewcommand{\cftsubsecpagefont}{\color{teal}} % Números de página en subsecciones
\renewcommand{\cftchapleader}{\textcolor{teal}{\cftdotfill{\cftdotsep}}} % Puntos en capítulos
\renewcommand{\cftchappagefont}{\color{teal}} % Números de página en capítulos
% Personaliza los puntos (dots) y números de página en la LoF y LoT
\renewcommand{\cftfigleader}{\textcolor{chilerojo}{\cftdotfill{\cftdotsep}}} % Puntos en la LoF
\renewcommand{\cftfigpagefont}{\color{chilerojo}} % Números en la LoF	

	\renewcommand{\cfttableader}{\textcolor{chilerojo}{\cftdotfill{\cftdotsep}}} % Puntos en la LoT
	\renewcommand{\cfttabpagefont}{\color{chilerojo}} % Números en la LoT
\RequirePackage{newpxmath} 
    \else 
     \typeout{Applying simple style...}
    	\usepackage[utopia]{quotchap}
        % Estilo 'simple'
        \hypersetup{
        colorlinks=true,
        linkcolor=black,
        citecolor=black,
        urlcolor=black,
        breaklinks=true
    }
       \RequirePackage{libertinus} 
    \fi
%\fi
