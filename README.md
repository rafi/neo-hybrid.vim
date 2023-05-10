# neo-hybrid.vim

Forked from [github.com/w0ng/vim-hybrid](https://github.com/w0ng/vim-hybrid),
improved with missing vim and terminal highlights, neovim lsp and diagnostics,
semantic highlights, and many popular plugins support.

A dark colour scheme for Vim that combines the:

- Default palette from [Tomorrow-Night](https://github.com/chriskempson/vim-tomorrow-theme).
- Reduced contrast palette from [Codecademy](https://www.codecademy.com)'s
  online editor.
- Syntax group highlighting scheme from [Jellybeans](https://github.com/nanotech/jellybeans.vim)
- Vimscript from [Solarized](https://github.com/altercation/vim-colors-solarized)

## Updates

- 10/05/2023: Renamed colorscheme to `neohybrid`.
- 09/05/2023: Added missing vim and terminal highlights, neovim lsp and diagnostics,
  semantic highlights, and many popular plugins support.
- 06/05/2023: Added Terminal highlights.
- 05/01/2016: Replaced `let g:hybrid_use_Xresources = 1` in favour of __`let
  g:hybrid_custom_term_colors = 1`__
- 05/01/2016: Added `let g:hybrid_reduced_contrast = 1`

## Requirements

- Neovim, gVim, Vim, …

## Installation

1. Copy `colors/neohybrid.vim` to:

   ```
   ~/.config/nvim/colors/neohybrid.vim
   ```

   Or alternatively, use your favorite package-manager:

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
