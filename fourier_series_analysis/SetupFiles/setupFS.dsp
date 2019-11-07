#
FOURIER SERIES TOOL - SETUP FILE
#

#
SETUP FILE GENERAL INFORMATION

Comments are enclosed between hash marks and are ignored by the tool.

Standard floating point expressions are defined as follows:

<EXPRESSION> ::== <EXPRESSION> + <EXPRESSION> 
                | <EXPRESSION> - <EXPRESSION> 
                | <EXPRESSION> * <EXPRESSION> 
                | <EXPRESSION> / <EXPRESSION> 
                | <EXPRESSION> % <EXPRESSION> 
                | <EXPRESSION> ^ <EXPRESSION> 
                | sin(<EXPRESSION>)
                | cos(<EXPRESSION>)
                | sinc(<EXPRESSION>)
                | abs(<EXPRESSION>)
                | -<EXPRESSION>
                | (<EXPRESSION>)
                | PI
                | <FLOATING POINT> -- standard floating point values
                | <INTEGER>        -- standard integer values

<INTEGER_EXPRESSION> ::== <EXPRESSION> -- if the <EXPRESSION>
                                          evaluates to a floating
                                          point number then it is
                                          rounded to the nearest
                                          integer 
#

#
COLOUR SCHEME

The colour scheme of the tool is specified as follows:

<OBJECT> "=" <COLOUR>

<COLOUR> ::== "black" | "dark gray" | "gray" | "white" | "pink" | 
              "dark pink" | "red" | "dark red" | "maroon" | 
              "dark orange" | "orange" | "dark yellow" | "yellow" |
              "green" | "dark green" | "deep green" | "dark blue" |
              "blue" | "mid blue" | "dark mid blue" | "blue-gray" |
              "cyan" | "magenta" | "dark magenta" | "thistle" 

<OBJECT> ::== "Axis Colour"        -- graph axes (default white)
            | "Background Colour"  -- graph background (default blue)
            | "Grid Colour"        -- graph grid-lines (default gray)
            | "Fourier Series Colour" -- Fourier series data colour
                                         (default green) 
            | "Harmonic Colour" -- harmonic data colour (default red)
            | "Harmonic Coefficient Colour" -- Fourier series
                                               coefficients
                                               corresponding to
                                               current harmonic
                                               summation (default red)   
            | "Signal Colour"  -- signal data colour (default yellow) 

These declarations are optional.
#

	Axis Colour = black
	Background Colour = white
	Fourier Series Colour = blue
	Grid Colour = gray
	Harmonic Colour = dark orange
	Harmonic Coefficient Colour = blue-gray
	Signal Colour = red

# 
NUMBER OF FOURIER COEFFICIENTS

"Number Of Fourier Coefficients" "=" <INTEGER_EXPRESSION>

This value determines the number of coefficients in the series'. For
the trigonometric series there will be <EXPRESSION> A coefficients
(coefficient indices 0 .. <EXPRESSION> - 1) and <EXPRESSION> - 1 B
coefficients (coefficient indices 1 .. <EXPRESSION> - 1). For the
complex series there will be 2 * <EXPRESSION> - 1 magnitude and phase
components (component indices -(<EXPRESSION> - 1) .. 0 .. <EXPRESSION> 
- 1). The value of <INTEGER_EXPRESSION> must be greater or equal to 
three.
#

	Number Of Fourier Coefficients = 17

#
PERIOD INFORMATION OF THE SIGNAL

The following values should all be greater than 0.

"Default Period" "=" <EXPRESSION>

The default period of the time-domain signal.

"Number Of Periods" "=" <EXPRESSION>

The number of periodic repetitions of the time-domain signal which are 
calculated. 
#

	Default Period = 1
	Number Of Periods = 4

#
INITIAL FOURIER SERIES AND RANGE

"Fourier Series Range" "=" <EXPRESSION>

This value determines the initial allowable range of Fourier series
coefficient values - A and B coefficients of the trigonometric Fourier 
series will be allowed to range between -<EXPRESSION> and <EXPRESSION> 
and complex Fourier series coefficients can take magnitudes from 0
.. <EXPRESSION>. <EXPRESSION> must be greater than 0.
#

	Fourier Series Range = 1

#
AUDIO RENDITION AVAILABILITY

"Audio Rendition"

Omitting this flag prevents audio renditions of the signals being
available. Including this flag allows audio rendition on all
non-Macintosh platforms
#

        Audio Rendition

#
INITIAL FOURIER SERIES

"Initially Present Trigonometric Series"

If this flag is present then the trigonometric Fourier series will be
presented on starting the tool. If ommited then the default
initial presentation of the complex Fourier series will be selected.
#	

	Initially Present Trigonometric Series

#
ANIMATING HARMONIC SUMMATIONS

"Animate Wavelet Summation"

Including this flag means that initially the summation of wavelets
will be animated. 
#

        Animate Harmonic Summation

# 
GRAPH GRID LINES

"Signal Grid Lines"

If this flag is present then the signal graph will initially be drawn
with grid lines. If this flag is ommited then no grid lines are
initially drawn.

"Fourier Series Grid Lines"

If this flag is present then the Fourier Series graphs will initially
be drawn with grid lines. If this flag is ommited then no grid lines
are initially drawn.
#

        Fourier Series Grid Lines
        Signal Grid Lines

#
HELP INFORMATION

Locations of help information files and labels to access these from
within the Help menu.

"Help:" <STRING>    -- where <STRING> is used as a label within the
                       Help menu to provide access to help information
                       in the corresponding help file 
"Help File:" <FILE> -- location of help file, accessible from current
                       directory, for example "HelpFiles/help.hlp"

These declarations are optional.
#

        Help: Overview
        Help File: HelpFiles/fsHelpOverview.hlp

        Help: Actions
        Help File: HelpFiles/fsHelpActions.hlp

#
FUNCTION DECLARATIONS

<(X)_EXPRESSION> is used in the following to denote an <EXPRESSION>
that may contain any variables in the list X also. So, for example, 

        <("n")_EXPRESSION> 

allows such values as 

        "sin(n + 0.5 * (4 - n))" or "sin(33 + PI)" or "n ^ 2"

Function bounds:

<BOUND> :: == <(X)_EXPRESSION> 
              ( "==" | "!=" | "<" | ">" | "<=" | ">=" )
              <(X)_EXPRESSION>

<BOUND> ::== <(X)_EXPRESSION> 
             (">" | ">=" ) 
             <(X)_EXPRESSION>
             (">" | ">=" ) 
             <(X)_EXPRESSION>

<BOUND> ::== <(X)_EXPRESSION> 
             ("<" | "<=" ) 
             <(X)_EXPRESSION>
             ("<" | "<=" ) 
             <(X)_EXPRESSION>

Function declarations:

<FUNCTION(X)_DECLARATION> is a function declaration containing
<(X)_EXPRESSION>s.

<FUNCTION(X)_DECLARATION> ::== (<BOUND> ":" <(X)_EXPRESSION> ";")
                               (<BOUND> ":" <(X)_EXPRESSION> ";")*
                               "otherwise :" <(X)_EXPRESSION>

<FUNCTION(X)_DECLARATION> ::== (X)_EXPRESSION
#

#
FOURIER SERIES

The trigonometric and complex Fourier series' are declared as
follows.

Trigonometric Fourier series are declared as:

"Name:" <STRING> -- any string
"Period:" <EXPRESSION> -- period of the time-domain signal that this
                          series represents
"A:" <FUNCTION("n")_DECLARATION> -- definition of A coefficients
"B:" <FUNCTION("n")_DECLARATION> -- definition of B coefficients

Complex Fourier series are declared as:

"Name:" <STRING> -- any string
"Period:" <EXPRESSION> -- period of the time-domain signal that this
                          series represents
"Magnitude:" <FUNCTION("n")_DECLARATION> -- definition of magnitude
                                            components
"Phase:"  <FUNCTION("n")_DECLARATION> -- definition of phase components

These declarations are optional.
#

	Name: Simple Example
	Period: 2
	A: n == 0 : 0;
	   n == 1 : 1;
	   otherwise : 0
	B: n == 0 : 0;
	   n == 1 : 3;
	   otherwise : 0

	Name: 50 percent duty cycle square wave
	Period: 2
	A: n == 0 : 0 ;
	   otherwise : 0
	B: n == 0 : 0 ;
	   otherwise : (n % 2) * ((2 / (n * PI)) *
           (1 - cos(n * PI)))

	Name: 50 percent duty cycle square pulse
	Period: 0.016
	A: n == 0 : 2;
	   otherwise : 0
	B: n == 0 : 0;
	   otherwise : (n % 2) * ((2 / (n * PI)) *
           (1 - cos(n * PI)))

	Name: 25 percent duty cycle square pulse
	Period: 0.016
	A: n == 0 : 2;
	   otherwise : (8 * (sin(((2 * PI) / 4) * n)) / 
           (2 * PI * n))
	B: n == 0 : 0;
	   otherwise : (8 * ((1 - cos(((2 * PI) / 4) * n)) /  
           (2 * PI * n)))

	Name: Ramped wave
	Period: 2
	A: n == 0 : 1;
	   otherwise : (n % 2) * (4 / (n * n * PI * PI))
	B: n == 0 : 0;
	   otherwise : -2 / (n * PI) 

	Name: Exercise 1.6i wave 
	Period: 1
	Magnitude: n == 0 : 0 ;
		   n == 1 : 3 / 2 ;
		   n == 2 : 2 ;
		   otherwise : 0
	Phase: n == 0 : 0 ;
	       n == 1 : 0 ;
	       n == 2 : -PI / 2 ;
	       otherwise : 0

	Name: Exercise 1.6ii wave 
	Period: 1
	Magnitude: n == 0 : 0.5 ;
                   n == 1 : 1 / 2 ;
	           n == 4 : 1 / 4 ;
	           otherwise : 0
	Phase: n == 0 : 0 ;
	       n == 1 : 0 ;
	       n == 4 : 0 ;
	       otherwise : 0

	Name: Square wave 3 (Figure 1.6)
	Period: 1
	Magnitude: n == 0 : 2 / 5 ;
	           otherwise : abs((2 / 5) * sinc((n * PI) / 5))
	Phase: n == 0 : 0 ;
	       otherwise : ((n / 5) % 2) * -PI

#
The index of the default signal is specified as follows:

"Default Signal" "=" <INTEGER>

where <INTEGER> must range between 1 and the number of Fourier series
declared.

This declaration is optional. If omitted the default signal is set to
1. If no signals are defined then this declaration will be ignored.
#

        Default Signal = 1
