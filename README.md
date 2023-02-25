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

- clones the following repository in the directory located
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


| Pluggins         | Description                                          | link |
|------------------|------------------------------------------------------|------|
| Packer           | A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config                                           |
| plenary          | Next item                                            |
| vim-dispatch     | Next item                                            |
| vim-devicons     | icons for NerdTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more                                           |
| nerdcommenter    | Vim plugin for intensive commenting for all programming languages.                                          |
| neotree          | Neovim plugin to manage the file system and other tree like structures.                                            |
| nvim-web-devicons| more Icons                                         |
| toggleterm       | A neovim lua plugin to help easily manage multiple terminal windows                                           |
| vimprettier      | Prettier plugin for neovim to code format                                           |
| nvim-cmp         | A completion plugin for neovim coded in Lua.                                          |
| lightspeed       | motion plugin using incremental input processing, allowing for unparalleled speed with minimal interruptions                                            |
| nvim-autopairs   | self-closing pairs : example { } [ ] ( )                                          |
| mason            | Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.                                            |
| mason-lspconfig  | Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim. Strongly recommended for Windows users.                                            |
| nvim-lspconfig   | Nvim LSP                                            |
| lualine          | A blazing fast and easy to configure neovim statusline plugin written in pure lua.                                            |
| telescope        | s a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core. Telescope is centered around modularity, allowing for easy customization.                                           |
| markdown-preview | markdown-preview for nvim                                           |