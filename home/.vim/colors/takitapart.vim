" Name:     takitapart vim colorscheme
" Author:   Bob VanderClay <bob@high90.com>
" License:  


" Initialization
" ---------------------------------------------------------------------
set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "takitapart"


" Color shortcuts
" ---------------------------------------------------------------------
let s:vmode           = "cterm"

let s:black           = "16"
let s:white           = "231"
let s:darkestgreen    = "22"
let s:darkgreen       = "28"
let s:mediumgreen     = "70"
let s:brightgreen     = "148"
let s:darkestcyan     = "23"
let s:mediumcyan      = "117"
let s:darkestblue     = "24"
let s:darkblue        = "31"
let s:darkestred      = "52"
let s:darkred         = "88"
let s:mediumred       = "124"
let s:brightred       = "160"
let s:brightestred    = "196"
let s:darkestpurple   = "55"
let s:mediumpurple    = "98"
let s:brightpurple    = "189"
let s:brightorange    = "208"
let s:brightestorange = "214"
let s:darker_charcoal  = "233"
let s:dark_charcoal    = "234"
let s:charcoal         = "235"
let s:light_charcoal   = "236"
let s:lighter_charcoal = "237"
let s:darker_stone     = "241"
let s:dark_stone       = "242"
let s:stone            = "243"
let s:light_stone      = "244"
let s:lighter_stone    = "245"
let s:darker_snow      = "251"
let s:dark_snow        = "252"
let s:snow             = "253"
let s:light_snow       = "254"
let s:lighter_snow     = "255"


" Background value based on termtrans setting "{{{
" ---------------------------------------------------------------------
" if (has("gui_running"))
    let s:back        = s:charcoal
" else
"    let s:back        = "NONE"
" endif


" Formatting options and null values for passthrough effect
" ---------------------------------------------------------------------
let s:none            = "NONE"
let s:none            = "NONE"
let s:t_none          = "NONE"
let s:n               = "NONE"
let s:c               = ",undercurl"
let s:r               = ",reverse"
let s:s               = ",standout"
let s:ou              = ""
let s:ob              = ""
let s:b           	  = ",bold"
let s:u           	  = ",underline"
let s:i           	  = ",italic"


" Highlighting primitives
" ---------------------------------------------------------------------
exe "let s:bg_none      			= ' ".s:vmode."bg=".s:none   					."'"
exe "let s:bg_back      			= ' ".s:vmode."bg=".s:back   					."'"
exe "let s:bg_black     			= ' ".s:vmode."bg=".s:black  					."'"
exe "let s:bg_white               	= ' ".s:vmode."bg=".s:white            			."'"
exe "let s:bg_darkestgreen        	= ' ".s:vmode."bg=".s:darkestgreen     			."'"
exe "let s:bg_darkgreen           	= ' ".s:vmode."bg=".s:darkgreen        			."'"
exe "let s:bg_mediumgreen         	= ' ".s:vmode."bg=".s:mediumgreen      			."'"
exe "let s:bg_brightgreen         	= ' ".s:vmode."bg=".s:brightgreen      			."'"
exe "let s:bg_darkestcyan         	= ' ".s:vmode."bg=".s:darkestcyan      			."'"
exe "let s:bg_mediumcyan          	= ' ".s:vmode."bg=".s:mediumcyan       			."'"
exe "let s:bg_darkestblue         	= ' ".s:vmode."bg=".s:darkestblue      			."'"
exe "let s:bg_darkblue            	= ' ".s:vmode."bg=".s:darkblue         			."'"
exe "let s:bg_darkestred          	= ' ".s:vmode."bg=".s:darkestred       			."'"
exe "let s:bg_darkred             	= ' ".s:vmode."bg=".s:darkred          			."'"
exe "let s:bg_mediumred           	= ' ".s:vmode."bg=".s:mediumred        			."'"
exe "let s:bg_brightred           	= ' ".s:vmode."bg=".s:brightred        			."'"
exe "let s:bg_brightestred        	= ' ".s:vmode."bg=".s:brightestred     			."'"
exe "let s:bg_darkestpurple       	= ' ".s:vmode."bg=".s:darkestpurple    			."'"
exe "let s:bg_mediumpurple        	= ' ".s:vmode."bg=".s:mediumpurple     			."'"
exe "let s:bg_brightpurple        	= ' ".s:vmode."bg=".s:brightpurple     			."'"
exe "let s:bg_brightorange        	= ' ".s:vmode."bg=".s:brightorange     			."'"
exe "let s:bg_brightestorange     	= ' ".s:vmode."bg=".s:brightestorange  			."'"
exe "let s:bg_darker_charcoal       = ' ".s:vmode."bg=".s:darker_charcoal           ."'"
exe "let s:bg_dark_charcoal         = ' ".s:vmode."bg=".s:dark_charcoal             ."'"
exe "let s:bg_charcoal              = ' ".s:vmode."bg=".s:charcoal                  ."'"
exe "let s:bg_light_charcoal        = ' ".s:vmode."bg=".s:light_charcoal            ."'"
exe "let s:bg_lighter_charcoal      = ' ".s:vmode."bg=".s:lighter_charcoal          ."'"
exe "let s:bg_darker_stone          = ' ".s:vmode."bg=".s:darker_stone              ."'"
exe "let s:bg_dark_stone            = ' ".s:vmode."bg=".s:dark_stone                ."'"
exe "let s:bg_stone                 = ' ".s:vmode."bg=".s:stone                     ."'"
exe "let s:bg_light_stone           = ' ".s:vmode."bg=".s:light_stone               ."'"
exe "let s:bg_lighter_stone         = ' ".s:vmode."bg=".s:lighter_stone             ."'"
exe "let s:bg_darker_snow           = ' ".s:vmode."bg=".s:darker_snow               ."'"
exe "let s:bg_dark_snow             = ' ".s:vmode."bg=".s:dark_snow                 ."'"
exe "let s:bg_snow                  = ' ".s:vmode."bg=".s:snow                      ."'"
exe "let s:bg_light_snow            = ' ".s:vmode."bg=".s:light_snow                ."'"
exe "let s:bg_lighter_snow          = ' ".s:vmode."bg=".s:lighter_snow              ."'"

exe "let s:fg_none      			= ' ".s:vmode."fg=".s:none   					."'"
exe "let s:fg_back      			= ' ".s:vmode."fg=".s:back   					."'"
exe "let s:fg_black     			= ' ".s:vmode."fg=".s:black  					."'"
exe "let s:fg_white               	= ' ".s:vmode."fg=".s:white            			."'"
exe "let s:fg_darkestgreen        	= ' ".s:vmode."fg=".s:darkestgreen     			."'"
exe "let s:fg_darkgreen           	= ' ".s:vmode."fg=".s:darkgreen        			."'"
exe "let s:fg_mediumgreen         	= ' ".s:vmode."fg=".s:mediumgreen      			."'"
exe "let s:fg_brightgreen         	= ' ".s:vmode."fg=".s:brightgreen      			."'"
exe "let s:fg_darkestcyan         	= ' ".s:vmode."fg=".s:darkestcyan      			."'"
exe "let s:fg_mediumcyan          	= ' ".s:vmode."fg=".s:mediumcyan       			."'"
exe "let s:fg_darkestblue         	= ' ".s:vmode."fg=".s:darkestblue      			."'"
exe "let s:fg_darkblue            	= ' ".s:vmode."fg=".s:darkblue         			."'"
exe "let s:fg_darkestred          	= ' ".s:vmode."fg=".s:darkestred       			."'"
exe "let s:fg_darkred             	= ' ".s:vmode."fg=".s:darkred          			."'"
exe "let s:fg_mediumred           	= ' ".s:vmode."fg=".s:mediumred        			."'"
exe "let s:fg_brightred           	= ' ".s:vmode."fg=".s:brightred        			."'"
exe "let s:fg_brightestred        	= ' ".s:vmode."fg=".s:brightestred     			."'"
exe "let s:fg_darkestpurple       	= ' ".s:vmode."fg=".s:darkestpurple    			."'"
exe "let s:fg_mediumpurple        	= ' ".s:vmode."fg=".s:mediumpurple     			."'"
exe "let s:fg_brightpurple        	= ' ".s:vmode."fg=".s:brightpurple     			."'"
exe "let s:fg_brightorange        	= ' ".s:vmode."fg=".s:brightorange     			."'"
exe "let s:fg_brightestorange     	= ' ".s:vmode."fg=".s:brightestorange  			."'"
exe "let s:fg_darker_charcoal       = ' ".s:vmode."fg=".s:darker_charcoal           ."'"
exe "let s:fg_dark_charcoal         = ' ".s:vmode."fg=".s:dark_charcoal             ."'"
exe "let s:fg_charcoal              = ' ".s:vmode."fg=".s:charcoal                  ."'"
exe "let s:fg_light_charcoal        = ' ".s:vmode."fg=".s:light_charcoal            ."'"
exe "let s:fg_lighter_charcoal      = ' ".s:vmode."fg=".s:lighter_charcoal          ."'"
exe "let s:fg_darker_stone          = ' ".s:vmode."fg=".s:darker_stone              ."'"
exe "let s:fg_dark_stone            = ' ".s:vmode."fg=".s:dark_stone                ."'"
exe "let s:fg_stone                 = ' ".s:vmode."fg=".s:stone                     ."'"
exe "let s:fg_light_stone           = ' ".s:vmode."fg=".s:light_stone               ."'"
exe "let s:fg_lighter_stone         = ' ".s:vmode."fg=".s:lighter_stone             ."'"
exe "let s:fg_darker_snow           = ' ".s:vmode."fg=".s:darker_snow               ."'"
exe "let s:fg_dark_snow             = ' ".s:vmode."fg=".s:dark_snow                 ."'"
exe "let s:fg_snow                  = ' ".s:vmode."fg=".s:snow                      ."'"
exe "let s:fg_light_snow            = ' ".s:vmode."fg=".s:light_snow                ."'"
exe "let s:fg_lighter_snow          = ' ".s:vmode."fg=".s:lighter_snow              ."'"

exe "let s:fmt_none     = ' ".s:vmode."=NONE".          " term=NONE".    "'"
exe "let s:fmt_bold     = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b."'"
exe "let s:fmt_bldi     = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b."'"
exe "let s:fmt_undr     = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u."'"
exe "let s:fmt_undb     = ' ".s:vmode."=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi     = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u."'"
exe "let s:fmt_uopt     = ' ".s:vmode."=NONE".s:ou.     " term=NONE".s:ou."'"
exe "let s:fmt_curl     = ' ".s:vmode."=NONE".s:c.      " term=NONE".s:c."'"
exe "let s:fmt_ital     = ' ".s:vmode."=NONE".          " term=NONE".    "'"
exe "let s:fmt_revr     = ' ".s:vmode."=NONE".s:r.      " term=NONE".s:r."'"
exe "let s:fmt_stnd     = ' ".s:vmode."=NONE".s:s.      " term=NONE".s:s."'"




" Basic highlighting
" ---------------------------------------------------------------------
" note that link syntax to avoid duplicate configuration doesn't work with the
" exe compiled formats

exe "hi! Normal"         .s:fmt_none   .s:fg_white  .s:bg_back

"       *Comment         any comment
" --------------------------------------------------------------
exe "hi! Comment"        .s:fmt_ital   .s:fg_stone .s:bg_none


"       *Constant        any constant
" --------------------------------------------------------------
"        String          a string constant: "this is a string"
"        Character       a character constant: 'c', '\n'
"        Number          a number constant: 234, 0xff
"        Boolean         a boolean constant: TRUE, false
"        Float           a floating point constant: 2.3e10
" --------------------------------------------------------------
exe "hi! Constant"       .s:fmt_none   .s:fg_darkblue   .s:bg_none
		exe "hi! String"       .s:fmt_none   .s:fg_brightgreen   .s:bg_none
		hi! link Character String
		hi! link Number Constant
		hi! link Boolean Constant
		hi! link Float Constant

"       *Identifier      any variable name
"        Function        function name (also: methods for classes)
" --------------------------------------------------------------
exe "hi! Identifier"     .s:fmt_none   .s:fg_mediumcyan   .s:bg_none
		hi! link Function Identifier

"       *Statement       any statement
" --------------------------------------------------------------
"        Conditional     if, then, else, endif, switch, etc.
"        Repeat          for, do, while, etc.
"        Label           case, default, etc.
"        Operator        "sizeof", "+", "*", etc.
"        Keyword         any other keyword
"        Exception       try, catch, throw
" --------------------------------------------------------------
exe "hi! Statement"      .s:fmt_none   .s:fg_mediumcyan  .s:bg_none
		hi! link Conditional Statement
		hi! link Repeat Statement
		hi! link Label Statement
		" hi! link Operator Statement
		exe "hi! Operator"      .s:fmt_none   .s:fg_brightorange  .s:bg_none
		hi! link Keyword Statement
		hi! link Exception Statement

"       *PreProc         generic Preprocessor
" --------------------------------------------------------------
"        Include         preprocessor #include
"        Define          preprocessor #define
"        Macro           same as Define
"        PreCondit       preprocessor #if, #else, #endif, etc.
" --------------------------------------------------------------
exe "hi! PreProc"        .s:fmt_none   .s:fg_darkblue .s:bg_none
		hi! link Include PreProc
		hi! link Define PreProc
		hi! link Macro PreProc
		hi! link PreCondit PreProc

"       *Type            int, long, char, etc.
" --------------------------------------------------------------
"        StorageClass    static, register, volatile, etc.
"        Structure       struct, union, enum, etc.
"        Typedef         A typedef
" --------------------------------------------------------------
exe "hi! Type"           .s:fmt_none   .s:fg_mediumcyan .s:bg_none
		hi! link StorageClass Type
		hi! link Structure Type
		hi! link Typedef Type

"       *Special         any special symbol
" --------------------------------------------------------------
"        SpecialChar     special character in a constant
"        Tag             you can use CTRL-] on this
"        Delimiter       character that needs attention
"        SpecialComment  special things inside a comment
"        Debug           debugging statements
" --------------------------------------------------------------
exe "hi! Special"        .s:fmt_none   .s:fg_brightestorange    .s:bg_none
		hi! link SpecialChar Special
		hi! link Tag Special
		hi! link Delimiter Special
		hi! link SpecialComment Special
		hi! link Debug Special

"       *Underlined      text that stands out, HTML links
" --------------------------------------------------------------
exe "hi! Underlined"     .s:fmt_none   .s:fg_mediumcyan .s:bg_none

"       *Ignore          left blank, hidden  |hl-Ignore|
" --------------------------------------------------------------
exe "hi! Ignore"         .s:fmt_none   .s:fg_none   .s:bg_none

"       *Error           any erroneous construct
" --------------------------------------------------------------
exe "hi! Error"          .s:fmt_bold   .s:fg_brightred    .s:bg_none

"       *Todo            anything that needs extra attention; mostly the
"                        keywords TODO FIXME and XXX
" --------------------------------------------------------------
exe "hi! Todo"           .s:fmt_bold   .s:fg_darkestred .s:bg_brightestorange


" Extended highlighting
" ---------------------------------------------------------------------
" Special non-text characters
exe "hi! NonText"        .s:fmt_bold   .s:fg_charcoal .s:bg_light_charcoal
	hi! link SpecialKey NonText

" exe "hi! StatusLine"     .s:fmt_none   .s:fg_base02 .s:bg_base1
" exe "hi! StatusLineNC"   .s:fmt_none   .s:fg_base02 .s:bg_base00
" exe "hi! Visual"         .s:fmt_none   .s:fg_base03 .s:bg_base01
" 
exe "hi! Directory"      .s:fmt_none   .s:fg_darkblue   .s:bg_none
exe "hi! ErrorMsg"       .s:fmt_revr   .s:fg_mediumred    .s:bg_none
exe "hi! IncSearch"      .s:fmt_stnd   .s:fg_brightorange .s:bg_none
exe "hi! Search"         .s:fmt_revr   .s:fg_brightestorange .s:bg_none
exe "hi! MoreMsg"        .s:fmt_none   .s:fg_darkblue   .s:bg_none
exe "hi! ModeMsg"        .s:fmt_none   .s:fg_darkblue   .s:bg_none
exe "hi! LineNr"         .s:fmt_none   .s:fg_stone .s:bg_lighter_charcoal
exe "hi! Question"       .s:fmt_bold   .s:fg_mediumcyan   .s:bg_none
" exe "hi! VertSplit"      .s:fmt_bold   .s:fg_base00 .s:bg_base00
exe "hi! Title"          .s:fmt_bold   .s:fg_brightorange .s:bg_none
" exe "hi! VisualNOS"      .s:fmt_stnd   .s:fg_none   .s:bg_base02
" exe "hi! WarningMsg"     .s:fmt_bold   .s:fg_mediumred    .s:bg_none
" exe "hi! WildMenu"       .s:fmt_none   .s:fg_base2  .s:bg_base02
" exe "hi! Folded"         .s:fmt_undb   .s:fg_base0  .s:bg_base02  .s:sp_base03
" exe "hi! FoldColumn"     .s:fmt_bold   .s:fg_base0  .s:bg_base02
exe "hi! DiffAdd"        .s:fmt_revr   .s:fg_mediumgreen  .s:bg_none
exe "hi! DiffChange"     .s:fmt_revr   .s:fg_brightestorange .s:bg_none
exe "hi! DiffDelete"     .s:fmt_revr   .s:fg_mediumred    .s:bg_none
exe "hi! DiffText"       .s:fmt_revr   .s:fg_darkblue   .s:bg_none
" exe "hi! SignColumn"     .s:fmt_none   .s:fg_base0  .s:bg_base02
" exe "hi! Conceal"        .s:fmt_none   .s:fg_blue   .s:bg_none
" exe "hi! SpellBad"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_red
" exe "hi! SpellCap"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_violet
" exe "hi! SpellRare"      .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_cyan
" exe "hi! SpellLocal"     .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_yellow
" exe "hi! Pmenu"          .s:fmt_none   .s:fg_base0  .s:bg_base02
" exe "hi! PmenuSel"       .s:fmt_none   .s:fg_base2  .s:bg_base01
" exe "hi! PmenuSbar"      .s:fmt_none   .s:fg_base0  .s:bg_base2
" exe "hi! PmenuThumb"     .s:fmt_none   .s:fg_base03 .s:bg_base0
" exe "hi! TabLine"        .s:fmt_undr   .s:fg_base0  .s:bg_base02  .s:sp_base0
" exe "hi! TabLineSel"     .s:fmt_undr   .s:fg_base2  .s:bg_base01  .s:sp_base0
" exe "hi! TabLineFill"    .s:fmt_undr   .s:fg_base0  .s:bg_base02  .s:sp_base0
" exe "hi! CursorColumn"   .s:fmt_none   .s:fg_none   .s:bg_base02
" exe "hi! CursorLine"     .s:fmt_uopt   .s:fg_none   .s:bg_base02  .s:sp_base1
" exe "hi! ColorColumn"    .s:fmt_none   .s:fg_none   .s:bg_base02
" exe "hi! Cursor"         .s:fmt_none   .s:fg_base03 .s:bg_base0
" hi! link lCursor Cursor
" exe "hi! MatchParen"     .s:fmt_bold   .s:fg_mediumred    .s:bg_base01


" vim syntax highlighting
" ---------------------------------------------------------------------
" exe "hi! vimLineComment" . s:fg_base01 .s:bg_none   .s:fmt_ital
" exe "hi! vimCommentString".s:fg_violet .s:bg_none   .s:fmt_none
" hi! link vimVar Identifier
" hi! link vimFunc Function
" hi! link vimUserFunc Function
" exe "hi! vimCommand"     . s:fg_yellow .s:bg_none   .s:fmt_none
" exe "hi! vimCmdSep"      . s:fg_blue   .s:bg_none   .s:fmt_bold
" exe "hi! helpExample"    . s:fg_base1  .s:bg_none   .s:fmt_none
" hi! link helpSpecial Special
" exe "hi! helpOption"     . s:fg_cyan   .s:bg_none   .s:fmt_none
" exe "hi! helpNote"       . s:fg_magenta.s:bg_none   .s:fmt_none
" exe "hi! helpVim"        . s:fg_magenta.s:bg_none   .s:fmt_none
" exe "hi! helpHyperTextJump" .s:fg_blue  .s:bg_none   .s:fmt_undr
" exe "hi! helpHyperTextEntry".s:fg_green .s:bg_none   .s:fmt_none
" exe "hi! vimIsCommand"   . s:fg_base00 .s:bg_none   .s:fmt_none
" exe "hi! vimSynMtchOpt"  . s:fg_yellow .s:bg_none   .s:fmt_none
" exe "hi! vimSynType"     . s:fg_cyan   .s:bg_none   .s:fmt_none
" exe "hi! vimHiLink"      . s:fg_blue   .s:bg_none   .s:fmt_none
" exe "hi! vimHiGroup"     . s:fg_blue   .s:bg_none   .s:fmt_none
" exe "hi! vimGroup"       . s:fg_blue   .s:bg_none   .s:fmt_undb

" PHP
" ---------------------------------------------------------------------
hi! link phpStringSingle     String
hi! link phpStringDouble     String
hi! link phpBacktick         String
hi! link phpHereDoc          String
hi! link phpNowDoc           String

hi! link phpFunctions Function

" phpMethods
" hi! link phpMethods Function
exe "hi! phpMethods"        	   .s:fmt_none   .s:fg_snow .s:bg_none

" phpMethodsVar		->[methods]
exe "hi! phpMethodsVar"           .s:fmt_none   .s:fg_mediumcyan .s:bg_none

" phpSuperGlobals	_GET, _PUT, _SERVER, etc.
" hi link phpSuperGlobals Identifier

" phpMagicConstant	__FILE__ __DIR__ __FUNCTION__ __METHOD__ __CLASS__, etc.
" phpMagicMethods	__construct __destruct __call __get __set __isset, etc. 

" hi! link phpBoolean Boolean
" hi! link phpNull Boolean

" hi link phpArrayPair Operator
" 

" phpRegion 	<?php, etc.
" hi phpRegionDelimiter guifg=#ad7fa8

" hi phpPropertySelector guifg=#888a85
" hi phpPropertySelectorInString guifg=#888a85

hi! link phpOperator Operator

" phpMemberSelector 	object[->]method
hi! link phpMemberSelector Operator 

" phpVarSelector 	[$]variablename
hi! link phpVarSelector Identifier

" phpRelation	
hi! link phpRelation	Operator

" hi phpAssignByRef guifg=#888a85
" hi phpUnknownSelector guifg=#888a85
" exe "hi! phpSemicolon"           .s:fmt_none   .s:fg_brightestred .s:bg_none

" phpParent		{}()[]
exe "hi! phpParent"           .s:fmt_none   .s:fg_white .s:bg_none
" phpParentError
hi! link phpParentError		phpParent

" exe "hi! phpHeredoc"           .s:fmt_none   .s:fg_brightgreen .s:bg_none
" hi! link phpNowdoc	phpHeredoc




" HTML
" ---------------------------------------------------------------------
" hi htmlTag guifg=#888a85
" hi htmlEndTag guifg=#888a85
" hi htmlTagName guifg=#babdb6
" hi htmlSpecialTagName guifg=#babdb6
" hi htmlArg guifg=#d3d7cf
" hi htmlTitle guifg=#8ae234 gui=none
" hi link htmlH1 htmlTitle
" hi link htmlH2 htmlH1
" hi link htmlH3 htmlH1
" hi link htmlH4 htmlH1
" hi link htmlH5 htmlH1
" hi link htmlH6 htmlH1

" CSS
" ---------------------------------------------------------------------
" CSS syntax
" hi cssTagName         guifg=#FFC66D
" hi cssBraces          guifg=#D8D8D8
" hi cssSelectorOp      guifg=#A5C261
" hi cssSelectorOp2     guifg=#A5C261
" hi cssInclude         guifg=#CC7833
" hi cssFunctionName    guifg=#B83426
" hi cssClassName       guifg=#D8D8D8
" hi cssPseudoClassId guifg=#eeeeec
" hi cssIdentifier      guifg=#D8D8D8
" hi cssComment         guifg=#EEEEEE guibg=#575757
" 
" Let right hand side be the same color
"     hi link cssFontAttr Constant
"     hi link cssCommonAttr Constant
"     hi link cssFontDescriptorAttr Constant
"     hi link cssColorAttr Constant
"     hi link cssTextAttr Constant
"     hi link cssBoxAttr Constant
"     hi link cssGeneratedContentAttr Constant
"     hi link cssAuralAttr Constant
"     hi link cssPagingAttr Constant
"     hi link cssUIAttr Constant
"     hi link cssRenderAttr Constant
"     hi link cssTableAttr Constant
" 
" 
" hi cssUIProp guifg=#d3d7cf
" 	hi link cssPagingProp cssUIProp
" 	hi link cssGeneratedContentProp cssUIProp
" 	hi link cssRenderProp cssUIProp
" 	hi link cssBoxProp cssUIProp
" 	hi link cssTextProp cssUIProp
" 	hi link cssColorProp cssUIProp
" 	hi link cssFontProp cssUIProp
" 
" hi sassClass guifg=#B7DFF8


" JavaScript Highlighting
" hi javaScript                   guifg=#ffffff
" hi javaScriptRegexpString       guifg=#aa6600
" hi javaScriptDocComment         guifg=#aaaaaa
" hi javaScriptCssStyles          guifg=#dd7700
" hi javaScriptDomElemFuncs       guifg=#66cd66
" hi javaScriptHtmlElemFuncs      guifg=#dd7700
" hi javaScriptLabel              guifg=#00bdec   gui=italic
" hi javaScriptPrototype          guifg=#00bdec
" hi javaScriptConditional        guifg=#ff0007   gui=bold
" hi javaScriptRepeat             guifg=#ff0007   gui=bold
" hi javaScriptFunction           guifg=#ff0086   gui=bold
" hi link javaScriptStatement Keyword

" hi javaScriptIdentifier guifg=#6C99BB
" hi javaScriptType guifg=#FFC66D
" hi javaScriptValue guifg=#6C99BB
" hi link javaScriptBraces Normal
" hi javaScriptOperator guifg=#888a85




" Acknowledgments
" ---------------------------------------------------------------------
" Solarized
" Ethan Schoonover <es@ethanschoonover.com>
" http://ethanschoonover.com/solarized
"
" Thank you for provding a great template for a modular and 
" flexible colorscheme. 
"
" 
" Mustang
" Henrique C. Alves <hcarvalhoalves@gmail.com>
" http://hcalves.deviantart.com/art/Mustang-Vim-Colorscheme-98974484
"
" Color inspiration.
"
"
" idlefingers
" Damien Timewell <damien@fluidsyntax.com>
" http://idlefingers.co.uk/
"
" Color inspiration.
"
"
