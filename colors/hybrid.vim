" File:       (neo)-hybrid.vim
" Maintainer: Rafael Bodill (rafi)
" URL:        https://github.com/rafi/vim-hybrid
" Modified:   06 May 2023 23:05 PM IDT
" License:    MIT
" vint: -ProhibitUnnecessaryDoubleQuote

" Description: {{{
" ----------------------------------------------------------------------------
" The default RGB colour palette is taken from Tomorrow-Night.vim:
" https://github.com/chriskempson/base16-vim/blob/master/colors/base16-tomorrow-night.vim
" Deprecated: https://github.com/chriskempson/vim-tomorrow-theme
"
" The reduced RGB colour palette is taken from Codecademy's online editor:
" https://www.codecademy.com/learn
"
" The syntax highlighting scheme is taken from jellybeans.vim:
" https://github.com/nanotech/jellybeans.vim
"
" The is code taken from solarized.vim:
" https://github.com/altercation/vim-colors-solarized

"}}}
" Requirements And Recommendations: {{{
" ----------------------------------------------------------------------------
" Requirements
"   - gVim 7.3+ on Linux, Mac and Windows.
"   - Vim 7.3+ on Linux and Mac, using a terminal that supports 256 colours.
"
" Due to the limited 256 palette, colours in Vim and gVim will still be slightly
" different.
"
" In order to have Vim use the same colours as gVim (the way this colour scheme
" is intended), it is recommended that you define the basic 16 colours in your
" terminal.
"
" For Linux users (rxvt-unicode, xterm):
"
" 1.  Add the default palette to ~/.Xresources:
"
"         https://gist.github.com/3278077
"
"     or alternatively, add the reduced contrast palette to ~/.Xresources:
"
"         https://gist.github.com/w0ng/16e33902508b4a0350ae
"
" 2.  Add to ~/.vimrc:
"
"         let g:hybrid_custom_term_colors = 1
"         let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
"         colorscheme hybrid
"
" For OSX users (iTerm):
"
" 1.  Import the default colour preset into iTerm:
"
"         https://raw.githubusercontent.com/w0ng/dotfiles/master/iterm2/hybrid.itermcolors
"
"     or alternatively, import the reduced contrast color preset into iTerm:
"
"         https://raw.githubusercontent.com/w0ng/dotfiles/master/iterm2/hybrid-reduced-contrast.itermcolors
"
" 2.  Add to ~/.vimrc:
"
"         let g:hybrid_custom_term_colors = 1
"         let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
"         colorscheme hybrid

"}}}
" Initialisation: {{{
" ----------------------------------------------------------------------------

hi clear

if exists("syntax_on")
  syntax reset
endif

let s:style = &background

let g:colors_name = "hybrid"

"}}}
" GUI And Cterm Palettes: {{{
" ----------------------------------------------------------------------------

let s:palette = {'gui' : {} , 'cterm' : {}}

if exists("g:hybrid_reduced_contrast") && g:hybrid_reduced_contrast == 1
  let s:gui_background = "#232c31"
  let s:gui_selection  = "#425059"
  let s:gui_line       = "#2d3c46"
  let s:gui_comment    = "#6c7a80"
else
  let s:gui_background = "#1d1f21"
  let s:gui_selection  = "#373b41"
  let s:gui_line       = "#282a2e"
  let s:gui_comment    = "#707880"
endif

let s:palette.gui.background = { 'dark' : s:gui_background , 'light' : "#e4e4e4" }
let s:palette.gui.foreground = { 'dark' : "#c5c8c6"        , 'light' : "#000000" }
let s:palette.gui.selection  = { 'dark' : s:gui_selection  , 'light' : "#bcbcbc" }
let s:palette.gui.line       = { 'dark' : s:gui_line       , 'light' : "#d0d0d0" }
let s:palette.gui.comment    = { 'dark' : s:gui_comment    , 'light' : "#5f5f5f" }
let s:palette.gui.red        = { 'dark' : "#cc6666"        , 'light' : "#5f0000" }
let s:palette.gui.orange     = { 'dark' : "#de935f"        , 'light' : "#875f00" }
let s:palette.gui.yellow     = { 'dark' : "#f0c674"        , 'light' : "#5f5f00" }
let s:palette.gui.green      = { 'dark' : "#b5bd68"        , 'light' : "#005f00" }
let s:palette.gui.aqua       = { 'dark' : "#8abeb7"        , 'light' : "#005f5f" }
let s:palette.gui.blue       = { 'dark' : "#81a2be"        , 'light' : "#00005f" }
let s:palette.gui.purple     = { 'dark' : "#b294bb"        , 'light' : "#5f005f" }
let s:palette.gui.window     = { 'dark' : "#303030"        , 'light' : "#9e9e9e" }
let s:palette.gui.darkcolumn = { 'dark' : "#1c1c1c"        , 'light' : "#808080" }
let s:palette.gui.addbg      = { 'dark' : "#5F875F"        , 'light' : "#d7ffd7" }
let s:palette.gui.addfg      = { 'dark' : "#d7ffaf"        , 'light' : "#005f00" }
let s:palette.gui.changebg   = { 'dark' : "#5F5F87"        , 'light' : "#d7d7ff" }
let s:palette.gui.changefg   = { 'dark' : "#d7d7ff"        , 'light' : "#5f005f" }
let s:palette.gui.delbg      = { 'dark' : "#cc6666"        , 'light' : "#ffd7d7" }
let s:palette.gui.darkblue   = { 'dark' : "#00005f"        , 'light' : "#d7ffd7" }
let s:palette.gui.darkcyan   = { 'dark' : "#005f5f"        , 'light' : "#005f00" }
let s:palette.gui.darkred    = { 'dark' : "#5f0000"        , 'light' : "#d7d7ff" }
let s:palette.gui.darkpurple = { 'dark' : "#5f005f"        , 'light' : "#5f005f" }

if exists("g:hybrid_custom_term_colors") && g:hybrid_custom_term_colors == 1
  let s:cterm_foreground = "15"  " White
  let s:cterm_selection  = "8"   " DarkGrey
  let s:cterm_line       = "0"   " Black
  let s:cterm_comment    = "7"   " LightGrey
  let s:cterm_red        = "9"   " LightRed
  let s:cterm_orange     = "3"   " DarkYellow
  let s:cterm_yellow     = "11"  " LightYellow
  let s:cterm_green      = "10"  " LightGreen
  let s:cterm_aqua       = "14"  " LightCyan
  let s:cterm_blue       = "12"  " LightBlue
  let s:cterm_purple     = "13"  " LightMagenta
  let s:cterm_delbg      = "9"   " LightRed
else
  let s:cterm_foreground = "250"
  let s:cterm_selection  = "237"
  let s:cterm_line       = "235"
  let s:cterm_comment    = "243"
  let s:cterm_red        = "167"
  let s:cterm_orange     = "173"
  let s:cterm_yellow     = "221"
  let s:cterm_green      = "143"
  let s:cterm_aqua       = "109"
  let s:cterm_blue       = "110"
  let s:cterm_purple     = "139"
  let s:cterm_delbg      = "167"
endif

let s:palette.cterm.background = { 'dark' : "234"              , 'light' : "254" }
let s:palette.cterm.foreground = { 'dark' : s:cterm_foreground , 'light' : "16"  }
let s:palette.cterm.window     = { 'dark' : "236"              , 'light' : "247" }
let s:palette.cterm.selection  = { 'dark' : s:cterm_selection  , 'light' : "250" }
let s:palette.cterm.line       = { 'dark' : s:cterm_line       , 'light' : "252" }
let s:palette.cterm.comment    = { 'dark' : s:cterm_comment    , 'light' : "59"  }
let s:palette.cterm.red        = { 'dark' : s:cterm_red        , 'light' : "52"  }
let s:palette.cterm.orange     = { 'dark' : s:cterm_orange     , 'light' : "94"  }
let s:palette.cterm.yellow     = { 'dark' : s:cterm_yellow     , 'light' : "58"  }
let s:palette.cterm.green      = { 'dark' : s:cterm_green      , 'light' : "22"  }
let s:palette.cterm.aqua       = { 'dark' : s:cterm_aqua       , 'light' : "23"  }
let s:palette.cterm.blue       = { 'dark' : s:cterm_blue       , 'light' : "17"  }
let s:palette.cterm.purple     = { 'dark' : s:cterm_purple     , 'light' : "53"  }
let s:palette.cterm.darkcolumn = { 'dark' : "234"              , 'light' : "244" }
let s:palette.cterm.addbg      = { 'dark' : "65"               , 'light' : "194" }
let s:palette.cterm.addfg      = { 'dark' : "193"              , 'light' : "22"  }
let s:palette.cterm.changebg   = { 'dark' : "60"               , 'light' : "189" }
let s:palette.cterm.changefg   = { 'dark' : "189"              , 'light' : "53"  }
let s:palette.cterm.delbg      = { 'dark' : s:cterm_delbg      , 'light' : "224" }
let s:palette.cterm.darkblue   = { 'dark' : "17"               , 'light' : "194" }
let s:palette.cterm.darkcyan   = { 'dark' : "24"               , 'light' : "22"  }
let s:palette.cterm.darkred    = { 'dark' : "52"               , 'light' : "189" }
let s:palette.cterm.darkpurple = { 'dark' : "53"               , 'light' : "53"  }

"}}}
" Formatting Options: {{{
" ----------------------------------------------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

"}}}
" Highlighting Primitives: {{{
" ----------------------------------------------------------------------------
function! s:gui(n)
  return s:palette.gui[a:n][s:style]
endfunction

function! s:cterm(n)
  return s:palette.cterm[a:n][s:style]
endfunction

let s:bg_none       = ' guibg=NONE                    ctermbg=NONE'
let s:bg_foreground = ' guibg='.s:gui('foreground').' ctermbg='.s:cterm('foreground')
let s:bg_background = ' guibg='.s:gui('background').' ctermbg='.s:cterm('background')
let s:bg_selection  = ' guibg='.s:gui('selection') .' ctermbg='.s:cterm('selection')
let s:bg_line       = ' guibg='.s:gui('line')      .' ctermbg='.s:cterm('line')
let s:bg_comment    = ' guibg='.s:gui('comment')   .' ctermbg='.s:cterm('comment')
let s:bg_red        = ' guibg='.s:gui('red')       .' ctermbg='.s:cterm('red')
let s:bg_orange     = ' guibg='.s:gui('orange')    .' ctermbg='.s:cterm('orange')
let s:bg_yellow     = ' guibg='.s:gui('yellow')    .' ctermbg='.s:cterm('yellow')
let s:bg_green      = ' guibg='.s:gui('green')     .' ctermbg='.s:cterm('green')
let s:bg_aqua       = ' guibg='.s:gui('aqua')      .' ctermbg='.s:cterm('aqua')
let s:bg_blue       = ' guibg='.s:gui('blue')      .' ctermbg='.s:cterm('blue')
let s:bg_purple     = ' guibg='.s:gui('purple')    .' ctermbg='.s:cterm('purple')
let s:bg_window     = ' guibg='.s:gui('window')    .' ctermbg='.s:cterm('window')
let s:bg_darkcolumn = ' guibg='.s:gui('darkcolumn').' ctermbg='.s:cterm('darkcolumn')
let s:bg_addbg      = ' guibg='.s:gui('addbg')     .' ctermbg='.s:cterm('addbg')
let s:bg_addfg      = ' guibg='.s:gui('addfg')     .' ctermbg='.s:cterm('addfg')
let s:bg_changebg   = ' guibg='.s:gui('changebg')  .' ctermbg='.s:cterm('changebg')
let s:bg_changefg   = ' guibg='.s:gui('changefg')  .' ctermbg='.s:cterm('changefg')
let s:bg_delbg      = ' guibg='.s:gui('delbg')     .' ctermbg='.s:cterm('delbg')
let s:bg_darkblue   = ' guibg='.s:gui('darkblue')  .' ctermbg='.s:cterm('darkblue')
let s:bg_darkcyan   = ' guibg='.s:gui('darkcyan')  .' ctermbg='.s:cterm('darkcyan')
let s:bg_darkred    = ' guibg='.s:gui('darkred')   .' ctermbg='.s:cterm('darkred')
let s:bg_darkpurple = ' guibg='.s:gui('darkpurple').' ctermbg='.s:cterm('darkpurple')

let s:fg_none       = ' guifg=NONE                    ctermfg=NONE'
let s:fg_foreground = ' guifg='.s:gui('foreground').' ctermfg='.s:cterm('foreground')
let s:fg_background = ' guifg='.s:gui('background').' ctermfg='.s:cterm('background')
let s:fg_selection  = ' guifg='.s:gui('selection') .' ctermfg='.s:cterm('selection')
let s:fg_line       = ' guifg='.s:gui('line')      .' ctermfg='.s:cterm('line')
let s:fg_comment    = ' guifg='.s:gui('comment')   .' ctermfg='.s:cterm('comment')
let s:fg_red        = ' guifg='.s:gui('red')       .' ctermfg='.s:cterm('red')
let s:fg_orange     = ' guifg='.s:gui('orange')    .' ctermfg='.s:cterm('orange')
let s:fg_yellow     = ' guifg='.s:gui('yellow')    .' ctermfg='.s:cterm('yellow')
let s:fg_green      = ' guifg='.s:gui('green')     .' ctermfg='.s:cterm('green')
let s:fg_aqua       = ' guifg='.s:gui('aqua')      .' ctermfg='.s:cterm('aqua')
let s:fg_blue       = ' guifg='.s:gui('blue')      .' ctermfg='.s:cterm('blue')
let s:fg_purple     = ' guifg='.s:gui('purple')    .' ctermfg='.s:cterm('purple')
let s:fg_window     = ' guifg='.s:gui('window')    .' ctermfg='.s:cterm('window')
let s:fg_darkcolumn = ' guifg='.s:gui('darkcolumn').' ctermfg='.s:cterm('darkcolumn')
let s:fg_addbg      = ' guifg='.s:gui('addbg')     .' ctermfg='.s:cterm('addbg')
let s:fg_addfg      = ' guifg='.s:gui('addfg')     .' ctermfg='.s:cterm('addfg')
let s:fg_changebg   = ' guifg='.s:gui('changebg')  .' ctermfg='.s:cterm('changebg')
let s:fg_changefg   = ' guifg='.s:gui('changefg')  .' ctermfg='.s:cterm('changefg')
let s:fg_darkblue   = ' guifg='.s:gui('darkblue')  .' ctermfg='.s:cterm('darkblue')
let s:fg_darkcyan   = ' guifg='.s:gui('darkcyan')  .' ctermfg='.s:cterm('darkcyan')
let s:fg_darkred    = ' guifg='.s:gui('darkred')   .' ctermfg='.s:cterm('darkred')
let s:fg_darkpurple = ' guifg='.s:gui('darkpurple').' ctermfg='.s:cterm('darkpurple')

let s:fmt_none = ' gui=NONE              cterm=NONE              term=NONE'
let s:fmt_bold = ' gui=NONE'.s:b.      ' cterm=NONE'.s:b.      ' term=NONE'.s:b
let s:fmt_bldi = ' gui=NONE'.s:b.      ' cterm=NONE'.s:b.      ' term=NONE'.s:b
let s:fmt_undr = ' gui=NONE'.s:u.      ' cterm=NONE'.s:u.      ' term=NONE'.s:u
let s:fmt_undb = ' gui=NONE'.s:u.s:b.  ' cterm=NONE'.s:u.s:b.  ' term=NONE'.s:u.s:b
let s:fmt_undi = ' gui=NONE'.s:u.      ' cterm=NONE'.s:u.      ' term=NONE'.s:u
let s:fmt_curl = ' gui=NONE'.s:c.      ' cterm=NONE'.s:c.      ' term=NONE'.s:c
let s:fmt_ital = ' gui=NONE'.s:i.      ' cterm=NONE'.s:i.      ' term=NONE'.s:i
let s:fmt_stnd = ' gui=NONE'.s:s.      ' cterm=NONE'.s:s.      ' term=NONE'.s:s
let s:fmt_revr = ' gui=NONE'.s:r.      ' cterm=NONE'.s:r.      ' term=NONE'.s:r
let s:fmt_revb = ' gui=NONE'.s:r.s:b.  ' cterm=NONE'.s:r.s:b.  ' term=NONE'.s:r.s:b

let s:sp_none       = ' guisp=NONE'
let s:sp_foreground = ' guisp='. s:palette.gui.foreground[s:style]
let s:sp_background = ' guisp='. s:palette.gui.background[s:style]
let s:sp_selection  = ' guisp='. s:palette.gui.selection[s:style]
let s:sp_line       = ' guisp='. s:palette.gui.line[s:style]
let s:sp_comment    = ' guisp='. s:palette.gui.comment[s:style]
let s:sp_red        = ' guisp='. s:palette.gui.red[s:style]
let s:sp_orange     = ' guisp='. s:palette.gui.orange[s:style]
let s:sp_yellow     = ' guisp='. s:palette.gui.yellow[s:style]
let s:sp_green      = ' guisp='. s:palette.gui.green[s:style]
let s:sp_aqua       = ' guisp='. s:palette.gui.aqua[s:style]
let s:sp_blue       = ' guisp='. s:palette.gui.blue[s:style]
let s:sp_purple     = ' guisp='. s:palette.gui.purple[s:style]
let s:sp_window     = ' guisp='. s:palette.gui.window[s:style]
let s:sp_addbg      = ' guisp='. s:palette.gui.addbg[s:style]
let s:sp_addfg      = ' guisp='. s:palette.gui.addfg[s:style]
let s:sp_changebg   = ' guisp='. s:palette.gui.changebg[s:style]
let s:sp_changefg   = ' guisp='. s:palette.gui.changefg[s:style]
let s:sp_darkblue   = ' guisp='. s:palette.gui.darkblue[s:style]
let s:sp_darkcyan   = ' guisp='. s:palette.gui.darkcyan[s:style]
let s:sp_darkred    = ' guisp='. s:palette.gui.darkred[s:style]
let s:sp_darkpurple = ' guisp='. s:palette.gui.darkpurple[s:style]

"}}}
" Terminal Highlighting: {{{
" ----------------------------------------------------------------------------

if has("nvim")
  let g:terminal_color_0 =  s:gui_background
  let g:terminal_color_1 =  s:palette.gui.red[s:style]
  let g:terminal_color_2 =  s:palette.gui.green[s:style]
  let g:terminal_color_3 =  s:palette.gui.yellow[s:style]
  let g:terminal_color_4 =  s:palette.gui.blue[s:style]
  let g:terminal_color_5 =  s:palette.gui.purple[s:style]
  let g:terminal_color_6 =  s:palette.gui.aqua[s:style]
  let g:terminal_color_7 =  s:palette.gui.foreground[s:style]
  let g:terminal_color_8 =  "#969896"
  let g:terminal_color_9 =  s:palette.gui.red[s:style]
  let g:terminal_color_10 = s:palette.gui.green[s:style]
  let g:terminal_color_11 = s:palette.gui.yellow[s:style]
  let g:terminal_color_12 = s:palette.gui.blue[s:style]
  let g:terminal_color_13 = s:palette.gui.purple[s:style]
  let g:terminal_color_14 = s:palette.gui.aqua[s:style]
  let g:terminal_color_15 = "#ffffff"
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_5
  if &background ==# "light"
    let g:terminal_color_background = g:terminal_color_7
    let g:terminal_color_foreground = g:terminal_color_2
  endif
elseif has("terminal")
  let g:terminal_ansi_colors = [
    \ s:gui_background,
    \ s:palette.gui.red[s:style],
    \ s:palette.gui.green[s:style],
    \ s:palette.gui.yellow[s:style],
    \ s:palette.gui.blue[s:style],
    \ s:palette.gui.purple[s:style],
    \ s:palette.gui.aqua[s:style],
    \ s:palette.gui.foreground[s:style],
    \ "#969896",
    \ s:palette.gui.red[s:style],
    \ s:palette.gui.green[s:style],
    \ s:palette.gui.yellow[s:style],
    \ s:palette.gui.blue[s:style],
    \ s:palette.gui.purple[s:style],
    \ s:palette.gui.aqua[s:style],
    \ "#ffffff",
    \ ]
endif

"}}}
" Vim Highlighting: (see :help highlight-groups) {{{
" ----------------------------------------------------------------------------
exe "hi! ColorColumn"   .s:fg_none        .s:bg_line        .s:fmt_none
"   Conceal"
"   Cursor"
"   CursorIM"
exe "hi! CursorColumn"  .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! Directory"     .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_addfg       .s:bg_addbg       .s:fmt_none
exe "hi! DiffChange"    .s:fg_changefg    .s:bg_changebg    .s:fmt_none
exe "hi! DiffDelete"    .s:fg_background  .s:bg_delbg       .s:fmt_none
exe "hi! DiffText"      .s:fg_background  .s:bg_blue        .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_background  .s:bg_red         .s:fmt_stnd
exe "hi! VertSplit"     .s:fg_window      .s:bg_none        .s:fmt_none
exe "hi! Folded"        .s:fg_comment     .s:bg_darkcolumn  .s:fmt_none
exe "hi! FoldColumn"    .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
exe "hi! SignColumn"    .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
"   Incsearch"
exe "hi! LineNr"        .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! MatchParen"    .s:fg_background  .s:bg_changebg    .s:fmt_none
exe "hi! ModeMsg"       .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! MoreMsg"       .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! NonText"       .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_foreground  .s:bg_selection   .s:fmt_none
exe "hi! PmenuSel"      .s:fg_foreground  .s:bg_selection   .s:fmt_revr
"   PmenuSbar"
"   PmenuThumb"
exe "hi! Question"      .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! Search"        .s:fg_background  .s:bg_yellow      .s:fmt_none
exe "hi! SpecialKey"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SpellCap"      .s:fg_blue        .s:bg_darkblue    .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_aqua        .s:bg_darkcyan    .s:fmt_undr
exe "hi! SpellBad"      .s:fg_red         .s:bg_darkred     .s:fmt_undr
exe "hi! SpellRare"     .s:fg_purple      .s:bg_darkpurple  .s:fmt_undr
exe "hi! StatusLine"    .s:fg_comment     .s:bg_background  .s:fmt_revr
exe "hi! StatusLineNC"  .s:fg_window      .s:bg_comment     .s:fmt_revr
exe "hi! TabLine"       .s:fg_foreground  .s:bg_darkcolumn  .s:fmt_revr
"   TabLineFill"
"   TabLineSel"
exe "hi! Title"         .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! Visual"        .s:fg_none        .s:bg_selection   .s:fmt_none
"   VisualNos"
exe "hi! WarningMsg"    .s:fg_red         .s:bg_none        .s:fmt_none
" FIXME LongLineWarning to use variables instead of hardcoding
hi LongLineWarning  guifg=NONE        guibg=#371F1C     gui=underline ctermfg=NONE        ctermbg=NONE        cterm=underline
"   WildMenu"

" Use defined custom background colour for terminal Vim.
if !has('gui_running') && exists("g:hybrid_custom_term_colors") && g:hybrid_custom_term_colors == 1
  let s:bg_normal = s:bg_none
else
  let s:bg_normal = s:bg_background
endif
exe "hi! Normal"        .s:fg_foreground  .s:bg_normal      .s:fmt_none

"}}}
" Generic Syntax Highlighting: (see :help group-name) {{{
" ----------------------------------------------------------------------------
exe "hi! Comment"         .s:fg_comment     .s:bg_none        .s:fmt_none

exe "hi! Constant"        .s:fg_red         .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_green       .s:bg_none        .s:fmt_none
"   Character"
"   Number"
"   Boolean"
"   Float"

exe "hi! Identifier"      .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_yellow      .s:bg_none        .s:fmt_none

exe "hi! Statement"       .s:fg_blue        .s:bg_none        .s:fmt_none
"   Conditional"
"   Repeat"
"   Label"
exe "hi! Operator"        .s:fg_aqua        .s:bg_none        .s:fmt_none
"   Keyword"
"   Exception"

exe "hi! PreProc"         .s:fg_aqua        .s:bg_none        .s:fmt_none
"   Include"
"   Define"
"   Macro"
"   PreCondit"

exe "hi! Type"            .s:fg_orange      .s:bg_none        .s:fmt_none
"   StorageClass"
exe "hi! Structure"       .s:fg_aqua        .s:bg_none        .s:fmt_none
"   Typedef"

exe "hi! Special"         .s:fg_green       .s:bg_none        .s:fmt_none
"   SpecialChar"
"   Tag"
"   Delimiter"
"   SpecialComment"
"   Debug"
"
exe "hi! Underlined"      .s:fg_blue        .s:bg_none        .s:fmt_none

exe "hi! Ignore"          .s:fg_none        .s:bg_none        .s:fmt_none

exe "hi! Error"           .s:fg_red         .s:bg_darkred     .s:fmt_undr

exe "hi! Todo"            .s:fg_addfg       .s:bg_none        .s:fmt_none

" Quickfix window highlighting
exe "hi! qfLineNr"        .s:fg_yellow      .s:bg_none        .s:fmt_none
"   qfFileName"
"   qfLineNr"
"   qfError"

"}}}
" Diff Syntax Highlighting:"{{{
" ----------------------------------------------------------------------------
" Diff
"   diffOldFile
"   diffNewFile
"   diffFile
"   diffOnly
"   diffIdentical
"   diffDiffer
"   diffBDiffer
"   diffIsA
"   diffNoEOL
"   diffCommon
hi! link diffRemoved Constant
"   diffChanged
hi! link diffAdded Special
"   diffLine
"   diffSubname
"   diffComment

"}}}
"
" This is needed for some reason: {{{

let &background = s:style

" }}}
" Legal: {{{
" ----------------------------------------------------------------------------
" Copyright (c) 2011 Ethan Schoonover
" Copyright (c) 2009-2012 NanoTech
" Copyright (c) 2012 w0ng
" Copyright (c) 2023 Rafael Bodill
"
" Permission is hereby granted, free of charge, to any per‐
" son obtaining a copy of this software and associated doc‐
" umentation files (the “Software”), to deal in the Soft‐
" ware without restriction, including without limitation
" the rights to use, copy, modify, merge, publish, distrib‐
" ute, sublicense, and/or sell copies of the Software, and
" to permit persons to whom the Software is furnished to do
" so, subject to the following conditions:
"
" The above copyright notice and this permission notice
" shall be included in all copies or substantial portions
" of the Software.
"
" THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY
" KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
" THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICU‐
" LAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
" DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CON‐
" TRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CON‐
" NECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

" }}}

" vim: set foldmethod=marker ts=2 sw=0 tw=80 et :
