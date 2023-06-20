# neo-hybrid.vim

Forked from [w0ng/vim-hybrid](https://github.com/w0ng/vim-hybrid), improved with
missing Vim and terminal highlights, Neovim LSP and diagnostics, semantic
highlights, and many popular plugins support.

The original hybrid theme by w0ng combines the:

- Default palette from [Tomorrow-Night](https://github.com/chriskempson/vim-tomorrow-theme).
- Reduced contrast palette from [Codecademy](https://www.codecademy.com)'s
  online editor.
- Syntax group highlighting scheme from [Jellybeans](https://github.com/nanotech/jellybeans.vim)
- Vimscript from [Solarized](https://github.com/altercation/vim-colors-solarized)

## Updates

- 2023-06-20: Add LspInlayHint and CmpGhostText. Change darkpurple color and
  define diff highlights.
- 2023-05-10: Renamed colorscheme to `neohybrid`.
- 2023-05-09: Add missing vim and terminal highlights, neovim lsp and diagnostics,
  semantic highlights, and many popular plugins support.
- 2023-05-06: Add Terminal highlights.
- 2016-01-05: Replace `let g:hybrid_use_Xresources = 1` in favour of
  `let g:hybrid_custom_term_colors = 1`
- 2016-01-05: Add `let g:hybrid_reduced_contrast = 1`

## Requirements

- Neovim, gVim, Vim, …

## Installation

1. Copy `colors/neohybrid.vim` locally to `~/.config/nvim/colors/neohybrid.vim`

   or alternatively, use your favorite package-manager:

   <details>
   <summary>With <a href="https://github.com/folke/lazy.nvim">lazy.nvim</a></summary>

   ```lua
   { 'rafi/neo-hybrid.vim', version = false, lazy = false },
   ```

   </details>

   <details>
   <summary>With <a href="https://github.com/wbthomason/packer.nvim">packer.nvim</a></summary>

   ```lua
   use { 'rafi/neo-hybrid.vim' }
   ```

   </details>

2. Add to `~/.config/nvim/init.lua` or `~/.vimrc` or your own configurations:

   ```vim
   colorscheme neohybrid
   ```
