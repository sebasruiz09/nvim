<h1 align="center">
  <img src="https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png" alt="Neovim">
</h1>

This is a configuration of neovim written in lua, using plugins like LSP, telescope, neo-tree and other well-known plugins to be a complete, simple, fast and efficient code editor.
<br>

### Prerequisites
<hr>

```
- neovim installed, configuration created with version 0.8 stable

- to use the prettier plugin, you must have it inst:alled globally

$ yarn global add prettier | npm install --global prettier
```
<br>

### Font Family and Icons
<hr>

To correctly see the icons and ligatures in the editor, the following font is recommended

https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip

and set the font in your terminal
```
JetBrainsMono Nerd Font Mono
```
<br>


![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
---
<hr>

- locate yourself in the following directory 

```
C:\Users\user\AppData\Local
```

- clone the following repository in the directory located
```
git clone https://github.com/sebasruiz09/nvim.git
```

- open the previously cloned nvim directory and open the ```file user/plugins.lua```

- once opened use the ```:w``` or ```:packerInstall``` command to install all packages


<br>

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
<hr>

- locate yourself in the following directory 

```
user/.config
```



- clones the following repository in the directory located
```
git clone https://github.com/sebasruiz09/nvim.git
```

- open the previously cloned nvim directory and open the ```file user/plugins.lua```

- once opened use the ```:w``` or ```:packerInstall``` command to install all packages

<br>

### Pluggins
<hr>

| Pluggins         | Description                                          | link |
|------------------|------------------------------------------------------|------|
| Packer           | A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config                                           |  https://github.com/wbthomason/packer.nvim
| plenary          |                                   | https://github.com/nvim-lua/plenary.nvim
| vim-devicons     | icons for NerdTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more | https://github.com/ryanoasis/vim-devicons
| nerdcommenter    | Vim plugin for intensive commenting for all programming languages.  | https://github.com/preservim/nerdcommenter
| neotree          | Neovim plugin to manage the file system and other tree like structures. | https://github.com/nvim-neo-tree/neo-tree.nvim
| nvim-web-devicons| more Icons     |  https://github.com/nvim-tree/nvim-web-devicons
| toggleterm       | A neovim lua plugin to help easily manage multiple terminal windows | https://github.com/akinsho/toggleterm.nvim
 | vimprettier      | Prettier plugin for neovim to code format | https://github.com/prettier/vim-prettier
| nvim-cmp         | A completion plugin for neovim coded in Lua.  | https://github.com/hrsh7th/nvim-cmp
| lightspeed       | motion plugin using incremental input processing, allowing for unparalleled speed with minimal interruptions                                            | https://github.com/ggandor/lightspeed.nvim
| nvim-autopairs   | self-closing pairs : example { } [ ] ( )  | https://github.com/windwp/nvim-autopairs
| mason            | Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.                                            | https://github.com/williamboman/mason.nvim
| mason-lspconfig  | Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim. Strongly recommended for Windows users.                             |  https://github.com/williamboman/mason-lspconfig.nvim
| nvim-lspconfig   | Nvim LSP   | https://github.com/neovim/nvim-lspconfig
| lualine          | A blazing fast and easy to configure neovim statusline plugin written in pure lua. | https://github.com/nvim-lualine/lualine.nvim
| telescope        | s a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core. Telescope is centered around modularity, allowing for easy customization. | https://github.com/nvim-telescope/telescope.nvim
| markdown-preview | markdown-preview for nvim | https://github.com/iamcco/markdown-preview.nvim
