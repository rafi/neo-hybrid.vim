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
let s:c = ",undercurl"
let s:r = ",reverse"
let s:s = ",standout"
let s:b = ",bold"
let s:u = ",underline"
let s:i = ",italic"
let s:t = ",strikethrough"

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
let s:fmt_stri = ' gui=NONE'.s:t.      ' cterm=NONE'.s:t.      ' term=NONE'.s:t

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
highlight! link CurSearch IncSearch
"   Cursor"
"   lCursor"
"   CursorIM"
exe "hi! CursorColumn"  .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! Directory"     .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_addfg       .s:bg_addbg       .s:fmt_none
exe "hi! DiffChange"    .s:fg_changefg    .s:bg_changebg    .s:fmt_none
exe "hi! DiffDelete"    .s:fg_background  .s:bg_delbg       .s:fmt_none
exe "hi! DiffText"      .s:fg_background  .s:bg_blue        .s:fmt_none
exe "hi! EndOfBuffer"   .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! TermCursor"    .s:fg_none        .s:bg_blue        .s:fmt_none
exe "hi! TermCursorNC"  .s:fg_none        .s:bg_selection   .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_red         .s:bg_none        .s:fmt_none
exe "hi! WinSeparator"  .s:fg_window      .s:bg_none        .s:fmt_none
exe "hi! Folded"        .s:fg_comment     .s:bg_darkcolumn  .s:fmt_none
exe "hi! FoldColumn"    .s:fg_comment     .s:bg_none        .s:fmt_none
exe "hi! SignColumn"    .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
exe "hi! IncSearch"     .s:fg_background  .s:bg_green       .s:fmt_none
" Substitute
exe "hi! LineNr"        .s:fg_selection   .s:bg_none        .s:fmt_none
" LineNrAbove
" LineNrBelow
exe "hi! CursorLineNr"  .s:fg_yellow      .s:bg_none        .s:fmt_none
" CursorLineFold
" CursorLineSign
exe "hi! MatchParen"    .s:fg_none        .s:bg_selection   .s:fmt_none
exe "hi! ModeMsg"       .s:fg_green       .s:bg_none        .s:fmt_none
" MsgSeparator
exe "hi! MoreMsg"       .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! NonText"       .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! NormalFloat"   .s:fg_foreground  .s:bg_float       .s:fmt_none
exe "hi! FloatBorder"   .s:fg_comment     .s:bg_float       .s:fmt_none
exe "hi! FloatTitle"    .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_foreground  .s:bg_selection   .s:fmt_none
exe "hi! PmenuSel"      .s:fg_foreground  .s:bg_selection   .s:fmt_revr
" PmenuKind
" PmenuKindSel
" PmenuExtra
" PmenuExtraSel
exe "hi! PmenuSbar"     .s:bg_status
exe "hi! PmenuThumb"    .s:bg_comment
exe "hi! Question"      .s:fg_green       .s:bg_none        .s:fmt_none
hi! link QuickFixLine WildMenu
exe "hi! Search"        .s:fg_background  .s:bg_yellow      .s:fmt_none
exe "hi! SpecialKey"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SpellBad"      .s:fg_none        .s:bg_none        .s:fmt_curl  .s:sp_red
exe "hi! SpellCap"      .s:fg_none        .s:bg_none        .s:fmt_curl  .s:sp_blue
exe "hi! SpellLocal"    .s:fg_none        .s:bg_none        .s:fmt_curl  .s:sp_aqua
exe "hi! SpellRare"     .s:fg_none        .s:bg_none        .s:fmt_curl  .s:sp_purple
exe "hi! StatusLine"    .s:fg_comment     .s:bg_background  .s:fmt_revr
exe "hi! StatusLineNC"  .s:fg_window      .s:bg_comment     .s:fmt_revr
exe "hi! TabLine"       .s:fg_foreground  .s:bg_darkcolumn  .s:fmt_revr
"   TabLineFill"
"   TabLineSel"
exe "hi! Title"         .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! Visual"        .s:fg_none        .s:bg_selection   .s:fmt_none
" VisualNOS
exe "hi! WarningMsg"    .s:fg_yellow      .s:bg_none        .s:fmt_none
" Whitespace
exe "hi! WildMenu"      .s:fg_none        .s:bg_darkpurple  .s:fmt_none
hi! link WinBar StatusLine
hi! link WinBarNC StatusLineNC

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

exe "hi! Error"           .s:fg_red         .s:bg_none        .s:fmt_none

exe "hi! Todo"            .s:fg_addfg       .s:bg_none        .s:fmt_none

" Quickfix window highlighting
exe "hi! qfLineNr"        .s:fg_yellow      .s:bg_none        .s:fmt_none
"   qfFileName"
"   qfLineNr"
"   qfError"

"}}}
" Diagnostics: {{{
" ----------------------------------------------------------------------------
exe "hi! DiagnosticError"  .s:fg_red        .s:bg_none        .s:fmt_none
exe "hi! DiagnosticWarn"   .s:fg_yellow     .s:bg_none        .s:fmt_none
exe "hi! DiagnosticInfo"   .s:fg_aqua       .s:bg_none        .s:fmt_none
exe "hi! DiagnosticHint"   .s:fg_blue       .s:bg_none        .s:fmt_none
exe "hi! DiagnosticOk"     .s:fg_green      .s:bg_none        .s:fmt_none

exe "hi! DiagnosticUnderlineHint" .s:fmt_undi .s:sp_comment
exe "hi! DiagnosticDeprecated"    .s:fmt_stri .s:sp_red
hi! link DiagnosticUnnecessary Comment

"}}}
" Diff Syntax Highlighting: {{{
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
" LSP: {{{
" ----------------------------------------------------------------------------

" highlight! link lspReference Visual
highlight LspReferenceRead ctermbg=237 guibg=#3D3741
highlight LspReferenceText ctermbg=237 guibg=#373B41
highlight LspReferenceWrite ctermbg=237 guibg=#374137
highlight LspSignatureActiveParameter ctermbg=237 guibg=#4D2238
highlight LspCodeLens ctermfg=7 guifg=#5F5F5F
highlight LspCodeLensSeparator ctermbg=8 guibg=#1C1C1C

" Lsp Semantic Tokens type highlights
" See https://neovim.io/doc/user/lsp.html#lsp-semantic-highlight
highlight! link @lsp.type.comment @comment
highlight! link @lsp.type.class @structure
highlight! link @lsp.type.decorator @function
highlight! link @lsp.type.enum @type
highlight! link @lsp.type.enumMember @constant
highlight! link @lsp.type.escapeSequence @string.escape
highlight! link @lsp.type.formatSpecifier @punctuation.special
highlight! link @lsp.type.interface @interface
highlight! link @lsp.type.keyword @keyword
highlight! link @lsp.type.macro @macro
highlight! link @lsp.type.method @method
highlight! link @lsp.type.namespace @namespace
highlight! link @lsp.type.operator @operator
highlight! link @lsp.type.parameter @parameter
highlight! link @lsp.type.property @property
highlight! link @lsp.type.selfKeyword @variable.builtin

highlight! link @tag Statement
highlight! link @tag.delimiter Special
highlight! link @tag.attribute Identifier

highlight! link @lsp.typemod.enum.defaultLibrary @type.builtin
highlight! link @lsp.typemod.enumMember.defaultLibrary @constant.builtin
highlight! link @lsp.typemod.function.defaultLibrary @function.builtin
highlight! link @lsp.typemod.keyword.async @keyword.coroutine
highlight! link @lsp.typemod.macro.defaultLibrary @function.builtin
highlight! link @lsp.typemod.method.defaultLibrary @function.builtin
highlight! link @lsp.typemod.operator.injected @operator
highlight! link @lsp.typemod.string.injected @string
highlight! link @lsp.typemod.type.defaultLibrary @type.builtin
highlight! link @lsp.typemod.variable.declaration.lua @variable
highlight! link @lsp.typemod.variable.defaultLibrary @variable.builtin
highlight! link @lsp.typemod.variable.injected @variable

" Define a color for each LSP item kind to create highlights for plugins.
let g:hybrid_lsp_kind_foregrounds = [
  \ [ 'Array', s:fg_yellow ],
  \ [ 'Boolean', s:fg_yellow ],
  \ [ 'Class', s:fg_blue ],
  \ [ 'Color', s:fg_yellow ],
  \ [ 'Constant', s:fg_orange ],
  \ [ 'Constructor', s:fg_green ],
  \ [ 'Default', s:fg_blue ],
  \ [ 'Enum', s:fg_blue ],
  \ [ 'EnumMember', s:fg_purple ],
  \ [ 'Event', s:fg_yellow ],
  \ [ 'Field', s:fg_green ],
  \ [ 'File', s:fg_green ],
  \ [ 'Folder', s:fg_yellow ],
  \ [ 'Function', s:fg_blue ],
  \ [ 'Interface', s:fg_blue ],
  \ [ 'Key', s:fg_red ],
  \ [ 'Keyword', s:fg_red ],
  \ [ 'Method', s:fg_green ],
  \ [ 'Module', s:fg_blue ],
  \ [ 'Namespace', s:fg_red ],
  \ [ 'Null', s:fg_yellow ],
  \ [ 'Number', s:fg_yellow ],
  \ [ 'Object', s:fg_purple ],
  \ [ 'Operator', s:fg_green ],
  \ [ 'Package', s:fg_red ],
  \ [ 'Property', s:fg_orange ],
  \ [ 'Reference', s:fg_yellow ],
  \ [ 'Snippet', s:fg_yellow ],
  \ [ 'String', s:fg_yellow ],
  \ [ 'Struct', s:fg_blue ],
  \ [ 'Text', s:fg_foreground ],
  \ [ 'TypeParameter', s:fg_blue ],
  \ [ 'Unit', s:fg_purple ],
  \ [ 'Value', s:fg_purple ],
  \ [ 'Variable', s:fg_orange ],
  \ ]

"}}}
" Plugins: {{{
" ----------------------------------------------------------------------------

" https://github.com/hrsh7th/nvim-cmp {{{
exe "hi! CmpItemAbbrDeprecated" .s:fg_none       .s:bg_none  .s:fmt_stri
exe "hi! CmpItemAbbr"           .s:fg_foreground
exe "hi! CmpItemAbbrMatch"      .s:fg_blue       .s:bg_none  .s:fmt_none
exe "hi! CmpItemAbbrMatchFuzzy" .s:fg_yellow     .s:bg_none  .s:fmt_none

for kind in g:hybrid_lsp_kind_foregrounds
  exe "hi! CmpItemKind" .kind[0] .kind[1] .s:bg_selection .s:fmt_none
endfor

" }}}
" https://github.com/SmiteshP/nvim-navic {{{
exe "hi! NavicText"      .s:fg_comment     .s:bg_status  .s:fmt_none
exe "hi! NavicSeparator" .s:fg_status    .s:bg_status  .s:fmt_none
for kind in g:hybrid_lsp_kind_foregrounds
  exe "hi! NavicIcons" .kind[0] .kind[1] .s:bg_status .s:fmt_none
endfor

" }}}
" https://github.com/stevearc/aerial.nvim {{{
for kind in g:hybrid_lsp_kind_foregrounds
  exe "hi! Aerial" .kind[0] ."Icon" .kind[1] .s:bg_normal .s:fmt_none
endfor

" }}}
" https://github.com/utilyre/barbecue.nvim {{{
for kind in g:hybrid_lsp_kind_foregrounds
  exe "hi! barbecue_context_" .tolower(kind[0]) .kind[1] .s:bg_normal .s:fmt_none
endfor

"}}}
" https://github.com/nvim-telescope/telescope.nvim {{{
highlight TelescopeSelectionCaret ctermfg=139 guifg=#B294BB ctermbg=97 guibg=#4D2238
highlight! link TelescopeSelection WildMenu
highlight! link TelescopeNormal NormalFloat
highlight! link TelescopeBorder FloatBorder
highlight! link TelescopeTitle FloatTitle
highlight! link TelescopePromptBorder FloatBorder
highlight! link TelescopeResultsBorder FloatBorder
highlight! link TelescopePreviewBorder FloatBorder
highlight! link TelescopePreviewLine WildMenu

"}}}
" https://github.com/nvim-neo-tree/neo-tree.nvim {{{
highlight NeoTreeGitAdded     guifg=#85B293
highlight NeoTreeGitDeleted   guifg=#804152
highlight NeoTreeGitModified  guifg=#C88D8D
highlight NeoTreeGitUntracked guifg=#9C9D9C
highlight NeoTreeModified     guifg=#C88D8D
highlight NeoTreeFileNameOpened guifg=#9C9D9C

"}}}
" https://github.com/lewis6991/gitsigns.nvim {{{
highlight GitSignsAdd ctermfg=22 guifg=#008500
highlight GitSignsChange ctermfg=58 guifg=#808200
highlight GitSignsDelete ctermfg=52 guifg=#800000

" Word diff in previews:
highlight GitSignsAddInline ctermbg=10 guibg=#2F5C36 guifg=#DDFFC3
highlight GitSignsDeleteInline ctermfg=167 guifg=#cc6666 ctermbg=97 guibg=#4D2238
highlight GitSignsChangeInline ctermbg=58 guibg=#808200

"}}}
" https://github.com/tpope/vim-fugitive {{{
highlight! link FugitiveblameAnnotation Label
highlight! link FugitiveblameDelimiter Comment
highlight! link FugitiveblameTime Comment

"}}}
" https://github.com/folke/lazy.nvim {{{
highlight LazyDimmed ctermfg=243 ctermbg=234 guifg=#8E99A3 guibg=#171B21
highlight LazyProp ctermfg=243 ctermbg=234 guifg=#8E99A3 guibg=#171B21

"}}}
" https://github.com/simrat39/symbols-outline.nvim {{{
highlight FocusedSymbol ctermbg=236 guibg=#2D3C42 cterm=NONE gui=NONE

"}}}
" https://github.com/chentau/marks.nvim {{{
highlight MarkSignHL ctermfg=12 guifg=#4EA9D7

"}}}
" https://github.com/dnlhc/glance.nvim {{{
highlight! link GlanceListMatch Visual
highlight! link GlanceListFilepath Comment
highlight GlanceListNormal guifg=#8b8e8c guibg=#2d2f31

"}}}
" https://github.com/kevinhwang91/nvim-bqf {{{
highlight! link BqfPreviewBorder FloatBorder
highlight! link BqfPreviewCursor TermCursor
"}}}
" https://github.com/zbirenbaum/copilot.lua {{{
highlight! link CopilotSuggestion Identifier

"}}}
" https://github.com/andymass/vim-matchup {{{
highlight MatchParenCur  guifg=NONE guibg=NONE    gui=NONE
exe "hi! MatchUpPopup"   .s:fg_foreground  .s:bg_float  .' blend=30'

"}}}
" https://github.com/akinsho/bufferline.nvim {{{
exe "hi! BufferLineBufferSelected"  .s:fg_comment .s:bg_background .s:fmt_none

"}}}
" https://github.com/b0o/incline.nvim {{{
highlight InclineNormal ctermfg=234 ctermbg=236 guifg=#c5c8c6 guibg=#2a2e36
highlight InclineNormalNC ctermfg=250 ctermbg=237 guifg=#757876 guibg=#2a2e36

"}}}
" https://github.com/rafi/tabstrip.nvim {{{
hi TabLineProject  ctermfg=252 ctermbg=238 guifg=#D0D0D0 guibg=#444444

"}}}
" https://github.com/RRethy/vim-illuminate {{{
highlight! link IlluminatedWordText LspReferenceText
highlight! link IlluminatedWordRead LspReferenceRead
highlight! link IlluminatedWordWrite LspReferenceWrite

"}}}
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
