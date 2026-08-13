
# Neovim Configuration

> A personal, modular Neovim configuration built for a fast and comfortable development workflow.

![Neovim configuration preview](./assets/neovim-preview.png)

This repository contains my personal Neovim setup. It has been built and refined around the tools I use every day, with a strong focus on performance, modularity, visual consistency, and a keyboard-driven workflow.

It is not intended to be a complete Neovim distribution. It is simply the result of adapting the editor to my preferences and development needs.

## Overview

The configuration is written in Lua and organized into independent modules. Plugin management is handled by [`lazy.nvim`](https://github.com/folke/lazy.nvim), allowing plugins and features to load only when they are needed.

The setup includes support for:

- Language Server Protocol configuration
- Intelligent code completion and snippets
- Syntax highlighting with Treesitter
- Code formatting and diagnostics
- File and project navigation
- Git integration
- Integrated terminals
- Custom dashboard, tabline, and statusline
- Notifications and improved command-line interfaces
- AI-assisted development with GitHub Copilot
- Local AI experimentation with Ollama
- Tmux-oriented development workflows

## Preview

The interface combines a custom theme, file navigation, completion menus, diagnostics, Git information, buffers, and project context in a compact workspace.

Place the main screenshot at:

```text
assets/neovim-preview.png
```

Additional screenshots can be added below to show specific parts of the configuration.

### Development workspace

![Development workspace](./assets/workspace.png)

### Completion and diagnostics

![Completion and diagnostics](./assets/completion.png)

### File navigation

![File navigation](./assets/files.png)

## Features

### Modular architecture

The configuration is separated by responsibility instead of being kept in a single large file. Core settings, keymaps, diagnostics, plugin specifications, LSP configuration, formatting, UI components, and utilities each live in their own module.

### Development tooling

The editor includes LSP support, completion, snippets, formatting, syntax-aware highlighting, diagnostics, code navigation, and project search. The setup is primarily used for Angular, TypeScript, JavaScript, Lua, Rust, Dart, and backend development.

### User interface

The interface has been customized with:

- A personalized colorscheme
- A custom dashboard
- Tab and buffer navigation
- Status information
- Styled completion and documentation windows
- Improved notifications
- Diagnostic and command interfaces
- Floating and integrated terminal views

### Navigation and productivity

Snacks, Telescope, Oil, Harpoon, Trouble, and other utilities are combined to provide fast file navigation, buffer management, project search, diagnostics, and frequently used development actions.

### Git workflow

Git integration is provided through Fugitive, Gitsigns, and Lazygit, making it possible to inspect changes, navigate hunks, manage branches, and work with repositories without leaving the editor.

### AI-assisted development

The configuration includes GitHub Copilot for inline code suggestions and is being extended with visual chat and agent workflows. Local models through Ollama are also part of the ongoing setup for private and offline experimentation.

## Structure

```text
~/.config/nvim
├── init.lua
├── lazy-lock.json
├── after
│   ├── plugin
│   └── settings
└── lua
    └── sebasruiz
        ├── config
        │   ├── diagnostics.lua
        │   ├── init.lua
        │   ├── keymaps.lua
        │   ├── lazy.lua
        │   ├── options.lua
        │   ├── reload.lua
        │   └── settings.lua
        └── plugins
            ├── format
            ├── lsp
            ├── snippets
            ├── start
            ├── ui
            └── utils
```

### Core configuration

The `config` directory contains the editor's global behavior:

- Options and settings
- Global mappings
- Diagnostics
- Plugin loading
- Configuration reloading

### Plugins

Plugin specifications are grouped by purpose:

- `format`: formatting, automatic pairs, closing tags, and error presentation
- `lsp`: language servers and language-specific tooling
- `snippets`: reusable code snippets
- `start`: foundational plugins loaded during normal editing
- `ui`: visual components and interface customization
- `utils`: navigation, Git, notes, search, diagnostics, and editing utilities

## Main Components

| Area | Tools |
| --- | --- |
| Plugin manager | lazy.nvim |
| Completion | nvim-cmp, LuaSnip |
| Language support | nvim-lspconfig, Treesitter |
| Formatting | conform.nvim |
| Navigation | Snacks, Telescope, Oil, Harpoon |
| Git | Fugitive, Gitsigns, Lazygit |
| Interface | Base46, Lualine, Tabby, Noice, Notify |
| Diagnostics | Trouble, custom diagnostic configuration |
| AI | GitHub Copilot, Ollama |

## Philosophy

This configuration follows a few simple ideas:

- Keep responsibilities separated into small modules
- Load plugins only when they are useful
- Prefer keyboard-driven workflows
- Preserve control over the editor instead of hiding its behavior
- Build features gradually from real development needs
- Keep the interface useful, clean, and personal

The configuration will continue evolving as my workflow and tools change.

## License

Released under the **GLWTS (Good Luck With That Shit) Public License**.

You may copy, distribute, modify, merge, sell, publish, sublicense, or do whatever you want with this configuration—entirely at your own risk.

The author provides no warranty and accepts no liability for broken editors, missing plugins, lost afternoons, debugging sessions, or the sudden urge to rewrite the entire configuration from scratch.

See [`LICENSE`](./LICENSE) for the complete license text.

## Final Words

This repository represents an ongoing effort to turn Neovim into a development environment that feels fast, familiar, and entirely my own.

If something here is useful to you, feel free to take it and adapt it to your workflow.

**Good luck and Godspeed.**
